private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;

ctrlSetText[3103,"Altis Police Department Shop"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret pushBack ["U_Rangemaster",nil,25];
		_ret pushBack ["U_B_CombatUniform_mcam_worn",nil,350];
		_ret pushBack ["U_B_SpecopsUniform_sgg",nil,350];
	};
	
	//Hats
	case 1:
	{
		if((call life_cop_level) > 1) then 
		{
			_ret pushBack ["H_HelmetB_plain_mcamo",nil,75];
			_ret pushBack ["H_Booniehat_mcamo",nil,120];
			_ret pushBack ["H_CrewHelmetHeli_B","masque à gaz",500];
			_ret pushBack ["H_Beret_blk_POLICE",nil,50];
			_ret pushBack ["H_MilCap_mcamo",nil,100];
			_ret pushBack ["NVGoggles_mas_mask",nil,1500];
			_ret pushBack ["NVGoggles_mas_mask_b",nil,1500];
			_ret pushBack ["NVGoggles_mas_mask_t",nil,1500];
			_ret pushBack ["NVGoggles_mas",nil,1500];
		};
	};
	
	//Glasses
	case 2:
	{
		_ret pushBack ["G_Shades_Black",nil,25],
		_ret pushBack ["G_Shades_Blue",nil,20],
		_ret pushBack ["G_Sport_Blackred",nil,20],
		_ret pushBack ["G_Sport_Checkered",nil,20],
		_ret pushBack ["G_Sport_Blackyellow",nil,20],
		_ret pushBack ["G_Sport_BlackWhite",nil,20],
		_ret pushBack ["G_Aviator",nil,75],
		_ret pushBack ["G_Squares",nil,10],
		_ret pushBack ["G_Lowprofile",nil,30],
		_ret pushBack ["G_Combat",nil,55]
	};
	
	//Vest
	case 3:
	{
		_ret pushBack ["V_Rangemaster_belt",nil,800];
		if((call life_cop_level) > 1) then
		{
			_ret pushBack ["V_PlateCarrier1_rgr",nil,1500];
			_ret pushBack ["V_PlateCarrier2_rgr",nil,1500];
			_ret pushBack ["V_PlateCarrier3_rgr",nil,1450];
			_ret pushBack ["V_TacVest_blk_POLICE",nil,1300];
		};
	};
	
	//Backpacks
	case 4:
	{
		_ret pushBack ["B_Kitbag_cbr",nil,800],
		_ret pushBack ["B_FieldPack_cbr",nil,500],
		_ret pushBack ["B_AssaultPack_cbr",nil,700],
		_ret pushBack ["B_Bergen_sgg",nil,2500],
		_ret pushBack ["B_Carryall_cbr",nil,3500],
		_ret pushBack ["B_Parachute",nil,5000]
	};
};

_ret;