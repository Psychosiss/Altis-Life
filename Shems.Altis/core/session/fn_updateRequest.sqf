private["_packet","_array","_flag","_civ_position","_med_position","_cop_position"];

_civ_position = getPos player;
diag_log format ["%1",_civ_position];

_med_position = getPos player;
diag_log format ["%1",_med_position];

_cop_position = getPos player;
diag_log format ["%1",_cop_position];

_packet = [getPlayerUID player,(profileName),playerSide,life_cash,life_atmcash];
_array = [];
_flag = switch(playerSide) do {case west: {"cop"};case civilian: {"civ"};case independent: {"med"};};
{
	if(_x select 1 == _flag) then
	{
		_array pushBack [_x select 0,(missionNamespace getVariable (_x select 0))];
	};
} foreach life_licenses;

_packet pushBack _array;
[] call life_fnc_saveGear;
_packet pushBack life_gear;
_packet pushBack life_is_alive;

switch (playerSide) do 
{
	case west: 
	{
		_packet pushBack _cop_position;
	};
	case civilian:
	{
		_packet pushBack life_is_arrested;
		_packet pushBack _civ_position;
	};

	case independent: 
	{
		_packet pushBack _med_position;
	};
};

[_packet,"DB_fnc_updateRequest",false,false] spawn life_fnc_MP;