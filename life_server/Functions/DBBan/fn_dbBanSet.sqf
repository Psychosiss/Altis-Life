private["_uid", "_banned", "_existing"];

_uid = _this select 0;
_banned = _this select 1;
_existing = [_uid] call life_fnc_dbBanGet;

if(!(_existing && _banned)) then 
{
	if(_banned) then
	{
		diag_log format["<<DBBAN>> %1 est banni", _uid];
		
		life_dbban_bannedids set [count life_dbban_bannedids, _uid];
	} else {
		diag_log format["<<DBBAN>> %1 n'est pas banni", _uid];
		life_dbban_bannedids = life_dbban_bannedids - [_uid];
	};
}