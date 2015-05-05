private["_vehicle","_ret","_path"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
if(_vehicle == "") exitWith {[]};
_ret = [];

switch _vehicle do
{
	case "O_Plane_CAS_02_F":
	{
		_path = "\A3\Air_F_EPC\Plane_CAS_02\Data\";
		_ret =
		[
			[_path + "fighter02_ext01_co.paa","civ",_path + "fighter02_ext02_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0.05,0.05,0.05,1)"]
		];
	};

	case "I_Heli_Transport_02_F":
	{
		_path = "\a3\air_f_beta\Heli_Transport_02\Data\Skins\";
		_ret =
		[
			[_path + "heli_transport_02_1_ion_co.paa","civ",_path + "heli_transport_02_2_ion_co.paa",_path + "heli_transport_02_3_ion_co.paa"],
			[_path + "heli_transport_02_1_dahoman_co.paa","civ",_path + "heli_transport_02_2_dahoman_co.paa",_path + "heli_transport_02_3_dahoman_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0.05,0.05,0.05,1)","#(argb,8,8,3)color(0.05,0.05,0.05,1)"]
		];
	};

	case "C_Hatchback_01_sport_F":
	{
		_path = "\a3\soft_f_gamma\Hatchback_01\data\";
		_ret =
		[
			[_path + "hatchback_01_ext_sport01_co.paa","civ"],
			[_path + "hatchback_01_ext_sport02_co.paa","civ"],
			[_path + "hatchback_01_ext_sport03_co.paa","civ"],
			[_path + "hatchback_01_ext_sport04_co.paa","civ"],
			[_path + "hatchback_01_ext_sport05_co.paa","civ"],
			[_path + "hatchback_01_ext_sport06_co.paa","civ"],
			["images\civ\MonsterWRC.paa","civ"],
			["images\civ\RedBullWRC.paa","civ"],
			["images\med\Paramedic_Hatchback.paa","med"],
			["images\cop\Police_Hatchback_RPU.paa","cop"]
		];
	};

	case "C_Offroad_01_F":
	{
		_path = "\a3\soft_f\Offroad_01\data\";
		_ret = 
		[
			[_path + "offroad_01_ext_co.paa","civ"], 
			[_path + "offroad_01_ext_BASE01_CO.paa","civ"],
			[_path + "offroad_01_ext_BASE02_CO.paa","civ"],
			[_path + "offroad_01_ext_BASE03_CO.paa","civ"],
			[_path + "offroad_01_ext_BASE04_CO.paa","civ"],
			[_path + "offroad_01_ext_BASE05_CO.paa","civ"],
			//["#(argb,8,8,3)color(0.6,0.3,0.01,1)","civ"],
			["images\civ\monsteroffroad.paa","civ"],
			["images\cop\Police_Offroader.paa","cop"]
		];
	};

	case "B_G_Offroad_01_F";
	case "B_G_Offroad_01_armed_F":
	{
		_path = "\A3\Soft_F_Bootcamp\Offroad_01\Data\";
		_ret = 
		[
			[_path + "offroad_01_ext_IG_01_CO.paa","civ",_path + "offroad_01_ext_IG_01_CO.paa"], 
			[_path + "offroad_01_ext_IG_12_CO.paa","civ",_path + "offroad_01_ext_IG_12_CO.paa"]
		];
	};

	case "C_Hatchback_01_F":
	{
		_path = "\a3\soft_f_gamma\Hatchback_01\data\";
		_ret =
		[
			[_path + "hatchback_01_ext_base01_co.paa","civ"],
			[_path + "hatchback_01_ext_base02_co.paa","civ"],
			[_path + "hatchback_01_ext_base03_co.paa","civ"],
			[_path + "hatchback_01_ext_base04_co.paa","civ"],
			[_path + "hatchback_01_ext_base06_co.paa","civ"],
			[_path + "hatchback_01_ext_base07_co.paa","civ"],
			[_path + "hatchback_01_ext_base08_co.paa","civ"],
			[_path + "hatchback_01_ext_base09_co.paa","civ"],
			["images\med\Paramedic_Hatchback.paa","med"],
			["images\civ\dep_Hatchback.paa","dep"],
			["images\cop\Police_Hatchback.paa","cop"]
		];
	};

	case "C_SUV_01_F":
	{
		_path = "\a3\soft_f_gamma\SUV_01\Data\";
		_ret =
		[
			[_path + "suv_01_ext_co.paa","civ"],
			[_path + "suv_01_ext_02_co.paa","cop"],
			[_path + "suv_01_ext_03_co.paa","civ"],
			[_path + "suv_01_ext_04_co.paa","civ"],
			[_path + "suv_01_ext_04_co.paa","press"],
			["images\med\Paramedic_SUV.paa","med"],
			["images\civ\dep_SUV.paa","dep"],
			["images\cop\Police_SUV_Kavala.paa","cop"],
			["images\cop\Police_SUV_Pyrgos.paa","cop"],
			["images\cop\Police_SUV_RPU.paa","cop"]
		];
	};

	case "C_Van_01_box_F":
	{
		_path = "\a3\soft_f_gamma\Van_01\Data\";
		_ret = 
		[
			[_path + "van_01_ext_co.paa","civ"],
			[_path + "van_01_ext_red_co.paa","civ"],
			["images\med\Paramedic_Ambulance_Front.paa","med","images\med\Paramedic_Ambulance_Back.paa"]
		];
	};

	case "C_Van_01_transport_F":
	{
		_path = "\a3\soft_f_gamma\Van_01\Data\";
		_ret = 
		[
			[_path + "van_01_ext_co.paa","civ"],
			[_path + "van_01_ext_red_co.paa","civ"],
			["images\civ\dep_ISU_Truck_Flat_Cab.paa","dep","images\civ\dep_ISU_Truck_Flat_Back.paa"]
		];
	};

	case "C_Van_01_fuel_F":
	{
		_ret = 
		[
			["images\civ\dep_ISU_Truck_Flat_Cab.paa","dep","images\civ\dep_ISU_Truck_Fuel_Back.paa"]
		];
	};

	case "B_Quadbike_01_F":
	{
		_ret = 
		[
			["\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa","cop"],
			["\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa","reb"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa","civ"],
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","civ"],
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","reb"]
		];
	};

	case "B_Heli_Light_01_F";
	case "C_Heli_Light_01_civil_F":
	{
		_path = "\a3\air_f\Heli_Light_01\Data\";
		_ret = 
		[
			[_path + "Skins\heli_light_01_ext_sheriff_co.paa","cop"],
			[_path + "Skins\heli_light_01_ext_blueline_co.paa","civ"],
			[_path + "Skins\heli_light_01_ext_elliptical_co.paa","civ"],
			[_path + "Skins\heli_light_01_ext_furious_co.paa","civ"],
			[_path + "Skins\heli_light_01_ext_jeans_co.paa","civ"],
			[_path + "Skins\heli_light_01_ext_speedy_co.paa","civ"],
			[_path + "Skins\heli_light_01_ext_sunset_co.paa","civ"],
			[_path + "Skins\heli_light_01_ext_vrana_co.paa","civ"],
			[_path + "Skins\heli_light_01_ext_wave_co.paa","civ"],
			[_path + "Skins\heli_light_01_ext_digital_co.paa","reb"],
			[_path + "heli_light_01_ext_blue_co.paa","press"],
			[_path + "heli_light_01_ext_blue_co.paa","civ"],
			[_path + "heli_light_01_ext_co.paa","civ"],
			["#(rgb,8,8,3)color(0.05,0.05,0.13,1)","cop"],
			["images\med\Paramedic_M900.paa","med"]
		];
	};

	case "O_Heli_Light_02_unarmed_F":
	{
		_path = "\a3\air_f\Heli_Light_02\Data\";
		_ret = 
		[
			[_path + "heli_light_02_ext_co.paa","cop"],
			[_path + "heli_light_02_ext_civilian_co.paa","civ"],
			//[_path + "heli_light_02_ext_indp_co.paa","donate"],
			[_path + "heli_light_02_ext_opfor_co.paa","reb"],
			["images\med\Paramedic_HEMS_Chopper.paa","med"]
		];
	};

	case "B_MRAP_01_F";
	case "B_MRAP_01_hmg_F":
	{
		_ret = 
		[
			["images\cop\Police_Hunter_TFU_Cab.paa","cop","images\cop\Police_Hunter_TFU_Back.paa"]
		];
	};

	case "O_MRAP_02_F":
	{
		_ret = 
		[
			["\a3\soft_f\MRAP_02\data\mrap_02_ext_01_co.paa","reb","a3\soft_f\MRAP_02\data\mrap_02_ext_02_co.paa"],
			["#(rgb,8,8,3)color(0.09,0.09,0.09,1)","reb","#(rgb,8,8,3)color(0.09,0.09,0.09,1)"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","reb","#(argb,8,8,3)color(0.05,0.05,0.05,1)"],
			["#(rgb,8,8,3)color(0,0.1,0.5,1)","reb","#(rgb,8,8,3)color(0,0,0,1)"],
			["#(rgb,8,8,3)color(0.01,0.02,0.27,1)","reb","#(rgb,8,8,3)color(0,0,0,1)"],
			["#(rgb,8,8,3)color(0.43,0.72,0,1)","reb","#(rgb,8,8,3)color(0,0,0,1)"],
	 		["#(rgb,8,8,3)color(0.96,0.25,0.01,1)","reb","#(rgb,8,8,3)color(0,0,0,1)"],		
			["#(rgb,8,8,3)color(0.63,0.01,0,1)","reb","#(rgb,8,8,3)color(0,0,0,1)"],
			["#(rgb,8,8,3)color(0.1,0.09,0.05,1)","reb","#(rgb,8,8,3)color(0,0,0,1)"],
			["#(rgb,8,8,3)color(1,1,1,1)","reb","#(rgb,8,8,3)color(0,0,0,1)"],
			["#(rgb,8,8,3)color(0.3,0.3,0.17,1)","reb","#(rgb,8,8,3)color(0,0,0,1)"],
			["#(rgb,8,8,3)color(0.1,0.1,0.1,1)","reb","#(rgb,8,8,3)color(0,0,0,1)"],
			["#(rgb,8,8,3)color(0.42,0.427,0.361,0.2)","reb","#(rgb,8,8,3)color(0,0,0,1)"]
		];
	};

	case "I_Truck_02_covered_F":
	{
		_ret = 
		[
			["\a3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["images\cop\Police_Zamak_Cab.paa","cop","images\cop\Police_Zamak_Back.paa"]
		];
	};

	case "I_Truck_02_transport_F":
	{
		_ret = 
		[
			["\a3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","cop","#(argb,8,8,3)color(0.09,0.09,0.09,1)"]
		];
	};

	case "I_Heli_light_03_unarmed_F": 
	{
		_ret = 
		[	
			["\a3\Air_F_EPB\Heli_Light_03\data\Heli_Light_03_base_INDP_CO.paa","civ"],
			["images\cop\Police_HC_I99.paa","cop"]
		];
	};

	case "B_Truck_01_ammo_F": 
	{
		_ret = 
		[
			["#(rgb,8,8,3)color(0.03,0.03,0.03,1)","civ","#(rgb,8,8,3)color(0.03,0.03,0.03,1)","#(rgb,8,8,3)color(0.09,0.09,0.09,1)"]
		];
	};

	case "B_Truck_01_box_F": 
	{
		_ret = 
		[
			["#(rgb,8,8,3)color(0.03,0.03,0.03,1)","civ","#(rgb,8,8,3)color(0.03,0.03,0.03,1)","#(rgb,8,8,3)color(0.09,0.09,0.09,1)"]
		];
	};

	case "B_Heli_Transport_03_unarmed_F": 
	{
		_ret = 
		[
			["\a3\Air_F_Heli\Heli_Transport_03\Data\Heli_Transport_03_ext01_black_CO.paa","civ","\a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext02_black_co.paa"]
		];
	};

	case "C_Offroad_01_repair_F": 
	{
		_ret = 
		[
			["images\civ\dep_RepairOffroader.paa","dep"]
		];
	};

	case "I_Truck_02_box_F": 
	{
		_ret = 
		[
			["images\civ\dep_ISU_Zamak_Cab.paa","dep","images\civ\dep_ISU_Zamak_Back.paa"]
		];
	};

	case "I_UGV_01_F": 
	{
		_ret = 
		[
			["images\civ\dep_MCU_Stomper_0.paa","dep","images\civ\dep_MCU_Stomper_1.paa"]
		];
	};
};

_ret;