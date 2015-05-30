private ["_vehicle","_capacity","_litres","_cost","_level","_tick","_delay"];

if (vehicle player != player) exitWith {hint "Votre bras est pas assez long pour faire fonctionner la pompe à partir de l'intérieur du véhicule."};
_vehicle = nearestObjects [(_this select 0),["Air","Car","Ship","Armored"],25];
if (count _vehicle == 0) exitWith {hint "Aucun vehicule à moins de 25 metres.";};
_vehicle = _vehicle select 0;
if (isEngineOn _vehicle) exitWith  {hint "Eteignez votre véhicule pour faire le plein!"};

_capacity = getNumber(configFile >> "CfgVehicles" >> typeOf _vehicle >> "fuelCapacity");
_litres = 0;
_cost = 0;
_level = fuel _vehicle;
_tax = (life_configuration select 7) / 100;
_delay = 0.5;
if (_vehicle isKindOf "Air") then {_delay = _delay / 3;};

while {_level < 1} do
{
	sleep _delay;
	if (speed player > 1) exitWith {};
	if (player distance (_this select 0) > 5) exitWith {};
	_litres = _litres + 1;
	_cost = _cost + (6 * (1 + ((life_configuration select 7) / 100)));
	if (life_atmmoney < _cost) exitWith {};
	_tick = 1 / _capacity;
	_level = _level + _tick;
	if (_level > 1) then { _level = 1; };
	hintSilent parseText format["<t color='#cec25b'>Litres:</t> %1<br/><t color='#cec25b'>Tax:</t> %5%4<br/><t color='#cec25b'>Cout:</t> %2 €<br/><t color='#cec25b'>Rempli:</t> %3%4", _litres, [_cost] call life_fnc_numberText, floor (_level * 100), "%", (life_configuration select 7)];
};

hintSilent parseText format["<t color='#cec25b'>Litres:</t> %1<br/><t color='#cec25b'>Tax:</t> %5%4<br/><t color='#cec25b'>Cost:</t> %2 €<br/><t color='#cec25b'>Rempli:</t> %3%4<br/><br/><t color='#00FF00'>Remplissage fini</t>", _litres, [_cost] call life_fnc_numberText, floor (_level * 100), "%", (life_configuration select 7)];

if(!local _vehicle) then
{
	[[[_vehicle,_level],{_this select 0 setFuel (_this select 1);}],"BIS_fnc_spawn",_vehicle,false] spawn BIS_fnc_MP;
} else {
	_vehicle setFuel _level;
};

life_atmmoney = life_atmmoney - _cost;