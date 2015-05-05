private "_filter";
_filter = [_this,0,0,[0]] call BIS_fnc_param;

ctrlSetText[3103,"Altis Heli Clothing Shop"];

switch _filter do
{
	case 0:
	{
		[
			["U_O_HeliPilotCoveralls","Heli Pilot Coveralls",10000],
			["U_I_HeliPilotCoveralls","Heli Pilot Coveralls",10000]
		];
	};

	case 1:
	{
		[
			["H_PilotHelmetHeli_O","Heli Pilot Helmet",25000],
			["H_PilotHelmetHeli_I","Heli Pilot Helmet",25000]
		];
	};

	case 2:
	{
		[
			["G_Aviator",nil,1000]
		];
	};

	case 3: {};
	case 4:
	{
		[
			["B_Parachute",nil,5000]
		];
	};
};