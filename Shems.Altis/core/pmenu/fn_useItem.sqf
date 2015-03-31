if (player getVariable ["restrained", false]) exitWith {};

private["_item"];
disableSerialization;
if((lbCurSel 2005) == -1) exitWith {};
_item = lbData[2005,(lbCurSel 2005)];

switch (true) do
{
	case (_item in ["water","coffee"]): 
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			playSound "drink";
			life_thirst = 100;
			player setFatigue 0;
		};
	};
	
	case (_item == "campfire"):
	{
		if (player distance (getMarkerPos "city") < 1000 || player distance (getMarkerPos "civ_spawn_2") < 1000 || player distance (getMarkerPos "civ_spawn_3") < 500 || player distance (getMarkerPos "civ_spawn_4") < 500) exitWith { hint "Tu doit t'eloigner de la civilisation pour etablir un campement."; };
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			titleText["Vous créez un feu de camp simple en utilisant le contenu d'un kit de feu de camp.","PLAIN"];
			_fire = "Campfire_burning_F" createVehicle (getPos player);
			[[_fire],"life_fnc_simDisable",false,false] spawn BIS_fnc_MP;
			_fire setVariable ["owner", player, true];
		};
	};

	case (_item == "boltcutter"): 
	{
		[cursorTarget] spawn life_fnc_boltcutter;
		closeDialog 0;
	};
	
	case (_item == "blastingcharge"): 
	{
		player reveal fed_bank;
		(group player) reveal fed_bank;
		[cursorTarget] spawn life_fnc_blastingCharge;
	};
	
	case (_item == "defusekit"): 
	{
		[cursorTarget] spawn life_fnc_defuseKit;
	};

	case (_item in ["storagesmall","storagebig"]): 
	{
		[_item] call life_fnc_storageBox;
	};

	case (_item == "redgull"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_thirst = 100;
			player setFatigue 0;
			[] spawn
			{
				playSound "drink";
				life_redgull_effect = time;
				titleText["Tu peux courrir comme un fou pendant 5 minutes ! Pas le temps de niaiser","PLAIN"];
				player enableFatigue false;
				waitUntil {!alive player OR ((time - life_redgull_effect) > (5 * 60))};
				player enableFatigue true;
			};
		};
	};

	case (_item == "spikeStrip"):
	{
		if(!isNull life_spikestrip) exitWith {hint "Tu as déjà une herse de déployée."};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_spikeStrip;
		};
	};
	
	case (_item == "fuelF"):
	{
		if(vehicle player != player) exitWith {hint "Vous ne pouvez pas faire le plein du véhicule!"};
		[] spawn life_fnc_jerryRefuel;
	};
	
	case (_item ==  "adrenalineShot"):
	{
		[] spawn life_fnc_adrenalineShot;
	};
	
	case (_item == "vammo"):
	{
		[] spawn life_fnc_vehAmmo;
	};
	
	case (_item == "nitro"):
	{
		[] spawn life_fnc_nitro;
	};
	
	case (_item == "gpstracker"): 
	{
		[cursorTarget] spawn life_fnc_gpsTracker;
	};

	case (_item in ["apple","salema","ornate","mackerel","tuna","mullet","catshark","turtle","turtlesoup","donuts","tbacon","peach","burgers","pizza","frites","chickenp","dogp","sheepp","goatp","rabbitp","snakep"]):
	{
		[_item] call life_fnc_eatFood;
		playSound "eat";
	};

	case (_item == "pickaxe"):
	{
		[] spawn life_fnc_gather;
		playSound "mining";
	};

	case (_item == "pressluft"):
    {
        [] spawn life_fnc_pressluftUse;
    };

	case (_item == "kidney"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			player setVariable["missingOrgan",false,true];
			life_thirst = 100;
			life_hunger = 100;
			player setFatigue .5;
		};
	};

	case (_item == "speedbomb"):
	{
		[] spawn life_fnc_speedBomb;
	};

	case (_item in ["marijuana","cigare"]):
	{
		[_item] spawn life_fnc_marijuana;
	};

	case (_item == "cocainep"):
	{
		[] spawn life_fnc_cocaine;
	};

	case (_item == "heroinp"):
	{
		[] spawn life_fnc_heroin;
	};

	case (_item == "methp"):
	{
		[] spawn life_fnc_meth;
	};

	case (_item in ["tent1","tent2"]):
	{
		[_item] spawn life_fnc_tent;
	};

	case (_item == "painkillers"):
	{
		titleText["Cet objet est utilisable depuis le menu d'interaction (touche windows gauche).","PLAIN"];
	};
	
	case (_item == "antimatter"):
	{
		[] spawn life_fnc_antiMatter;
	};

	default
	{
		hint "Cet objet n'est pas utilisable !";
	};
};

[] call life_fnc_p_updateMenu;
[] call life_fnc_hudUpdate;