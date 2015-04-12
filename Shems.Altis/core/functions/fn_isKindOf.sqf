private ["_object","_type","_return"];
_object = [_this,0,objNull,[objNull,""]] call BIS_fnc_param;
_type = [_this,1,"",["",[]]] call BIS_fnc_param;
_return = false;

if (typeName _type == typeName "") then 
{
	_type = [_type];
};

{
	if (_object isKindOf _x) exitWith {_return = true};
} forEach _type;

_return