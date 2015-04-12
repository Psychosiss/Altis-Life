private["_abortButton","_respawnButton","_fieldManual","_escSync","_canUseControls"];
disableSerialization;

_escSync = 
{
	private["_abortButton","_thread","_syncManager"];
	disableSerialization;
	_syncManager = 
	{
		disableSerialization;
		private["_abortButton","_timeStamp"];
		_abortButton = (findDisplay 49) displayCtrl 104;
		_timeStamp = time + 10;
		
		waitUntil 
		{
			_abortButton ctrlSetText format["%1",[(_timeStamp - time),"SS.MS"] call BIS_fnc_secondsToString];
			_abortButton ctrlCommit 0;
			round(_timeStamp - time) <= 0 || isNull (findDisplay 49)
		};
		
		_abortButton ctrlSetText localize "STR_DISP_INT_ABORT";
		_abortButton ctrlCommit 0;
	};
	
	_abortButton = (findDisplay 49) displayCtrl 104;
	[] call SOCK_fnc_updateRequest;
	
	if(_this) then 
	{
		_thread = [] spawn _syncManager;
		waitUntil{scriptDone _thread OR isNull (findDisplay 49)};
		_abortButton ctrlEnable true;
	};
};

_canUseControls = 
{
	if(playerSide == west) exitWith {};
	if((player getVariable["Restrained",false]) OR (player getVariable["Escorting",false]) OR (player getVariable["transporting",false]) OR (life_is_arrested) OR (life_istazed)) then {false} else {true};
};
	
while {true} do
{
	waitUntil{!isNull (findDisplay 49)};
	_abortButton = (findDisplay 49) displayCtrl 104;
	_abortButton ctrlEnable false;
	_abortButton buttonSetAction "[[player],""TON_fnc_cleanupRequest"",false,false] spawn life_fnc_MP";
	_respawnButton = (findDisplay 49) displayCtrl 1010;
	_fieldManual = (findDisplay 49) displayCtrl 122;
	_abortButton ctrlEnable false;
	_respawnButton ctrlEnable false;
	_fieldManual ctrlEnable false;
	_usebleCtrl = call _canUseControls;
	_usebleCtrl spawn _escSync;
	if(_usebleCtrl) then 
	{
		_respawnButton ctrlEnable true;
	};
	waitUntil{isNull (findDisplay 49)};
};