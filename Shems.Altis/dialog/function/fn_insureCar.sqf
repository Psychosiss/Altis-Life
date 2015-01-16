#include <macro.h>

private["_vehicle","_vid","_pid","_unit","_price"];
disableSerialization;
if(lbCurSel 2802 == -1) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;
_unit = player;

if(isNil "_vehicle") exitWith {hint "Il y a une erreur dans la sélection..."};

_price = [_vehicle,__GETC__(life_insure_prices)] call fnc_index;

if(_price == -1) then 
{
	_price = 10000;
} else {
	_price = (__GETC__(life_insure_prices) select _price) select 1;
};
if(life_atmcash < _price) exitWith 
{
	hint format[(localize "STR_Garage_CashError"),[_price] call life_fnc_numberText];
};

[[_vid,_pid,_unit,_price],"TON_fnc_insureCar",false,false] spawn life_fnc_MP;

hint "Votre véhicule est désormais assuré";

life_atmcash = life_atmcash - _price;
closeDialog 0;