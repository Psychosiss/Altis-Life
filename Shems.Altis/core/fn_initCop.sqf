#include <macro.h>

private["_end"];

player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
_end = false;

if(life_blacklisted) exitWith
{
	["Blacklisted",false,true] call BIS_fnc_endMission;
	sleep 30;
};

if((__GETC__(life_coplevel)) < 1) exitWith 
{
	["NotWhitelisted",false,true] call BIS_fnc_endMission;
	sleep 35;
};

[] call life_fnc_spawnMenu;

player setVariable["rank",(__GETC__(life_coplevel)),true];

if(talent_west_bonus1) then {life_paycheck = life_paycheck + 2000;};
if(talent_west_bonus3) then {life_paycheck = life_paycheck + 1000;};

waitUntil{!isNull (findDisplay 38500)};
waitUntil{isNull (findDisplay 38500)};

[] spawn
{
	while {true} do
	{
		waitUntil {uniform player == "U_Rangemaster"};
		player setObjectTextureGlobal [0,"images\cop\uniform.paa"];
		waitUntil {uniform player != "U_Rangemaster"};
	};
};