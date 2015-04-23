private "_unit";
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit OR !isPlayer _unit) exitWith {};

_nearestVehicle = nearestObjects[getPosATL player,["Car","Ship","Submarine","Air"],10] select 0;
if(isNil "_nearestVehicle") exitWith {hint "Il n'y a pas de véhicule à coté de vous.."};

detach _unit;
[[_nearestVehicle],"life_fnc_moveIn",_unit,false] spawn life_fnc_MP;
_unit setVariable["Escorting",false,true];
_unit setVariable["transporting",true,true];