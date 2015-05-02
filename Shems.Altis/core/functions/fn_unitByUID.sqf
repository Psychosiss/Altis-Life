private ["_uid","_player"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_player = objNull;

{
	if (getPlayerUID _x == _uid) exitWith
	{
		_player = _x;
	};
} foreach ([] call life_fnc_listPlayers);

_player