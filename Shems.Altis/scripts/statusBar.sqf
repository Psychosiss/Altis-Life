waitUntil {!(isNull (findDisplay 46))};
disableSerialization;

_rscLayer = "StatusBar" call BIS_fnc_rscLayer;
_rscLayer cutRsc["StatusBar","PLAIN"];

[] spawn 
{
	_counter = 180;
	_timeSinceLastUpdate = 0;
	while {true} do
	{
		sleep 1;
		_counter = _counter - 1;
		_statusText = "gaming-shems.com";
		((uiNamespace getVariable "StatusBar")displayCtrl 1000) ctrlSetText format["%3 | FPS: %1 | TS3 : 195.154.200.118 | Humains actifs: %2  ", round diag_fps, count playableUnits, _statusText, _counter];
	}; 
};