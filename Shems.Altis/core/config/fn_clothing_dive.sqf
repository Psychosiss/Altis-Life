private "_filter";
_filter = [_this,0,0,[0]] call BIS_fnc_param;

ctrlSetText[3103,"Steve's Diving Shop"];

switch _filter do
{
	case 0:
	{
		[
			["U_B_Wetsuit","Batman",5000],
			["U_O_Wetsuit",nil,5000]
		];
	};

	case 1: {};

	case 2:
	{
		[
			["G_Diving",nil,500]
		];
	};

	case 3:
	{
		[
			["V_RebreatherIR",nil,5000]
		];
	};

	case 4: {};
};