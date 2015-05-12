private["_uid","_name","_side","_money","_bank","_licenses","_handler","_thread","_queryResult","_query","_alias"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_money = [_this,2,0,[""]] call BIS_fnc_param;
_bank = [_this,3,2500,[""]] call BIS_fnc_param;
_returnToSender = [_this,4,ObjNull,[ObjNull]] call BIS_fnc_param;

if((_uid == "") OR (_name == "")) exitWith {systemChat "Mauvaise UID ou nom";};
if(isNull _returnToSender) exitWith {systemChat "ReturnToSender is Null!";};

_query = format["SELECT playerid, name FROM players WHERE playerid='%1'",_uid];

waitUntil{sleep (random 0.3); !DB_Async_Active};
_tickTime = diag_tickTime;
_queryResult = [_query,2,true] call DB_fnc_asyncCall;

diag_log "------------- Insertion d'une requète Query -------------";
diag_log format["QUERY: %1",_query];
diag_log format["Temps à completer: %1 secondes",(diag_tickTime - _tickTime)];
diag_log format["Resultat: %1",_queryResult];
diag_log "---------------------------------------------------------";

if(typeName _queryResult == "STRING") exitWith 
{
	[[],"SOCK_fnc_dataQuery",(owner _returnToSender),false] spawn life_fnc_MP;
};

if(count _queryResult != 0) exitWith 
{
	[[],"SOCK_fnc_dataQuery",(owner _returnToSender),false] spawn life_fnc_MP;
};

_name = [_name] call DB_fnc_mresString;
_alias = [[_name]] call DB_fnc_mresArray;
_money = [_money] call DB_fnc_numberSafe;
_bank = [_bank] call DB_fnc_numberSafe;

/*
_query = format["INSERT INTO players (playerid, name, money, atmmoney, aliases, cop_licenses, civ_licenses, med_licenses, cop_gear, civ_gear, med_gear, cop_position, civ_position, med_position) VALUES('%1', '%2', '%3', '%4', '%5','""[]""','""[]""','""[]""','""[]""','""[]""','""[]""','""[]""','""[]""','""[]""')",
	_uid,
	_name,
	_money,
	_bank,
	_alias
];
*/

_query = format["INSERT INTO players (playerid, name, cop_money, cop_atmmoney, civ_money, civ_atmmoney, med_money, med_atmmoney, aliases, cop_licenses, civ_licenses, med_licenses, cop_gear, civ_gear, med_gear, cop_position, civ_position, med_position) VALUES('%1', '%2', '%3', '%4', '%5', '%6', '%7', '%8', '%9','""[]""','""[]""','""[]""','""[]""','""[]""','""[]""','""[]""','""[]""','""[]""')",
	_uid,
	_name,
	_money,
	_bank,
	_money,
	_bank,
	_money,
	_bank,
	_alias
];

waitUntil {!DB_Async_Active};
[_query,1] call DB_fnc_asyncCall;
[[],"SOCK_fnc_dataQuery",(owner _returnToSender),false] spawn life_fnc_MP;