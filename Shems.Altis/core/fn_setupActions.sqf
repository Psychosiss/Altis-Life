switch (playerSide) do
{
	case civilian:
	{

		life_actions = life_actions + [player addAction["Piller",life_fnc_robAction,"",0,false,false,"",'!isNull cursorTarget && player distance cursorTarget < 3.5 && isPlayer cursorTarget && animationState cursorTarget == "Incapacitated" && !(cursorTarget getVariable["robbed",FALSE]) ']];
		life_actions = life_actions + [player addAction["Prendre un organe",life_fnc_takeOrgans,"",0,false,false,"",'!isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable ["missingOrgan",FALSE]) && !(player getVariable "Escorting") && !(player getVariable "hasOrgan") && !(player getVariable "transporting") && animationState cursorTarget == "Incapacitated"']];
        life_actions = life_actions + [player addAction["Activer la veste explosive",life_fnc_suicideBomb,"",0,false,false,"",'vest player == "V_HarnessOGL_gry" && alive player && playerSide == civilian && !life_istazed && !life_isSuicide && !(player getVariable "restrained") && !(player getVariable "Escorting") && !(player getVariable "transporting")']];
		life_actions = life_actions + [player addAction["Récolter des ossements",life_fnc_gatherSkulls,"",0,false,false,"",'!life_action_in_use && (((getPosASL player select 2) < -110) && ((player distance (getMarkerPos "archeo_1") < 130)) OR (((getPosASL player select 2) < -124) && (player distance (getMarkerPos "archeo_2") < 130)))&& (vehicle player == player) && (life_carryWeight + (["skull"] call life_fnc_itemWeight)) <= life_maxWeight ']];
		life_actions = life_actions + [player addAction["Vérifier les bombes",life_fnc_bombDetect,"",99,false,true,"",'player distance cursorTarget < 5 && (cursorTarget getVariable["dchargeplaced",FALSE]) && ((cursorTarget isKindOf "Car") || (cursorTarget isKindOf "Building")) ']];
		life_actions = life_actions + [player addAction["Désamorcer les explosifs", life_fnc_bombDefuseKit,"",99,false,false,"",'player distance cursorTarget < 5 && (cursorTarget getVariable["dchargefound",FALSE]) && ((cursorTarget isKindOf "Car") || (cursorTarget isKindOf "Building")) ']];
		life_actions = life_actions + [player addAction["Utiliser le nitro",life_fnc_activateNitro,false,2,false,false,"",' (vehicle player != player) && (driver vehicle player == player) && (((vehicle player) getVariable["nitro", 0]) > 0) ']];
		life_actions = life_actions + [player addAction["Attacher",life_fnc_restrainAction,cursorTarget,9999999,false,false,"",'!isNull cursorTarget && player distance cursorTarget < 5 && isPlayer cursorTarget && animationState cursorTarget == "Incapacitated" && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && speed cursorTarget < 1 ']];
		life_actions = life_actions + [player addAction["Déposer un filet de pèche",life_fnc_dropFishingNet,"",0,false,false,"",'(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];
		life_actions = life_actions + [player addAction["Suivre les animaux",life_fnc_trackAnimal,"",-1,false,false,"",'player distance (getMarkerPos "hunting") < 600']];
		life_actions = life_actions + [player addAction["Peau d'animal",life_fnc_skinAnimal,life_cursorTarget,-1,false,false,"",'!isNull life_cursorTarget && (player distance life_cursorTarget) < 4 && life_inv_skinningknife > 0 && (typeOf life_cursorTarget) in ["Cock_random_F","Goat_random_F","Hen_random_F","Sheep_random_F","Alsatian_Random_F","Rabbit_F","Snake_random_F"] && !alive life_cursorTarget ']];
		life_actions = life_actions + [player addAction["Cacher le corps",{deleteVehicle life_cursorTarget},life_cursorTarget,-1,false,false,"",'!isNull life_cursorTarget && (player distance life_cursorTarget) < 4 &&(typeOf life_cursorTarget) in ["Cock_random_F","Goat_random_F","Hen_random_F","Sheep_random_F","Alsatian_Random_F","Rabbit_F","Snake_random_F"] && !alive life_cursorTarget ']];
		life_actions = life_actions + [player addAction["Cuire la viande crue",life_fnc_cookMeat,life_cursorTarget,-1,false,false,"",'!isNull life_cursorTarget && (player distance life_cursorTarget) < 4 && (typeOf life_cursorTarget) == "Campfire_burning_F" && (life_inv_chicken > 0 || life_inv_dog > 0 || life_inv_sheep > 0 || life_inv_goat > 0) ']];
		life_actions = life_actions + [player addAction["Nettoyer le campement",{deleteVehicle life_cursorTarget},life_cursorTarget,-1,false,false,"",'!isNull life_cursorTarget && (player distance life_cursorTarget) < 4 && (typeOf life_cursorTarget) == "Campfire_burning_F" ']];
		life_actions = life_actions + [player addAction["Inventaire",life_fnc_openInventory,life_cursorTarget,0,false,false,"",' !isNull life_cursorTarget && (player distance life_cursorTarget) < 9 && ((typeOf life_cursorTarget) in ["Land_TentA_F","Land_TentDome_F"]) ']];
	};

	case west:
	{
		life_actions = life_actions + [player addAction["Menotter",life_fnc_restrain,cursorTarget,-1,false,false,"",' if (isPlayer cursorTarget) then { ((side cursorTarget != west) && alive cursorTarget && cursorTarget distance player < 5 && !(cursorTarget getVariable ["restrained",false]) && speed cursorTarget < 1) };']];
		life_actions = life_actions + [player addAction["Démenotter",life_fnc_unrestrain,cursorTarget,0,false,false,"",' if (!isNull cursorTarget) then { if (isPlayer cursorTarget) then { (cursorTarget isKindOf "Man" && player distance cursorTarget < 3.5 && (cursorTarget getVariable ["restrained",false]) && !(cursorTarget getVariable ["Escorting",false]))};};']];
	};
	
	case independent:
	{
		life_actions = life_actions + [player addAction["Traitement chirurgicale",life_fnc_medicOrgans,"",1,false,true,"",' playerSide == independent && !isNull cursorTarget && cursorTarget isKindOf "Man" ']];
		life_actions = life_actions + [player addAction["Menotter",life_fnc_restrain,cursorTarget,-1,false,false,"",' if (isPlayer cursorTarget) then { ((side cursorTarget != independent) && alive cursorTarget && cursorTarget distance player < 5 && !(cursorTarget getVariable ["restrained",false]) && speed cursorTarget < 1) };']];
		life_actions = life_actions + [player addAction["Démenotter",life_fnc_unrestrain,cursorTarget,0,false,false,"",' if (!isNull cursorTarget) then { if (isPlayer cursorTarget) then { (cursorTarget isKindOf "Man" && player distance cursorTarget < 3.5 && (cursorTarget getVariable ["restrained",false]) && !(cursorTarget getVariable ["Escorting",false]))};};']];
	};
};

player addAction["Mettre les bouchons",{0.5 fadeSound 0.1; life_earplugs = true; },"",-9999999,false,false,"","!life_earplugs"];
player addAction["Enlever les bouchons",{0.5 fadeSound 1; life_earplugs = false; },"",-9999999,false,false,"","life_earplugs"];
life_actions = life_actions + [player addAction["Utiliser les antalgiques",life_fnc_painKillers,player,-1,false,false,"",'(life_pain > 0) && (life_inv_painkillers > 0)']];
life_actions = life_actions + [player addAction["Donner  les antalgiques",life_fnc_painKillers,cursorTarget,-1,false,false,"",'!isNull cursorTarget && (isPlayer cursorTarget) && (alive cursorTarget) && ((cursorTarget getVariable ["pain",0]) > 0) && (life_inv_painkillers > 0)']];
life_actions = life_actions + [player addAction["Activer la nitro",life_fnc_activateNitro,false,2,false,false,"",'(vehicle player != player) && (driver vehicle player == player) && (((vehicle player) getVariable["nitro", 0]) > 0)']];