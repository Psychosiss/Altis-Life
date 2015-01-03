#include <macro.h>

if (isDedicated) exitWith {};
waitUntil {!isNull player};

switch (playerSide) do
{
	case civilian:
	{
		player addEventHandler ["Fired", 
		{
			if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count [["civ_spawn_3", 600],["civ_spawn_10", 600]] > 0) then
			{
				deleteVehicle (_this select 6);
				titleText ["Tu es bléssé car tu as tiré dans une safe zone.","PLAIN",3];
				player setDamage 1;
			};
		}];
	};
	case west: {};
	case independent: {};
	case east:
	{
		player addEventHandler ["Fired", 
		{
			if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count [["civ_spawn_3", 600],["civ_spawn_10", 600]] > 0) then
			{
				deleteVehicle (_this select 6);
				titleText ["Tu es bléssé car tu as tiré dans une safe zone.","PLAIN",3];
				player setDamage 1;
			};
		}];
	};
};