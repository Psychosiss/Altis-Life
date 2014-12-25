private["_uid","_side","_value","_mode","_query"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,sideUnknown,[civilian]] call BIS_fnc_param;
_mode = [_this,3,-1,[0]] call BIS_fnc_param;

if(_uid == "" OR _side == sideUnknown) exitWith {};
_query = "";

switch(_mode) do 
{
	case 0: 
	{
		_value = [_this,2,0,[0]] call BIS_fnc_param;
		_value = [_value] call DB_fnc_numberSafe;
		_query = format["UPDATE players SET cash='%1' WHERE playerid='%2'",_value,_uid];
	};

	case 1: 
	{
		_value = [_this,2,0,[0]] call BIS_fnc_param;
		_value = [_value] call DB_fnc_numberSafe;
		_query = format["UPDATE players SET bankacc='%1' WHERE playerid='%2'",_value,_uid];
	};

	case 2: 
	{
		_value = [_this,2,[],[[]]] call BIS_fnc_param;
		_value = [_value] call DB_fnc_mresArray;
		switch(_side) do 
		{
			case west: {_query = format["UPDATE players SET cop_licenses='%1' WHERE playerid='%2'",_value,_uid];};
			case civilian: {_query = format["UPDATE players SET civ_licenses='%1' WHERE playerid='%2'",_value,_uid];};
			case independent: {_query = format["UPDATE players SET med_licenses='%1' WHERE playerid='%2'",_value,_uid];};
			case east: {_query = format["UPDATE players SET east_licenses='%1' WHERE playerid='%2'",_value,_uid];};
		};
	};

	case 3: 
	{
		_value = [_this,2,[],[[]]] call BIS_fnc_param;
		_value = [_value] call DB_fnc_mresArray;
		switch(_side) do 
		{
			case west: {_query = format["UPDATE players SET cop_gear='%1' WHERE playerid='%2'",_value,_uid];};
			case civilian: {_query = format["UPDATE players SET civ_gear='%1' WHERE playerid='%2'",_value,_uid];};
			case independent: {_query = format["UPDATE players SET med_gear='%1' WHERE playerid='%2'",_value,_uid];};
			case east: {_query = format["UPDATE players SET east_gear='%1' WHERE playerid='%2'",_value,_uid];};
		};
	};
	
	case 4: {};

	case 5: 
	{
		_value = [_this,2,false,[true]] call BIS_fnc_param;
		_value = [_value] call DB_fnc_bool;
		_query = format["UPDATE players SET arrested='%1' WHERE playerid='%2'",_value,_uid];
	};

	case 6: {};
	case 7: {};
	case 8: {};
};

if(_query == "") exitWith {};
waitUntil {!DB_Async_Active};
[_query,1] call DB_fnc_asyncCall;