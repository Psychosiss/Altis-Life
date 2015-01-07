#include <macro.h>

private["_end"];

waitUntil {!(isNull (findDisplay 46))};

_end = false;

if((__GETC__(life_eastlevel)) < 1) exitWith 
{
	["NotWhitelisted",false,true] call BIS_fnc_endMission;
	sleep 35;
};

waitUntil{!isNull (findDisplay 38500)};
waitUntil{isNull (findDisplay 38500)};

player addRating 9999999;

[] call life_fnc_handlerHelp;
[] spawn life_fnc_onPlayerAbsent;

[[getPlayerUID player],"TON_fnc_loadBounties",false,false] spawn life_fnc_MP;