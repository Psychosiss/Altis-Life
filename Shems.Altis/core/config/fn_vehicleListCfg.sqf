private["_shop","_return"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {[]};
_return = [];

/*
if ("life_donator" call GTA_fnc_const > 0) then 
{
	{
		_x set [1, ( _x select 1 ) / 2];
	} forEach _return;
};
*/

switch _shop do
{
	case "kart_shop":
	{
		_return pushBack ["C_Kart_01_Blu_F",150000],
		_return pushBack ["C_Kart_01_Fuel_F",150000],
		_return pushBack ["C_Kart_01_Red_F",150000],
		_return pushBack ["C_Kart_01_Vrana_F",150000]
	};

	case "med_shop":
	{
		/*_return pushBack ["C_Offroad_01_F",7000],
		_return pushBack ["I_Truck_02_medical_F",25000],
		_return pushBack ["O_Truck_03_medical_F",45000],
		_return pushBack ["B_Truck_01_medical_F",60000],
		_return pushBack ["C_SUV_01_F",15000]*/
		_return pushBack ["C_SUV_01_F",0];
		_return pushBack ["C_Hatchback_01_F",0];
		_return pushBack ["C_Van_01_box_F",0];
		if (life_med_level >= 3) then 
		{
			_return pushBack ["C_Hatchback_01_sport_F",0];
		};
	};
	
	case "med_air_hs": 
	{
		/*_return pushBack ["B_Heli_Light_01_F",50000],
		_return pushBack ["O_Heli_Light_02_unarmed_F",75000],
		_return pushBack ["O_Heli_Transport_04_medevac_F",125000]*/
		if (life_med_level >= 2) then 
		{
			_return pushBack ["O_Heli_Light_02_unarmed_F",0];
			_return pushBack ["C_Heli_Light_01_civil_F",0];
		};	
	};

	case "med_boat":
	{
		//_return pushBack ["C_Boat_Civil_01_rescue_F",10000];
	};

	case "civ_car":
	{
		_return pushBack ["C_Quadbike_01_F",5000];
		_return pushBack ["C_Hatchback_01_F",10000];
		_return pushBack ["C_Offroad_01_F",15000];
		_return pushBack ["C_SUV_01_F",15000];
		_return pushBack ["C_Van_01_transport_F",68000];
	};

	// To add
	case "event_derby":
	{
		_return pushBack ["B_Quadbike_01_F",0];
		_return pushBack ["C_Hatchback_01_F",0];
		_return pushBack ["C_Offroad_01_F",0];
		_return pushBack ["C_SUV_01_F",0];
		_return pushBack ["C_Hatchback_01_sport_F",0];
	};

	case "event_helicopters":
	{
		_return pushBack ["C_Heli_Light_01_civil_F",0];
		_return pushBack ["B_Heli_Light_01_F",0];
		_return pushBack ["O_Heli_Light_02_unarmed_F",0];
		_return pushBack ["I_Heli_Transport_02_F",0];
		_return pushBack ["B_Heli_Transport_03_unarmed_F",0];
		_return pushBack ["O_Heli_Transport_04_F",0];
		_return pushBack ["O_Heli_Transport_04_bench_F",0];
		_return pushBack ["O_Heli_Transport_04_covered_F",0];
		_return pushBack ["O_Heli_Transport_04_box_F",0];
	};

	case "press_car":
	{
		_return pushBack ["C_SUV_01_F",5000];
	};

	case "press_helicopters":
	{
		_return pushBack ["C_Heli_Light_01_civil_F",250000];
	};

	case "civ_truck":
	{
		_return pushBack ["C_Van_01_transport_F",30000];
		_return pushBack ["C_Van_01_box_F",50000];
		_return pushBack ["I_Truck_02_transport_F",80000];
		_return pushBack ["I_Truck_02_covered_F",100000];
		_return pushBack ["O_Truck_03_transport_F",250000];
		_return pushBack ["O_Truck_03_covered_F",300000];
		_return pushBack ["O_Truck_03_device_F",2000000];
		_return pushBack ["B_Truck_01_ammo_F",400000];
		_return pushBack ["B_Truck_01_box_F",600000];
	};

	case "reb_car":
	{
		_return pushBack ["B_Quadbike_01_F",2500];
		_return pushBack ["B_G_Offroad_01_F",10000];
		_return pushBack ["O_MRAP_02_F",1000000];
		_return pushBack ["B_Heli_Light_01_F",500000];
		_return pushBack ["I_Heli_light_03_unarmed_F",3000000];
		if (license_civ_rebel) then 
		{
			_return pushBack ["B_G_Offroad_01_armed_F",600000];
		};
	};

	case "cop_car":
	{
		if (life_cop_level >= 2) then 
		{
			_return pushBack ["C_Hatchback_01_F",0];
		};

		if (life_cop_level >= 3) then 
		{
			_return pushBack ["C_SUV_01_F",0];
			_return pushBack ["C_Offroad_01_F",0];
			_return pushBack ["I_Truck_02_covered_F",0];
		};

		if (life_cop_level >= 6) then 
		{
			_return pushBack ["C_Hatchback_01_sport_F",0];
		};

		if (license_cop_tfu || {life_cop_level >= 8}) then 
		{
			_return pushBack ["B_MRAP_01_F",0];
		};
	};

	case "civ_air":
	{
		_return pushBack ["C_Heli_Light_01_civil_F",250000];
		_return pushBack ["B_Heli_Light_01_F",500000];
		_return pushBack ["O_Heli_Light_02_unarmed_F",1000000];
		_return pushBack ["I_Heli_Transport_02_F",3000000];
		_return pushBack ["B_Heli_Transport_03_unarmed_F",6000000];
		_return pushBack ["O_Heli_Transport_04_F",2000000];
		_return pushBack ["O_Heli_Transport_04_bench_F",4000000];
		_return pushBack ["O_Heli_Transport_04_covered_F",4000000];
		_return pushBack ["O_Heli_Transport_04_box_F",7500000];
	};

	case "cop_air":
	{
		_return pushBack ["B_Heli_Light_01_F",0];
		_return pushBack ["I_Heli_light_03_unarmed_F",0];
	};

	case "civ_ship":
	{
		_return pushBack ["C_Rubberboat",5000];
		_return pushBack ["C_Boat_Civil_01_F",22000];
		_return pushBack ["B_SDV_01_F",2000000];
	};

	case "cop_ship": 
	{
		_return pushBack ["B_Boat_Transport_01_F",0];
		_return pushBack ["C_Boat_Civil_01_police_F",0];
		_return pushBack ["B_SDV_01_F",0];
	};

	case "civ_jet":
	{
		_return pushBack ["O_Plane_CAS_02_F",10000000];
	};	

	case "civ_box":
	{
		_return pushBack ["Land_CargoBox_V1_F",140000];
		_return pushBack ["Box_NATO_AmmoVeh_F",200000];
		_return pushBack ["Box_East_AmmoVeh_F",200000];
		_return pushBack ["Box_IND_AmmoVeh_F",200000];
		_return pushBack ["Land_Cargo20_blue_F",850000];
		_return pushBack ["Land_Cargo20_brick_red_F",850000];
		_return pushBack ["Land_Cargo20_cyan_F",850000];
		_return pushBack ["Land_Cargo20_grey_F",850000];
		_return pushBack ["Land_Cargo20_light_blue_F",850000];
		_return pushBack ["Land_Cargo20_light_green_F",850000];
		_return pushBack ["Land_Cargo20_military_green_F",850000];
		_return pushBack ["Land_Cargo20_orange_F",850000];
		_return pushBack ["Land_Cargo20_red_F",850000];
		_return pushBack ["Land_Cargo20_sand_F",850000];
		_return pushBack ["Land_Cargo20_white_F",850000];
		_return pushBack ["Land_Cargo20_yellow_F",850000];
		_return pushBack ["Land_Portable_generator_F",100000];
	};

	case "dep_car":
	{
		_return pushBack ["C_Offroad_01_repair_F",5000];
	};

	case "dep_air":
	{
		_return pushBack ["O_Heli_Transport_04_repair_F",100000];
		_return pushBack ["O_Heli_Transport_04_fuel_F",100000];
	};
};

_return;