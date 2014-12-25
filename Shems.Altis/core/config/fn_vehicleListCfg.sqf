#include <macro.h>

private["_shop","_return"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {[]};
_return = [];
switch (_shop) do
{
	case "civ_car":
	{
		_return = 
		[
			["B_Quadbike_01_F",2500],
			["C_Hatchback_01_F",9500],
			["C_Offroad_01_F",12500],
			["C_SUV_01_F",35000]
		];
	};

	case "civ_air":
	{
		_return =
		[
			["B_Heli_Light_01_F",255000],
			["O_Heli_Light_02_unarmed_F",850000],
			["O_Heli_Transport_04_F",500000],
			["O_Heli_Transport_04_box_F",2000000]
		];
	};

	case "civ_box":
	{
		_return =
		[
			["Land_CargoBox_V1_F",40000],
			["Box_IND_AmmoVeh_F",60000],
			["Box_NATO_AmmoVeh_F",80000],
			["Land_Cargo20_red_F",120000],
			["Land_Cargo20_white_F",180000],
			["Land_Cargo20_grey_F",240000]
		];
	};

	case "civ_truck":
	{
		_return =
		[
			["C_Van_01_transport_F",40000],
			["C_Van_01_box_F",60000],
			["C_Van_01_fuel_F",80000],
			["I_Truck_02_transport_F",75000],
			["I_Truck_02_covered_F",100000],
			["B_Truck_01_transport_F",275000],
			["O_Truck_03_transport_F",200000],
			["O_Truck_03_covered_F",250000],
			["O_Truck_03_device_F",450000],
			["B_Truck_01_fuel_F",500000],
			["B_Truck_01_box_F",750000]
		];
	};

	case "civ_ship":
	{
		_return =
		[
			["C_Rubberboat",5000],
			["C_Boat_Civil_01_F",22000]
		];
	};

	case "reb_car":
	{
		_return =
		[
			["C_Offroad_01_F",7000],
			["O_MRAP_02_F",650000],
			["I_MRAP_03_F",900000],
			["B_G_Offroad_01_armed_F",1000000]
		];
	};

	case "reb_air":
	{
		_return = 
		[
			["O_Heli_Transport_04_bench_F",400000]
		];	
	};

	case "dep_car":
	{
		_return set[count _return,["B_G_Offroad_01_F",5000]];
	};

	case "dep_air":
	{
		_return set[count _return,["O_Heli_Transport_04_repair_F",100000]];
		_return set[count _return,["O_Heli_Transport_04_fuel_F",100000]];
	};

	case "kart_shop":
	{
		_return = 
		[
			["C_Kart_01_Blu_F",15000],
			["C_Kart_01_Fuel_F",15000],
			["C_Kart_01_Red_F",15000],
			["C_Kart_01_Vrana_F",15000]
		];
	};

	case "med_shop":
	{
		_return = 
		[
			["C_Offroad_01_F",7000],
			["I_Truck_02_medical_F",25000],
			["O_Truck_03_medical_F",45000],
			["B_Truck_01_medical_F",60000],
			["C_SUV_01_F",15000]
		];
	};
	
	case "med_air_hs": 
	{
		_return = 
		[
			["B_Heli_Light_01_F",50000],
			["O_Heli_Light_02_unarmed_F",75000],
			["O_Heli_Transport_04_medevac_F",125000]
		];
	};

	case "cop_car":
	{
		_return set[count _return,["C_Offroad_01_F",5000]];
		_return set[count _return,["C_SUV_01_F",20000]];
		if(__GETC__(life_coplevel) > 3) then
		{
			_return set[count _return,["B_MRAP_01_F",100000]];
		};
		if(__GETC__(life_coplevel) > 5) then
		{
			_return set[count _return,["B_MRAP_01_hmg_F",100000]];
		};
	};
	
	case "cop_air":
	{
		if(__GETC__(life_coplevel) > 2) then
		{
			_return set[count _return,["O_Heli_Light_02_unarmed_F",750000]];
			_return set[count _return,["B_Heli_Light_01_F",75000]];
		};
		if(__GETC__(life_coplevel) > 4) then
		{
			_return set[count _return,["O_Heli_Light_02_unarmed_F",1000000]];
			_return set[count _return,["B_Heli_Light_01_F",246000]];
			_return set[count _return,["I_Heli_light_03_unarmed_F",1200000]];
		};
	};

	case "cop_ship":
	{
		_return =
		[
			["B_Boat_Transport_01_F",3000],
			["C_Boat_Civil_01_police_F",20000],
			["B_SDV_01_F",50000],
			["B_Boat_Armed_01_minigun_F",200000]
		];
	};

	case "donator_shop":
	{
		if(license_civ_don1) then
		{
			_return set[count _return,["C_Van_01_Fuel_F",4000]];
			_return set[count _return,["I_Truck_02_box_F",50000]];
		};
		if(license_civ_don2) then
		{
			_return set[count _return,["C_Van_01_Fuel_F",4000]];
			_return set[count _return,["I_Truck_02_box_F",50000]];
			_return set[count _return,["C_Hatchback_01_sport_F",40000]];
		};
		if(license_civ_don3) then
		{
			_return set[count _return,["C_Van_01_Fuel_F",4000]];
			_return set[count _return,["I_Truck_02_box_F",50000]];
			_return set[count _return,["C_Hatchback_01_sport_F",40000]];
			_return set[count _return,["B_Truck_01_box_F",400000]];
		};
		if(license_civ_don4) then
		{
			_return set[count _return,["C_Van_01_Fuel_F",4000]];
			_return set[count _return,["I_Truck_02_box_F",50000]];
			_return set[count _return,["C_Hatchback_01_sport_F",40000]];
			_return set[count _return,["B_Truck_01_box_F",400000]];
			_return set[count _return,["I_Heli_Transport_02_F",600000]];
			_return set[count _return,["I_Heli_light_03_unarmed_F",500000]];
		};
		if(license_civ_don5) then
		{
			_return set[count _return,["C_Van_01_Fuel_F",4000]];
			_return set[count _return,["I_Truck_02_box_F",50000]];
			_return set[count _return,["C_Hatchback_01_sport_F",40000]];
			_return set[count _return,["B_Truck_01_box_F",400000]];
			_return set[count _return,["I_Heli_Transport_02_F",600000]];
			_return set[count _return,["I_Heli_light_03_unarmed_F",500000]];
			_return set[count _return,["O_Heli_Transport_04_covered_F",800000]];
		};
	};
};

_return;