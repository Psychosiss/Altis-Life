private "_craft";
_craft = [_this,0,"",[""]] call BIS_fnc_param;
if(_craft == "") exitWith {closeDialog 0};

switch(_craft) do
{
	case "weapon":
	{
		switch(true) do
		{
			default
			{
				["Weapons",
					[
						["hgun_P07_F", ["life_inv_goldbar",2,"life_inv_copperr",1]],
						["SMG_01_F", ["life_inv_goldbar",6,"life_inv_copperr",3,"life_inv_ironr",3,"life_inv_diamondr",1]]

					]
				];
			};
		};
	};

	case "uniform":
	{
		switch(true) do
		{
			default
			{
				["Clothes",
					[
						["U_IG_Guerilla1_1", ["life_inv_goldbar",1]]
					]
				];
			};
		};
	};

	case "backpack":
	{
		switch(true) do
		{
			default
			{
				["Backpacks",
					[
						["B_Carryall_oli", ["life_inv_goldbar",1]]
					]
				];
			};
		};
	};

	case "item":
	{
		switch(true) do
		{
			default
			{
				["Items",
					[
						["life_inv_pickaxe", ["life_inv_goldbar",1]]
					]
				];
			};
		};
	};
};