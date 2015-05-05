private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
_ret = [];

ctrlSetText[3103,"Magasin médical"];

switch _filter do
{
	case 0:
	{
		_ret pushBack ["U_B_CombatUniform_mcam_vest", "Uniforme médicale", 0];
		if (life_med_level >= 3) then 
		{
			_ret pushBack ["U_I_Wetsuit", "Medic Wetsuit", 0];
		};
	};

	case 1: 
	{
		_ret pushBack ["H_Cap_blu",nil,0];
		_ret pushBack ["H_Watchcap_sgg",nil,0];
		_ret pushBack ["H_Cap_marshal",nil,0];
	};

	case 2:
	{
		_ret pushBack ["G_Shades_Black",nil,0];
		_ret pushBack ["G_Shades_Blue",nil,0];
		_ret pushBack ["G_Sport_Blackred",nil,0];
		_ret pushBack ["G_Sport_Checkered",nil,0];
		_ret pushBack ["G_Sport_Blackyellow",nil,0];
		_ret pushBack ["G_Sport_BlackWhite",nil,0];
		_ret pushBack ["G_Squares",nil,0];
		_ret pushBack ["G_Aviator",nil,0];	
		_ret pushBack ["G_Lady_Mirror",nil,0];
		_ret pushBack ["G_Lady_Dark",nil,0];
		_ret pushBack ["G_Lady_Blue",nil,0];
		_ret pushBack ["G_Lowprofile",nil,0];
		_ret pushBack ["G_Combat",nil,0];
		if (life_med_level >= 3) then 
		{
			_ret pushBack ["G_Diving",nil,0];
		};
	};

	case 3: 
	{
		if (life_med_level >= 3) then 
		{
			_ret pushBack ["V_RebreatherIA",nil,0];
		};
	};

	case 4:
	{
		_ret pushBack ["B_Carryall_khk",nil,0];
		if (life_med_level >= 3) then 
		{
			_ret pushBack ["B_Parachute",nil,0];
		};
	};
};

_ret;