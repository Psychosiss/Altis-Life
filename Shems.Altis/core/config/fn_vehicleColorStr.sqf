private["_vehicle","_color","_index"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
_index = [_this,1,-1,[0]] call BIS_fnc_param;
_color = "";

switch _vehicle do
{
	case "O_Plane_CAS_02_F":
	{
		switch _index do
		{
			case 0: {_color = "Camo";};
			case 1: {_color = "Noir";};
		};
	};

	case "C_Offroad_01_F":
	{
		switch _index do
		{
			case 0: {_color = "Rouge";};
			case 1: {_color = "Jaune";};
			case 2: {_color = "Blanc";};
			case 3: {_color = "Bleu";};
			case 4: {_color = "Rouge foncé";};
			case 5: {_color = "Bleu / Blanc"};
			case 7: {_color = "Monster"};
			case 8: {_color = "Police"};
			
		};
	};

	case "B_G_Offroad_01_F";
	case "B_G_Offroad_01_armed_F":
	{
		switch _index do
		{
			case 0: {_color = "Woodland";};
			case 1: {_color = "Desert";};
		};
	};

	case "C_Hatchback_01_F":
	{
		switch _index do
		{
			case 0: {_color = "Beige";};
			case 1: {_color = "Vert";};
			case 2: {_color = "Bleu";};
			case 3: {_color = "Bleu Foncé";};
			case 4: {_color = "Jaune";};
			case 5: {_color = "Blanc"};
			case 6: {_color = "Gris"};
			case 7: {_color = "Noir"};
			case 8: {_color = "Medecin"};
			case 9: {_color = "Depanneur"};
			case 10: {_color = "Police"};
		};
	};

	case "C_Hatchback_01_sport_F":
	{
		switch _index do
		{
			case 0: {_color = "Rouge"};
			case 1: {_color = "Dark Bleu"};
			case 2: {_color = "Orange"};
			case 3: {_color = "Noir / Blanc"};
			case 4: {_color = "Tan"};
			case 5: {_color = "Vert"};
			case 6: {_color = "Monster WRC Sport"};
			case 7: {_color = "Rougebull WRC Sport"};
			case 8: {_color = "Medecin"};
			case 9: {_color = "Police"};
		};
	};

	case "C_SUV_01_F":
	{
		switch _index do
		{
			case 0: {_color = "Rouge foncé";};
			case 1: {_color = "Noir";};
			case 2: {_color = "Argent";};
			case 3: {_color = "Orange";};
			case 4: {_color = "Press";};
			case 5: {_color = "Medecin";};
			case 6: {_color = "Depanneur";};
			case 7: {_color = "Kavala SUV";};
			case 8: {_color = "Pyrgos SUV";};
			case 9: {_color = "Police";};
		};
	};

	case "C_Van_01_box_F":
	{
		switch _index do
		{
			case 0: {_color = "Blanc"};
			case 1: {_color = "Rouge"};
			case 2: {_color = "Ambulance"};
		};
	};
	
	case "C_Van_01_transport_F":
	{
		switch _index do
		{
			case 0: {_color = "Blanc"};
			case 1: {_color = "Rouge"};
			case 2: {_color = "Depanneur"};
		};
	};

	case "C_Van_01_fuel_F":
	{
		switch _index do
		{
			case 0: {_color = "Depanneur"};
		};
	};
	
	case "B_Quadbike_01_F" :
	{
		switch _index do
		{
			case 0: {_color = "Marron"};
			case 1: {_color = "Desert Digital"};
			case 2: {_color = "Noir"};
			case 3: {_color = "Bleu"};
			case 4: {_color = "Rouge"};
			case 5: {_color = "Blanc"};
			case 6: {_color = "Vert Digital"};
			case 7: {_color = "Chasseur"};
			case 8: {_color = "Rebelle"};
		};
	};
	
	case "B_Heli_Light_01_F";
	case "C_Heli_Light_01_civil_F":
	{
		switch _index do
		{
			case 0: {_color = "Sheriff"};
			case 1: {_color = "Bleuline"};
			case 2: {_color = "Elliptical"};
			case 3: {_color = "Furious"};
			case 4: {_color = "Jeans Bleu"};
			case 5: {_color = "Speedy Rougeline"};
			case 6: {_color = "Sunset"};
			case 7: {_color = "Vrana"};
			case 8: {_color = "Waves Bleu"};
			case 9: {_color = "Rebelle"};
			case 10: {_color = "Presse"};
			case 11: {_color = "Bleu"};
			case 12: {_color = "Rouge"};
			case 13: {_color = "Police"};
			case 14: {_color = "Medic"};
		};
	};
	
	case "O_Heli_Light_02_unarmed_F":
	{
		switch _index do
		{
			case 0: {_color = "Noir"};
			case 1: {_color = "Blanc / Bleu"};
			case 2: {_color = "Rebelle"};
			case 3: {_color = "Medecin"};
		};
	};
	
	case "B_MRAP_01_F";
	case "B_MRAP_01_hmg_F":
	{
		switch _index do
		{
			case 0: {_color = "Police"};
		};
	};
	
	case "O_MRAP_02_F":
	{
		switch _index do
		{
			case 0: {_color = "OPFOR"};
			case 1: {_color = "Lumiere Noir"};
			case 2: {_color = "Noir"};
			case 3: {_color = "Bleu ciel"};
			case 4: {_color = "Bleu foncé"};
			case 5: {_color = "Lime Vert"};
			case 6: {_color = "Orange"};
			case 7: {_color = "Rouge"};
			case 8: {_color = "Khaki"};
			case 9: {_color = "Blanc"};
			case 10: {_color = "Tan"};
			case 11: {_color = "Gris"};
			case 12: {_color = "Olive"};
		};
	};

	case "I_Truck_02_covered_F":
	{
		switch _index do
		{
			case 0: {_color = "Orange"};
			case 1: {_color = "Police"};
		};
	};

	case "I_Truck_02_transport_F":
	{
		switch _index do
		{
			case 0: {_color = "Orange"};
			case 1: {_color = "Noir"};
		};
	};

	case "I_Heli_Transport_02_F":
	{
		switch _index do
		{
			case 0: {_color = "Ion"};
			case 1: {_color = "Dahoman"};
			case 2: {_color = "Noir"};
		};
	};

	case "I_Heli_light_03_unarmed_F":
	{
		switch _index do
		{
			case 0: {_color = "Rebel"};
			case 1: {_color = "I99"};
		};
	};

	case "B_Truck_01_ammo_F": 
	{
		switch _index do
		{
			case 0: {_color = "Civil"};
		};
	};

	case "B_Truck_01_box_F": 
	{
		switch _index do
		{
			case 0: {_color = "Civil"};
		};
	};

	case "B_Heli_Transport_03_unarmed_F": 
	{
		switch _index do 
		{
			case 0: {_color = "Noir"};
		};
	};

	case "C_Offroad_01_repair_F": 
	{
		switch _index do
		{
			case 0: {_color = "Depanneur"};
		};
	};

	case "I_Truck_02_box_F": 
	{
		switch _index do
		{
			case 0: {_color = "Depanneur"};
		};
	};

	case "I_UGV_01_F": 
	{
		switch _index do
		{
			case 0: {_color = "Depanneur"};
		};
	};
};

_color;