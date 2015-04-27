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
[] call compile PreprocessFileLineNumbers "core\configuration.sqf";
[] call life_fnc_setupEVH;
[] call life_fnc_setupActions;

waitUntil {(!isNil {clientGangLeader})};

0 cutText ["En attente que le serveur soit prêt...","BLACK FADED"];
0 cutFadeOut 99999999;

waitUntil{!isNil "life_server_isReady"};
waitUntil{(life_server_isReady OR !isNil "life_server_extDB_notLoaded")};
if(!isNil "life_server_extDB_notLoaded" && {life_server_extDB_notLoaded != ""}) exitWith 
{
	["extDB non trouvé"] call life_fnc_log;
	999999 cutText ["Un probleme lié à extDB a été rencotré, Merci de le signaler.","BLACK FADED"];
	999999 cutFadeOut 99999999;
};

[] call SOCK_fnc_dataQuery;
waitUntil {life_session_completed};
0 cutText["Fin de la procedure client","BLACK FADED"];
0 cutFadeOut 9999999;

//[] spawn life_fnc_escInterupt;
[] execVM "core\chatEvents\init.sqf";
[] call life_fnc_fastRope;
[] call life_fnc_addKey;
[] spawn life_fnc_voiceCheck;

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

player setVariable["Restrained",false,true];
player setVariable["Escorting",false,true];
player setVariable["transporting",false,true];
player setVariable["missingOrgan",false,true];
player setVariable["hasOrgan",false,true];

[] call life_fnc_payManager;
["payManager executé"] call life_fnc_log;
[] call life_fnc_taxesManager;
["taxesManager executé"] call life_fnc_log;
waitUntil {!(isNull (findDisplay 46))};
["Ecran 46 trouvé"] call life_fnc_log;
(findDisplay 46) displayAddEventHandler ["KeyUp","_this call life_fnc_keyUpHandler"];
(findDisplay 46) displayAddEventHandler ["KeyDown","_this call life_fnc_keyDownHandler"];
(findDisplay 46) displayAddEventHandler ["MouseButtonDown","_this call life_fnc_mouseDownHandler"];
(findDisplay 46) displayAddEventHandler ["MouseButtonUp","_this call life_fnc_mouseUpHandler"];
(findDisplay 46) displayAddEventHandler ["MouseZchanged","_this spawn life_fnc_enableActions"];
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
player setVariable["steam64ID",getPlayerUID player];
player setVariable["realname",profileName,true];

life_fnc_moveIn = compileFinal "player moveInCargo (_this select 0);";
life_dynMarket_boughtItems = [];
[[getPlayerUID player],"TON_fnc_playerLogged",false,false] spawn life_fnc_MP;

["Life_RscHUD",nil,nil,false] call life_fnc_createRscLayer;

"colorCorrections" ppEffectAdjust [1, 1.08, -0.06, [0.5,0.5,0.5,0], [1,1,1,1.21], [0.09,0.09,0.09,0]];
"colorCorrections" ppEffectCommit 0;
"colorCorrections" ppEffectEnable true;

while {true} do 
{
	sleep 600;
	[] call SOCK_fnc_updateRequest;
};

[] call life_fnc_initSurvival;

showChat true;
doStop units player;
enableRadio false;
enableSentences false;
player disableConversation true;
player switchCamera "EXTERNAL";
player setVariable ["BIS_noCoreConversations", true];
0 fadeRadio 0;
1 fadeSound 1;
1 fadeMusic 1;
1 fadeSpeech 1;

__CONST__(life_paycheck,life_paycheck);
__CONST__(life_taxes,life_taxes);
player enableFatigue (__GETC__(life_enableFatigue));
[[getPlayerUID player,player getVariable["realname",name player]],"life_fnc_wantedProfUpdate",false,false] spawn life_fnc_MP;