private["_nearVehicles","_vehicle"];
if(vehicle player != player) then
{
	_vehicle = vehicle player;
} else {
	_nearVehicles = nearestObjects[getPos (_this select 0),["Car","Air","Ship","Land_Portable_generator_F","Box_NATO_AmmoVeh_F","Box_East_AmmoVeh_F","Box_IND_AmmoVeh_F","Land_Cargo20_blue_F","Land_Cargo20_brick_red_F","Land_Cargo20_cyan_F","Land_Cargo20_grey_F","Land_Cargo20_light_blue_F","Land_Cargo20_light_green_F","Land_Cargo20_military_green_F","Land_Cargo20_orange_F","Land_Cargo20_red_F","Land_Cargo20_sand_F","Land_Cargo20_white_F","Land_Cargo20_yellow_F"],30];
	if(count _nearVehicles > 0) then
	{
		{
			if(!isNil "_vehicle") exitWith {};
			_vehData = _x getVariable["vehicle_info_owners",[]];
			if(count _vehData  > 0) then
			{
				_vehOwner = (_vehData select 0) select 0;
				if((getPlayerUID player) == _vehOwner) exitWith
				{
					_vehicle = _x;
				};
			};
		} foreach _nearVehicles;
	};
};

if(isNil "_vehicle") exitWith {hint "There isn't a vehicle near the NPC."};
if(isNull _vehicle) exitWith {};
[[_vehicle,false,(_this select 1)],"TON_fnc_vehicleStore",false,false] call life_fnc_MP;
hint "The server is trying to store the vehicle...";
life_garage_store = true;