with missionNamespace do 
{
	private ["_params","_class"];
	_params = [_this,0,[]] call BIS_fnc_param;
	_class = [_this,1,"",[""]] call BIS_fnc_param;
	_preCompiled = [_this,2,false,[true]] call BIS_fnc_param;
	private "_fncName";
	_fncName = format["life_%1",_class];

	if (isNil _fncName && !_preCompiled) then 
	{
		private ["_scriptPath","_fncFile"];
		_scriptPath = format["dialog\function\%1.sqf",_class];
		_fncFile = preprocessFileLineNumbers _scriptPath;
		_fncFile = format ["scriptname '%1_%2';_fnc_scriptName = '%1';",_fncName] + _fncFile;
		missionNamespace setVariable [_fncName,compileFinal _fncFile];
	};

	private "_initVar";
	_initVar = _fncName + "_init";
	private "_display";
	_display = _params select 0;
	_display displayAddEventHandler 
	["Unload",format["
		['onUnload',_this] call %1; 
		uiNamespace setVariable ['%1',nil]; 
		missionNamespace setVariable ['%2',nil];",_fncName,_initVar]
	];
	uiNamespace setVariable [format["%1_display",_fncName],_display];
	missionNamespace setVariable [_initVar,false];
	[_display,_class] call BIS_fnc_guiEffectTiles;
	["onLoad",_params] call (missionNamespace getVariable _fncName);
	missionNamespace setVariable [_initVar,true];
};