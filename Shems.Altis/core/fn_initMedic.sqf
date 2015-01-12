#include <macro.h>

private["_end"];

player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};

if((__GETC__(life_medicLevel)) < 1) exitWith 
{
	["NotWhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
	sleep 35;
};

[] call life_fnc_spawnMenu;

if(talent_indep_bonus1) then {life_paycheck = life_paycheck + 1500;};

waitUntil{!isNull (findDisplay 38500)};
waitUntil{isNull (findDisplay 38500)};

[] spawn
{
	while {true} do
	{
		waitUntil {uniform player == "U_Rangemaster"};
		player setObjectTextureGlobal [0,"images\med\uniform.jpg"];
		waitUntil {uniform player != "U_Rangemaster"};
	};
};