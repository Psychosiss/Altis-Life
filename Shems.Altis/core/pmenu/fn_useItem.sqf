private "_item";
disableSerialization;
if((lbCurSel 2005) == -1) exitWith {};
if (player getVariable ["restrained", false]) exitWith {};
_item = lbData[2005,(lbCurSel 2005)];

switch true do
{
	case (_item in ["water","coffee","kfc_pepsi"]): 
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
			[[_fire],"life_fnc_simDisable",false,false] call BIS_fnc_MP;
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
				titleText["Redbull ne donne pas des ailes, désolé. Tu peux courrir 5 minutes","PLAIN"];
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

	case (_item == "lockpick"):
	{
		[] spawn life_fnc_lockPick;
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

	case (_item in ["apple","salema","ornate","mackerel","tuna","mullet","catshark","turtle","turtlesoup","donuts","tbacon","peach","burgers","pizza","frites","chickenp","dogp","sheepp","goatp","rabbitp","snakep","kfc_popcorn","kfc_wings","kfc_bucket"]):
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
		titleText["Cet objet est utilisable depuis le menu déroulant.","PLAIN"];
	};

	case (_item == "underwatercharge"): 
	{
		_obj = nearestObject [player, "Land_Wreck_Traw_F"];
		if (_obj == objNull) then {_obj = nearestObject [player, "Land_Wreck_Traw2_F"];};
		if (("Land_Wreck_Traw_F" == typeOf _obj) OR ("Land_Wreck_Traw2_F" == typeOf _obj) && (player distance _obj < 30)) then
		{
			if (!([false,_item,1] call life_fnc_handleInv)) exitWith {hint "Erreur : objet non trouvé";};
			_ship = _obj getVariable "opened";
			_ship_obj = _obj;
			if (_ship) then {hint "Le navire est ouvert!"};
			if (!_ship) then 
			{
				hint "Une charge à été planté. Eloignez-vous !";
				playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", _ship_obj];
				sleep 10;
				"M_NLAW_AT_F" createVehicle [getPos _ship_obj select 0, getPos _ship_obj select 1, 0];
				shipWeapons = true;
				publicVariableServer "shipWeapons";
			};
		};
	};
  
   	case (_item == "team_red"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_redTeam;
		};
	};

	case (_item == "team_blue"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_blueTeam;
		};
	};

	default
	{
		hint "Cet objet n'est pas utilisable !";
	};
};

[] call life_fnc_p_updateMenu;
[] call life_fnc_hudUpdate;