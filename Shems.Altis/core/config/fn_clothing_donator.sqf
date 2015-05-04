private "_filter";
_filter = [_this,0,0,[0]] call BIS_fnc_param;

ctrlSetText[3103,"Donator Clothing Store"];

switch _filter do
{
	case 0:
	{
		[
			["U_I_Protagonist_VR",nil,3000],
			["U_O_Protagonist_VR",nil,3000],
			["U_B_Protagonist_VR",nil,3000]
		];
	};

	case 1:
	{
		[
			["G_Bandanna_aviator",nil,500],
			["G_Bandanna_beast",nil,500],
			["G_Bandanna_tan",nil,500],
			["G_Bandanna_sport",nil,500],
			["G_Bandanna_blk",nil,500],
			["G_Bandanna_oli",nil,500],
			["G_Bandanna_shades",nil,500]
		];
	};

	case 2:
	{
		[
			["G_Goggles_VR",nil,100]
		];
		
	};

	case 3:
	{
		[
			["V_HarnessOGL_gry","gilet explosif",1500000]
		];
	};

	case 4:
	{
		[
			["B_AssaultPack_cbr",nil,1500],
			["B_Kitbag_mcamo",nil,3500],
			["B_TacticalPack_oli",nil,2500],
			["B_FieldPack_ocamo",nil,2000],
			["B_Bergen_sgg",nil,3500],
			["B_Kitbag_cbr",nil,3500],
			["B_Carryall_oli",nil,4000],
			["B_Carryall_khk",nil,4000]
		];
	};
};