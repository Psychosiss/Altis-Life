#include <macro.h>

private["_spawnPos","_playerPosition"];

_playerPosition = civ_position;
diag_log format ["%1",_playerPosition];

civ_spawn_1 = nearestObjects[getMarkerPos "civ_spawn_1", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_2 = nearestObjects[getMarkerPos "civ_spawn_2", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_3 = nearestObjects[getMarkerPos "civ_spawn_3", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_4 = nearestObjects[getMarkerPos "civ_spawn_4", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];

waitUntil {!(isNull (findDisplay 46))};

/*
if(life_is_arrested) then
{
	life_is_arrested = false;
	[player,true] spawn life_fnc_jail;
} else {
	[0] call life_fnc_setPain;
	[false] call life_fnc_brokenLeg;
	[] call life_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)};
	waitUntil{isNull (findDisplay 38500)};
};
*/
if (!life_is_alive) then
{
	[0] call life_fnc_setPain;
	[false] call life_fnc_brokenLeg;
	[] call life_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)};
	waitUntil{isNull (findDisplay 38500)};
	life_is_alive = true;
} else {
	if(life_is_arrested) then
	{
		life_is_arrested = false;
		[player,true] spawn life_fnc_jail;
	} else {
		player setPos _playerPosition;
	};	
	life_is_alive = true;
}; 

player setVariable["coplevel", __GETC__(life_coplevel), true];
player setVariable["mediclevel", __GETC__(life_medicLevel), true];
player setVariable["adminlevel", __GETC__(life_adminlevel), true];

player addRating 9999999;

[] call life_fnc_handlerHelp;

[[getPlayerUID player],"TON_fnc_loadBounties",false,false] spawn life_fnc_MP;