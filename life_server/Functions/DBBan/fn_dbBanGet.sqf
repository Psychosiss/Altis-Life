private ["_uid"];

false;

_uid = _this select 0;

if(isNil("life_dbban_bannedids")) then
{
	life_dbban_bannedids = [];
	diag_log "Tableau de ban ID créer!";
};

(_uid in life_dbban_bannedids);