private["_uid","_side","_money","_atmmoney","_licenses","_gear","_civ_position","_cop_position","_med_position","_karma","_name","_query","_thread"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_side = [_this,2,sideUnknown,[civilian]] call BIS_fnc_param;
_money = [_this,3,0,[0]] call BIS_fnc_param;
_atmmoney = [_this,4,5000,[0]] call BIS_fnc_param;
_licenses = [_this,5,[],[[]]] call BIS_fnc_param;
_gear = [_this,6,[],[[]]] call BIS_fnc_param;
_civ_position = [_this,7,""] call BIS_fnc_param;
_cop_position = [_this,8,""] call BIS_fnc_param;
_med_position = [_this,9,""] call BIS_fnc_param;
_karma = _this select 10;

if((_uid == "") OR (_name == "")) exitWith {};

_name = [_name] call DB_fnc_mresString;
_gear = [_gear] call DB_fnc_mresArray;
_money = [_money] call DB_fnc_numberSafe;
_atmmoney = [_atmmoney] call DB_fnc_numberSafe;

for "_i" from 0 to count(_licenses)-1 do 
{
	_bool = [(_licenses select _i) select 1] call DB_fnc_bool;
	_licenses set[_i,[(_licenses select _i) select 0,_bool]];
};

_licenses = [_licenses] call DB_fnc_mresArray;

switch _side do 
{
	case west: 
	{
		_query = format["UPDATE players SET 
		name='%1',
		money='%2',
		atmmoney='%3',
		cop_gear='%4',
		cop_licenses='%5',
		cop_position='%7'
		WHERE playerid='%6'
		",_name,_money,_atmmoney,_gear,_licenses,_uid];
	};
	
	case civilian: 
	{
		_query = format["UPDATE players SET 
		name='%1',
		money='%2',
		atmmoney='%3',
		civ_licenses='%4',
		civ_gear='%6',
		arrested='%7',
		civ_position='%8',
		karma='%9'
		WHERE playerid='%5'
		",_name,_money,_atmmoney,_licenses,_uid,_gear,[_this select 7] call DB_fnc_bool,_karma];
	};
	
	case independent: 
	{
		_query = format["UPDATE players SET 
		name='%1',
		money='%2',
		atmmoney='%3',
		med_licenses='%4',
		med_gear='%6',
		med_position='%7'
		WHERE playerid='%5'
		",_name,_money,_atmmoney,_licenses,_uid];
	};
};

waitUntil {sleep (random 0.3); !DB_Async_Active};
_queryResult = [_query,1] call DB_fnc_asyncCall;