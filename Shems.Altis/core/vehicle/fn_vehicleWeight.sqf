private["_vehicle","_weight","_used"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {};

_weight = -1;
_used = (_vehicle getVariable "Trunk") select 1;
_weight = [(typeOf _vehicle)] call life_fnc_vehicleWeightCfg;

switch (typeOf _vehicle) do
{
	case "Land_TentA_F": {_weight = 400;};
	case "Land_TentDome_F": {_weight = 600;};
};
{
	if (typeOf _vehicle == _x select 1) then
	{
		_weight = _x select 3;
	};
} foreach life_vehicleInfo;

if(isNil "_used") then {_used = 0};
[_weight,_used];