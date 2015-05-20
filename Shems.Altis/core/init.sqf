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
if(!isNil "life_server_extDB_notLoaded" && {life_server_extDB_notLoaded != ""}) exitWith 
{
	999999 cutText ["Un probleme lié à extDB a été rencontré, Merci de le signaler.","BLACK FADED"];
	999999 cutFadeOut 99999999;
};

[] call SOCK_fnc_dataQuery;
waitUntil {life_session_completed};
0 cutText["Fin de la procedure client","BLACK FADED"];
0 cutFadeOut 9999999;

[] call life_fnc_fastRope;
[] spawn life_fnc_voiceCheck;
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

["Chargement du salaire"] call life_fnc_log;
[] call life_fnc_payManager;

["Chargement des impots"] call life_fnc_log;
[] call life_fnc_taxesManager;

["Mise en place du suppresseur de son"] call life_fnc_log;
life_soundMuted = false;
life_soundSuppressed = false;
["life_RscSoundStatus"] call life_fnc_createRscLayer;

["Ecran 46 trouvé"] call life_fnc_log;
waitUntil {!(isNull (findDisplay 46))};

"colorCorrections" ppEffectAdjust [1, 1.08, -0.06, [0.5,0.5,0.5,0], [1,1,1,1.21], [0.09,0.09,0.09,0]];
"colorCorrections" ppEffectCommit 0;
"colorCorrections" ppEffectEnable true;

[] call life_fnc_initEventHandlers;
[] call life_fnc_initActions;

life_sidechat = true;
[[player,life_sidechat,playerSide],"TON_fnc_managesc",false,false] spawn life_fnc_MP;

doStop units player;

["Demarrage de l'HUD"] call life_fnc_log;
["Life_RscHUD",nil,nil,false] call life_fnc_createRscLayer;

["Demarrage du tag du joueur"] call life_fnc_log;
["life_RscNameTags"] call life_fnc_createRscLayer;

//0 cutText ["","BLACK IN"];
[] call life_fnc_hudSetup;

player setVariable["steam64ID",getPlayerUID player];
player setVariable["realname",profileName,true];

life_fnc_moveIn = compileFinal 
"
	player moveInCargo (_this select 0);
";

life_dynMarket_boughtItems = [];
[[getPlayerUID player],"TON_fnc_playerLogged",false,false] spawn life_fnc_MP;

[] execVM "core\chatEvents\init.sqf";
[] execVM "scripts\IgiLoadinit.sqf";

life_paycheck = compileFinal (if(typeName life_paycheck == "STRING") then {life_paycheck} else {str(life_paycheck)});
life_taxes = compileFinal (if(typeName life_taxes == "STRING") then {life_taxes} else {str(life_taxes)});
player enableFatigue ((call life_enableFatigue));
[[getPlayerUID player,player getVariable["realname",name player]],"life_fnc_wantedProfUpdate",false,false] spawn life_fnc_MP;

life_init = true;