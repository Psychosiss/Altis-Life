#include <macro.h>

life_firstSpawn = true;
life_session_completed = false;
private["_handle","_timeStamp"];
0 cutText["Mise en place client, patientez...","BLACK FADED"];
0 cutFadeOut 9999999;
_timeStamp = diag_tickTime;
diag_log "------------------------------------------------------------------------------------------------------";
diag_log "--------------------------- Debut de l'initialisation du Client Altis Life ---------------------------";
diag_log "------------------------------------------------------------------------------------------------------";
waitUntil {!isNull player && player == player};

[] call compile PreprocessFileLineNumbers "core\clientValidator.sqf";

diag_log "::Life Client:: Initialisation des Variables";
[] call compile PreprocessFileLineNumbers "core\configuration.sqf";
diag_log "::Life Client:: Variables initialisé";

diag_log "::Life Client:: Mise en place des gestionnaires d'événements";
[] call life_fnc_setupEVH;
diag_log "::Life Client:: EventHandlers mis en place";

diag_log "::Life Client:: Mise en place des actions d'utilisateurs";
[] call life_fnc_setupActions;
diag_log "::Life Client:: Actions d'utilisateurs mis en place";

diag_log "::Life Client:: En attente du transférere des fonctions du serveur..";
waitUntil {(!isNil {clientGangLeader})};
diag_log "::Life Client:: Reception des fonctions du serveur.";

0 cutText ["En attente que le serveur soit prêt...","BLACK FADED"];
0 cutFadeOut 99999999;
diag_log "::Life Client:: Le serveur est prêt..";

waitUntil{!isNil "life_server_isReady"};
waitUntil{(life_server_isReady OR !isNil "life_server_extDB_notLoaded")};
if(!isNil "life_server_extDB_notLoaded") exitWith 
{
	diag_log "::Life Client:: Le serveur le trouve pas extDB";
	999999 cutText ["Un probleme lié à extDB a été rencotré, Merci de le signaler.","BLACK FADED"];
	999999 cutFadeOut 99999999;
};

[] call SOCK_fnc_dataQuery;
waitUntil {life_session_completed};
0 cutText["Fin de la procedure client","BLACK FADED"];
0 cutFadeOut 9999999;

//[] spawn life_fnc_escInterupt;
[] execVM "core\chatEvents\init.sqf";

switch (playerSide) do
{
	case west:
	{
		_handle = [] spawn life_fnc_initCop;
		waitUntil {scriptDone _handle};
	};

	case civilian:
	{
		_handle = [] spawn life_fnc_initCiv;
		waitUntil {scriptDone _handle};
	};

	case independent:
	{
		_handle = [] spawn life_fnc_initMedic;
		waitUntil {scriptDone _handle};
	};

	case sideLogic:
    {
        _handle = [] spawn life_fnc_initZeus;
        waitUntil {scriptDone _handle};
    };
};

player setVariable["restrained",false,true];
player setVariable["Escorting",false,true];
player setVariable["transporting",false,true];
player setVariable["missingOrgan",false,true];
player setVariable["hasOrgan",false,true];
diag_log "Passage a l'initialisation des paramètres";
[] execFSM "core\fsm\client.fsm";
diag_log "Execution du client.fsm";
waitUntil {!(isNull (findDisplay 46))};
diag_log "Ecran 46 Trouvé";
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call life_fnc_keyUpHandler"];
player addRating 99999999;
diag_log "------------------------------------------------------------------------------------------------------";
diag_log format["                Fin de l'init d'Altis Life Client :: Temps d'execution total : %1 secondes ",(diag_tickTime) - _timeStamp];
diag_log "------------------------------------------------------------------------------------------------------";
life_sidechat = true;
//[[player,life_sidechat,playerSide],"TON_fnc_managesc",false,false] spawn life_fnc_MP;
0 cutText ["","BLACK IN"];
[] call life_fnc_hudSetup;
LIFE_ID_PlayerTags = ["LIFE_PlayerTags","onEachFrame","life_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;
LIFE_ID_RevealObjects = ["LIFE_RevealObjects","onEachFrame","life_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;
[] call life_fnc_settingsInit;
player setVariable["steam64ID",getPlayerUID player];
player setVariable["realname",profileName,true];

life_fnc_moveIn = 
compileFinal "
	player moveInCargo (_this select 0);
";

life_fnc_garageRefund = 
compileFinal "
	_price = _this select 0;
	_unit = _this select 1;
	if(_unit != player) exitWith {};
	life_atmcash = life_atmcash + _price;
";

life_dynMarket_boughtItems = [];
[[getPlayerUID player],"TON_fnc_playerLogged",false,false] spawn life_fnc_MP;

[] spawn  
{
	private["_fnc_food","_fnc_water"]; 
	_fnc_food = 
	{
		if(life_hunger < 2) then 
		{
			player setDamage 1; 
			hint "Vous êtes mort de faim.";
	} else {
		life_hunger = life_hunger - 10;
		[] call life_fnc_hudUpdate;
		if(life_hunger < 2) then 
		{
			player setDamage 1; 
			hint "Vous êtes mort de faim.";
		};
		switch(life_hunger) do 
		{
			case 30: {hint "Vous ne avez rien mangé depuis un moment... Vous devriez trouver quelque chose à manger.";};
			case 20: {hint "Vous commencez à mourir de faim, vous avez besoin de trouver quelque chose à manger, sinon vous mourrez.";};
			case 10: {hint "Vous êtes maintenant mort de faim, vous allez bientôt mourir si vous ne mangez quelque chose.";player setFatigue 1;};
			};
		};
	};
	
	_fnc_water = 
	{
		if(life_thirst < 2) then 
		{
			player setDamage 1; 
			hint "Vous êtes morts de déshydratation.";
		} else {
			life_thirst = life_thirst - 10;
			[] call life_fnc_hudUpdate;
			if(life_thirst < 2) then 
			{
				player setDamage 1; 
				hint "Vous êtes morts de déshydratation.";
			};
			switch(life_thirst) do 
			{
				case 30: {hint"Vous n'avez rien bu depuis un moment... Vous devriez trouver quelque chose à boire.";};
				case 20: {hint "Vous n'avez rien bu, vous avez besoin de trouver quelque chose à boire ou vous allez bientôt commencer à mourir de déshydratation."; player setFatigue 1;};
				case 10: {hint "Vous souffrez maintenent en déshydratation sévère... trouver quelque chose à boire rapidement."; player setFatigue 1;};
			};
		};
	};

	while{true} do
	{
		sleep 550;
		[] call _fnc_water;
		sleep 200;
		[] call _fnc_food;
	};
};

[] spawn
{
	private["_bp","_load","_cfg"];
	while{true} do
	{
		waitUntil {backpack player != ""};
		_bp = backpack player;
		_cfg = getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumload");
		_load = round(_cfg / 8);
		life_maxWeight = life_maxWeightT + _load;
		waitUntil {backpack player != _bp};
		if(backpack player == "") then 
		{
			life_maxWeight = life_maxWeightT;
		};
	};
};

[] spawn
{
	while{true} do
	{
		_oldDamage = damage player;
		waitUntil {_oldDamage != damage player};
		if (_oldDamage != damage player) then
		{
			_damage = (damage player) - _oldDamage;
			if (_damage > 0.2) then
			{
				_pain = (life_pain + _damage);
				if (_pain > 1) then 
				{ 
					_pain = 1; 
				};
				[_pain] spawn life_fnc_setPain;
			};
		};
	};
};

[] spawn
{
	while {true} do
	{
		sleep 1.5;
		if(life_carryWeight > life_maxWeight && !isForcedWalk player) then 
		{
			player forceWalk true;
			player setFatigue 1;
			hint "Votre sac est plein! Lachez des objets pour avancer plus vite.";
		} else {
			if(isForcedWalk player) then 
			{
				player forceWalk false;
			};
		};
	};
};

[] spawn
{
	waitUntil {life_session_completed};
	for "_i" from 0 to (count life_addiction)-1 do
	{
		_new = life_addiction select _i;
		if (_new > 0) then
		{
			_new = _new - 0.02;
			if (_new < 0) then 
			{ 
				_new = 0; 
			};
			life_addiction set [_i, _new];
			if (_new > 0 && (time - (life_used_drug select _i)) > 600) then
			{
				switch (true) do
				{
					case (_new > 0.4): 
					{ 
						systemChat "Vous êtes fortement en manque."; life_drug_withdrawl = false; 
					};
					case (_new > 0.6): 
					{ 
						systemChat "Obtenez de la drogue avant que votre addiction occupe toutes vos pensées."; life_drug_withdrawl = false; 
					};
					case (_new > 0.9):
					{
						systemChat "You feel shakey and anxious! You need a fix! Vous vous sentez chancelants et anxieux! Vous avez besoin d'une dose!";
						if (!life_drug_withdrawl) then 
						{ 
							[] spawn 
							{ 
								while {life_drug_withdrawl} do 
								{ 
									resetCamShake;
									addCamShake [1, 4, 10];
									sleep 3.5;
								}; 
								resetCamShake;
							}
						};
						life_drug_withdrawl = true;
					};
				};
			};
		};
	};
	sleep 240;
	life_drug_level = life_drug_level - 0.05;
	if (life_drug_level < 0) then 
	{ 
		life_drug_level = 0; 
	};
};

[] spawn  
{
	private["_walkDis","_myLastPos","_MaxWalk","_runHunger","_runDehydrate"];
	_walkDis = 0;
	_myLastPos = (getPos player select 0) + (getPos player select 1);
	_MaxWalk = 1200;
	while{true} do 
	{
		sleep 0.5;
		if(!alive player) then {_walkDis = 0;}
		else
		{
			_CurPos = (getPos player select 0) + (getPos player select 1);
			if((_CurPos != _myLastPos) && (vehicle player == player)) then
			{
				_walkDis = _walkDis + 1;
				if(_walkDis == _MaxWalk) then
				{
					_walkDis = 0;
					life_thirst = life_thirst - 5;
					life_hunger = life_hunger - 5;
					[] call life_fnc_hudUpdate;
				};
			};
			_myLastPos = (getPos player select 0) + (getPos player select 1);
		};
	};
};

[] spawn  
{
	while{true} do
	{
		waitUntil {(player getVariable "missingOrgan")};
		life_max_health = .50;
		while{(player getVariable "missingOrgan")} do 
		{
			life_thirst =  50;
			life_hunger =  50;
			if(damage player < (1 - life_max_health)) then {player setDamage (1 - life_max_health);};
			"dynamicBlur" ppEffectEnable true;
			"dynamicBlur" ppEffectAdjust [2];
			"dynamicBlur" ppEffectCommit 1;
			sleep 5;
		};
		"dynamicBlur" ppEffectEnable false;
		life_max_health = 1;
	};
};

[] spawn
{
	while {true} do
	{
		sleep 1.5;
		if(life_inv_uranium2 != 0) then 
		{
			player forceWalk true;
			player setFatigue 1;
			hint "Tu porte de l'uranium brut tu ne peux pas courir pour le moment!";
		} else {
			if(isForcedWalk player) then 
			{
				player forceWalk false;
			};
		};
	};
};

[] spawn
{
	while {true} do
	{
		private["_damage"];
		sleep 1;
		while {((player distance (getMarkerPos "Warm_Marker") < 250) && (player getVariable["Revive",TRUE]))} do
		{
			if(uniform player == "U_C_Scientist") then
			{
				hint "! Tu est dans une zone radioactive ! Mais ta combinaison te protège.";
				sleep 5;
			} else {
				hint "! TU ES DANS UNE ZONE RADIOACTIVE ! Tu risque de mourir si tu n'es pas protégé.";
				_damage = damage player;
				_damage = _damage + 0.1;
				player setDamage (_damage);
				[] call life_fnc_hudUpdate;
				sleep 5;
			};
		};
	};
};

[] spawn 
{
    while {true} do 
	{
        if (life_fatigue < getFatigue player) then 
		{
            player setFatigue life_fatigue;
        };
        sleep 1.5;
    }
};

while {true} do 
{
	sleep 600;
	[] call SOCK_fnc_updateRequest;
};

enableRadio false;
enableSentences false;
player disableConversation true;
0 fadeRadio 0;

__CONST__(life_paycheck,life_paycheck);
player enableFatigue (__GETC__(life_enableFatigue));