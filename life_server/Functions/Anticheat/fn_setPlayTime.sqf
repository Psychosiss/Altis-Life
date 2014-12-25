private["_uid", "_time_gathered"];

_uid = _this select 0;
_time_gathered = _this select 1;

[_uid] call ANTICHEAT_fnc_getPlayTime;

{
	if((_x select 0) == _uid) exitWith
	{	
		_x set [1, _time_gathered];
		_x set [2, time];

		diag_log format["<* Anticheat Playtime *> Player %1 now has playtime %2", _uid, _time_gathered];
	};
} foreach anticheat_playtime_values;