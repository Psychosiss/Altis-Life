life_channel_send = true;
life_garage_store = false;
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_is_processing = false;
life_session_completed = false;
life_bail_paid = false;
life_action_inUse = false;
life_impound_inuse = false;
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_removeWanted = false;
life_god = false;
life_frozen = false;
life_markers = false;
life_isSuicide = false;
life_smoking = false;
life_drug_withdrawl = false;
life_earplugs = false;
life_animals_spawned = false;
life_action_gathering = false;
life_show_actions = false;
life_is_alive = false;
life_request_timer = false;
life_drug_level = 0;
life_cocaine_effect = 0;
life_heroin_effect = 0;
life_meth_effect = 0;
life_clothing_filter = 0;
life_sex = 0;
life_checked = 0;
life_session_tries = 0;
life_action_time = 0;
//life_speaking_warnings = 0;
life_fatigue = 0.5;
life_respawn_timer = 2;
life_clothing_uniform = -1;
life_animals_spawned_time = -500;
life_trunk_vehicle = ObjNull;
life_spikestrip = ObjNull;
life_cursorTarget = objNull;
life_handcuffs = ObjNull;
life_handcuffkeys = ObjNull;
life_query_time = time;
life_action_delay = time;
life_redgull_effect = time;
life_clothing_purchase = [-1,-1,-1,-1,-1];
life_used_drug = [0,0,0,0];
life_addiction = [0,0,0,0];
life_last_tracked = [0,0,0];
life_animals_array = [];
life_masks = [
	["G_Balaclava_blk","G_Balaclava_combat","G_Balaclava_lowprofile","G_Balaclava_oli","G_Bandanna_aviator","G_Bandanna_beast","G_Bandanna_blk","G_Bandanna_khk","G_Bandanna_oli","G_Bandanna_shades","G_Bandanna_sport","G_Bandanna_tan"],
	["H_Shemag_khk","H_Shemag_tan","H_Shemag_olive","H_Shemag_olive_hs","H_ShemagOpen_khk","H_ShemagOpen_tan"],
	["U_B_GhillieSuit","U_O_GhillieSuit","U_I_GhillieSuit"]
];

life_revive_cops = compileFinal (if(typeName true == "STRING") then {true} else {str(true)});
life_revive_fee = compileFinal (if(typeName 1250 == "STRING") then {1250} else {str(1250)});
life_houseLimit = compileFinal (if(typeName 5 == "STRING") then {5} else {str(5)});
life_gangPrice = compileFinal (if(typeName 0 == "STRING") then {0} else {str(0)});
life_gangUpgradeBase = compileFinal (if(typeName 10000 == "STRING") then {10000} else {str(10000)});
life_gangUpgradeMultipler = compileFinal (if(typeName 2.5 == "STRING") then {2.5} else {str(2.5)});
life_save_civ = compileFinal (if(typeName true == "STRING") then {true} else {str(true)});
life_save_yinv = compileFinal (if(typeName true == "STRING") then {true} else {str(true)});
life_enableFatigue = compileFinal (if(typeName false == "STRING") then {false} else {str(false)});
life_paycheck_period = compileFinal (if(typeName 5 == "STRING") then {5} else {str(5)});
life_taxes_period = compileFinal (if(typeName 10 == "STRING") then {10} else {str(10)});
life_impound_car = compileFinal (if(typeName 350 == "STRING") then {350} else {str(350)});
life_impound_boat = compileFinal (if(typeName 250 == "STRING") then {250} else {str(250)});
life_impound_air = compileFinal (if(typeName 850 == "STRING") then {850} else {str(850)});

switch playerSide do
{
	case west: 
	{
		life_maxWeight = 50;
		life_maxWeightT = 50;
		life_carryWeight = 0;
		life_atmmoney = 100000;
		life_paycheck = 10000;
		life_taxes = 2500;
	};

	case independent: 
	{
		life_maxWeight = 50;
		life_maxWeightT = 50;
		life_carryWeight = 0;
		life_atmmoney = 100000;
		life_paycheck = 5000;
		life_taxes = 2500;
	};

	case civilian : 
	{
		life_maxWeight = 24;
		life_maxWeightT = 24;
		life_carryWeight = 0;
		life_atmmoney = 100000;
		life_paycheck = 1500;
		life_taxes = 750;
	};
};

/*
life_eat_Salema = 40;
life_eat_Ornate = 20;
life_eat_Mackerel = 20;
life_eat_Tuna = 100;
life_eat_Mullet = 30;
life_eat_CatShark = 60;
life_eat_Rabbit = 20;
life_eat_Apple = 5;
life_eat_turtlesoup = 62;
life_eat_donuts = 30;
life_eat_burgers = 35;
life_eat_frites = 35;
life_eat_pizza = 70;
*/

life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_bank_fail = false;
life_use_atm = true;
life_is_arrested = false;
life_delivery_in_progress = false;
life_action_in_use = false;
life_istazed = false;
life_brokenLeg = false;
life_thirst = 100;
life_hunger = 100;
life_trunk_reserved_ressources = 1;
life_my_gang = ObjNull;
life_smartphoneTarget = ObjNull;
life_pain = 0;
life_money = 0;
life_vehicles = [];
bank_robber = [];
player setVariable["downed",false,true];

life_vShop_rentalOnly = 
[
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
	"B_G_Offroad_01_armed_F"
];
life_vShop_rentalOnly = compileFinal (if(typeName life_vShop_rentalOnly == "STRING") then {life_vShop_rentalOnly} else {str(life_vShop_rentalOnly)});

life_inv_items = 
[
	"life_inv_oilu",
	"life_inv_oilp",
	"life_inv_heroinu",
	"life_inv_heroinp",
	"life_inv_cannabis",
	"life_inv_marijuana",
	"life_inv_apple",
	"life_inv_salema",
	"life_inv_ornate",
	"life_inv_mackerel",
	"life_inv_tuna",
	"life_inv_mullet",
	"life_inv_catshark",
	"life_inv_turtle",
	"life_inv_fishingpoles",
	"life_inv_water",
	"life_inv_burgers",
	"life_inv_donuts",
	"life_inv_turtlesoup",
	"life_inv_coffee",
	"life_inv_fuelF",
	"life_inv_fuelE",
	"life_inv_pickaxe",
	"life_inv_copperore",
	"life_inv_ironore",
	"life_inv_ironr",
	"life_inv_copperr",
	"life_inv_sand",
	"life_inv_salt",
	"life_inv_saltr",
	"life_inv_glass",
	"life_inv_tbacon",
	"life_inv_lockpick",
	"life_inv_redgull",
	"life_inv_peach",
	"life_inv_frites",
	"life_inv_pizza",
	"life_inv_diamond",
	"life_inv_coke",
	"life_inv_cokep",
	"life_inv_diamondr",
	"life_inv_spikeStrip",
	"life_inv_rock",
	"life_inv_cement",
	"life_inv_goldbar",
	"life_inv_blastingcharge",
	"life_inv_boltcutter",
	"life_inv_defusekit",
	"life_inv_storagesmall",
	"life_inv_storagebig",
	"life_inv_methu",
	"life_inv_methp",
	"life_inv_tabac",
	"life_inv_cigare",
	"life_inv_puranium",
	"life_inv_ipuranium",
	"life_inv_uranium1",
	"life_inv_uranium2",
	"life_inv_uranium3",
	"life_inv_uranium4",
	"life_inv_uranium",
	"life_inv_skull",
	"life_inv_skullp",
	"life_inv_nitro",
	"life_inv_kidney",
	"life_inv_gpstracker",
	"life_inv_bombdetect",
	"life_inv_demolitioncharge",
	"life_inv_civdefusekit",
	"life_inv_scalpel",
	"life_inv_silver",
	"life_inv_silverr",
	"life_inv_speedbomb",
	"life_inv_pressluft",
	"life_inv_campfire",
	"life_inv_painkillers",
	"life_inv_tent1",
	"life_inv_tent2",
	"life_inv_dog",
	"life_inv_dogp",
	"life_inv_goat",
	"life_inv_snake",
	"life_inv_goatp",
	"life_inv_sheep",
	"life_inv_sheepp",
	"life_inv_chicken",
	"life_inv_chickenp",
	"life_inv_snakep",
	"life_inv_rabbit",
	"life_inv_rabbitp",
	"life_inv_skinningknife",
	"life_inv_vammo",
	"life_inv_adrenalineShot",
	"life_inv_debitcard",
	"life_inv_underwatercharge",
	"life_inv_handcuffs",
    "life_inv_handcuffkeys"
];

{missionNamespace setVariable[_x,0];} foreach life_inv_items;

life_licenses =
[
	["license_cop_air","cop"],
	["license_cop_swat","cop"],
	["license_cop_cg","cop"],
	["license_civ_driver","civ"],
	["license_civ_air","civ"],
	["license_civ_heroin","civ"],
	["license_civ_marijuana","civ"],
	["license_civ_boat","civ"],
	["license_civ_oil","civ"],
	["license_civ_dive","civ"],
	["license_civ_truck","civ"],
	["license_civ_gun","civ"],
	["license_civ_rebel","civ"],
	["license_civ_coke","civ"],
	["license_civ_diamond","civ"],
	["license_civ_copper","civ"],
	["license_civ_iron","civ"],
	["license_civ_sand","civ"],
	["license_civ_salt","civ"],
	["license_civ_cement","civ"],
	["license_med_air","med"],
	["license_civ_meth","civ"],
	["license_civ_tabac","civ"],
	["license_civ_home","civ"],
	["license_civ_uranium","civ"],
	["license_civ_skull","civ"],
	["license_civ_silver","civ"],
	["license_cop_tfu","cop"],
	["license_civ_advrebel", "civ"],
	["license_civ_jet","civ"],
	["license_civ_press","civ"]
];

{missionNamespace setVariable[(_x select 0),false];} foreach life_licenses;

life_dp_points = ["dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25"];

life_illegal_items = 
[
	["goldbar",150000],
	["heroinu",1875],
	["heroinp",3750],
	["cocaine",2500],
	["cocainep",5000],
	["cannabis",1750],
	["marijuana",3500],
	["turtle",7000],
	["blastingcharge",125000],
	["boltcutter",50000],
	["oil_u",5500],
	["oil_p",9500],
	["methu",5500],
	["methp",9500],
	["tabac",5500], // --- TODO : search a price
	["cigare",9500], // --- TODO : search a price
	["ipuranium",10000], // --- TODO : search a price
	["dog",2500], // --- TODO : search a price
	["dogp",2500], // --- TODO : search a price
	["handcuffs",10000],
	["handcuffkeys",5000] // --- TODO : search a price
	["kidney",5000], // --- TODO : search a price
];

sell_array = 
[
	["apple",50],
	["catshark",300],
	["cement",2250],
	//["methu",400],
	["methp",12000],
	//["cocaine",3000],
	["cocainep",10000],
	["copper_r",2250],
	//["diamond",750],
	["diamondc",3000],
	//["fuelE",0],
	["fuelF",500],
	["glass",2800],
	["goldbar",260000],
	//["heroinu",1850],
	["heroinp",8000],
	["iron_r",2600],
	["lockpick",75], // --- TODO : edit the price
	["mackerel",170],
	["marijuana",7000],
	["mullet",250],
	["oilp",9500],
	["ornate",50],
	["peach",50],
	["pickaxe",750], // --- TODO : edit the price
	["rabbit",800], // --- TODO : edit the price
	["redgull",200], // --- TODO : edit the price
	["salema",50],
	["salt_r",2700],
	["silver_r",3000],
	["spikeStrip",1200], // --- TODO : edit the price
	["storagebig",0], // --- TODO : edit the price
	["storagesmall",0], // --- TODO : edit the price
	["tbacon",25], // --- TODO : edit the price
	["tuna",700], // --- TODO : edit the price
	["turtle",15000],
	["water",5], // --- TODO : edit the price
	["burgers",175], // --- TODO : edit the price
	["frites",150], // --- TODO : edit the price
	["pizza",200], // --- TODO : edit the price
	["coffee",5], // --- TODO : edit the price
	["turtlesoup",1000],
	["donuts",60], // --- TODO : edit the price
	["tabac",5000], // --- TODO : edit the price
	["cigare",7600], // --- TODO : edit the price
	["uranium",35000], // --- TODO : edit the price
	["skull",750], // --- TODO : edit the price
	["skullp",1500], // --- TODO : edit the price
	["nitro",5000], // --- TODO : edit the price
	["kidney",50000], // --- TODO : edit the price
	["gpstracker",500], // --- TODO : edit the price
	["scalpel",100], // --- TODO : edit the price
	["pressluft",5000], // --- TODO : edit the price
	["speedbomb",500000], // --- TODO : edit the price
	["campfire",3000], // --- TODO : edit the price
	["painkillers",50], // --- TODO : edit the price
	["tent1",9000], // --- TODO : edit the price
	["tent2",10000], // --- TODO : edit the price
	["skinningknife",1000], // --- TODO : edit the price
	["dog",3000], // --- TODO : edit the price
	["goat",2000], // --- TODO : edit the price
	["chicken",2500], // --- TODO : edit the price
	["sheep",2000], // --- TODO : edit the price
	["snake",850], // --- TODO : edit the price
	["dogp",14000], // --- TODO : edit the price
	["goatp",8000], // --- TODO : edit the price
	["chickenp",9000], // --- TODO : edit the price
	["sheepp",8000], // --- TODO : edit the price
	["snakep",1900], // --- TODO : edit the price
	["rabbitp",1800], // --- TODO : edit the price
	["vammo",10000], // --- TODO : edit the price
	["adrenalineShot",5000], // --- TODO : edit the price
	["debitcard",2500], // --- TODO : edit the price
	["underwatercharge",5000], // --- TODO : edit the price
	["handcuffs",200], // --- TODO : edit the price
    ["handcuffkeys",100] // --- TODO : edit the price
];
//sell_array = compileFinal (if(typeName sell_array == "STRING") then {sell_array} else {str(sell_array)});

buy_array = 
[
	["apple",65],
	["salema",55],
	["ornate",50],
	["mackerel",200],
	["tuna",900],
	["mullet",300],
	["catshark",350],
	["water",10],
	["burgers",350],
	["turtle",4000],
	["turtlesoup",2500],
	["donuts",120],
	["coffee",10],
	["tbacon",75],
	["lockpick",150],
	["pickaxe",1200],
	["redgull",1500],
	["fuelF",850],
	["peach",68],
	["frites",300],
	["pizza",400],
	["spikeStrip",2500],
	["blastingcharge",35000],
	["boltcutter",7500],
	["defusekit",2500],
	["storagesmall",75000],
	["storagebig",150000],
	["puranium",15000],
	["ipuranium",9000],
	["nitro",15000],
	["kidney",75000],
	["gpstracker",2500],
	["demolitioncharge",7500000],
	["bombdetect",9200],
	["civdefusekit",7500],
	["scalpel",500],
	["pressluft",10000],
	["speedbomb",700000],
	["campfire",5000],
	["painkillers",150],
	["tent1",20000],
	["tent2",25000],
	["dogp",22000],
	["skinningknife",2000],
	["vammo",25000],
	["adrenalineShot",20000],
	["debitcard",5000],
	["underwatercharge",10000],
	["handcuffs",500],
    ["handcuffkeys",300]
];
buy_array = compileFinal (if(typeName buy_array == "STRING") then {buy_array} else {str(buy_array)});

life_weapon_shop_array =
[
	["arifle_sdar_F",7500],
	["hgun_P07_snds_F",650],
	["hgun_P07_F",1500],
	["ItemGPS",45],
	["ToolKit",75],
	["FirstAidKit",65],
	["Medikit",450],
	["NVGoggles",980],
	["16Rnd_9x21_Mag",15],
	["20Rnd_556x45_UW_mag",35],
	["ItemMap",35],
	["ItemCompass",25],
	["Chemlight_blue",50],
	["Chemlight_yellow",50],
	["Chemlight_green",50],
	["Chemlight_red",50],
	["hgun_Rook40_F",500],
	["arifle_Katiba_F",5000],
	["30Rnd_556x45_Stanag",65],
	["20Rnd_762x51_Mag",85],
	["30Rnd_65x39_caseless_green",50],
	["DemoCharge_Remote_Mag",7500],
	["SLAMDirectionalMine_Wire_Mag",2575],
	["optic_ACO_grn",250],
	["acc_flashlight",100],
	["srifle_EBR_F",1500],
	["arifle_TRG21_F",3500],
	["optic_MRCO",5000],
	["optic_Aco",850],
	["arifle_MX_F",7500],
	["arifle_MXC_F",5000],
	["arifle_MXM_F",8500],
	["MineDetector",500],
	["optic_Holosight",275],
	["acc_pointer_IR",175],
	["arifle_TRG20_F",2500],
	["SMG_01_F",1500],
	["arifle_Mk20C_F",4500],
	["30Rnd_45ACP_Mag_SMG_01",60],
	["30Rnd_9x21_Mag",100],
	["16Rnd_9x21_Mag",115],
	["150Rnd_762x51_Box_Tracer",200]
];
life_weapon_shop_array = compileFinal (if(typeName life_weapon_shop_array == "STRING") then {life_weapon_shop_array} else {str(life_weapon_shop_array)});

life_taxi_stands =
[
	["civ_spawn_4","Badtown",civilian],
	["civ_spawn_3","Neochori",civilian],
	["civ_spawn_2","Pyrgos",civilian],
	["civ_spawn_10","Kavala",civilian],
	["reb_spawn_2","Camp ouest",civilian],
	["reb_spawn_1","Camp est",civilian],
	["cop_spawn_1","Kavala",west],
	["cop_spawn_2","Pyrgos",west],
	["cop_spawn_3","Neochori",west],
	["cop_spawn_4","Barrage",west],
	["medic_spawn_1","Kavala",independent],
	["medic_spawn_2","Pyrgos",independent]
];

life_garage_prices =
[
	["B_QuadBike_01_F",550],
	["C_Hatchback_01_F",1500],
	["C_Offroad_01_F", 2500],
	["B_G_Offroad_01_F",3500],
	["C_SUV_01_F",5250],
	["C_Van_01_transport_F",7890],
	["C_Hatchback_01_sport_F",2350],
	["C_Van_01_fuel_F",4500],
	["I_Heli_Transport_02_F",1000],
	["C_Van_01_box_F",9000],
	["I_Truck_02_transport_F",1200],
	["I_Truck_02_covered_F",1450],
	["B_Truck_01_transport_F",2650],
	["B_Truck_01_box_F", 3500],
	["O_MRAP_02_F",4500],
	["B_Heli_Light_01_F",4500],
	["O_Heli_Light_02_unarmed_F",6500],
	["C_Rubberboat",400],
	["C_Boat_Civil_01_F",4500],
	["B_Boat_Transport_01_F",450],
	["C_Boat_Civil_01_police_F",3500],
	["B_Boat_Armed_01_minigun_F",1650],
	["B_SDV_01_F",2500],
	["B_MRAP_01_F",7500]
];
life_garage_prices = compileFinal (if(typeName life_garage_prices == "STRING") then {life_garage_prices} else {str(life_garage_prices)});

life_garage_sell =
[
	["B_QuadBike_01_F",550],
	["C_Hatchback_01_F",1500],
	["C_Offroad_01_F", 2500],
	["B_G_Offroad_01_F",3500],
	["C_SUV_01_F",5250],
	["C_Van_01_transport_F",7890],
	["C_Hatchback_01_sport_F",2350],
	["C_Van_01_fuel_F",4500],
	["I_Heli_Transport_02_F",1000],
	["C_Van_01_box_F",9000],
	["I_Truck_02_transport_F",1200],
	["I_Truck_02_covered_F",1450],
	["B_Truck_01_transport_F",2650],
	["B_Truck_01_box_F", 3500],
	["O_MRAP_02_F",4500],
	["B_Heli_Light_01_F",4500],
	["O_Heli_Light_02_unarmed_F",10000],
	["C_Rubberboat",400],
	["C_Boat_Civil_01_F",4500],
	["B_Boat_Transport_01_F",450],
	["C_Boat_Civil_01_police_F",3500],
	["B_Boat_Armed_01_minigun_F",1650],
	["B_SDV_01_F",2500],
	["B_MRAP_01_F",7500]
];
life_garage_sell = compileFinal (if(typeName life_garage_sell == "STRING") then {life_garage_sell} else {str(life_garage_sell)});

life_insure_prices =
[
	["C_Kart_01_Blu_F",2500],
    ["C_Kart_01_Fuel_F",2500],
    ["C_Kart_01_Vrana_F",2500],
    ["C_Kart_01_Red_F",2500],
	["B_Quadbike_01_F",2500],
	["C_Hatchback_01_F",4500],
	["C_Hatchback_01_sport_F",4500],
	["C_Offroad_01_F",3000],
	["C_SUV_01_F",4000],
	["C_Van_01_transport_F",10000],
	["C_Van_01_box_F",10000],
	["C_Van_01_fuel_F",10000],
	["I_Truck_02_transport_F",10000],
	["I_Truck_02_covered_F",10000],
	["I_Truck_02_box_F",10000],
	["B_Truck_01_transport_F",10000],
	["B_Truck_01_box_F", 10000],
	["O_Truck_03_device_F", 10000],
	["B_G_Offroad_01_F",10000],
	["B_G_Offroad_01_armed_F",10000],
	["O_MRAP_02_F",10000],
	["B_MRAP_01_F",10000],
	["B_MRAP_01_hmg_F",10000],
	["I_MRAP_03_F",10000],
	["B_Heli_Light_01_F",10000],
	["B_Heli_Attack_01_F",10000],
	["O_Heli_Light_02_unarmed_F",10000],
	["I_Heli_Transport_02_F",10000],
	["I_Heli_light_03_unarmed_F",10000],
	["B_Heli_Transport_01_F",10000],
	["C_Rubberboat",10000],
	["I_G_Boat_Transport_01_F",10000],
	["C_Boat_Civil_01_F",10000],
	["B_Boat_Transport_01_F",10000],
	["C_Boat_Civil_01_police_F",10000],
	["B_Boat_Armed_01_minigun_F",10000],
	["B_SDV_01_F",10000]
];
life_insure_prices = compileFinal (if(typeName life_insure_prices == "STRING") then {life_insure_prices} else {str(life_insure_prices)});