disableSerialization;
private ["_params","_class","_display","_varScript","_varDisplay","_varInit"];

with missionNamespace do 
{
	_params = [_this,0,[]] call BIS_fnc_param;
	_class = [_this,1,"",[""]] call BIS_fnc_param;
	_display = _params select 0;
	_varScript = _class + "_script";
	_varDisplay = _class + "_display";
	_varInit = _class + "_init";
	_display displayAddEventHandler ["Unload", format 
	["
		['onUnload', _this] call %1; 
		uiNamespace setVariable ['%2', nil];
		missionNamespace setVariable ['%3', nil];
	",_varScript,_varDisplay,_varInit]];
	uiNamespace setVariable [_varDisplay,_display];
	[_display,_class] call BIS_fnc_guiEffectTiles;
	missionNamespace setVariable [_varInit,false];
	["onLoad",_params] call (missionNamespace getVariable _varScript);
	missionNamespace setVariable [_varInit,true];
};