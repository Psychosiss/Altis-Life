private["_vehicle","_veh_data"];
if(dialog) exitWith {};
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;

if(isNull _vehicle OR !
(
	("Land_Wreck_Traw_F" == typeOf _vehicle) OR
	("Land_Wreck_Traw2_F" == typeOf _vehicle) OR
	_vehicle isKindOf "Car" OR 
	_vehicle isKindOf "Air" OR 
	_vehicle isKindOf "Ship" OR 
	_vehicle isKindOf "House_F" OR 
	_vehicle isKindOF "Box" OR
	(typeOf _vehicle in 
		[
			//"Land_Pod__Heli_Transport_04_covered_F",
			"Land_Pod_Heli_Transport_04_covered_F",
			"Land_Portable_generator_F",
			"Box_NATO_AmmoVeh_F",
			"Box_East_AmmoVeh_F",
			"Box_IND_AmmoVeh_F",
			"Land_Cargo20_blue_F",
			"Land_Cargo20_brick_red_F",
			"Land_Cargo20_cyan_F",
			"Land_Cargo20_grey_F",
			"Land_Cargo20_light_blue_F",
			"Land_Cargo20_light_green_F",
			"Land_Cargo20_military_green_F",
			"Land_Cargo20_orange_F",
			"Land_Cargo20_red_F",
			"Land_Cargo20_sand_F",
			"Land_Cargo20_white_F",
			"Land_Cargo20_yellow_F",
			"Land_TentDome_F",
			"Land_TentA_F"
		]
	)
)) exitWith {};

if((_vehicle getVariable ["trunk_in_use",false])) exitWith {hint "Une seul personne peut ouvrir l'inventaire de ce vehicule."};
_vehicle setVariable["trunk_in_use",true,true];
if(!createDialog "TrunkMenu") exitWith {"Erreur Dialog";};
disableSerialization;
[_vehicle] call life_fnc_updateVehTrunk;

if(_vehicle isKindOf "House_F") then 
{
	ctrlSetText[3501,format["Inventaire de la maison - %1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];
} else {
	ctrlSetText[3501,format["Inventaire du véhicule - %1",getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName")]];
};

if(_vehicle isKindOf "House_F") then 
{
	private "_mWeight";
	_mWeight = 0;
	{
		_mWeight = _mWeight + ([(typeOf _x)] call life_fnc_vehicleWeightCfg);
	} foreach (_vehicle getVariable["containers",[]]);
	_veh_data = [_mWeight,(_vehicle getVariable["Trunk",[[],0]]) select 1];
} else {
	_veh_data = [_vehicle] call life_fnc_vehicleWeight;
};

if(_vehicle isKindOf "House_F" && {count (_vehicle getVariable ["containers",[]]) == 0}) exitWith 
{
	hint "You need to install storage containers to have storing capabilities!"; 
	closeDialog 0; 
	_vehicle setVariable["trunk_in_use",false,true];
};

if(_veh_data select 0 == -1 && {!(_vehicle isKindOf "House_F")}) exitWith 
{
	closeDialog 0; 
	_vehicle setVariable["trunk_in_use",false,true]; 
	hint "Ce véhicule ne peux pas stocker d'objets.";
};

ctrlSetText[3504,format["%1/%2",_veh_data select 1,_veh_data select 0]];
[_vehicle] call life_fnc_vehInventory;
life_trunk_vehicle = _vehicle;

_vehicle spawn
{
	player say3D "trunk_open";
	waitUntil {isNull (findDisplay 3500)};
	player say3D "trunk_close";
	_this setVariable["trunk_in_use",false,true];
	if(_this isKindOf "House_F") then 
	{
		[[_this],"TON_fnc_updateHouseTrunk",false,false] spawn life_fnc_MP;
	};
};