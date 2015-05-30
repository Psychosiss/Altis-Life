private["_vehicle","_displayName","_capacity"];
_vehicle = cursorTarget;
if(isNull _vehicle) exitWith {hint "Regardez ou vous visez, regardez votre véhicule !"};
if(!(_vehicle isKindOF "LandVehicle") && !(_vehicle isKindOf "Air") && !(_vehicle isKindOf "Ship")) exitWith {};
if(player distance _vehicle > 7.5) exitWith {hint "Vous ête trop loin!"};
if(!([false,"fuelF",1] call life_fnc_handleInv)) exitWith {};
_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
_capacity = getNumber(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "fuelCapacity");
titleText[format["Rechargement d'essence %1.....",_displayName],"PLAIN"];
player playMove "AinvPknlMstpSlayWrflDnon_medic";
sleep 5;

_tick = 20 / _capacity;
_level = (fuel _vehicle) + _tick;
if (_level > 1) then { _level = 1; };

if(!local _vehicle) then
{
	[[[_vehicle,_level],{_this select 0 setFuel (_this select 1);}],"BIS_fnc_spawn",_vehicle,false] spawn BIS_fnc_MP;
} else {
	_vehicle setFuel _level;
};
	
titleText[format["Vous avez remis 20 litres d'essence à votre %1.",_displayName],"PLAIN"];
[true,"fuelE",1] call life_fnc_handleInv;