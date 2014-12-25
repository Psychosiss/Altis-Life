private ["_flag","_index","_gang","_attName","_attGang","_areaGang","_nearUnits","_xindex","_xgang","_xname","_areaContested","_curGang","_gangNum","_run","_perCent","_mName","_mText"];

_flag = getpos player nearestObject "Flag_Red_F";

if ((player distance _flag) > 20) exitWith 
{ 
	hint "You must be closer to the flag to capture this area!"; 
};
if ((side player == civilian) and (isNull life_my_gang)) exitWith 
{ 
	hint "You must be in a gang to capture a gang area!"; 
};

if (side player == civilian) then 
{
	_index = [life_my_gang,life_gang_list] call fnc_index;
	if (_index == -1) exitWith 
	{ 
		hint "You must be in a gang to capture a gang area!"; 
	};

	_gang = life_gang_list select _index;
	_attName = _gang select 0;
	_attGang = _gang select 1;
	_areaContested = false;
	_nearUnits = _flag nearEntities ["Man",50];
	{
		if ((isPlayer _x) and (_x != player) and (side _x == civilian) and (!(_x in (units _attGang)))) then {
			_areaContested = true;
			_xindex = [(group _x),life_gang_list] call fnc_index;
			_xgang = life_gang_list select _xindex;
			_xname = _xgang select 0;
		};
		if ((isPlayer _x) and (_x != player) and (side _x == west)) then 
		{
			_areaContested = true;
			_xname = "Police Force";
		};
		if (_areaContested) exitWith 
		{
			if (_xname == "Police Force") then 
			{
				hint "Members of the Police Force are nearby!\nKill them to be able to capture this point!";
			} else {
				hint format["%1 Members are nearby!\nFind them and kill them!", _xname];
			};
		};
	} forEach _nearUnits;
	
	if (_areaContested) exitWith {};

	_curGang = _flag getVariable ["gangControl", ""];
	if (_curGang == _attName) exitWith { hint "You already own this point!"; };
	
	_gangNum = _flag getVariable ["gangNum", ""];
	[[0,format["Gang Area %1 is Being Captured by [%2]", _gangNum, _attName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	
	_run = true;
	_perCent = 0;
	while {_run} do 
	{
		hint format["<t size='1.5'><t color='#ff0000'>Gang Area %1</t></t><br /><br />%2 Percent Captured!", _gangNum, _perCent];
		if (!(alive player)) then { _run = false; };
		if (_perCent == 100) then { _run = false; };
		_perCent = _perCent + 1;
		sleep 1;
	};

	if (alive player) then 
	{
		hint format["<t size='1.5'><t color='#ff0000'>Gang Area %1</t></t><br /><br />Your gang has captured this area!", _gangNum];
		[[0,format["Gang Area %1 has been Captured by [%2]", _gangNum, _attName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		
		_mName = format["Gang_Area_%1", _gangNum];
		_mText = format["Gang Area %1 [%2]", _gangNum, _attName];
		_mName setMarkerText _mText;
		
		_flag setVariable ["gangControl", _attName, true];
	} else {
		hint "You were killed while capturing the point!";
		[[0,format["[%2] has Failed to Capture Gang Area %1", _gangNum, _attName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	};
};

if (side player == west) then 
{
	_curGang = _flag getVariable ["gangControl", ""];
	_gangNum = _flag getVariable ["gangNum", ""];
	
	if (_curGang == "") exitWith 
	{ 
		hint "This Gang Area is Unclaimed."; 
	};

	_areaContested = false;
	_nearUnits = _flag nearEntities ["Man",50];
	{
		if ((isPlayer _x) and (_x != player) and (side _x == civilian)) then 
		{
			_xindex = [(group _x),life_gang_list] call fnc_index;
			if (!(_xindex == -1)) then 
			{
				_xname = ((life_gang_list select _xindex) select 0);
				if (_xname == _curGang) then {_areaContested = true;};
			};
		};
		if (_areaContested) exitWith 
		{
			hint format["%1 Members are Nearby!\nArrest them to neutralize this point!", _curGang];
		};
	} forEach _nearUnits;
	
	if (_areaContested) exitWith {};
	
	[[0,format["The Police Force is Neutralizing Gang Area %1 from [%2]", _gangNum, _curGang]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	
	_run = true;
	_perCent = 100;
	while {_run} do {
		hint format["<t size='1.5'><t color='#ff0000'>Gang Area %1</t></t><br /><br />%2 Percent Owned!", _gangNum, _perCent];
		if (!(alive player)) then 
		{ 
			_run = false; 
		};
		if (_perCent == 0) then 
		{ 
			_run = false; 
		};
		_perCent = _perCent - 1;
		sleep 1;
	};

	if (alive player) then 
	{
		hint format["<t size='1.5'><t color='#ff0000'>Gang Area %1</t></t><br /><br />You have neutralized this Gang Area!", _gangNum];
		[[0,format["Gang Area %1 has been Neutralized by The Police Force!", _gangNum]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		
		_mName = format["Gang_Area_%1", _gangNum];
		_mText = format["Gang Area %1", _gangNum];
		_mName setMarkerText _mText;
		_flag setVariable ["gangControl", "", true];

		life_cash = life_cash + 20000;
	} else {
		hint "You were killed while neutralizing the point!";
		[[0,format["The Police Force has Failed to Capture Gang Area %1 from [%2]", _gangNum, _curGang]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	};
};