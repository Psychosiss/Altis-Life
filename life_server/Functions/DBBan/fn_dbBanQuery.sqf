private["_uid", "_name","_query","_result","_unit"];

_uid = _this select 0;
_name = _this select 1;
_existing = [_uid] call life_fnc_dbBanGet;

diag_log "<<DBBAN>> Recherche ...";

_query = format ["SELECT banned FROM players WHERE playerid='%1'", _uid];

waitUntil {sleep (random 0.3); !DB_Async_Active};
_queryResult = [_query,1] call DB_fnc_asyncCall;

_result = call compile format["%1", _result];
_result = (((_result select 0) select 0) select 0);
_result = _result == "1" || _result == "true";

diag_log format["<<DBBAN>> Le résultat est %1", _result];

if(!_existing && _result) then
{
	diag_log format["<<DBBAN>> Requête du joueur a été reconnu comme étant banni pour %1 [%2] signalez-le a l'administration.", _name, _uid];
	[_uid, _name, "DB-QUERY-BAN"] call life_fnc_dbBanBan;
};
