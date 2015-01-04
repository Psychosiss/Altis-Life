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

player setVariable["coplevel", __GETC__(life_coplevel), true];
player setVariable["medlevel", __GETC__(life_medicLevel), true];
player setVariable["adminlevel", __GETC__(life_adminlevel), true];

[[getPlayerUID player],"TON_fnc_loadBounties",false,false] spawn life_fnc_MP;