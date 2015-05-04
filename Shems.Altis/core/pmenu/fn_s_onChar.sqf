private["_control","_code","_slider","_value","_varName","_onKeyUp"];
_control = _this select 0;
_code = _this select 1;
_slider = _this select 2;
_onKeyUp = _this select 3;

disableSerialization;
if(isNull _control) exitWith {};

if(_onKeyUp) then 
{
	_value = parseNumber(ctrlText _control);
	_varName = switch _slider do 	
	{
		case "ground": {"life_vdFoot"};
		case "vehicle": {"life_vdCar"};
		case "air": {"life_vdAir"};
		default {"life_vdFoot"};
	};

	missionNamespace setVariable [_varName,_value];
	[] call life_fnc_settingsMenu;
	[] call life_fnc_updateViewDistance;
};