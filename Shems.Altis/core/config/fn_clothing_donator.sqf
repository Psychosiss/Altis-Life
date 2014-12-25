private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;

ctrlSetText[3103,"Donator Clothing Store"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_I_Protagonist_VR",nil,5000],
			["U_O_Protagonist_VR",nil,5000],
			["U_B_Protagonist_VR",nil,5000]
		];
	};
	
	//Hats
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
	
	//Glasses
	case 2:
	{
		[
			["G_Goggles_VR",nil,500]
		];
		
	};
	
	//Vest
	case 3:
	{
		[
			["V_HarnessOGL_gry","gilet explosif",1500000]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_AssaultPack_cbr",nil,2500],
			["B_Kitbag_mcamo",nil,4500],
			["B_TacticalPack_oli",nil,3500],
			["B_FieldPack_ocamo",nil,3000],
			["B_Bergen_sgg",nil,4500],
			["B_Kitbag_cbr",nil,4500],
			["B_Carryall_oli",nil,5000],
			["B_Carryall_khk",nil,5000]
		];
	};
};