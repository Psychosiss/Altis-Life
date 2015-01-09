private["_uid","_name","_unit"];
_uid = _this select 0;
_name = _this select 2;
_unit = _this select 3;
_containers = nearestObjects[_unit,["WeaponHolderSimulated"],5];
{
	deleteVehicle _x;
} foreach _containers;
deleteVehicle _unit;

_uid spawn TON_fnc_houseCleanup;