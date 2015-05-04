if (typeName _this != typeName []) then {_this = [_this]};

private "_name";
_name = [_this,0,"",[""]] call BIS_fnc_param;

switch (count _this) do 
{
	case 1: 
	{
		call ( missionNamespace getVariable _name );
	};

	case 2: 
	{
		_value = _this select 1;
		_value = str _value;
		missionNamespace setVariable [_name, compileFinal _value];
	};
	default {[ "Nombre de parametre invalide - %1", _this] call BIS_fnc_error;};
};