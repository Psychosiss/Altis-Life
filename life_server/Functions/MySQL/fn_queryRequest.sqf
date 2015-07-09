private["_uid","_side","_query","_return","_queryResult","_qResult","_handler","_thread","_tickTime","_loops","_returnCount"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,sideUnknown,[civilian]] call BIS_fnc_param;
_ownerID = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _ownerID) exitWith {};
_ownerID = owner _ownerID;
_query = switch _side do 
{
	case west: {_returnCount = 11; format["SELECT playerid, name, money, atmmoney, adminlevel, donatorlvl, cop_licenses, cop_level, cop_gear, karma, blacklist FROM players WHERE playerid='%1'",_uid];};
	case civilian: {_returnCount = 10; format["SELECT playerid, name, money, atmmoney, adminlevel, donatorlvl, civ_licenses, arrested, civ_gear, karma FROM players WHERE playerid='%1'",_uid];};
	case independent: {_returnCount = 10; format["SELECT playerid, name, money, atmmoney, adminlevel, donatorlvl, med_licenses, med_level, med_gear, karma FROM players WHERE playerid='%1'",_uid];};
};

waitUntil{sleep (random 0.3); !DB_Async_Active};
_tickTime = diag_tickTime;
_queryResult = [_query,2] call DB_fnc_asyncCall;

diag_log "------------- Requête Client Query -------------";
diag_log format["QUERY: %1",_query];
diag_log format["Temps à completer: %1 secondes",(diag_tickTime - _tickTime)];
diag_log format["Resultat: %1",_queryResult];
diag_log "------------------------------------------------";

if(typeName _queryResult == "STRING") exitWith 
{
	[[],"SOCK_fnc_insertPlayerInfo",_ownerID,false,true] spawn life_fnc_MP;
};

if(count _queryResult isEqualTo 0) exitWith 
{
	[[],"SOCK_fnc_insertPlayerInfo",_ownerID,false,true] spawn life_fnc_MP;
};

private "_tmp";
_tmp = _queryResult select 2;
_queryResult set[2,[_tmp] call DB_fnc_numberSafe];
_tmp = _queryResult select 3;
_queryResult set[3,[_tmp] call DB_fnc_numberSafe];
_new = [(_queryResult select 6)] call DB_fnc_mresToArray;

if(typeName _new == "STRING") then 
{
	_new = call compile format["%1", _new];
};

_queryResult set[6,_new];

_old = _queryResult select 6;
for "_i" from 0 to (count _old)-1 do
{
	_data = _old select _i;
	_old set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_bool)]];
};
_queryResult set[6,_old];

_new = [(_queryResult select 8)] call DB_fnc_mresToArray;
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
_queryResult set[8,_new];

switch _side do 
{
	case west: 
	{
		_queryResult set[10,([_queryResult select 10,1] call DB_fnc_bool)];
	};

	case civilian: 
	{
		_queryResult set[7,([_queryResult select 7,1] call DB_fnc_bool)];

		_houseData = _uid spawn TON_fnc_fetchPlayerHouses;
		waitUntil {scriptDone _houseData};
		_queryResult pushBack (missionNamespace getVariable[format["houses_%1",_uid],[]]);

		_gangData = _uid spawn TON_fnc_queryPlayerGang;
		waitUntil{scriptDone _gangData};
		_queryResult pushBack (missionNamespace getVariable[format["gang_%1",_uid],[]]);
	};

	case independent: {};
};

_tmp = _queryResult select 9;
_queryResult set[9,[_tmp] call DB_fnc_numberSafe];

_keyArr = missionNamespace getVariable [format["%1_KEYS_%2",_uid,_side],[]];
_queryResult set[15,_keyArr]; //12

[_queryResult,"SOCK_fnc_requestReceived",_ownerID,false] spawn life_fnc_MP;