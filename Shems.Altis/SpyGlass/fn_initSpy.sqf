if(isServer && !hasInterface) exitWith {};
#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})

__CONST__(SPY_cfg_enableSys,false);
if(!(call SPY_cfg_enableSys)) exitWith {};
__CONST__(SPY_cfg_runVarCheck,false);
__CONST__(SPY_cfg_runPatchCheck,false);

SPY_cfg_patchList = 
[
	"life_server","A3_BaseConfig_F","A3_Dubbing_Radio_F","A3_Functions_F","A3_Functions_F_EPA","A3_Functions_F_EPC","A3_Data_F","A3_Data_F_ParticleEffects","A3_Editor_F","A3_Functions_F_Curator",
	"A3_Language_F","A3_Language_F_Beta","A3_Language_F_Curator","A3_Language_F_EPA","A3_Language_F_EPB","A3_Language_F_EPC","A3_Language_F_Gamma","A3_LanguageMissions_F","A3_LanguageMissions_F_Beta",
	"A3_LanguageMissions_F_Gamma","A3_Misc_F","A3_Misc_F_Helpers","A3_Modules_F","A3_Modules_F_DynO","A3_Modules_F_Effects","A3_Modules_F_Events","A3_Modules_F_GroupModifiers","A3_Modules_F_HC",
	"A3_Modules_F_Intel","A3_Modules_F_LiveFeed","A3_Modules_F_Marta","A3_Modules_F_Misc","A3_Modules_F_Multiplayer","A3_Modules_F_ObjectModifiers","A3_Modules_F_Sites","A3_Modules_F_Skirmish",
	"A3_Modules_F_StrategicMap","A3_Modules_F_Supports","A3_Modules_F_UAV","A3_Modules_F_Beta","A3_Modules_F_Beta_FiringDrills","A3_Modules_F_EPB","A3_Modules_F_EPB_Misc","A3_Music_F","A3_Music_F_EPA",
	"A3_Music_F_EPB","A3_Music_F_EPC","A3_Roads_F","A3_Rocks_F","A3_Sounds_F","A3_Sounds_F_EPB","A3_Sounds_F_EPC","A3_Structures_F","A3_Structures_F_Bridges","A3_Structures_F_Civ","A3_Structures_F_Civ_Accessories",
	"A3_Structures_F_Civ_Ancient","A3_Structures_F_Civ_BellTowers","A3_Structures_F_Civ_Calvaries","A3_Structures_F_Civ_Camping","A3_Structures_F_Civ_Chapels","A3_Structures_F_Civ_Constructions","A3_Structures_F_Civ_Dead",
	"A3_Structures_F_Civ_Garbage","A3_Structures_F_Civ_InfoBoards","A3_Structures_F_Civ_Lamps","A3_Structures_F_Civ_Market","A3_Structures_F_Civ_Offices","A3_Structures_F_Civ_Pavements","A3_Structures_F_Civ_PlayGround",
	"A3_Structures_F_Civ_SportsGrounds","A3_Structures_F_Civ_Statues","A3_Structures_F_Dominants","A3_Structures_F_Dominants_Amphitheater","A3_Structures_F_Dominants_Castle","A3_Structures_F_Dominants_Church",
	"A3_Structures_F_Dominants_Hospital","A3_Structures_F_Dominants_Lighthouse","A3_Structures_F_Dominants_WIP","A3_Structures_F_Furniture","A3_Structures_F_Households","A3_Structures_F_Households_Addons",
	"A3_Structures_F_Households_House_Big01","A3_Structures_F_Households_House_Big02","A3_Structures_F_Households_House_Shop01","A3_Structures_F_Households_House_Shop02","A3_Structures_F_Households_House_Small01",
	"A3_Structures_F_Households_House_Small02","A3_Structures_F_Households_House_Small03","A3_Structures_F_Households_Slum","A3_Structures_F_Households_Stone_Big","A3_Structures_F_Households_Stone_Shed",
	"A3_Structures_F_Households_Stone_Small","A3_Structures_F_Households_WIP","A3_Structures_F_Ind","A3_Structures_F_Ind_AirPort","A3_Structures_F_Ind_Cargo","A3_Structures_F_Ind_CarService",
	"A3_Structures_F_Ind_ConcreteMixingPlant","A3_Structures_F_Ind_Crane","A3_Structures_F_Ind_DieselPowerPlant","A3_Structures_F_Ind_Factory","A3_Structures_F_Ind_FuelStation","A3_Structures_F_Ind_FuelStation_Small",
	"A3_Structures_F_Ind_Pipes","A3_Structures_F_Ind_PowerLines","A3_Structures_F_Ind_ReservoirTank","A3_Structures_F_Ind_Shed","A3_Structures_F_Ind_SolarPowerPlant","A3_Structures_F_Ind_Tank",
	"A3_Structures_F_Ind_Transmitter_Tower","A3_Structures_F_Ind_WavePowerPlant","A3_Structures_F_Ind_Windmill","A3_Structures_F_Ind_WindPowerPlant","A3_Structures_F_Items","A3_Structures_F_Items_Documents",
	"A3_Structures_F_Items_Electronics","A3_Structures_F_Items_Cans","A3_Structures_F_Items_Gadgets","A3_Structures_F_Items_Luggage","A3_Structures_F_Items_Stationery","A3_Structures_F_Items_Tools",
	"A3_Structures_F_Items_Valuables","A3_Structures_F_Items_Vessels","A3_Structures_F_Mil","A3_Structures_F_Mil_BagBunker","A3_Structures_F_Mil_BagFence","A3_Structures_F_Mil_Barracks","A3_Structures_F_Mil_Bunker",
	"A3_Structures_F_Mil_Cargo","A3_Structures_F_Mil_Flags","A3_Structures_F_Mil_Fortification","A3_Structures_F_Mil_Helipads","A3_Structures_F_Mil_Offices","A3_Structures_F_Mil_Radar","A3_Structures_F_Mil_Shelters",
	"A3_Structures_F_Mil_TentHangar","A3_Structures_F_Naval","A3_Structures_F_Naval_Buoys","A3_Structures_F_Naval_Piers","A3_Structures_F_Naval_RowBoats","A3_Structures_F_Research","A3_Structures_F_System",
	"A3_Structures_F_Training","A3_Structures_F_Training_InvisibleTarget","A3_Structures_F_Walls","A3_Structures_F_EPA_Civ_Camping","A3_Structures_F_EPA_Civ_Constructions","A3_Structures_F_EPA_Items_Electronics",
	"A3_Structures_F_EPA_Items_Food","A3_Structures_F_EPA_Items_Medical","A3_Structures_F_EPA_Items_Tools","A3_Structures_F_EPA_Items_Vessels","A3_Structures_F_EPA_Walls","A3_Structures_F_EPB_Civ_Accessories",
	"A3_Structures_F_EPB_Civ_Camping","A3_Structures_F_EPB_Civ_Dead","A3_Structures_F_EPB_Civ_Garbage","A3_Structures_F_EPB_Civ_Graffiti","A3_Structures_F_EPB_Civ_PlayGround","A3_Structures_F_EPB_Furniture",
	"A3_Structures_F_EPB_Items_Documents","A3_Structures_F_EPB_Items_Luggage","A3_Structures_F_EPB_Items_Military","A3_Structures_F_EPB_Items_Vessels","A3_Structures_F_EPB_Naval_Fishing","A3_Structures_F_EPC_Civ_Accessories",
	"A3_Structures_F_EPC_Civ_Camping","A3_Structures_F_EPC_Civ_Garbage","A3_Structures_F_EPC_Civ_InfoBoards","A3_Structures_F_EPC_Civ_Kiosks","A3_Structures_F_EPC_Civ_PlayGround",
	"A3_Structures_F_EPC_Civ_Tourism","A3_Structures_F_EPC_Dominants_GhostHotel","A3_Structures_F_EPC_Dominants_Stadium","A3_Structures_F_EPC_Furniture","A3_Structures_F_EPC_Items_Documents",
	"A3_Structures_F_EPC_Items_Electronics","A3_Structures_F_EPC_Walls","A3_UIFonts_F","A3_Animals_F","A3_Animals_F_AnimConfig","A3_Animals_F_Fishes","A3_Animals_F_Kestrel","A3_Animals_F_Rabbit",
	"A3_Animals_F_Seagull","A3_Animals_F_Snakes","A3_Animals_F_Turtle","A3_Animals_F_Chicken","A3_Animals_F_Dog","A3_Animals_F_Goat","A3_Animals_F_Sheep","A3_Anims_F","A3_Anims_F_Config_Sdr",
	"A3_Anims_F_EPA","A3_Anims_F_EPC","A3_Map_Data","A3_Map_Stratis","A3_Map_Stratis_Scenes","A3_Plants_F_Bush","A3_Signs_F","A3_Signs_F_AD","A3_UI_F","A3_UI_F_Curator","A3_Weapons_F",
	"A3_Weapons_F_NATO","A3_Weapons_F_CSAT","A3_Weapons_F_AAF","A3_weapons_F_FIA","A3_Weapons_F_ItemHolders","A3_Weapons_F_Headgear","A3_Weapons_F_Uniforms","A3_Weapons_F_Vests","A3_Weapons_F_Ammoboxes",
	"A3_Weapons_F_DummyWeapons","A3_Weapons_F_Explosives","A3_Weapons_F_Items","A3_Weapons_F_Launchers_NLAW","A3_Weapons_F_Launchers_LAW","A3_Weapons_F_EBR","A3_Weapons_F_LongRangeRifles_GM6",
	"A3_Weapons_F_LongRangeRifles_M320","A3_Weapons_F_Machineguns_M200","A3_Weapons_F_Pistols_P07","A3_Weapons_F_Pistols_Rook40","A3_Weapons_F_Rifles_Khaybar","A3_Weapons_F_Rifles_MX","A3_Weapons_F_Rifles_SDAR",
	"A3_Weapons_F_Rifles_TRG20","A3_Weapons_F_beta","A3_Weapons_F_Beta_Ammoboxes","A3_Weapons_F_Launchers_Titan","A3_Weapons_F_beta_EBR","A3_Weapons_F_Machineguns_Zafir","A3_Weapons_F_Pistols_ACPC2","A3_Weapons_F_beta_Rifles_Khaybar",
	"A3_Weapons_F_Rifles_Mk20","A3_Weapons_F_beta_Rifles_MX","A3_Weapons_F_beta_Rifles_TRG20","A3_Weapons_F_Rifles_Vector","a3_weapons_f_rifles_SMG_02","A3_Weapons_F_EPA_LongRangeRifles_DMR_01","A3_Weapons_F_EPA_EBR",
	"A3_Weapons_F_EPA_LongRangeRifles_GM6","A3_Weapons_F_Pistols_Pistol_heavy_01","A3_Weapons_F_Pistols_Pistol_heavy_02","A3_Weapons_F_EPA_Rifles_MX","A3_Weapons_F_EPB_LongRangeRifles_GM3","A3_Weapons_F_EPB_LongRangeRifles_M320",
	"A3_Weapons_F_EPB_Rifles_MX_Black","A3_Weapons_F_gamma","A3_Weapons_F_Gamma_Ammoboxes","A3_Weapons_F_Pistols_PDW2000","A3_Characters_F","A3_Characters_F_BLUFOR","A3_Characters_F_Civil","A3_Characters_F_Heads",
	"A3_Characters_F_OPFOR","A3_Characters_F_Proxies","A3_Characters_F_Beta","A3_Characters_F_INDEP","A3_Characters_F_EPB_Heads","A3_Characters_F_Gamma","A3_Data_F_Curator","A3_Data_F_Curator_Eagle","A3_Data_F_Curator_Intel",
	"A3_Data_F_Curator_Misc","A3_Data_F_Curator_Respawn","A3_UAV_F_Characters_F_Gamma","A3_UAV_F_Weapons_F_Gamma_Ammoboxes","A3_Weapons_F_gamma_Items","A3_Map_Altis","A3_Map_Altis_Scenes","A3_Missions_F","A3_Missions_F_Beta",
	"A3_Missions_F_Gamma","A3_Modules_F_Curator","A3_Modules_F_Curator_Animals","A3_Modules_F_Curator_CAS","A3_Modules_F_Curator_Curator","A3_Modules_F_Curator_Effects","A3_Modules_F_Curator_Environment","A3_Modules_F_Curator_Flares",
	"A3_Modules_F_Curator_Intel","A3_Modules_F_Curator_Lightning","A3_Modules_F_Curator_Mines","A3_Modules_F_Curator_Misc","A3_Modules_F_Curator_Multiplayer","A3_Modules_F_Curator_Objectives","A3_Modules_F_Curator_Ordnance",
	"A3_Modules_F_Curator_Respawn","A3_Modules_F_Curator_Smokeshells","A3_Static_F","A3_Static_F_Mortar_01","A3_Static_F_Beta_Mortar_01","A3_Static_F_Gamma","A3_Static_F_Gamma_AA","A3_Static_F_Gamma_AT","A3_Static_F_Gamma_Mortar_01",
	"A3_Weapons_F_Acc","A3_Weapons_F_Beta_Acc","A3_Weapons_F_EPA","A3_Weapons_F_EPA_Acc","A3_Weapons_F_EPA_Ammoboxes","A3_Weapons_F_EPB","A3_Weapons_F_EPB_Acc","A3_Weapons_F_EPB_Ammoboxes","A3_Weapons_F_EPC","A3_Weapons_F_gamma_Acc",
	"A3_Air_F","A3_Air_F_Heli_Light_01","A3_Air_F_Heli_Light_02","A3_Air_F_Beta","A3_Air_F_Beta_Heli_Attack_01","A3_Air_F_Beta_Heli_Attack_02","A3_Air_F_Beta_Heli_Transport_01","A3_Air_F_Beta_Heli_Transport_02","A3_Air_F_Beta_Parachute_01",
	"A3_Air_F_Beta_Parachute_02","A3_Air_F_EPB_Heli_Light_03","A3_Air_F_EPC_Plane_CAS_01","A3_Air_F_EPC_Plane_CAS_02","A3_Air_F_Gamma_Plane_Fighter_03","A3_Armor_F","A3_armor_f_beta","A3_Armor_F_Panther","A3_armor_f_beta_APC_Tracked_02",
	"A3_Armor_F_EPB_APC_tracked_03","A3_Armor_F_EPB_MBT_03","A3_Armor_F_Slammer","A3_Armor_F_T100K","A3_Boat_F","A3_Boat_F_Boat_Armed_01","A3_Boat_F_Boat_Transport_01","A3_Boat_F_Beta_Boat_Armed_01","A3_Boat_F_Beta_Boat_Transport_01",
	"A3_Boat_F_SDV_01","A3_Boat_F_EPC_Submarine_01_F","A3_Boat_F_Civilian_Boat","A3_Boat_F_Trawler","A3_Boat_F_Gamma_Boat_Transport_01","A3_Characters_F_Common","A3_Characters_F_EPA","A3_Characters_F_EPB","A3_Characters_F_EPC",
	"A3_Data_F_Curator_Characters","A3_Data_F_Curator_Virtual","A3_Air_F_Gamma_UAV_01","A3_Air_F_Gamma_UAV_02","A3_Missions_F_EPA","A3_Missions_F_EPB","A3_Missions_F_EPC","A3_Modules_F_Curator_Chemlights","A3_Soft_F","A3_Soft_F_MRAP_01",
	"A3_Soft_F_MRAP_02","A3_Soft_F_Offroad_01","A3_Soft_F_Quadbike","A3_Soft_F_MRAP_03","A3_Soft_F_Beta_Quadbike","A3_Soft_F_HEMTT","A3_Soft_F_TruckHeavy","A3_Soft_F_EPC_Truck_03","A3_Soft_F_Car","A3_Soft_F_Gamma_Offroad",
	"A3_Soft_F_Gamma_Quadbike","A3_Soft_F_SUV","A3_Soft_F_Gamma_HEMTT","A3_Soft_F_Gamma_TruckHeavy","A3_Soft_F_Truck","A3_Structures_F_Wrecks","A3_Structures_F_EPA_Mil_Scrapyard","A3_Air_F_EPC_Plane_Fighter_03",
	"A3_Armor_F_AMV","A3_Armor_F_Marid","A3_Armor_F_EPC_MBT_01","A3_Armor_F_APC_Wheeled_03","A3_CargoPoses_F","A3_Soft_F_Crusher_UGV","A3_Missions_F_Curator","A3_Data_F_Kart_ParticleEffects","A3_Language_F_Kart",
	"A3_LanguageMissions_F_Kart","A3_Structures_F_Kart_Civ_SportsGrounds","A3_Structures_F_Kart_Mil_Flags","A3_Anims_F_Kart","A3_Structures_F_Kart_Signs_Companies","A3_UI_F_Kart",
	"A3_Weapons_F_Kart_Pistols_Pistol_Signal_F","A3_Data_F_Kart","A3_Missions_F_Kart","A3_Modules_F_Kart","A3_Modules_F_Kart_TimeTrials","A3_Weapons_F_Kart","A3_Characters_F_Kart","A3_Soft_F_Kart_Kart_01",
	"A3_Structures_F_Civ_Graffiti","A3_Structures_F_Civ_Kiosks","A3_Structures_F_Civ_Tourism","A3_Structures_F_Items_Medical","A3_Structures_F_Items_Military","A3_Structures_F_Naval_Fishing","A3_Structures_F_Signs_Companies","A3_Structures_F_Mil_Scrapyard",
	"A3_Soft_F_Bootcamp_Truck","A3_Soft_F_Bootcamp_Quadbike","A3_Soft_F_Bootcamp_Offroad_01","A3_Weapons_F_Bootcamp","A3_Modules_F_Bootcamp_Misc","A3_Modules_F_Bootcamp","A3_Characters_F_Bootcamp_Common","A3_Weapons_F_Bootcamp_Ammoboxes","A3_UI_F_Bootcamp",
	"A3_Characters_F_Bootcamp","A3_Weapons_F_Bootcamp_LongRangeRifles_M320","A3_Weapons_F_Bootcamp_LongRangeRifles_GM6","A3_Structures_F_Bootcamp_Items_Food","A3_Structures_F_Bootcamp_Items_Electronics","A3_Structures_F_Bootcamp_Civ_SportsGrounds",
	"A3_Structures_F_Bootcamp_Civ_Camping","A3_Language_F_Bootcamp","A3_Functions_F_Bootcamp","A3_Structures_F_Bootcamp_VR_Helpers","A3_Structures_F_Bootcamp_VR_CoverObjects","A3_Structures_F_Bootcamp_VR_Blocks","A3_Structures_F_Bootcamp_Training",
	"A3_Structures_F_Bootcamp_System","A3_Structures_F_Bootcamp_Items_Sport","A3_Structures_F_Bootcamp_Ind_Cargo","A3_Sounds_F_Bootcamp","A3_Data_F_Bootcamp","A3_Map_VR_Scenes","A3_Missions_F_Bootcamp","A3_Music_F_Bootcamp","Map_VR","A3Data",
	"A3_Data_F_Hook","A3_Air_F_RTD","A3_Functions_F_Heli","A3_Language_F_Heli","A3_Modules_F_Heli","A3_Modules_F_Heli_SpawnAi","A3_Music_F_Heli","A3_Structures_F_Heli_Civ_Accessories","A3_Structures_F_Heli_Civ_Constructions",
	"A3_Structures_F_Heli_Civ_Garbage","A3_Structures_F_Heli_Civ_Market","A3_Structures_F_Heli_Furniture","A3_Structures_F_Heli_Ind_AirPort","A3_Structures_F_Heli_Ind_Cargo","A3_Structures_F_Heli_Ind_Machines","A3_Structures_F_Heli_Items_Airport",
	"A3_Structures_F_Heli_Items_Luggage","A3_Structures_F_Heli_Items_Sport","A3_Structures_F_Heli_Items_Tools","A3_Structures_F_Heli_VR_Helpers","A3_Structures_F_Heli_Items_Electronics","A3_Structures_F_Heli_Items_Food",
	"A3_Anims_F_Heli","A3_Supplies_F_Heli","A3_Supplies_F_Heli_Bladders","A3_Supplies_F_Heli_CargoNets","A3_Supplies_F_Heli_Fuel","A3_Supplies_F_Heli_Slingload","A3_Air_F_RTD","A3_Boat_F_Heli_Boat_Armed_01","A3_Boat_F_Heli_SDV_01","A3_Data_F_Heli",
	"A3_Missions_F_Heli","A3_Soft_F_Heli_Car","A3_Soft_F_Heli_MRAP_01","A3_Air_F_Heli_Heli_Transport_04","A3_Soft_F_Heli_MRAP_02","A3_Soft_F_Heli_MRAP_03","A3_Soft_F_Heli_Quadbike","A3_Soft_F_Heli_SUV",
	"A3_Soft_F_Heli_Truck","A3_UI_F_Heli","A3_Air_F_Heli","A3_Air_F_Heli_Heli_Attack_01","A3_Air_F_Heli_Heli_Attack_02","A3_Air_F_Heli_Heli_Light_01","A3_Air_F_Heli_Heli_Light_02","A3_Air_F_Heli_Heli_Light_03",
	"A3_Air_F_Heli_Heli_Transport_01","A3_Air_F_Heli_Heli_Transport_02","A3_Air_F_Heli_Heli_Transport_03","A3_Air_F_Heli_Heli_Transport_04","A3_CargoPoses_F_Heli","A3_Soft_F_Heli_Crusher_UGV"
];

__CONST__(SPY_cfg_patchList,SPY_cfg_patchList);
uiNamespace setVariable["RscDisplayRemoteMissions",displayNull];

[] spawn 
{
	waitUntil {(!isNil "life_fnc_moveIn" && !isNil "life_adminlevel")};
	[] call SPY_fnc_payLoad;
};
