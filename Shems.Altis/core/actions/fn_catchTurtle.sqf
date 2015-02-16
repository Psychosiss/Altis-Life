private["_obj"];
_obj = cursorTarget;
if(isNull _obj) exitWith {};
if(alive _obj) exitWith {};

if(([true,"turtle",1] call life_fnc_handleInv)) then
{
	deleteVehicle _obj;
	titleText["Vous avez ramassé de la viande de tortue","PLAIN"];
};