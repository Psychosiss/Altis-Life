private ["_filter","_return"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
_return = [];

ctrlSetText[3103,"Mohammed's Jihadi Shop"];

switch _filter do
{
	case 0:
	{
		_return pushBack ["U_BG_Guerrilla_6_1",nil,10000];
		_return pushBack ["U_BG_Guerilla1_1",nil,10000];
		_return pushBack ["U_BG_Guerilla2_2",nil,10000];
		_return pushBack ["U_BG_Guerilla2_1",nil,10000];
		_return pushBack ["U_BG_Guerilla2_3",nil,10000];
		_return pushBack ["U_BG_Guerilla3_1",nil,10000];
		_return pushBack ["U_IG_Guerilla2_1",nil,10000];
		_return pushBack ["U_IG_Guerilla1_1",nil,10000];
		_return pushBack ["U_BG_leader",nil,10000];
		_return pushBack ["U_O_OfficerUniform_ocamo",nil,15000];
		_return pushBack ["U_I_OfficerUniform",nil,15000];
		_return pushBack ["U_I_CombatUniform_shortsleeve",nil,15000];
		_return pushBack ["U_O_CombatUniform_ocamo",nil,25000];
		_return pushBack ["U_O_CombatUniform_oucamo",nil,25000];
		_return pushBack ["U_O_GhillieSuit",nil,50000];
		_return pushBack ["U_I_GhillieSuit",nil,75000];
		_return pushBack ["U_O_PilotCoveralls",nil,20000];
		_return pushBack ["U_I_PilotCoveralls",nil,20000];
		_return pushBack ["U_O_Wetsuit",nil,5000];
	};

	case 1:
	{
		_return pushBack ["H_Bandanna_blu",nil,5000];
		_return pushBack ["H_Bandanna_camo",nil,5000];
		_return pushBack ["H_Bandanna_cbr",nil,5000];
		_return pushBack ["H_Bandanna_gry",nil,5000];
		_return pushBack ["H_Bandanna_khk",nil,5000];
		_return pushBack ["H_Bandanna_mcamo",nil,5000];
		_return pushBack ["H_Bandanna_sgg",nil,5000];
		_return pushBack ["H_Bandanna_sand",nil,5000];
		_return pushBack ["H_Bandanna_surfer",nil,5000];
		_return pushBack ["H_Bandanna_surfer_blk",nil,5000];
		_return pushBack ["H_Bandanna_surfer_grn",nil,5000];
		_return pushBack ["H_Watchcap_blk",nil,5000];
		_return pushBack ["H_Watchcap_camo",nil,5000];
		_return pushBack ["H_Watchcap_cbr",nil,5000];
		_return pushBack ["H_Watchcap_khk",nil,5000];
		_return pushBack ["H_Watchcap_sgg",nil,5000];
		_return pushBack ["H_Booniehat_khk",nil,5000];
		_return pushBack ["H_Booniehat_indp",nil,5000];
		_return pushBack ["H_Booniehat_mcamo",nil,5000];
		_return pushBack ["H_Booniehat_oli",nil,5000];
		_return pushBack ["H_Booniehat_tan",nil,5000];
		_return pushBack ["H_ShemagOpen_khk",nil,5000];
		_return pushBack ["H_Shemag_olive",nil,5000];
		_return pushBack ["H_Shemag_khk",nil,5000];
		_return pushBack ["H_Beret_ocamo",nil,5000];
		_return pushBack ["H_StrawHat",nil,100];
		_return pushBack ["H_StrawHat_dark",nil,100];
		_return pushBack ["H_HelmetIA",nil,10000];
		_return pushBack ["H_HelmetO_ocamo",nil,10000];
		_return pushBack ["H_HelmetLeaderO_ocamo",nil,10000];
		_return pushBack ["H_HelmetO_oucamo",nil,10000];
		_return pushBack ["H_HelmetLeaderO_oucamo",nil,10000];
		_return pushBack ["H_HelmetSpecO_ocamo",nil,10000];
		_return pushBack ["H_HelmetSpecO_blk",nil,10000];
		_return pushBack ["H_HelmetB_paint",nil,20000];
		_return pushBack ["H_HelmetSpecB_paint1",nil,25000];
	};

	case 2:
	{
		_return pushBack ["G_Combat",nil,2000];
		_return pushBack ["G_Lowprofile",nil,2000];
		_return pushBack ["G_Shades_Black",nil,2000];
		_return pushBack ["G_Tactical_Clear",nil,2000];
		_return pushBack ["G_Spectacles_Tinted",nil,2000];
		_return pushBack ["G_Aviator",nil,2000];
		_return pushBack ["G_Diving",nil,500];
		_return pushBack ["G_Balaclava_oli",nil,8000];
		_return pushBack ["G_Balaclava_lowprofile",nil,8000];
		_return pushBack ["G_Balaclava_combat",nil,8000];
		_return pushBack ["G_Balaclava_blk",nil,8000];			
		_return pushBack ["G_Bandanna_aviator",nil,8000];
		_return pushBack ["G_Bandanna_beast",nil,8000];
		_return pushBack ["G_Bandanna_blk",nil,8000];
		_return pushBack ["G_Bandanna_khk",nil,8000];			
		_return pushBack ["G_Bandanna_oli",nil,8000];
		_return pushBack ["G_Bandanna_shades",nil,8000];
		_return pushBack ["G_Bandanna_sport",nil,8000];
		_return pushBack ["G_Bandanna_tan",nil,8000];
	};

	case 3:
	{
		_return pushBack ["V_HarnessOSpec_brn",nil,10000];
		_return pushBack ["V_HarnessOSpec_gry",nil,10000];
		_return pushBack ["V_HarnessOGL_brn",nil,10000];
		_return pushBack ["V_HarnessO_brn",nil,10000];
		_return pushBack ["V_HarnessO_gry",nil,10000];
		_return pushBack ["V_TacVest_blk",nil,15000];
		_return pushBack ["V_TacVest_brn",nil,15000];
		_return pushBack ["V_TacVest_camo",nil,15000];
		_return pushBack ["V_TacVest_khk",nil,15000];
		_return pushBack ["V_TacVest_oli",nil,15000];
		_return pushBack ["V_TacVestIR_blk",nil,30000];
		_return pushBack ["V_PlateCarrierIA1_dgtl",nil,80000];
		_return pushBack ["V_PlateCarrierIA1_dgtl",nil,80000];
		_return pushBack ["V_PlateCarrierIAGL_dgtl",nil,90000];
		_return pushBack ["V_PlateCarrierIA2_dgtl",nil,100000];
		_return pushBack ["V_RebreatherIR",nil,5000];
	};

	case 4:
	{
		_return pushBack ["B_FieldPack_ocamo",nil,5000];
		_return pushBack ["B_FieldPack_blk",nil,5000];
		_return pushBack ["B_FieldPack_cbr",nil,5000];
		_return pushBack ["B_FieldPack_oli",nil,5000];
		_return pushBack ["B_FieldPack_khk",nil,5000];
		_return pushBack ["B_FieldPack_oucamo",nil,5000];
		_return pushBack ["B_Kitbag_cbr",nil,5000];
		_return pushBack ["B_TacticalPack_oli",nil,5000];
		_return pushBack ["B_Carryall_oli",nil,10000];
		_return pushBack ["B_Carryall_khk",nil,10000];
		_return pushBack ["B_Carryall_cbr",nil,10000];
		_return pushBack ["B_Carryall_ocamo",nil,10000];
		_return pushBack ["B_Carryall_mcamo",nil,10000];
		_return pushBack ["B_Carryall_oucamo",nil,10000];
	};
};

_return