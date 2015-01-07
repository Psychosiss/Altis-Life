private["_container","_unit"];
if(count _this == 1) exitWith {false};
_unit = _this select 0;
_container = _this select 1;

if((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) exitWith 
{
	_house = nearestBuilding (getPosATL player);
	if(!(_house in life_vehicles) && {(_house getVariable ["locked",false])}) then 
	{
		hint "Vous n'êtes pas autorisé à accéder à ce stockage.";
		[] spawn 
		{
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
		};
	};
};

if(_container isKindOf "LandVehicle" OR _container isKindOf "Ship" OR _container isKindOf "Air") exitWith 
{
	if(!(_container in life_vehicles) && {(locked _container) == 2}) exitWith 
	{
		hint "Tu ne peux pas ouvrir l'inventaire si il est fermé.";
		[] spawn 
		{
			waitUntil {!isNull (findDisplay 602)};
			closeDialog 0;
		};
	};
};