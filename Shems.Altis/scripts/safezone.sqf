#include <macro.h>

#define SAFETY_ZONES [["civ_spawn_3", 600],["civ_spawn_10", 600]]
#define MESSAGE "Tu es bléssé car tu as tiré dans une safe zone."

	if (isDedicated) exitWith {};
	waitUntil {!isNull player};

switch (playerSide) do
{
	case civilian:
	{
		player addEventHandler ["Fired", 
		{
			if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count SAFETY_ZONES > 0) then
			{
				deleteVehicle (_this select 6);
				titleText [MESSAGE, "PLAIN", 3];
				player setDamage 1;
			};
		}];
	};
};