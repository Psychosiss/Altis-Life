if (!isMultiplayer) exitWith {};

disableSerialization;

private ["_display","_ctrlRespawn","_ctrlManual","_ctrlAbort"];
_display = _this select 0;
_ctrlRespawn = (_this select 0) displayCtrl 1010;
_ctrlManual = (_this select 0) displayCtrl 122;
_ctrlAbort = (_this select 0) displayCtrl 104;
_ctrlTitle = (_this select 0) displayCtrl 1050;

uiNamespace setVariable ["life_interruptDisplay",_display];

_ctrlAbort ctrlSetTooltip "Synchronisation du profil et déconnection";
_ctrlAbort ctrlSetEventHandler ["ButtonClick", "[] spawn life_fnc_abort; ( uiNamespace getVariable ""life_interruptDisplay"" ) closeDisplay 2; true"];
_ctrlRespawn ctrlEnable false;
_ctrlManual ctrlEnable false;
_ctrlAbort ctrlEnable false;
_waitTime = time + 10;

while { !isNull _display } do 
{
	if ( time < _waitTime ) then 
	{
		_ctrlAbort ctrlSetText format ["Déconnection disponible dans %1",[_waitTime - time,"SS.MS"] call BIS_fnc_secondsToString];
	} else {
		_ctrlAbort ctrlSetText "STR_DISP_INT_ABORT";
		_ctrlAbort ctrlEnable true;
	};

	_ctrlRespawn ctrlEnable !(player getVariable ["restrained", false] && player getVariable ["escorting", false] && player getVariable ["transporting", false] || !isNil "life_is_arrested" && {life_is_arrested} || !isNil "life_istazed" && {life_istazed});
	sleep 0.01;
};

true