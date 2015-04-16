private["_handle"];

life_use_atm = true;
life_hunger = 100;
life_thirst = 100;
life_carryWeight = 0;
life_money = 0;
life_respawned = false;
life_holstered = false;
player playMove "amovpercmstpsnonwnondnon";

life_corpse setVariable["Revive",nil,true];
life_corpse setVariable["name",nil,TRUE];
life_corpse setVariable["Reviving",nil,true];
player setVariable["Revive",nil,true];
player setVariable["name",nil,true];
player setVariable["Reviving",nil,true];

switch(playerSide) do
{
	case west: 
	{
		_handle = [] spawn life_fnc_copLoadout;
	};

	case civilian: 
	{
		_handle = [] spawn life_fnc_civLoadout;
	};

	case independent: 
	{
		_handle = [] spawn life_fnc_medicLoadout;
	};
	waitUntil {scriptDone _handle};
};

if(!isNull life_corpse) then 
{
	private["_containers"];
	life_corpse setVariable["Revive",true,true];
	_containers = nearestObjects[life_corpse,["WeaponHolderSimulated"],5];
	{deleteVehicle _x;} foreach _containers;
	hideBody life_corpse;
	//deleteVehicle life_corpse;
};

life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

if(life_is_arrested) exitWith 
{
	life_is_arrested = false;
	[player,true] spawn life_fnc_jail;
	[] call SOCK_fnc_updateRequest;
};

if(!isNil "life_copRecieve") then 
{
	[[player,life_copRecieve,true],"life_fnc_wantedBounty",false,false] call life_fnc_MP;
	life_copRecieve = nil;
};

if(life_removeWanted) then 
{
	[[getPlayerUID player],"life_fnc_wantedRemove",false,false] call life_fnc_MP;
};

[] call SOCK_fnc_updateRequest;
[] call life_fnc_hudUpdate;