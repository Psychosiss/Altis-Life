SHEMS_playerByName = 
{
	_name = [_this,0,"",[""]] call BIS_fnc_param;
	_unit = objNull;
	{
		if(name _x == _name) then {_unit = _x;};
	} forEach playableUnits;
	_unit
};

SHEMS_playerByUID = 
{
	_pid = [_this,0,"",[""]] call BIS_fnc_param;
	_unit = objNull;
	{
		if(getPlayerUID _x == _pid) then {_unit = _x;};
	} forEach playableUnits;
	_unit
};

SHEMS_isPlayerUIDActive = 
{
	_pid = [_this,0,"",[""]] call BIS_fnc_param;
	_unit = [_pid] call SHEMS_playerByUID;
	_on = true;
	if(isNull _unit) then {_on = false;};
	_on
};

SHEMS_isPlayerNameActive = 
{
	_name = [_this,0,"",[""]] call BIS_fnc_param;
	_unit = [_name] call SHEMS_playerByName;
	_on = true;
	if(isNull _unit) then {_on = false;};
	_on
};

SHEMS_percentChance = 
{
	_percent = [_this,0,0,[0]] call BIS_fnc_param;
	_dice = random(100);
	_ret = false;
	if(_dice <= _percent) then {_ret = true;};
	_ret
};

SHEMS_closeAllDialogs = 
{
	while {dialog} do 
	{
		closeDialog 0;
		sleep 0.1;
	};
};

SHEMS_stringContains = 
{
	_text = [_this,0,"",[""]] call BIS_fnc_param;
	_plainText = [97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,48,49,50,51,52,53,54,55,56,57,32];
	_arr = toArray _text;
	_ok = true;
	{if(!(_x in _plainText)) then {_ok = false;};} forEach _arr;
	_ok
};

SHEMS_compileFinal = 
{   
    private ["_var","_ns","_code","_arr"];
    _var = [_this,0,"",[""]] call BIS_fnc_param;
    _ns = [_this,1,missionNamespace,[missionNamespace]] call BIS_fnc_param;
    _code = _ns getVariable [_var, 0];
    if (typeName _code != typeName {}) exitWith {false};
    _arr = toArray str _code;
    _arr set [0,32];
    _arr set [count _arr - 1,32];
    _code = compileFinal toString _arr;
    _ns setVariable [_var, _code];
    true
};

SHEMS_upperFirst = 
{
	_item = [_this,0,"",[""]] call BIS_fnc_param;
	_charArr = toArray(_item);
	_firstChar = _charArr select 0;
	_firstChar = toString ([_firstChar]);
	_firstChar = toUpper (_firstChar);
	_firstChar = toArray (_firstChar);
	_charArr set[0,(_firstChar select 0)];
	_str = toString (_charArr);
	_str;
};