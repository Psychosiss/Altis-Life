private["_shop","_return"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {[]};
_return = [];
switch _shop do
{
	case "civ_car":
	{
		_return pushBack ["C_Quadbike_01_F",2500];
		_return pushBack ["C_Hatchback_01_F",9500];
		_return pushBack ["C_Offroad_01_F",12500];
		_return pushBack ["C_SUV_01_F",35000];
		_return pushBack ["C_Van_01_transport_F",40000];
	};

	case "civ_air":
	{
		_return pushBack ["B_Heli_Light_01_F",255000];
		_return pushBack ["O_Heli_Light_02_unarmed_F",850000];
		_return pushBack ["B_Heli_Transport_03_unarmed_F",6500000];
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

	case "civ_truck":
	{
		_return pushBack ["I_Truck_02_transport_F",75000];
		_return pushBack ["I_Truck_02_covered_F",100000];
		_return pushBack ["O_Truck_03_transport_F",200000];
		_return pushBack ["O_Truck_03_covered_F",250000];
		_return pushBack ["O_Truck_03_device_F",450000];
		_return pushBack ["B_Truck_01_transport_F",275000];
		_return pushBack ["B_Truck_01_fuel_F",500000];
		_return pushBack ["B_Truck_01_covered_F",750000];
		_return pushBack ["B_Truck_01_box_F",1250000];
		_return pushBack ["C_Van_01_box_F",60000];
		_return pushBack ["C_Van_01_fuel_F",80000];
	};

	case "civ_ship":
	{
		_return pushBack ["C_Rubberboat",5000];
		_return pushBack ["C_Boat_Civil_01_F",22000];
	};

	case "reb_car":
	{
		_return pushBack ["C_Offroad_01_F",7000],
		_return pushBack ["O_MRAP_02_F",650000],
		_return pushBack ["I_MRAP_03_F",900000],
		_return pushBack ["B_G_Offroad_01_armed_F",1000000]
	};

	case "reb_air":
	{
		_return pushBack ["C_Heli_Light_01_civil_F",400000]
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

	case "kart_shop":
	{
			_return pushBack ["C_Kart_01_Blu_F",15000],
			_return pushBack ["C_Kart_01_Fuel_F",15000],
			_return pushBack ["C_Kart_01_Red_F",15000],
			_return pushBack ["C_Kart_01_Vrana_F",15000]
	};

	case "med_shop":
	{
		_return pushBack ["C_Offroad_01_F",7000],
		_return pushBack ["I_Truck_02_medical_F",25000],
		_return pushBack ["O_Truck_03_medical_F",45000],
		_return pushBack ["B_Truck_01_medical_F",60000],
		_return pushBack ["C_SUV_01_F",15000]
	};
	
	case "med_air_hs": 
	{
		_return pushBack ["B_Heli_Light_01_F",50000],
		_return pushBack ["O_Heli_Light_02_unarmed_F",75000],
		_return pushBack ["O_Heli_Transport_04_medevac_F",125000]
	};

	case "med_boat":
	{
		_return pushBack ["C_Boat_Civil_01_rescue_F",10000];
	};

	case "cop_car":
	{
		_return pushBack ["C_Offroad_01_F",5000];
		_return pushBack ["C_SUV_01_F",20000];
		if((call life_cop_level) > 3) then
		{
			_return pushBack ["B_MRAP_01_F",100000];
		};
		if((call life_cop_level) > 5) then
		{
			_return pushBack ["B_MRAP_01_hmg_F",100000];
		};
	};
	
	case "cop_air":
	{
		if((call life_cop_level) > 2) then
		{
			_return pushBack ["O_Heli_Light_02_unarmed_F",750000];
			_return pushBack ["C_Heli_Light_01_civil_F",75000];
		};
		if((call life_cop_level) > 4) then
		{
			_return pushBack ["O_Heli_Light_02_unarmed_F",1000000];
			_return pushBack ["C_Heli_Light_01_civil_F",246000];
			_return pushBack ["I_Heli_light_03_unarmed_F",1200000];
		};
	};

	case "cop_ship":
	{
		_return pushBack ["B_Boat_Transport_01_F",3000],
		_return pushBack ["C_Boat_Civil_01_police_F",20000],
		_return pushBack ["B_SDV_01_F",50000],
		_return pushBack ["B_Boat_Armed_01_minigun_F",200000]
	};

	case "donator_shop":
	{
		if((call life_donator) > 0) then
		{
			_return pushBack ["I_Truck_02_box_F",50000];
			_return pushBack ["C_Hatchback_01_sport_F",40000];
		};
		if((call life_donator) > 2) then
		{
			_return pushBack ["I_Truck_02_box_F",50000];
			_return pushBack ["C_Hatchback_01_sport_F",40000];
			_return pushBack ["B_Truck_01_box_F",400000];
		};
		if((call life_donator) > 3) then
		{
			_return pushBack ["I_Truck_02_box_F",50000];
			_return pushBack ["C_Hatchback_01_sport_F",40000];
			_return pushBack ["B_Truck_01_box_F",400000];
			_return pushBack ["I_Heli_Transport_02_F",600000];
			_return pushBack ["I_Heli_light_03_unarmed_F",500000];
		};
		if((call life_donator) > 4) then
		{
			_return pushBack ["I_Truck_02_box_F",50000];
			_return pushBack ["C_Hatchback_01_sport_F",40000];
			_return pushBack ["B_Truck_01_box_F",400000];
			_return pushBack ["I_Heli_Transport_02_F",600000];
			_return pushBack ["I_Heli_light_03_unarmed_F",500000];
			_return pushBack ["O_Heli_Transport_04_covered_F",800000];
		};
	};
};

_return;