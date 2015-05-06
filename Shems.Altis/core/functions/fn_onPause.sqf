with missionNamespace do 
{

	if (!isMultiplayer) exitWith {};

	disableSerialization;
	["Mis en pause."] call life_fnc_log;
	private ["_display","_ctrlRespawn","_ctrlManual","_ctrlAbort","_waitTime","_combatTime","_timeLeft"];
	_display = _this select 0;
	_ctrlRespawn = (_this select 0) displayCtrl 1010;
	_ctrlManual = (_this select 0) displayCtrl 122;
	_ctrlAbort = (_this select 0) displayCtrl 104;
	_ctrlTitle = (_this select 0) displayCtrl 1050;
	uiNamespace setVariable ["life_interruptDisplay",_display];
	_ctrlAbort ctrlSetTooltip "Synchronisation du profil et déconnection";
	_ctrlAbort ctrlSetEventHandler ["ButtonClick", "with missionNamespace do {[] spawn life_fnc_abort;}; (uiNamespace getVariable ""life_interruptDisplay"") closeDisplay 2; true"];
	_ctrlRespawn ctrlEnable false;

	if (!isNil "life_init" && {life_init}) then 
	{
		_ctrlAbort ctrlEnable false;
		_waitTime = diag_tickTime + 10;
		_combatTime = missionNamespace getVariable "life_combat_lastTick";
		if (!isNil "_combatTime") then 
		{
			_combatTime = diag_tickTime - _combatTime;
			if (_combatTime < 20) then 
			{
				_waitTime = _waitTime + (20 - _combatTime);
			};
		};

		while {!isNull _display} do 
		{
			_timeLeft = _waitTime - diag_tickTime;
			if (diag_tickTime < _waitTime) then 
			{
				_ctrlAbort ctrlSetText format ["Déconnecter dans %1",[_timeLeft, "SS.MS"] call BIS_fnc_secondsToString];
			} else {
				_ctrlAbort ctrlSetText localize "STR_DISP_INT_ABORT";
				_ctrlAbort ctrlEnable true;
			};
			_ctrlRespawn ctrlEnable !(player getVariable ["restrained", false] && player getVariable [ "escorting", false] && player getVariable ["transporting", false] || !isNil "life_is_arrested" && {life_is_arrested} || !isNil "life_istazed" && {life_istazed});
			sleep 0.01;
		};
	};
};

true

/*
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
_ctrlAbort ctrlSetEventHandler ["ButtonClick", "[] spawn life_fnc_abort; (uiNamespace getVariable ""life_interruptDisplay"") closeDisplay 2; true"];
_ctrlRespawn ctrlEnable false;
_ctrlManual ctrlEnable false;
_ctrlAbort ctrlEnable false;
_waitTime = time + 10;

while {!isNull _display} do 
{
	if (time < _waitTime) then 
	{
		_ctrlAbort ctrlSetText format ["Déconnecter dans %1",[_waitTime - time,"SS.MS"] call BIS_fnc_secondsToString];
	} else {
		_ctrlAbort ctrlSetText localize "STR_DISP_INT_ABORT";
		_ctrlAbort ctrlEnable true;
	};
	_ctrlRespawn ctrlEnable !(player getVariable ["restrained", false] && player getVariable ["escorting", false] && player getVariable ["transporting", false] || !isNil "life_is_arrested" && {life_is_arrested} || !isNil "life_istazed" && {life_istazed});
	sleep 0.01;
};

true
*/