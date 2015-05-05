private "_filter";
_filter = [_this,0,0,[0]] call BIS_fnc_param;

ctrlSetText[3103,"Bounty Hunter Clothing Shop"];

switch _filter do
{
	case 0:
	{
		[
			["U_I_CombatUniform","Bounty Hunter Uniform",5000]
		];
	};

	case 1: {};
	case 2: {};
	case 3: {};
	case 4: {};
};