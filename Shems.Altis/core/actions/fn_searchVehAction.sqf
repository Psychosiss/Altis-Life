private["_vehicle","_data"];
_vehicle = cursorTarget;
if((_vehicle isKindOf "Car") || !(_vehicle isKindOf "Air") || !(_vehicle isKindOf "Ship")) then
{
	_owners = _vehicle getVariable "vehicle_info_owners";
	if(isNil {_owners}) exitWith {hint "Ce véhicule n'as aucune informations, il provient probablement d'un cheateur. \n\nSuppression du véhicule."; deleteVehicle _vehicle;};
	life_action_inUse = true;
	hint "Recherche des informations...";
	sleep 3;
	life_action_inUse = false;
	if(player distance _vehicle > 10 || !alive player || !alive _vehicle) exitWith {hint "Couldn't search the vehicle";};
	_owners = [_owners] call life_fnc_vehicleOwners;

	if(_owners == "any<br/>") then
	{
		_owners = "Aucun propriétaire<br/>";
	};
	hint parseText format["<t color='#FF0000'><t size='2'>Infos du vehicule</t></t><br/><t color='#FFD700'><t size='1.5'>Propriétaire</t></t><br/> %1",_owners];
};