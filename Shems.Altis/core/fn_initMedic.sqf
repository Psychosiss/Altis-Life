#include <macro.h>

private["_end"];

player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};

if((__GETC__(life_med_level)) < 1) exitWith 
{
	["NotWhitelisted",false,true] call BIS_fnc_endMission;
	sleep 35;
};

if (!life_is_alive) then
{
	[] call life_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)};
	waitUntil{isNull (findDisplay 38500)};
	life_is_alive = true;
} else {
	player setPos _playerPosition;
	life_is_alive = true;
};

//[] call life_fnc_spawnMenu;

player setVariable["coplevel", __GETC__(life_coplevel), true];
player setVariable["med_level", __GETC__(life_med_level), true];
player setVariable["adminlevel", __GETC__(life_adminlevel), true];

[] spawn
{
	while {true} do
	{
		waitUntil {uniform player == "U_Rangemaster"};
		player setObjectTextureGlobal [0,"images\med\uniform.jpg"];
		waitUntil {uniform player != "U_Rangemaster"};
	};
};