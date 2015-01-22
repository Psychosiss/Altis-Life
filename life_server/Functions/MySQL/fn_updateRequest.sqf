private["_uid","_side","_cash","_bank","_licenses","_gear","_talent","_name","_query","_thread"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_side = [_this,2,sideUnknown,[civilian]] call BIS_fnc_param;
_cash = [_this,3,0,[0]] call BIS_fnc_param;
_bank = [_this,4,5000,[0]] call BIS_fnc_param;
_licenses = [_this,5,[],[[]]] call BIS_fnc_param;
_gear = [_this,6,[],[[]]] call BIS_fnc_param;
_talent = [_this, 8,[],[[]]] call BIS_fnc_param;
_civ_position = [_this,9,""] call BIS_fnc_param;
_cop_position = [_this,10,""] call BIS_fnc_param;
_med_position = [_this,11,""] call BIS_fnc_param;

if((_uid == "") OR (_name == "")) exitWith {};

_name = [_name] call DB_fnc_mresString;
_gear = [_gear] call DB_fnc_mresArray;
_cash = [_cash] call DB_fnc_numberSafe;
_bank = [_bank] call DB_fnc_numberSafe;

for "_i" from 0 to count(_licenses)-1 do 
{
	_bool = [(_licenses select _i) select 1] call DB_fnc_bool;
	_licenses set[_i,[(_licenses select _i) select 0,_bool]];
};

_licenses = [_licenses] call DB_fnc_mresArray;
_talent = [_talent] call DB_fnc_mresArray;

switch (_side) do 
{
	case west: 
	{
		_query = format["UPDATE players SET 
		name='%1',
		cash='%2',
		bankacc='%3',
		cop_gear='%4',
		cop_licenses='%5',
		cop_talent='%7',
		cop_position='%10'
		WHERE playerid='%6'
		",_name,_cash,_bank,_gear,_licenses,_uid,_talent];
	};
	
	case civilian: 
	{
		_query = format["UPDATE players SET 
		name='%1',
		cash='%2',
		bankacc='%3',
		civ_licenses='%4',
		civ_gear='%6',
		arrested='%7',
		civ_talent='%8',
		civ_position='%9'
		WHERE playerid='%5'
		",_name,_cash,_bank,_licenses,_uid,_gear,[_this select 7] call DB_fnc_bool,_talent];
	};
	
	case independent: 
	{
		_query = format["UPDATE players SET 
		name='%1',
		cash='%2',
		bankacc='%3',
		med_licenses='%4',
		med_gear='%6',
		med_talent='%7',
		med_position='%11'
		WHERE playerid='%5'
		",_name,_cash,_bank,_licenses,_uid,_talent];
	};
};

waitUntil {sleep (random 0.3); !DB_Async_Active};
_queryResult = [_query,1] call DB_fnc_asyncCall;