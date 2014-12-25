#include <macro.h>

private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;

ctrlSetText[3103,"Magasin militaire"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{		
		_ret set[count _ret,["U_I_CombatUniform","Uniforme",5]];
		_ret set[count _ret,["U_B_GhillieSuit",nil,50]];
		_ret set[count _ret,["U_B_PilotCoveralls",nil,50]];
		_ret set[count _ret,["U_B_Wetsuit",nil,50]];
		_ret set[count _ret,["U_O_PilotCoveralls",nil,50]];
		_ret set[count _ret,["U_I_OfficerUniform",nil,50]];
		_ret set[count _ret,["U_B_CombatUniform_sgg",nil,50]];
		
	};
	
	//Hats
	case 1:
	{
		_ret set[count _ret,["H_CrewHelmetHeli_I",nil,50]];
		_ret set[count _ret,["H_HelmetCrew_O",nil,50]];
		_ret set[count _ret,["H_PilotHelmetFighter_O","masque de pilote",50]];
		_ret set[count _ret,["H_MilCap_mcamo",nil,50]];
		
	};
	
	//Glasses
	case 2:
	{
		_ret = 
		[
			["NVGoggles_mas_mask",nil,500],
			["NVGoggles_mas_mask_b",nil,500],
			["NVGoggles_mas_mask_t",nil,500],
			["NVGoggles_mas",nil,500]
		];
	};
	
	//Vest
	case 3:
	{
		_ret set[count _ret,["V_PlateCarrierIAGL_dgtl",nil,100]];
	};
	
	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_Carryall_cbr",nil,500],
			["B_Parachute",nil,1000]
		];
	};
};

_ret;