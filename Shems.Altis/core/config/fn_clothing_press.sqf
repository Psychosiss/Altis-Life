private "_filter";
_filter = [_this,0,0,[0]] call BIS_fnc_param;

ctrlSetText[3103,"Dan Daily's Press Outfits"];

switch _filter do
{
	case 0:
	{
		[
			["U_C_Journalist","Journaliste",250]
		];
	};

	case 1:
	{
		[
			["H_Cap_press",nil,150]
		];
	};

	case 2:
	{
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Squares",nil,10],
			["G_Aviator",nil,100],
			["G_Lady_Mirror",nil,150],
			["G_Lady_Dark",nil,150],
			["G_Lady_Blue",nil,150],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55]
		];
	};

	case 3:
	{
		[
			["V_Press_F",nil,5000]
		];
	};

	case 4:
	{
		[
			["B_AssaultPack_cbr",nil,2500],
			["B_FieldPack_ocamo",nil,3000],
			["B_Kitbag_mcamo",nil,4500],
			["B_Kitbag_cbr",nil,4500],
			["B_TacticalPack_oli",nil,3500],
			["B_Bergen_sgg",nil,4500],
			["B_Carryall_oli",nil,5000],
			["B_Carryall_khk",nil,5000]
		];
	};
};