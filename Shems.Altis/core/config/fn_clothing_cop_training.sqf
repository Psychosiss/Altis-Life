private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
_ret = [];

ctrlSetText[3103,"Altis Police Training Shop"];

switch _filter do
{
	case 0:
	{
		_ret pushBack ["U_O_Protagonist_VR","Training Suit (Red)",550];
		_ret pushBack ["U_B_Protagonist_VR","Training Suit (Blue)",550];
		_ret pushBack ["U_I_Protagonist_VR","Training Suit (Green)",550];
	};

	case 1: {};
	case 2: 
	{
		_ret pushBack ["G_Goggles_VR",nil,100];
	};

	case 3: {};
	case 4: {};
};

_ret;