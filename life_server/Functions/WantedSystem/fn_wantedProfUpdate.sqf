private["_uid","_name","_query","_tickTime","_wantedCheck","_wantedQuery"];

_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;

if(_uid == "" OR  _name == "") exitWith {};

_tickTime = diag_tickTime;
_name = [_name] call DB_fnc_mresString;
_wantedCheck = format["SELECT wantedName FROM wanted WHERE wantedID='%1'",_uid];

waitUntil{!DB_Async_Active};

_wantedQuery = [_wantedCheck,2] call DB_fnc_asyncCall;

if(count _wantedQuery == 0) exitWith {diag_log "Personne non recherché, pas de mise à jour.";};

_wantedQuery = call compile format["%1",_wantedQuery];

if(_name != (_wantedQuery select 0)) then
{
	_query = format["UPDATE wanted SET wantedName = '%2' WHERE wantedID ='%1'",_uid,_name];
	waitUntil {!DB_Async_Active};
	[_query,2] call DB_fnc_asyncCall;

	diag_log "------------- Mis à jour du nom du joueur -------------";
	diag_log format["QUERY 1: %1",_wantedCheck];
	diag_log format["QUERY 2: %1",_query];
	diag_log format["Ancien nom: %1",_wantedQuery];
	diag_log format["Requète par: %1",_name];
	diag_log format["Temps à compléter: %1 seconde(s)",(diag_tickTime - _tickTime)];
	diag_log "----------------- Joueur recherché --------------------";
} else {
	diag_log "Nom abituelle, aucun changement nécessaire";
};