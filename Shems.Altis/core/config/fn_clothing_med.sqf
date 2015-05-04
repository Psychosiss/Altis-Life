private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;

ctrlSetText[3103,"Magasin médical"];

_ret = [];
switch _filter do
{
	//Uniforms
	case 0:
	{
		_ret = 
		[
			["U_Rangemaster",nil,25]
		];
	};
	
	//Hats
	case 1: {[];};
	
	//Glasses
	case 2:
	{
		_ret = 
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Aviator",nil,75],
			["G_Squares",nil,10],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55]
		];
	};
	
	//Vest
	case 3: {[];};
	
	//Backpacks
	case 4:
	{
		_ret =
		[
			["B_Kitbag_cbr",nil,800],
			["B_FieldPack_cbr",nil,500],
			["B_AssaultPack_cbr",nil,700],
			["B_Bergen_sgg",nil,2500],
			["B_FieldPack_ocamo",nil,3000],
			["B_Carryall_cbr",nil,3500]
		];
	};
};

_ret;