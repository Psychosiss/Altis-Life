private["_vehicle","_vehicleInfo","_value"];
_vehicle = cursorTarget;
if(isNull _vehicle) exitWith {};
if(!((_vehicle isKindOf "Air") OR (_vehicle isKindOf "Ship") OR (_vehicle isKindOf "LandVehicle"))) exitWith {};
_vehicleInfo = _vehicle getVariable ["Trunk",[]];
if(count _vehicleInfo == 0) exitWith {hint "Ce vehicule est vide."};

_value = 0;
{
	_var = _x select 0;
	_val = _x select 1;
	_index = [_var,life_illegal_items] call fnc_index;
	if(_index != -1) then
	{
		_vIndex = [_var,sell_array] call fnc_index;
		if(_vIndex != -1) then
		{
			_value = _value + (_val * ((sell_array select _vIndex) select 1));
		};
	};
} foreach (_vehicleInfo select 0);

if(_value > 0) then
{
	[[0,format["Un véhicule a été fouillé et a une valeur de %1 € de drogue.",[_value] call life_fnc_numberText]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	life_atmmoney = life_atmmoney + _value;
	_vehicle setVariable["Trunk",[],true];
} else {
	hint "Aucune drogue dans ce vehicule.";
};