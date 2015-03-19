private["_vehicle","_color","_index"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
_index = [_this,1,-1,[0]] call BIS_fnc_param;
_color = "";

switch (_vehicle) do
{
	case "C_Offroad_01_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Rouge"};
			case 1: {_color = "Marron"};
            case 2: {_color = "Blanc"};
			case 3: {_color = "Bleu"};
			case 4: {_color = "Rouge foncé"};
			case 5: {_color = "Bleu / Blanc"};
			case 6: {_color = "Police"};
			case 7: {_color = "Medicale"};
			case 8: {_color = "Dodge"};
		};
	};
	
	case "C_Hatchback_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Beige";};
			case 1: {_color = "Vert";};
			case 2: {_color = "Bleu";};
			case 3: {_color = "Bleu Foncé";};
			case 4: {_color = "Jaune";};
			case 5: {_color = "Blanc"};
			case 6: {_color = "Gris"};
			case 7: {_color = "Noir"};
			case 8: {_color = "Beetle"};
			case 9: {_color = "Youtube"};
			case 10: {_color = "Pedobear"};
			case 11: {_color = "Porsche"};
			case 12: {_color = "Rockstar"};
		};
	};
	
	case "I_Heli_light_03_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Police"};
			case 1: {_color = "Camo"};
			case 2: {_color = "Militaire"};
		};
	};
	
	case "C_Hatchback_01_sport_F":
	{
		switch(_index) do
		{
			case 0: {_color = "Rouge"};
			case 1: {_color = "Bleu foncé"};
			case 2: {_color = "Orange"};
			case 3: {_color = "Noir / Blanc"};
			case 4: {_color = "Tan"};
			case 5: {_color = "Vert"};
			case 6: {_color = "SWAT"};
			case 7: {_color = "Supporter"};
			case 8: {_color = "Redbull"};
			case 9: {_color = "Monster"};
			
		};
	};
	
	case "C_SUV_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Rouge foncé"};
			case 1: {_color = "Gris"};
			case 2: {_color = "Orange"};
			case 3: {_color = "Police"};
			case 4: {_color = "Medicale"};
			case 5: {_color = "Ferrari"};
			case 6: {_color = "Espace"};
			case 7: {_color = "Donut's"};
			case 8: {_color = "Flammes"};
			case 9: {_color = "Starsky"};
			case 10: {_color = "Cube"};
			case 11: {_color = "Stickers"};
		};
	};
	
	case "C_Van_01_box_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Blanc"};
			case 1: {_color = "Rouge"};
		};
	};
	
	case "C_Van_01_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Blanc"};
			case 1: {_color = "Rouge"};
		};
	};
	
	case "C_Van_01_fuel_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Blanc"};
			case 1: {_color = "Rouge"};
		};
	};
	
	case "C_Quadbike_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Desert"};
			case 1: {_color = "Noir"};
			case 2: {_color = "Bleu"};
			case 3: {_color = "Rouge"};
			case 4: {_color = "Blanc"};
			case 5: {_color = "Rebel"};
			case 6: {_color = "Cube"};
		};
	};
	
	case "B_Heli_Light_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Police"};
			case 1: {_color = "Civ Bleu"};
			case 2: {_color = "Civ Rouge"};
			case 3: {_color = "Bleuline"};
			case 4: {_color = "Elliptical"};
			case 5: {_color = "Furious"};
			case 6: {_color = "Jeans Bleu"};
			case 7: {_color = "Speedy Rougeline"};
			case 8: {_color = "Sunset"};
			case 9: {_color = "Vrana"};
			case 10: {_color = "Rebel Digital"};
			case 11: {_color = "Police"};
			case 12: {_color = "Medicale"};
		};
	};
	
	case "O_Heli_Light_02_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Noir"};
			case 1: {_color = "Blanc / Bleu"};
			case 2: {_color = "Desert Digi"};
		};
	};
	
	case "B_MRAP_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Police"};
		};
	};
	
	case "I_Truck_02_covered_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Gris"};
			case 1: {_color = "Orange"};
		};
	};
	
	case "I_Truck_02_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Noir"};
		};
	};
	
	case "B_APC_Wheeled_01_cannon_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Noir"};
		};
	};
	
	case "O_Heli_Attack_02_black_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Noir"};
		};
	};
	
	case "I_Heli_Transport_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Ion"};
			case 1: {_color = "Dahoman"};
		};
	};
	
	case "B_APC_Wheeled_01_cannon_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Noir"};
		};
	};
	
	case "B_Heli_Transport_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Police"};
		};
	};
	
	case "B_G_Offroad_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Police"};
		};
	};

	case "O_Heli_Light_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Medicale"};
		};
	};

	case "B_SDV_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Police"};
		};
	};
};

_color;