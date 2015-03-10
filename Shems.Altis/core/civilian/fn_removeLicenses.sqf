private["_state"];
_state = [_this,0,1,[0]] call BIS_fnc_param;

switch (_state) do
{
	//Death while being wanted
	case 0:
	{
		license_civ_rebel = false;
		license_civ_driver = false;
		license_civ_heroin = false;
		license_civ_marijuana = false;
		license_civ_coke = false;
	};
	
	//Jail licenses
	case 1:
	{
		license_civ_gun = false;
		license_civ_driver = false;
	};
	
	//Remove motor vehicle licenses
	case 2:
	{
		if(license_civ_driver OR license_civ_air OR license_civ_truck OR license_civ_boat) then 
		{
			license_civ_driver = false;
			license_civ_air = false;
			license_civ_truck = false;
			license_civ_boat = false;
			hint "Vous avez perdu toutes vos licences de véhicules automobiles pour homicide routier.";
		};
	};
	
	//Killing someone while owning a gun license
	case 3:
	{
		if(license_civ_gun) then 
		{
			license_civ_gun = false;
			hint "Vous avez perdu vos licenses de tir pour homicide.";
		};
	};

	case 10:
	{
		license_civ_driver = false;
		hint "Votre permis de conduire à été saisi par la police.";
	};

	case 11:
	{
		license_civ_truck = false;
		hint "Votre permis poid lourd à été saisi par la police.";
	};

	case 12:
	{
		license_civ_air = false;
		hint "Votre permis aéronotique à été saisi par la police.";
	};

	case 13:
	{
		license_civ_boat = false;
		hint "Votre permis bateau à été saisi par la police.";
	};

	case 14:
	{
		license_civ_dive = false;
		hint "Votre license de plongée à été saisi par la police.";
	};

	case 15:
	{
		license_civ_gun = false;
		hint "Votre permis de port d'armes à été saisi par la police.";
	};

	case 16:
	{
		life_civ_rebel = false;
		hint "Votre license rebelle à été saisi par la police.";
};