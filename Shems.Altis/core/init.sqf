private "_handle";

life_firstSpawn = true;
life_session_completed = false;

0 cutText["Mise en place client, patientez...","BLACK FADED"];
0 cutFadeOut 9999999;

1 fadeSound 0;
1 fadeMusic 0;
1 fadeSpeech 0;

enableRadio false;
enableSentences false;
0 fadeRadio 0;

waitUntil {!isNull player && player == player}; 
waitUntil {local player};

[] call compile PreprocessFileLineNumbers "core\clientValidator.sqf";
[] call compile PreprocessFileLineNumbers "core\configuration.sqf";

waitUntil {(!isNil {clientGangLeader})};

0 cutText ["Attente du serveur ...","BLACK FADED"];
0 cutFadeOut 99999999;

waitUntil{!isNil "life_server_isReady"};
waitUntil{(life_server_isReady OR !isNil "life_server_extDB_notLoaded")};
if(!isNil "life_server_extDB_notLoaded") exitWith 
{
	999999 cutText ["Un probleme lié à extDB a été rencontré, Merci de le signaler.","BLACK FADED"];
	999999 cutFadeOut 99999999;
};

[] call SOCK_fnc_dataQuery;
waitUntil {life_session_completed};
0 cutText["Fin de la procedure client","BLACK FADED"];
0 cutFadeOut 9999999;

[] call life_fnc_fastRope;
[] call life_fnc_vehicleSync;

waitUntil {!isNull (findDisplay 46)};

["Chargement des rôles"] call life_fnc_log;
[] call life_fnc_initPlayer;

if (playerSide != sideLogic) then
{
	[] call life_fnc_initSurvival;
	[] spawn  
	{
		while{true} do
		{
			sleep (300 + (random 180));
			[] call SOCK_fnc_updateRequest;
		};
	};
};

/*[] spawn
{
	while {true} do 
	{
		waitUntil{!isNull(findDisplay 49)};
		((findDisplay 49) displayCtrl 122) ctrlEnable false;
		((findDisplay 49) displayCtrl 122) ctrlShow false;
		waitUntil {isNull (findDisplay 49)};
		showChat true;
	};
};*/

player switchCamera "EXTERNAL";
player setVariable ["BIS_noCoreConversations", true];
1 fadeSound 1;
1 fadeMusic 1;
1 fadeSpeech 1;
showChat true;

player setVariable["Restrained",false,true];
player setVariable["Escorting",false,true];
player setVariable["transporting",false,true];
player setVariable["missingOrgan",false,true];
player setVariable["hasOrgan",false,true];
player setVariable["downed",false,true];
player setVariable["steam64ID",getPlayerUID player];
player setVariable["realname",profileName,true];

["Chargement du salaire"] call life_fnc_log;
[] call life_fnc_payManager;

["Chargement des impots"] call life_fnc_log;
[] call life_fnc_taxesManager;

["Ecran 46 trouvé"] call life_fnc_log;
waitUntil {!(isNull (findDisplay 46))};

"colorCorrections" ppEffectAdjust [1, 1.08, -0.06, [0.5,0.5,0.5,0], [1,1,1,1.21], [0.09,0.09,0.09,0]];
"colorCorrections" ppEffectCommit 0;
"colorCorrections" ppEffectEnable true;

_handle = [] spawn life_fnc_initEventHandlers;
waitUntil {scriptDone _handle};
[] call life_fnc_initActions;

["Vidage de toutes les pompes à essences"] call life_fnc_log;
_pumps = [];
_pumpClass = "Land_fs_feed_F";
if (worldName == "Altis") then
{
	_pumps = [[9205.75,12112.2,-0.0487232],[11831.6,14155.9,-0.0342026],[12024.7,15830,-0.0298138],[12026.6,15830.1,-0.0342979],[12028.4,15830,-0.0388737],[9025.78,15729.4,-0.0206451],[9023.75,15729,-0.027153],[9021.82,15728.7,-0.0293427],[16750.9,12513.1,-0.0525198],[6798.15,15561.6,-0.0441475],[6198.83,15081.4,-0.0912418],[14173.2,16541.8,-0.0946102],[5023.26,14429.6,-0.0978947],[5019.68,14436.7,-0.0114822],[4001.12,12592.1,-0.0966625],[17417.2,13936.7,-0.106519],[3757.14,13477.9,-0.0540276],[3757.54,13485.9,-0.010498],[16875.2,15469.4,0.0373325],[16871.7,15476.6,0.0102873],[8481.69,18260.7,-0.0266876],[15297.1,17565.9,-0.283808],[14221.4,18302.5,-0.0697155],[15781,17453.2,-0.285282],[19961.3,11454.6,-0.0349236],[19965.1,11447.6,-0.0483704],[5768.99,20085.7,-0.0189667],[21230.4,7116.56,-0.0604229],[20784.8,16665.9,-0.0521202],[20789.6,16672.3,-0.0213318],[23379.4,19799,-0.0544052],[25701.2,21372.6,-0.0774155]];
} else {
	_pumps = [[2707.91,5787.74,-0.0527279],[2711.07,5793.77,-0.0502887],[2714.46,5799.8,-0.0476766]];
	_pumpClass = "Land_fuelstation_feed_F";
};

{
	_pump = (nearestObject [_x, _pumpClass]);
	_pump setFuelCargo 0;
	_pump addAction ["Faire le plein",life_fnc_refuelVehicle,1,3,true,true,"",'_this distance _target < 5 && cursorTarget == _target'];
} forEach _pumps;

life_sidechat = true;
[[player,life_sidechat,playerSide],"TON_fnc_managesc",false,false] spawn life_fnc_MP;

doStop units player;
0 cutText ["","BLACK IN"];
[] call life_fnc_hudSetup;

LIFE_ID_PlayerTags = ["LIFE_PlayerTags","onEachFrame","life_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;
LIFE_ID_RevealObjects = ["LIFE_RevealObjects","onEachFrame","life_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;

life_fnc_moveIn = compileFinal 
"
	player moveInCargo (_this select 0);
";

life_dynMarket_boughtItems = [];
[[getPlayerUID player],"TON_fnc_playerLogged",false,false] spawn life_fnc_MP;

["Chargement du moniteur de chat"] call life_fnc_log;
[] execVM "core\chatEvents\init.sqf";
waitUntil {!isNil "aniChatEvents_initated"};
[] execVM "scripts\IgiLoadinit.sqf";

life_paycheck = compileFinal (if(typeName life_paycheck == "STRING") then {life_paycheck} else {str(life_paycheck)});
life_taxes = compileFinal (if(typeName life_taxes == "STRING") then {life_taxes} else {str(life_taxes)});
player enableFatigue (call life_enableFatigue);
[[getPlayerUID player,player getVariable["realname",name player]],"life_fnc_wantedProfUpdate",false,false] spawn life_fnc_MP;

life_init = true;