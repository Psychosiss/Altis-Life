private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
_ret = [];

ctrlSetText[3103,"Altis Police Department Shop"];

switch _filter do
{
	case 0:
	{
		_ret pushBack [ "U_O_OfficerUniform_ocamo","Uniforme de police",0];
		if (life_cop_level >= 3) then 
		{
			_ret pushBack ["U_B_Wetsuit",nil,0];
		};

		if (license_cop_tfu || {life_cop_level >= 6}) then 
		{
			_ret pushBack ["U_I_CombatUniform",nil,0];
		};
	};

	case 1:
	{
		_ret pushBack ["H_Cap_police",nil,0];
		if (life_cop_level >= 2) then 
		{
			_ret pushBack ["H_Watchcap_blk",nil,0];
		};

		if (license_cop_tfu || {life_cop_level >= 6}) then 
		{
			_ret pushBack ["H_HelmetB_light_black",nil,0];
		};

		if(life_cop_level >= 7) then 
		{
			_ret pushBack ["H_Beret_blk_POLICE",nil,0];
		};
	};

	case 2:
	{
		_ret pushBack ["G_Tactical_Clear",nil,0];
		_ret pushBack ["G_Spectacles_Tinted",nil,0];
		_ret pushBack ["G_Diving",nil,0];
		_ret pushBack ["G_Aviator",nil,0];
		_ret pushBack ["G_Shades_Green",nil,0];
		_ret pushBack ["G_Shades_Blue",nil,0];
		_ret pushBack ["G_Shades_Black",nil,0];
		_ret pushBack ["G_Shades_Red",nil,0];
	};

	case 3:
	{
		_ret pushBack ["V_Rangemaster_belt",nil,0];
		if (life_cop_level >= 3) then 
		{
			_ret pushBack ["V_TacVest_blk_POLICE",nil,0];
			_ret pushBack ["V_RebreatherB",nil,0];
		};

		if (license_cop_tfu || {life_cop_level >= 6}) then 
		{
			_ret pushBack ["V_PlateCarrier1_blk",nil,0];
		};
	};

	case 4:
	{
		_ret pushBack ["B_Carryall_cbr",nil,0];
		if (life_cop_level >= 5) then 
		{
			_ret pushBack ["B_Parachute",nil,0];
		};

		if (life_cop_level >= 7) then 
		{
			_ret pushBack ["B_UAV_01_backpack_F",nil,0];
		};
	};
};

_ret;