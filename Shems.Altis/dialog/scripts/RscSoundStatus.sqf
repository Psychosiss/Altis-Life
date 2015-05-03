private ["_mode","_params"];
_mode = _this select 0;
_params = _this select 1;

switch _mode do 
{
	case "onLoad": 
	{
		_display = _params select 0;
		_ctrlPictureStatus = _display displayCtrl 23000;
		_ctrlPictureStatus ctrlShow (soundVolume == 0.2);
		life_RscSoundStatus_refreshHandle = [_display] spawn 
		{
			disableSerialization;
			_display = _this select 0;
			waitUntil {isNull _display};
			["life_RscSoundStatus"] call life_fnc_createRscLayer;
		};
	};

	case "onUnload": {};
	case "onToggleSound": 
	{
		_display = uiNamespace getVariable ["life_RscSoundStatus_display", displayNull];
		_ctrlPictureStatus = _display displayCtrl 23000;
		_muted = _params select 0;
		_ctrlPictureStatus ctrlShow _muted;
	};
};