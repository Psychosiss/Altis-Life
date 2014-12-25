private ["_chance","_animal","_animals","_msg","_error","_dir","_bearing","_comp","_distance","_message"];

if (player distance (getMarkerPos "hunting") > 600) exitWith 
{ 
	[[0,2], "This environment is not the habitat of a hunted animal."] call life_fnc_broadcast; 
};

if (player distance life_last_tracked < 65) exitWith 
{ 
	[2, "You've already searched this area and found no tracks. Try elsewhere."] call life_fnc_broadcast; 
};

_chance = 3;

life_last_tracked = getPos player;
_animal = objNull;
{
	if (!(isNull _x)) then
	{
		if (isNull _animal && alive _x) then 
		{ 
			_animal = _x; 
		} else { 
			if (player distance _x < player distance _animal && alive _x) then 
			{ 
				_animal = _x; 
			}; 
		};
	};
} forEach life_animals_array;

_vd = getPosASL _animal vectorDiff getPosASL player;
_dir = (_vd select 0) atan2 (_vd select 1);
if (_dir < 0) then {_dir = 360 + _dir}; 
_comp = ["north", "north east", "east", "south east", "south", "south west", "west", "north west", "north"];
_bearing = _comp select (round (_dir / 45));

_error = floor (random 10);
if (random 2 < 1) then 
{ 
	_error = _error * -1; 
};
_distance = floor ((player distance _animal) + _error);
_message = format["You've picked up the tracks of a %1 approximately %2 metres to the %3.", getText(configFile >> "CfgVehicles" >> (typeOf _animal) >> "displayName"), _distance, _bearing];

[[0,2], _message] call life_fnc_broadcast;