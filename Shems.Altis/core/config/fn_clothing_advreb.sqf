private ["_filter","_return"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
_return = [];

ctrlSetText [3103,"Advanced Rebel Clothing"];

switch (_filter) do
{
	case 0:	
	{
		_return pushBack ["U_I_FullGhillie_ard",nil,100000];
		_return pushBack ["U_I_FullGhillie_sard",nil,100000];
		_return pushBack ["U_I_FullGhillie_lsh",nil,100000];
	};

	case 1:	{};
	case 2:	{};
	case 3:	
	{
		_return pushBack ["V_PlateCarrierIAGL_oli",nil,90000];
		_return pushBack ["V_HarnessOGL_gry","gilet explosif",1000000];
	};

	case 4:	{};
};

_return