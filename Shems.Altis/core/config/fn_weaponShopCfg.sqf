#include <macro.h>

private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0;};

switch(_shop) do
{
	case "med_basic":
	{
		switch (true) do 
		{
			case (playerSide != independent): {"Vous n'êtes pas Médecin."};
			default {
				["Hospital EMS Shop",
					[
						["ItemGPS",nil,100],
						["ItemMap",nil,50],
						["Binocular",nil,150],
						["ToolKit",nil,250],
						["FirstAidKit",nil,0],
						["Medikit",nil,0]
					]
				];
			};
		};
	};

	case "cop_cadet":
	{
		switch(true) do
		{
			case (playerSide != west): {"Vous n'êtes pas Policier!"};
			default
			{
				["Magasin Cadet",
					[
						["Binocular","Jumelles",500],
						["Rangefinder","Telemetre",500],
						["ItemGPS","GPS",500],
						["ToolKit","Trousse à outils",500],
						["FirstAidKit","1ers secours",500],
						["arifle_sdar_F",nil,10000],
						["30Rnd_556x45_Stanag_Tracer_Red",nil,180],
						["30Rnd_556x45_Stanag",nil,250],
						["hgun_P07_snds_F","Taser Pistole",5000],
						["16Rnd_9x21_Mag","Taser Magazin 9x21",50], 						
						["hgun_P07_F",nil,2500],
						["16Rnd_9x21_Mag",nil,50],
						["Binocular",nil,150],
						["Rangefinder",nil,500],
						["ItemMap",nil,50],
						["ItemGPS",nil,200],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["NVGoggles",nil,2000],
						["B_UAV_01_F",nil,100000],
						["B_UAV_01_backpack_F",nil,50000],
						["ItemRadio","Telephone",500],
						["SmokeShellYellow","gaz lacrimogene",500]
					]
				];
			};
		};
	};

	case "cop_officier":
	{
		switch(true) do
		{
			case (playerSide != west): {"Vous n'êtes pas Policier"};
			case (__GETC__(life_coplevel) < 2): {"Vous n'avez pas le rang d'officier!"};
			default
			{
				["Magasin Officier",
					[
						["Binocular","Jumelles",500],
						["Rangefinder","Telemetre",500],
						["ItemGPS","GPS",500],
						["ToolKit","Trousse à outils",500],
						["FirstAidKit","1ers secours",500],
						["arifle_sdar_F",nil,10000],
						["30Rnd_556x45_Stanag",nil,250],
						["20Rnd_556x45_UW_mag",nil,200],
						["arifle_MXC_Black_F",nil,10000],
						["muzzle_snds_H",nil,2500],
						["30Rnd_65x39_caseless_mag",nil,500],
						["30Rnd_65x39_caseless_mag_Tracer",nil,500],
						["SMG_02_F",nil,7500],
						["muzzle_snds_L",nil,2500],
						["30Rnd_9x21_Mag",nil,250],
						["SMG_01_F",nil,7500],
						["muzzle_snds_acp",nil,2500],
						["30Rnd_45ACP_Mag_SMG_01",nil,250],
						["30Rnd_45ACP_Mag_SMG_01_tracer_green",nil,250],
						["hgun_PDW2000_F",nil,7500],
						["muzzle_snds_L",nil,2500],
						["30Rnd_9x21_Mag",nil,250],
						["MineDetector",nil,1000],
						["acc_flashlight",nil,750],
						["acc_pointer_IR",nil,750],
						["optic_Holosight",nil,1500],
						["optic_Holosight_smg",nil,1500],
						["optic_Hamr",nil,2000],
						["optic_MRCO",nil,3000],
						["MiniGrenade",nil,2500],
						["ItemRadio","Telephone",500],
						["SmokeShellYellow","gaz lacrimogene",500]
					]
				];
			};
		};
	};

	case "cop_caporal":
	{
		switch(true) do
		{
			case (playerSide != west): {"Vous n'êtes pas Policier"};
			case (__GETC__(life_coplevel) < 3): {"Vous n'avez pas le rang de caporal!"};
			default
			{
				["Magasin Caporal",
					[	
						["Binocular","Jumelles",500],
						["Rangefinder","Telemetre",500],
						["ItemGPS","GPS",500],
						["ToolKit","Trousse à outils",500],
						["FirstAidKit","1ers secours",500],
						["hgun_Pistol_heavy_01_F",nil,5000],
						["muzzle_snds_acp",nil,2500],
						["11Rnd_45ACP_Mag",nil,200],
						["optic_MRD",nil,2000],
						["arifle_MX_Black_F",nil,15000],
						["muzzle_snds_H",nil,2500],
						["30Rnd_65x39_caseless_mag",nil,500],
						["30Rnd_65x39_caseless_mag_Tracer",nil,500],
						["arifle_MX_SW_Black_F",nil,75000],
						["muzzle_snds_H_MG",nil,5000],
						["100Rnd_65x39_caseless_mag",nil,2000],
						["100Rnd_65x39_caseless_mag_Tracer",nil,2000],
						["arifle_MXM_Black_F",nil,60000],
						["muzzle_snds_H",nil,2500],
						["30Rnd_65x39_caseless_mag",nil,500],
						["30Rnd_65x39_caseless_mag_Tracer",nil,500],
						["srifle_EBR_F",nil,50000],
						["20Rnd_762x51_Mag",nil,500],
						["muzzle_snds_B",nil,2500],
						["launch_B_Titan_F",nil,85000],
						["Titan_AA",nil,10000],
						["acc_flashlight",nil,750],
						["acc_pointer_IR",nil,750],
						["optic_Holosight",nil,1500],
						["optic_Holosight_smg",nil,1500],
						["optic_Hamr",nil,2000],
						["optic_MRCO",nil,3000],
						["optic_Arco",nil,4000],
						["optic_SOS",nil,5000],
						["optic_NVS",nil,6000],
						["MiniGrenade",nil,2500],
						["HandGrenade",nil,5000],
						["ItemRadio","Telephone",500],
						["SmokeShellYellow","gaz lacrimogene",500]
					]
				];
			};
		};
	};

	case "cop_sergent":
	{
		switch(true) do
		{
			case (playerSide != west): {"Vous n'êtes pas Policier"};
			case (__GETC__(life_coplevel) < 4): {"Vous n'avez pas le rang de sergent!"};
			default
			{
				["Magasin Sergent",
					[
						["Binocular","Jumelles",500],
						["Rangefinder","Telemetre",500],
						["ItemGPS","GPS",500],
						["ToolKit","Trousse à outils",500],
						["FirstAidKit","1ers secours",500],
						["hgun_Pistol_heavy_01_F",nil,5000],
						["muzzle_snds_acp",nil,2500],
						["11Rnd_45ACP_Mag",nil,200],
						["optic_MRD",nil,2000],
						["arifle_MX_Black_F",nil,15000],
						["muzzle_snds_H",nil,2500],
						["30Rnd_65x39_caseless_mag",nil,500],
						["30Rnd_65x39_caseless_mag_Tracer",nil,500],
						["arifle_MX_SW_Black_F",nil,75000],
						["muzzle_snds_H_MG",nil,5000],
						["100Rnd_65x39_caseless_mag",nil,2000],
						["100Rnd_65x39_caseless_mag_Tracer",nil,2000],
						["arifle_MXM_Black_F",nil,60000],
						["muzzle_snds_H",nil,2500],
						["30Rnd_65x39_caseless_mag",nil,500],
						["30Rnd_65x39_caseless_mag_Tracer",nil,500],
						["srifle_EBR_F",nil,50000],
						["20Rnd_762x51_Mag",nil,500],
						["muzzle_snds_B",nil,2500],
						["launch_B_Titan_F",nil,85000],
						["Titan_AA",nil,10000],
						["acc_flashlight",nil,750],
						["acc_pointer_IR",nil,750],
						["optic_Holosight",nil,1500],
						["optic_Holosight_smg",nil,1500],
						["optic_Hamr",nil,2000],
						["optic_MRCO",nil,3000],
						["optic_Arco",nil,4000],
						["optic_SOS",nil,5000],
						["optic_NVS",nil,6000],
						["MiniGrenade",nil,2500],
						["HandGrenade",nil,5000],
						["ItemRadio","Telephone",500],
						["SmokeShellYellow","gaz lacrimogene",500]
					]
				];
			};
		};
	};

	case "cop_lieutenant":
	{
		switch(true) do
		{
			case (playerSide != west): {"Vous n'êtes pas Policier"};
			case (__GETC__(life_coplevel) < 5): {"Vous n'avez pas le rang de lieutenant!"};
			default
			{
				["Magasin Lieutenant",
					[
						["Binocular","Jumelles",500],
						["Rangefinder","Telemetre",500],
						["ItemGPS","GPS",500],
						["ToolKit","Trousse à outils",500],
						["FirstAidKit","1ers secours",500],
						["LMG_Zafir_F",nil,100000],
						["150Rnd_762x51_Box_Tracer",nil,200],
						["hgun_Pistol_heavy_01_F",nil,5000],
						["muzzle_snds_acp",nil,2500],
						["11Rnd_45ACP_Mag",nil,200],
						["optic_MRD",nil,2000],
						["arifle_MX_Black_F",nil,15000],
						["muzzle_snds_H",nil,2500],
						["30Rnd_65x39_caseless_mag",nil,500],
						["30Rnd_65x39_caseless_mag_Tracer",nil,500],
						["arifle_MX_SW_Black_F",nil,75000],
						["muzzle_snds_H_MG",nil,5000],
						["100Rnd_65x39_caseless_mag",nil,2000],
						["100Rnd_65x39_caseless_mag_Tracer",nil,2000],
						["arifle_MXM_Black_F",nil,60000],
						["muzzle_snds_H",nil,2500],
						["30Rnd_65x39_caseless_mag",nil,500],
						["30Rnd_65x39_caseless_mag_Tracer",nil,500],
						["srifle_EBR_F",nil,50000],
						["20Rnd_762x51_Mag",nil,500],
						["muzzle_snds_B",nil,2500],
						["launch_B_Titan_F",nil,85000],
						["Titan_AA",nil,10000],
						["acc_flashlight",nil,750],
						["acc_pointer_IR",nil,750],
						["optic_Holosight",nil,1500],
						["optic_Holosight_smg",nil,1500],
						["optic_Hamr",nil,2000],
						["optic_MRCO",nil,3000],
						["optic_Arco",nil,4000],
						["optic_SOS",nil,5000],
						["optic_NVS",nil,6000],
						["MiniGrenade",nil,2500],
						["HandGrenade",nil,5000],
						["ItemRadio","Telephone",500],
						["SmokeShellYellow","gaz lacrimogene",500]
					]
				];
			};
		};
	};

	case "cop_capitaine":
	{
		switch(true) do
		{
			case (playerSide != west): {"Vous n'êtes pas Policier"};
			case (__GETC__(life_coplevel) < 6): {"Vous n'avez pas le rang de capitaine!"};
			default
			{
				["Magasin Capitaine",
					[
						["Binocular","Jumelles",500],
						["Rangefinder","Telemetre",500],
						["ItemGPS","GPS",500],
						["ToolKit","Trousse à outils",500],
						["FirstAidKit","1ers secours",500],
						["SatchelCharge_Remote_Mag",nil,150000],
						["hgun_Pistol_heavy_01_F",nil,5000],
						["muzzle_snds_acp",nil,2500],
						["11Rnd_45ACP_Mag",nil,200],
						["optic_MRD",nil,2000],
						["arifle_MX_Black_F",nil,15000],
						["muzzle_snds_H",nil,2500],
						["30Rnd_65x39_caseless_mag",nil,500],
						["30Rnd_65x39_caseless_mag_Tracer",nil,500],
						["arifle_MX_SW_Black_F",nil,75000],
						["muzzle_snds_H_MG",nil,5000],
						["100Rnd_65x39_caseless_mag",nil,2000],
						["100Rnd_65x39_caseless_mag_Tracer",nil,2000],
						["arifle_MXM_Black_F",nil,60000],
						["muzzle_snds_H",nil,2500],
						["30Rnd_65x39_caseless_mag",nil,500],
						["30Rnd_65x39_caseless_mag_Tracer",nil,500],
						["srifle_EBR_F",nil,50000],
						["20Rnd_762x51_Mag",nil,500],
						["muzzle_snds_B",nil,2500],
						["acc_flashlight",nil,750],
						["acc_pointer_IR",nil,750],
						["optic_Holosight",nil,1500],
						["optic_Holosight_smg",nil,1500],
						["optic_Hamr",nil,2000],
						["optic_MRCO",nil,3000],
						["optic_Arco",nil,4000],
						["ItemRadio","Telephone",500],
						["SmokeShellYellow","gaz lacrimogene",500]
					]
				];
			};
		};
	};

	case "cop_chef_adjoint":
	{
		switch(true) do
		{
			case (playerSide != west): {"Vous n'êtes pas Policier"};
			case (__GETC__(life_coplevel) < 7): {"Vous n'avez pas le rang de Chef adjoint!"};
			default
			{
				["Magasin Chef Ajoint",
					[
						["Binocular","Jumelles",500],
						["Rangefinder","Telemetre",500],
						["ItemGPS","GPS",500],
						["ToolKit",nil,500],
						["FirstAidKit",nil,500],
						["Medikit",nil,50],
						["srifle_LRR_F",nil,80000],
						["7Rnd_408_Mag",nil,2000],
						["optic_Arco",nil,4000],
						["optic_SOS",nil,5000],
						["optic_NVS",nil,6000],
						["ItemRadio","Telephone",500],
						["SmokeShellYellow","gaz lacrimogene",500]
					]
				];
			};
		};
	};

	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Vous n'êtes pas civil!"};
			case (!license_civ_rebel): {"Vous n'avez pas la licence Rebelle!"};
			default
			{
				["Mohammed's Jihadi Shop",
					[
							["arifle_SDAR_F",nil,35000],
							["arifle_TRG20_F",nil,45000],
							["arifle_TRG21_F",nil,50000],
							["arifle_Mk20_F",nil,60000],
							["30Rnd_556x45_Stanag",nil,8000],
							["30Rnd_556x45_Stanag_Tracer_Green",nil,6000],
							["20Rnd_556x45_UW_mag",nil,8000],
							["SMG_01_F",nil,40000],
							["30Rnd_45ACP_Mag_SMG_01",nil,9000],
							["arifle_Katiba_F",nil,85000],
							["30Rnd_65x39_caseless_green",nil,16000],
							["30Rnd_65x39_caseless_green_mag_Tracer",nil,11000],
							["srifle_DMR_01_F",nil,120000],
							["10Rnd_762x51_Mag",nil,500],
							["optic_ACO_grn",nil,25000],
							["optic_Arco",nil,25000],
							["optic_Holosight_smg",nil,25000],
							["optic_Holosight",nil,25000]							
					]
				];
			};
		};
	};

	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Vous n'etes pas un civil!"};
			case (!license_civ_gun): {"Vous n'avez pas la la license port d'armes!"};
			default
			{
				["Billy Joe's Firearms",
					[						
						["hgun_Rook40_F",nil,5000],
						["16Rnd_9x21_Mag",nil,500],
						["hgun_PDW2000_F",nil,20000],
						["30Rnd_9x21_Mag",nil,1000],
						["hgun_ACPC2_F",nil,5000],
						["9Rnd_45ACP_Mag",nil,500],
						["arifle_sdar_F","SDAR (Illegal)",35000],
						["20Rnd_556x45_UW_mag",nil,500],
						["optic_ACO_grn",nil,2500],
						["optic_ACO_grn_smg",nil,2500]
					]
				];
			};
		};
	};

	case "gang":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Vous n'etes pas un civil!"};
			default
			{
				["Hideout Armament",
					[
						["hgun_Rook40_F",nil,15500],
						["hgun_Pistol_heavy_02_F",nil,18850],
						["hgun_ACPC2_F",nil,24500],
						["hgun_PDW2000_F",nil,27000],
						["optic_ACO_grn_smg",nil,1500],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["6Rnd_45ACP_Cylinder",nil,50],
						["30Rnd_9x21_Mag",nil,75],
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150]
					]
				];
			};
		};
	};

	case "genstore":
	{
		["Altis General Store",
			[
				["Binocular","Jumelles",500],
				["ItemGPS","GPS",500],
				["ItemMap",nil,50],
				["FirstAidKit",nil,500],
				["ToolKit","Trousse à outils",1000],
				["NVGoggles_OPFOR","JVN",2500],
				["Chemlight_red",nil,300],
    			["Chemlight_yellow",nil,300],
    			["Chemlight_green",nil,300],
    			["Chemlight_blue",nil,300]
			]
		];
	};

	case "uranium":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"Tu n'es pas civil!"};
			case (!license_civ_uranium): {"Tu n'as pas la formation Uranium!"};
			default
			{
				["Objet Traitement Uranium",
					[
						["ToolKit",nil,200],
						["FirstAidKit",nil,100]
					]
				];
			};
		};
	};

	case "cellphone":
	{
		["Store phone",
			[
				["ItemRadio","Cellphone",500]
			]
		];
	};
};