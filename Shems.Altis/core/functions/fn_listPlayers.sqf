private ["_list","_players"];
_list = playableUnits + allDeadMen;
if (!isMultiplayer) then {_list pushBack player};
_players = [];

{
	if (isPlayer _x) then	
	{
		_players pushBack _x;
	};
} forEach _list;

_players