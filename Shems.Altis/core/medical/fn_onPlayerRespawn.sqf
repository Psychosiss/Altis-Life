private["_unit","_corpse"];
_unit = _this select 0;
_corpse = _this select 1;
life_corpse = _corpse;

private["_containers"];
_containers = nearestObjects[getPosATL _corpse,["WeaponHolderSimulated"],5];
{deleteVehicle _x;} foreach _containers;

_unit setVariable["Restrained",false,true];
_unit setVariable["Escorting",false,true];
_unit setVariable["transporting",false,true];
_unit setVariable["steam64id",(getPlayerUID player),true];
_unit setVariable["missingOrgan",false,true];
_unit setVariable["hasOrgan",false,true];

_unit addRating 9999999999999999;
player playMoveNow "amovppnemstpsraswrfldnon";

[] call life_fnc_initActions;
[[_unit,life_sidechat,playerSide],"TON_fnc_managesc",false,false] spawn life_fnc_MP;
player enableFatigue ((call life_enableFatigue));