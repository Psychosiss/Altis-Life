#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})

"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call life_fnc_MPexec};

DB_Async_Active = false;
DB_Async_ExtraLock = false;
life_server_isReady = false;
life_server_extDB2_notLoaded = "";
serv_sv_use = [];
publicVariable "life_server_isReady";

if(isNil {uiNamespace getVariable "life_sql_id"}) then 
{
	life_sql_id = round(random(9999));
	__CONST__(life_sql_id,life_sql_id);
	uiNamespace setVariable ["life_sql_id",life_sql_id];
	_result = "extDB2" callExtension "9:VERSION";
	["diag_log",[format["extDB2: Version: %1",_result]]] call TON_fnc_logIt;
	if(_result isEqualTo "") exitWith {diag_log "L'extension extDB2 du serveur n'a pas été trouvé, merci de le reporter à un developpeur.";};
	if ((parseNumber _result) < 52) exitWith {diag_log "extDB2: Vous devez avoir la version 52 ou + d'extDB2.";};
	"extDB2" callExtension "9:ADD_PROTOCOL:LOG:SPY_LOG:spyglass";
	//_result = "extDB2" callExtension "9:DATABASE:ALTISLIFERPG";
	_result = "extDB2" callExtension "9:ADD_DATABASE:ALTISLIFERPG";
	if(_result != "[1]") exitWith {diag_log "extDB2: Erreur de connection à la base de données.";};
	//_result = "extDB2" callExtension format["9:ADD:DB_RAW_V2:%1",(call life_sql_id)];
	_result = "extDB2" callExtension format["9:ADD_DATABASE_PROTOCOL:ALTISLIFERPG:SQL_CUSTOM_V2:%1",(call life_sql_id)];
	if(_result != "[1]") exitWith {diag_log "extDB2: Erreur de connection à la base de données.";};

	if(getNumber(configFile >> "CfgServerSettings" >> "extDB2" >> "LOG") isEqualTo 1) then 
	{
		{
			"extDB2" callExtension format["9:ADD_PROTOCOL:LOG:%1:%2",_x select 0,_x select 1];
			["diag_log",[format["extDB2: %1 is successfully added",_x select 0]]] call TON_fnc_logIt;
		} forEach getArray(configFile >> "CfgServerSettings" >> "extDB2" >> "LOG_Settings");
	};

	if(getNumber(configFile >> "CfgServerSettings" >> "extDB2" >> "RCON") isEqualTo 1) then 
	{
		RCON_ID = round(random(9999));
		RCON_ID = compileFinal (if(typeName RCON_ID == "STRING") then {RCON_ID} else {str(RCON_ID)});
		uiNamespace setVariable ["RCON_ID",RCON_ID];
		"extDB2" callExtension format["9:START_RCON:%1",RCON_SELECTION];
		"extDB2" callExtension format["9:ADD:RCON:%1",(call RCON_ID)];
		["diag_log",["extDB2: RCON est activé"]] call TON_fnc_logIt;
	};

	if(getNumber(configFile >> "CfgServerSettings" >> "extDB2" >> "VAC") isEqualTo 1) then 
	{
		VAC_ID = round(random(9999));
		VAC_ID = compileFinal (if(typeName VAC_ID == "STRING") then {VAC_ID} else {str(VAC_ID)});
		uiNamespace setVariable ["VAC_ID",VAC_ID];
		"extDB2" callExtension "9:START_VAC";
		"extDB2" callExtension format["9:ADD_PROTOCOL:STEAM:%1",(call VAC_ID)];
		["diag_log",["extDB2: VAC est activé"]] call TON_fnc_logIt;
	};

	if(getNumber(configFile >> "CfgServerSettings" >> "extDB2" >> "MISC") isEqualTo 1) then 
	{
		MISC_ID = round(random(9999));
		MISC_ID = compileFinal (if(typeName MISC_ID == "STRING") then {MISC_ID} else {str(MISC_ID)});
		uiNamespace setVariable ["MISC_ID",MISC_ID];
		"extDB2" callExtension format["9:ADD_PROTOCOL:MISC:%1",(call MISC_ID)];
		["diag_log",["extDB2: MISC est activé"]] call TON_fnc_logIt;
	};
	"extDB2" callExtension "9:LOCK";
	["diag_log",["extDB2: Connecté à la base de données."]] call TON_fnc_logIt;
} else {
	life_sql_id = uiNamespace getVariable "life_sql_id";
	__CONST__(life_sql_id,life_sql_id);
	["diag_log",["extDB2: Toujours connecté à la base de données"]] call TON_fnc_logIt;
	if(getNumber(configFile >> "CfgServerSettings" >> "extDB2" >> "RCON") isEqualTo 1) then 
	{
		RCON_ID = uiNamespace getVariable "RCON_ID";
		RCON_ID = compileFinal (if(typeName RCON_ID == "STRING") then {RCON_ID} else {str(RCON_ID)});
		["diag_log",["extDB2: RCON toujours activé"]] call TON_fnc_logIt;
	};

	if(getNumber(configFile >> "CfgServerSettings" >> "extDB2" >> "VAC") isEqualTo 1) then 
	{
		VAC_ID = uiNamespace getVariable "VAC_ID";
		VAC_ID = compileFinal (if(typeName VAC_ID == "STRING") then {VAC_ID} else {str(VAC_ID)});
		["diag_log",["extDB2: VAC toujours activé"]] call TON_fnc_logIt;
	};

	if(getNumber(configFile >> "CfgServerSettings" >> "extDB2" >> "MISC") isEqualTo 1) then 
	{
		MISC_ID = uiNamespace getVariable "MISC_ID";
		MISC_ID = compileFinal (if(typeName MISC_ID == "STRING") then {MISC_ID} else {str(MISC_ID)});
		["diag_log",["extDB2: MISC toujours activé"]] call TON_fnc_logIt;
	};
};

if(!life_server_extDB2_notLoaded isEqualTo "") exitWith {};

["CALL resetLifeVehicles",1] spawn DB_fnc_asyncCall;
["CALL deleteDeadVehicles",1] spawn DB_fnc_asyncCall;
["CALL deleteOldHouses",1] spawn DB_fnc_asyncCall;
["CALL deleteOldGangs",1] spawn DB_fnc_asyncCall;
["DELETE FROM houses WHERE owned='0'",1] spawn DB_fnc_asyncCall;

master_group attachTo[bank_obj,[0,0,0]];

onMapSingleClick "if(_alt) then {vehicle player setPos _pos};";
{
	_hs = createVehicle ["Land_Hospital_main_F",[0,0,0],[],0,"NONE"];
	_hs setDir (markerDir _x);
	_hs setPosATL (getMarkerPos _x);
	_var = createVehicle ["Land_Hospital_side1_F",[0,0,0],[],0,"NONE"];
	_var attachTo [_hs,[4.69775,32.6045,-0.1125]];
	detach _var;
	_var = createVehicle ["Land_Hospital_side2_F",[0,0,0],[],0,"NONE"];
	_var attachTo [_hs,[-28.0336,-10.0317,0.0889387]]; 
	detach _var;
} foreach ["hospital_2","hospital_3"];

{
	if(!isPlayer _x) then 
	{
		_npc = _x;
		{
			if(_x != "") then 
			{
				_npc removeWeapon _x;
			};
		} foreach [primaryWeapon _npc, secondaryWeapon _npc, handgunWeapon _npc];
	};
} foreach allUnits;

life_adminlevel = 0;
life_med_level = 0;
life_cop_level = 0;
life_donator = 0;

__CONST__(JxMxE_PublishVehicle,"false");

life_radio_west = radioChannelCreate [[0,0.95,1,0.8],"Side Channel","%UNIT_NAME",[]];
life_radio_civilian = radioChannelCreate [[0,0.95,1,0.8],"Side Channel","%UNIT_NAME",[]];
life_radio_independentendent = radioChannelCreate [[0,0.95,1,0.8],"Side Channel","%UNIT_NAME",[]];

fed_bank setVariable ["safe",count playableUnits,true];
[] spawn TON_fnc_federalUpdate;

addMissionEventHandler ["HandleDisconnect",{_this call TON_fnc_clientDisconnect; false;}];

[] call compile PreProcessFileLineNumbers "\life_server\functions.sqf";
[] call compile PreProcessFileLineNumbers "\life_server\eventhandlers.sqf";

[] spawn TON_fnc_cleanup;
life_wanted_list = [];
[] execFSM "\life_server\cleanup.fsm";

[] spawn
{
	private["_logic","_queue"];
	while {true} do
	{
		sleep (30 * 60);
		_logic = missionNamespace getVariable ["bis_functions_mainscope",objNull];
		_queue = _logic getVariable "BIS_fnc_MP_queue";
		_logic setVariable["BIS_fnc_MP_queue",[],true];
		{
			_x setVariable["sellers",[],true];
		} foreach [Dealer_1,Dealer_2];
	};
};

life_HouseInitDone = false;
[] spawn TON_fnc_initHouses;
waitUntil{life_HouseInitDone};

[] execVM "\life_server\Functions\DynMarket\fn_config.sqf";
[] execVM "\life_server\Functions\DynamicEvents\fn_generateWreck.sqf";
[] execVM "\life_server\Functions\DynamicEvents\config.sqf";
[] execVM "\life_server\Functions\DynamicEvents\fn_generateAuto.sqf";

private["_dome","_rsb"];

_dome = nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"];
_rsb = nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"];

for "_i" from 1 to 3 do 
{
	_dome setVariable[format["bis_disabled_Door_%1",_i],1,true]; 
	_dome animate [format["Door_%1_rot",_i],0];
};

_rsb setVariable["bis_disabled_Door_1",1,true];
_rsb allowDamage false;
_dome allowDamage false;
life_server_isReady = true;
publicVariable "life_server_isReady";