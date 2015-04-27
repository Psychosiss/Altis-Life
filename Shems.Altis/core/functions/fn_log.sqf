private ["_log","_type"];
_log = [_this,0,"",["",[]]] call BIS_fnc_param;
_type = [_this,1,0,[0]] call BIS_fnc_param;

if (typeName _log == typeName []) then 
{
	_log = format _log;
};

_type = switch _type do 
{
	case 1: {"Attention"};
	case 2: {"Erreur"};
	default {"Information"};
};

diag_log text format ["[ %1 ] [ %2 ] [ %3 ] %4", toUpper _type, _fnc_scriptNameParent, diag_frameno, _log];