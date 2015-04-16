#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])

private["_ctrl","_num","_totalWeight","_itemWeight","_veh_data","_inv","_index","_val","_Truck","_FuelTrucks","_FuelStuff"];
disableSerialization;

_ctrl = ctrlSelData(3503);
_num = ctrlText 3506;
if(!([_num] call fnc_isnumber)) exitWith {hint "Entrez un nombre.";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint "You can't enter anything below 1!";};

if(life_trunk_vehicle isKindOf "House_F") then 
{
	_mWeight = 0;
	{
		_mWeight = _mWeight + ([(typeOf _x)] call life_fnc_vehicleWeightCfg);
	} foreach (life_trunk_vehicle getVariable["containers",[]]);
	_totalWeight = [_mWeight,(life_trunk_vehicle getVariable["Trunk",[[],0]]) select 1];
} else {
	_totalWeight = [life_trunk_vehicle] call life_fnc_vehicleWeight;
};
_itemWeight = ([_ctrl] call life_fnc_itemWeight) * _num;
_veh_data = life_trunk_vehicle getVariable ["Trunk",[[],0]];
_inv = _veh_data select 0;

if(_ctrl == "goldbar" && {!(life_trunk_vehicle isKindOf "LandVehicle" OR life_trunk_vehicle isKindOf "House_F")}) exitWith {hint "You cannot store that in anything but a land vehicle!"};
if(_ctrl == "uranium1" && {!(life_trunk_vehicle isKindOf "LandVehicle" OR life_trunk_vehicle isKindOf "House_F")}) exitWith {hint "Tu ne peux pas transporter les déchets d'Uranium en hélicoptère!"};

_Truck = TypeOf life_trunk_vehicle;
_FuelStuff = ["oilu","oilp"];
_FuelTrucks = ["C_Van_01_fuel_F","B_Truck_01_fuel_F"];

switch (true) do
{
	case ((_ctrl in _FuelStuff) && (_Truck in _FuelTrucks)): {life_trunk_reserved_ressources = 1};
	case (!(_ctrl in _FuelStuff) && !(_Truck in _FuelTrucks)): {life_trunk_reserved_ressources = 2};
	case (!(_ctrl in _FuelStuff) && (_Truck in _FuelTrucks)): {life_trunk_reserved_ressources = 3};
	case ((_ctrl in _FuelStuff) && !(_Truck in _FuelTrucks)): {life_trunk_reserved_ressources = 4};
};

if (life_trunk_reserved_ressources == 3) exitWith {hint "Vous ne pouvez pas stocker cet objet dans ce véhicule"};
if (life_trunk_reserved_ressources == 4) exitWith {hint "Ce véhicule ne permet pas de transporter cet objet"};

if(_ctrl == "money") then
{
	_index = [_ctrl,_inv] call fnc_index;
	if(life_money < _num) exitWith {hint "You don't have that much cash on you to store in the vehicle!"};
	if(_index == -1) then
	{
		__inv pushBack [_ctrl,_num];
	} else {
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};
	
	life_money = life_money - _num;
	life_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[life_trunk_vehicle] call life_fnc_vehInventory;
} else {
	if(((_totalWeight select 1) + _itemWeight) > (_totalWeight select 0)) exitWith {hint "The vehicle is either full or cannot hold that much."};
	if(!([false,_ctrl,_num] call life_fnc_handleInv)) exitWith {hint "Couldn't remove the items from your inventory to put in the vehicle.";};
	_index = [_ctrl,_inv] call fnc_index;
	if(_index == -1) then
	{
		_inv pushBack [_ctrl,_num];
	} else {
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};
	life_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[life_trunk_vehicle] call life_fnc_vehInventory;
};