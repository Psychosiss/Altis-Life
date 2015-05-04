private ["_validFunctions","_params","_functionName","_target","_isPersistent","_isCall","_varName","_varValue","_function","_callerName","_callerUID","_exitScope"];

_exitScope = false;
_varName = _this select 0;
_varValue = _this select 1;
_mode = [_varValue,0,[0]] call BIS_fnc_param;
_params = [_varValue,1,[]] call BIS_fnc_param;
_functionName =	[_varValue,2,"",[""]] call BIS_fnc_param;
_target = [_varValue,3,true,[objNull,true,0,[],sideUnknown,grpNull,""]] call BIS_fnc_param;
_isPersistent =	[_varValue,4,false,[false]] call BIS_fnc_param;
_isCall = [_varValue,5,false,[false]] call BIS_fnc_param;
_callerName = [_varValue,6,"",[""]] call BIS_fnc_param;
_callerUID = [_varValue,7,"",[""]] call BIS_fnc_param;

if(!(["life_fnc_",_functionName] call BIS_fnc_inString) && 
{!(["SPY_fnc_",_functionName] call BIS_fnc_inString)} && 
{!(["DB_fnc_",_functionName] call BIS_fnc_inString)} && 
{!(["TON_fnc_",_functionName] call BIS_fnc_inString)} &&
{!(toLower(_functionName) in ["BIS_fnc_execVM","BIS_fnc_effectkilledairdestruction","BIS_fnc_effectkilledairdestructionstage2"])} && 
{!(["SOCK_fnc_",_functionName] call BIS_fnc_inString)}) exitWith {false};
if(toLower(_functionName) == "DB_fnc_asyncCall") exitWith {false};
if(toLower(_functionName) == "DB_fnc_mresToArray") exitWith {false};

if(_functionName == "BIS_fnc_execVM") then 
{
	_param2 = _params select 1;
	if(isNil "_param2") exitWith {_exitScope = true;};
	if(_param2 != "initPlayerServer.sqf") exitWith {_exitScope = true;};
};

if(_callerName == "" OR _callerUID == "") exitWith {};
if(_callerUID != "__SERVER__" && _callerName != "__SERVER__" && toLower(_functionName) in ["SPY_fnc_cookieJar","SPY_fnc_notifyAdmins"]) then 
{
	if(toLower(_functionName) == "spy_fnc_cookiejar") exitWith 
	{
		private "_reportUID";
		_reportUID = _params select 1;
		if(_reportUID != _callerUID) exitWith 
		{
			if(isServer && _mode == 0) then 
			{
				[_callerName,_callerUID,"false_reports_to_spyglass"] call SPY_fnc_cookieJar;
				[[_callerName,"Rapport de spyglass corrompu (cheater)"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
			};
			_exitScope = true;
		};
	};

	private "_reportName";
	_reportName = _params select 0;
	if(_callerName != _reportName) exitWith 
	{
		if(isServer && _mode == 0) then 
		{
			[_callerName,_callerUID,"false_reports_to_spyglass"] call SPY_fnc_cookieJar;
			[[_callerName,"Rapport de spyglass corrompu (cheater)"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
		};
		_exitScope = true;
	};
};

if(toLower(_functionName) == "BIS_fnc_endmission") exitWith {false};
if(_exitScope) exitWith {false};
if (isMultiplayer && _mode == 0) then 
{
	if (isServer) then 
	{
		if (typeName _target == typeName []) then 
		{
			{
				[_varName,[_mode,_params,_functionName,_x,_isPersistent,_isCall,_callerName,_callerUID]] call life_fnc_MPexec;
			} foreach _target;
		} else {
			private ["_ownerID","_serverID"];
			_serverID = owner (missionNamespace getVariable ["BIS_functions_mainscope",objNull]);
			switch (typeName _target) do 
			{
				case (typeName objNull): {_ownerID = owner _target;};
				case (typeName true): {_ownerID = [_serverID,-1] select _target;};
				case (typeName 0): {_ownerID = _target;};
				case (typeName grpNull);
				case (typeName sideUnknown): {_ownerID = -1;};
				case (typeName ""): {_ownerID = -1;};
			};
			life_fnc_MP_packet = [1,_params,_functionName,_target,_isPersistent,_isCall,"__SERVER__","__SERVER__"];
			if (_ownerID < 0) then 
			{
				publicVariable "life_fnc_MP_packet";
			} else {
				if (_ownerID != _serverID) then 
				{
					_ownerID publicVariableClient "life_fnc_MP_packet";
				};
			};

			if (_ownerID < 0 || _ownerID == _serverID) then // --- or if (_ownerID == -1 ...
			{
				["life_fnc_MP_packet",life_fnc_MP_packet] call life_fnc_MPexec;
			};

			if (_isPersistent) then 
			{
				if (typeName _target != typeName 0) then 
				{
					private ["_logic","_queue"];
					_logic = missionNamespace getVariable ["BIS_functions_mainscope",objNull];
					_queue = _logic getVariable ["BIS_fnc_MP_queue",[]];
					_queue set [count _queue,+life_fnc_MP_packet];
					_logic setVariable ["BIS_fnc_MP_queue",_queue,true];
				} else {
					["L'execution persistante n'est pas disponible quand la cible est %1. Utiliser %2 ou %3 plutôt.",typeName 0,typeName objNull,typeName false] call BIS_fnc_error;
				};
			};
		//};
	//};
		} else {
			private "_canExecute";
			_canExecute = switch (typeName _target) do 
			{
				case (typeName grpNull): {player in units _target};
				case (typeName sideUnknown): {playerSide == _target;};
				case (typeName ""): {if(!isNull player) then {getPlayerUID player == _target;} else {false}};
				default {true};
			};
			if (_canExecute) then 
			{
				_function = missionNamespace getVariable _functionName;
				if (!isNil "_function") then 
				{
					if (_isCall) then 
					{
						_params call _function;
					} else {
						_params spawn _function;
					};
					true
				} else {
				/*
					["Fonction '%1' n'existe pas",_functionName] call BIS_fnc_error;
					false
				*/
					_supportInfo = supportInfo format ["*:%1*", _functionName];
					if (count _supportInfo > 0) then 
					{
						_cfgRemoteExecCommands = [["CfgRemoteExecCommands"], configFile] call BIS_fnc_loadClass;
						if (isClass (_cfgRemoteExecCommands >> _functionName)) then 
						{
							_paramCount = if (typeName _params == typeName []) then {count _params} else {1};
							switch _paramCount do 
							{
								case 0: {_params call compile format ["%1", _functionName];true};
								case 1: {_params call compile format ["%1 (_this)", _functionName ];true};
								case 2: {_params call compile format ["(_this select 0) %1 (_this select 1)", _functionName ];true};
								default {["Erreur lors de l'exécution à distance '%1' - nombre incorrect d'arguments (%2) passé, doit être 0, 1 ou 2", _functionName, count _params] call BIS_fnc_error;false};
							};
						} else {
							["Commande de script '%1' n'est pas autorisé à être éxécuté à distance.", _functionName] call BIS_fnc_error;
							false
						};
					} else {
						["Fonction ou commande de script '%1' n'existe pas", _functionName] call BIS_fnc_error;
						false
					};
				};
			};
		};
	};
};