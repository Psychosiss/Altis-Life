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
[] spawn life_fnc_onPlayerAbsent;

player setVariable["rank",(__GETC__(life_coplevel)),true];

/*
if(playerSide == west) then 
{
    private["_getRank"];
    _getRank = switch (__GETC__(life_coplevel)) do 
	{
		case 1: {1};
		case 2: {2};
		case 3: {3};
		case 4: {4};
		case 5: {5};
		case 6: {6};
		case 7: {7};
		case 8: {8};
		case 9: {9};
		case 10: {10};
		default {0};
	};
    player setVariable["coplevel",_getRank,TRUE];
};
*/

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