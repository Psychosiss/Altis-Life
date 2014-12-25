#include <macro.h>

private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;

ctrlSetText[3103,"Altis Police Department Shop"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret set[count _ret,["U_Rangemaster",nil,25]];
		_ret set[count _ret,["U_B_CombatUniform_mcam_worn",nil,350]];
		_ret set[count _ret,["U_B_SpecopsUniform_sgg",nil,350]];
	};
	
	//Hats
	case 1:
	{
		if(__GETC__(life_coplevel) > 1) then
		{
			_ret set[count _ret,["H_HelmetB_plain_mcamo",nil,75]];
			_ret set[count _ret,["H_Booniehat_mcamo",nil,120]];
			_ret set[count _ret,["H_CrewHelmetHeli_B","masque à gaz",500]];
			_ret set[count _ret,["H_Beret_blk_POLICE",nil,50]];
			_ret set[count _ret,["H_MilCap_mcamo",nil,100]];
			_ret set[count _ret,["NVGoggles_mas_mask",nil,1500]];
			_ret set[count _ret,["NVGoggles_mas_mask_b",nil,1500]];
			_ret set[count _ret,["NVGoggles_mas_mask_t",nil,1500]];
			_ret set[count _ret,["NVGoggles_mas",nil,1500]];
		};
	};
	
	//Glasses
	case 2:
	{
		_ret = 
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Aviator",nil,75],
			["G_Squares",nil,10],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55]
		];
	};
	
	//Vest
	case 3:
	{
		_ret set[count _ret,["V_Rangemaster_belt",nil,800]];
		if(__GETC__(life_coplevel) > 1) then
		{
			_ret set[count _ret,["V_PlateCarrier1_rgr",nil,1500]];
			_ret set[count _ret,["V_PlateCarrier2_rgr",nil,1500]];
			_ret set[count _ret,["V_PlateCarrier3_rgr",nil,1450]];
			_ret set[count _ret,["V_TacVest_blk_POLICE",nil,1300]];
		};
	};
	
	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_Kitbag_cbr",nil,800],
			["B_FieldPack_cbr",nil,500],
			["B_AssaultPack_cbr",nil,700],
			["B_Bergen_sgg",nil,2500],
			["B_Carryall_cbr",nil,3500],
			["B_Parachute",nil,5000]
		];
	};
};

_ret;