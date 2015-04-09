if (!serverCommandAvailable "#kick" || !isMultiplayer) exitWith {false};

private "_player";
_player = [_this,0,objNull,[objNull,0]] call BIS_fnc_param;

if (isNull _player || {isPlayer _player}) exitWith {false};
serverCommand format ["#kick '%1'", getPlayerUID _player];

true