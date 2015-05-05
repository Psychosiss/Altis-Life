private ["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
_ret = [];

ctrlSetText [3103,"Clothing Safe"];

switch _filter do 
{
	case 0:	
	{
		_ret pushBack ["U_I_CombatUniform",nil,0];
	};

	case 1: 
	{
		_ret pushBack ["H_Cap_blk",nil,0];
		_ret pushBack ["H_Beret_blk_POLICE",nil,0];

		if (life_cop_level >= 6) then 
		{
			_ret pushBack ["H_HelmetB_light_black",nil,0];
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
		_ret pushBack ["V_TacVest_blk_POLICE",nil,0];
		if (life_cop_level >= 6) then 
		{
			_ret pushBack ["V_PlateCarrier1_blk",nil,0];
		};
	};

	case 4: 
	{

		_ret pushBack ["B_Carryall_cbr",nil,0];
		_ret pushBack ["B_Parachute",nil,0];
	};
};

_ret