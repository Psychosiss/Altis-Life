#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
DB_Async_Active = false;
DB_Async_ExtraLock = false;
life_server_isReady = false;
publicVariable "life_server_isReady";

[] execVM "\life_server\functions.sqf";
[] execVM "\life_server\eventhandlers.sqf";

_extDB = false;

if(isNil {uiNamespace getVariable "life_sql_id"}) then 
{
	life_sql_id = round(random(9999));
	__CONST__(life_sql_id,life_sql_id);
	uiNamespace setVariable ["life_sql_id",life_sql_id];
	_result = "extDB" callExtension "9:VERSION";
	diag_log format ["extDB: Version: %1", _result];
	if(_result == "") exitWith {};
	if ((parseNumber _result) < 14) exitWith {diag_log "Erreur: Vous devez avoir la version 14 ou + d'extDB.";};
	_result = "extDB" callExtension "9:DATABASE:Database2";
	if(_result != "[1]") exitWith {diag_log "extDB: Erreur de connection à la base de données.";};
	_result = "extDB" callExtension format["9:ADD:DB_RAW_V2:%1",(call life_sql_id)];
	if(_result != "[1]") exitWith {diag_log "extDB: Erreur de connection à la base de données.";};
	"extDB" callExtension "9:LOCK";
	_extDB = true;
	diag_log "extDB: Connecté à la base de données.";
} else {
	life_sql_id = uiNamespace getVariable "life_sql_id";
	__CONST__(life_sql_id,life_sql_id);
	diag_log "extDB: Toujours connecté à la base de données.";
};

if (!_extDB) exitWith 
{
	life_server_extDB_notLoaded = true;
	publicVariable "life_server_extDB_notLoaded";
	diag_log "extDB: Erreur, regardez les logs d'extDB pour plus d'informations.";
};

["CALL resetLifeVehicles",1] spawn DB_fnc_asyncCall;
["CALL deleteDeadVehicles",1] spawn DB_fnc_asyncCall;
["CALL deleteOldHouses",1] spawn DB_fnc_asyncCall;
["CALL deleteOldGangs",1] spawn DB_fnc_asyncCall;

life_adminlevel = 0;
life_med_level = 0;
life_cop_level = 0;
life_donator = 0;

__CONST__(JxMxE_PublishVehicle,"No");

//life_radio_west = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
//life_radio_civ = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
//life_radio_indep = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];

serv_sv_use = [];

fed_bank setVariable["safe",(count playableUnits),true];

addMissionEventHandler ["HandleDisconnect",{_this call TON_fnc_clientDisconnect; false;}];

[] spawn TON_fnc_cleanup;
life_gang_list = [];
publicVariable "life_gang_list";
life_wanted_list = [];
client_session_list = [];

[] execFSM "\life_server\cleanup.fsm";

[] spawn
{
	private["_logic","_queue"];
	while {true} do
	{
		sleep (30 * 60);
		_logic = missionnamespace getvariable ["bis_functions_mainscope",objnull];
		_queue = _logic getvariable "BIS_fnc_MP_queue";
		_logic setVariable["BIS_fnc_MP_queue",[],TRUE];
	};
};

[] spawn TON_fnc_federalUpdate;

[] spawn
{
	while {true} do
	{
		sleep (30 * 60);
		{
			_x setVariable["sellers",[],true];
		} foreach ["Dealer_1","Dealer_2","Dealer_3"];
	};
};

{
	if(!isPlayer _x) then 
	{
		_npc = _x;
		{
			if(_x != "") then 
			{
				_npc removeWeapon _x;
			};
		} foreach [primaryWeapon _npc,secondaryWeapon _npc,handgunWeapon _npc];
	};
} foreach allUnits;

[] spawn TON_fnc_initHouses;

[] execVM "\life_server\Functions\DynMarket\fn_config.sqf";
[] execVM "\life_server\Functions\SipWreck\fn_generateWreck.sqf";
call compile preProcessFileLineNumbers "\life_server\SHK_pos\shk_pos_init.sqf";

private["_dome","_rsb"];

_dome = nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"];
_rsb = nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"];

for "_i" from 1 to 3 do {_dome setVariable[format["bis_disabled_Door_%1",_i],1,true]; _dome animate [format["Door_%1_rot",_i],0];};
_rsb setVariable["bis_disabled_Door_1",1,true];
_rsb allowDamage false;
_dome allowDamage false;
life_server_isReady = true;
publicVariable "life_server_isReady";

[] call SHEMS_fnc_antiHack;