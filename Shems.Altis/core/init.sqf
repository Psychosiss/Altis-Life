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

[] spawn life_fnc_escInterupt;

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
diag_log "Display 46 Trouvé";
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call life_fnc_keyHandler"];
player addRating 99999999;
diag_log "------------------------------------------------------------------------------------------------------";
diag_log format["                Fin de l'init d'Altis Life Client :: Temps d'execution total : %1 secondes ",(diag_tickTime) - _timeStamp];
diag_log "------------------------------------------------------------------------------------------------------";
life_sidechat = true;
[[player,life_sidechat,playerSide],"TON_fnc_managesc",false,false] spawn life_fnc_MP;
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

[] execVM "core\init_survival.sqf";

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