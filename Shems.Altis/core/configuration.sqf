#include <macro.h>

// 																								Backend Variables
life_channel_send = true;
life_garage_store = false;
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_siren2_active = false;
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
life_drug_level = 0;
life_cocaine_effect = 0;
life_heroin_effect = 0;
life_meth_effect = 0;
life_clothing_filter = 0;
life_sex_ill = 0;
life_checked = 0;
life_session_tries = 0;
life_fatigue = 0.5;
life_respawn_timer = 2;
life_clothing_uniform = -1;
life_animals_spawned_time = -500;
life_trunk_vehicle = Objnull;
life_spikestrip = ObjNull;
life_query_time = time;
life_action_delay = time;
life_holster_time = time;
life_redgull_effect = time;
life_used_drug = [0,0,0,0];
life_addiction = [0,0,0,0];
life_last_tracked = [0,0,0];
life_animals_array = [];

__CONST__(life_revive_cops,true);
__CONST__(life_revive_fee,1250);
__CONST__(life_houseLimit,5);
__CONST__(life_gangPrice,0);
__CONST__(life_gangUpgradeBase,10000);
__CONST__(life_gangUpgradeMultipler,2.5);
__CONST__(life_save_civ,true);
__CONST__(life_save_yinv,true);
__CONST__(life_enableFatigue,false);

life_clothing_purchase = [-1,-1,-1,-1,-1];

//																								Weight Variables

switch (playerSide) do
{
	case west: 
	{
		life_maxWeight = 50;
		life_maxWeightT = 50;
		life_carryWeight = 0;
	};

	case independent: 
	{
		life_maxWeight = 50;
		life_maxWeightT = 50;
		life_carryWeight = 0;
	};

	case civilian : 
	{
		life_maxWeight = 24;
		life_maxWeightT = 24;
		life_carryWeight = 0;
	};
};

//																								Food Variables

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

// 																								Life Variables

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
__CONST__(life_paycheck_period,5);
__CONST__(life_impound_car,350);
__CONST__(life_impound_boat,250);
__CONST__(life_impound_air,850);
life_my_gang = ObjNull;
life_smartphoneTarget = ObjNull;
life_pain = 0;
life_cash = 0;
life_vehicles = [];
bank_robber = [];
player setVariable["downed",false,true];

switch (playerSide) do
{
	case west: 
	{
		life_atmcash = 10000;
		life_paycheck = 3000;
	};

	case civilian: 
	{
		life_atmcash = 10000;
		life_paycheck = 1250;
	};

	case independent: 
	{
		life_atmcash = 10000;
		life_paycheck = 3000;
	};
};

life_vShop_rentalOnly = 
[
	"B_MRAP_01_hmg_F",
	"Land_CargoBox_V1_F",
	"Box_IND_AmmoVeh_F",
	"Box_NATO_AmmoVeh_F",
	"Land_Cargo20_red_F",
	"Land_Cargo20_white_F",
	"Land_Cargo20_grey_F"
];
__CONST__(life_vShop_rentalOnly,life_vShop_rentalOnly);

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
	"life_inv_bois",
	"life_inv_planche",
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
	"life_inv_goldbarp",
	"life_inv_underwatercharge",
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
	"life_inv_antimatter"
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
	["license_civ_bois","civ"],
	["license_civ_home","civ"],
	["license_civ_uranium","civ"],
	["license_civ_skull","civ"],
	["license_civ_admin","civ"],
	["license_civ_silver","civ"]
];

{missionNamespace setVariable[(_x select 0),false];} foreach life_licenses;

life_talent =
[
	["talent_civ_vest1","civ"],
	["talent_civ_vest2","civ"],
	["talent_civ_vest3","civ"],
	["talent_civ_look","civ"],
	["talent_civ_truck1","civ"],
	["talent_civ_truck2","civ"],
	["talent_civ_helico1","civ"],
	["talent_civ_helico2","civ"],
	["talent_civ_helico3","civ"],
	["talent_civ_truck3","civ"],
	["talent_civ_truck4","civ"],
	["talent_civ_truck5","civ"],
	["talent_civ_truck6","civ"],
	["talent_civ_extra1","civ"],
	["talent_civ_extra2","civ"],
	["talent_civ_extra3","civ"],
	["talent_civ_utils7","civ"],
	["talent_civ_extra4","civ"],
	["talent_civ_extra5","civ"],
	["talent_civ_extra9","civ"],
	["talent_civ_extra6","civ"],
	["talent_civ_extra7","civ"],
	["talent_civ_extra8","civ"],
	["talent_civ_gather","civ"],
	["talent_civ_utils1","civ"],
	["talent_civ_utils2","civ"],
	["talent_civ_utils3","civ"],
	["talent_civ_utils4","civ"],
	["talent_civ_utils5","civ"],
	["talent_civ_utils6","civ"],
	["talent_civ_craft1","civ"],
	["talent_civ_craft2","civ"],
	["talent_civ_craft3","civ"],
	["talent_civ_work1","civ"],
	["talent_civ_work2","civ"],
	["talent_civ_work3","civ"],
	["talent_civ_work4","civ"],
	["talent_civ_work5","civ"],
	["talent_civ_work6","civ"],
	["talent_civ_work7","civ"],	
	["talent_civ_showlevel","civ"],	
	["talent_west_tool1","west"],
	["talent_west_tool2","west"],
	["talent_west_tool3","west"],
	["talent_west_tool7","west"],
	["talent_west_tool4","west"],
	["talent_west_tool5","west"],
	["talent_west_tool6","west"],
	["talent_west_tool8","west"],
	["talent_west_arme1","west"],
	["talent_west_arme2","west"],
	["talent_west_arme3","west"],
	["talent_west_arme4","west"],
	["talent_west_arme5","west"],
	["talent_west_arme6","west"],
	["talent_west_truck1","west"],
	["talent_west_truck2","west"],
	["talent_west_hunter","west"],
	["talent_west_helico1","west"],
	["talent_west_helico2","west"],
	["talent_west_helico2","west"],
	["talent_west_bonus1","west"],
	["talent_west_bonus2","west"],
	["talent_west_bonus5","west"],
	["talent_west_bonus3","west"],
	["talent_west_bonus4","west"],
	["talent_west_bonus6","west"],
	["talent_west_bonus7","west"],
	["talent_west_item1","west"],
	["talent_west_item2","west"],
	["talent_west_item3","west"],
	["talent_west_item4","west"],
	["talent_west_work1","west"],
	["talent_west_work2","west"],
	["talent_west_work3","west"],
	["talent_west_work4","west"],	
	["talent_west_self1","west"],	
	["talent_west_self2","west"],	
	["talent_west_self3","west"],	
	["talent_west_self4","west"],	
	["talent_west_self5","west"],	
	["talent_west_gather","west"],	
	["talent_west_showlevel","west"],	
	["talent_indep_support1","indep"],
	["talent_indep_support2","indep"],
	["talent_indep_support3","indep"],
	["talent_indep_support4","indep"],
	["talent_indep_support6","indep"],
	["talent_indep_support5","indep"],
	["talent_indep_craft1","indep"],
	["talent_indep_craft2","indep"],
	["talent_indep_craft3","indep"],
	["talent_indep_craft4","indep"],
	["talent_indep_truck1","indep"],
	["talent_indep_truck2","indep"],
	["talent_indep_truck3","indep"],
	["talent_indep_helico1","indep"],
	["talent_indep_helico2","indep"],
	["talent_indep_arme1","indep"],
	["talent_indep_arme2","indep"],
	["talent_indep_arme3","indep"],
	["talent_indep_arme4","indep"],
	["talent_indep_bonus1","indep"],
	["talent_indep_bonus5","indep"],
	["talent_indep_bonus2","indep"],
	["talent_indep_bonus6","indep"],
	["talent_indep_bonus3","indep"],
	["talent_indep_bonus4","indep"],
	["talent_indep_work1","indep"],
	["talent_indep_work2","indep"],
	["talent_indep_work3","indep"],
	["talent_indep_work4","indep"],
	["talent_indep_work5","indep"],
	["talent_indep_work6","indep"],
	["talent_indep_work7","indep"],	
	["talent_indep_gather","indep"],	
	["talent_indep_showlevel","indep"],	
	["talent_indep_showdead","indep"],	
	["talent_east_bad1","east"],
	["talent_east_bad2","east"],
	["talent_east_bad3","east"],
	["talent_east_bad7","east"],
	["talent_east_bad4","east"],
	["talent_east_bad5","east"],
	["talent_east_bad6","east"],
	["talent_east_arme1","east"],
	["talent_east_arme2","east"],
	["talent_east_arme3","east"],
	["talent_east_arme4","east"],
	["talent_east_flashbang","east"],
	["talent_east_arme5","east"],
	["talent_east_arme6","east"],
	["talent_east_viseur1","east"],
	["talent_east_viseur2","east"],
	["talent_east_truck1","east"],
	["talent_east_truck2","east"],
	["talent_east_helico1","east"],
	["talent_east_helico2","east"],
	["talent_east_ifrit","east"],
	["talent_east_4x4","east"],
	["talent_east_bonus1","east"],
	["talent_east_bonus2","east"],
	["talent_east_bonus5","east"],
	["talent_east_bonus3","east"],
	["talent_east_bonus4","east"],
	["talent_east_item1","east"],
	["talent_east_item2","east"],
	["talent_east_lockpick1","east"],
	["talent_east_lockpick2","east"],
	["talent_east_lockpick3","east"],
	["talent_east_lockpick4","east"],
	["talent_east_drive","east"],
	["talent_east_lockpick5","east"],
	["talent_east_lockpick6","east"],
	["talent_east_fly","east"],
	["talent_east_work1","east"],
	["talent_east_work2","east"],
	["talent_east_work3","east"],
	["talent_east_work4","east"],
	["talent_east_worki1","east"],
	["talent_east_worki2","east"],
	["talent_east_worki3","east"],
	["talent_east_recolte","east"],
	["talent_east_gather","east"],
	["talent_east_showlevel","east"]
];

{missionNamespace setVariable[(_x select 0),false];} foreach life_talent;

life_dp_points = ["dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25"];

life_illegal_items = 
[
	["heroinu",1200],
	["heroinp",2500],
	["cocaine",1500],
	["cocainep",3500],
	["marijuana",2000],
	["turtle",3000],
	["blastingcharge",10000],
	["boltcutter",500],
	["kidney",5000],
	["methu",400],
	["methp",4000],
	["tabac",5000],
	["cigare",9500],
	["ipuranium",10000],
	["dog",2500],
	["dogp",2500]
];

sell_array = 
[
	["apple",50],
	["heroinu",1850],
	["heroinp",3650],
	["salema",45],
	["ornate",40],
	["mackerel",175],
	["tuna",700],
	["mullet",250],
	["catshark",300],
	["oilp",3200],
	["turtle",3000],
	["water",5],
	["burgers",175],
	["frites",150],
	["pizza",200],
	["coffee",5],
	["turtlesoup",1000],
	["donuts",60],
	["marijuana",5350],
	["tbacon",25],
	["lockpick",75],
	["pickaxe",750],
	["redgull",200],
	["peach",55],
	["cocaine",3000],
	["cocainep",8750],
	["diamond",750],
	["diamondc",4000],
	["iron_r",3275],
	["copper_r",2500],
	["salt_r",1650],
	["glass",1450],
	["fuelF",500],
	["spikeStrip",1200],
	["cement",1950],
	["goldbar",95000],
	["methu",400],
	["methp",4000],
	["tabac",5000],
	["cigare",7600],
	["planche",3200],
	["uranium",35000],
	["skull",750],
	["skullp",1500],
	["nitro",5000],
	["kidney",50000],
	["gpstracker",500],
	["goldbarp",75000],
	["scalpel",100],
	["silver_r",2100],
	["pressluft",5000],
	["speedbomb",500000],
	["campfire",3000],
	["painkillers",50],
	["tent1",9000],
	["tent2",10000],
	["skinningknife",1000],
	["dog",3000],
	["goat",2000],
	["chicken",2500],
	["sheep",2000],
	["snake",850],
	["rabbit",800],
	["dogp",14000],
	["goatp",8000],
	["chickenp",9000],
	["sheepp",8000],
	["snakep",1900],
	["rabbitp",1800],
	["vammo",10000],
	["adrenalineShot",5000],
	["antimatter",1500000]
];
__CONST__(sell_array,sell_array);

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
	["underwatercharge",40000],
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
	["adrenalineShot",20000]
];
__CONST__(buy_array,buy_array);

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
__CONST__(life_weapon_shop_array,life_weapon_shop_array);

life_taxi_stands =
[
	["donor_town","Ville naturelle",civilian],
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
	["east_spawn","Air",east],
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
__CONST__(life_garage_prices,life_garage_prices);

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
__CONST__(life_garage_sell,life_garage_sell);