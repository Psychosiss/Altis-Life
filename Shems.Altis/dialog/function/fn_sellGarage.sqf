#include <macro.h>

private["_vehicle","_vid","_pid","_unit","_price"];
disableSerialization;
if(lbCurSel 2802 == -1) exitWith {hint "Vous n'avez rien sélectionné."};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;
_unit = player;
if (life_action_inUse) exitWith {};

if(isNil "_vehicle") exitWith {hint "La séléction a une erreur..."};
life_action_inUse = true;
_price = [_vehicle,__GETC__(life_garage_sell)] call fnc_index;
if(_price == -1) then {_price = 1000;} else {_price = (__GETC__(life_garage_sell) select _price) select 1;};

[[_vid,_pid,_price,player,life_garage_type],"TON_fnc_vehicleDelete",false,false] spawn life_fnc_MP;
[[1,format["Vous avez vendu votre véhicule pour %1 €",_price]],"life_fnc_broadcast",player,false] spawn life_fnc_MP;
life_atmcash = life_atmcash + _price;

life_action_inUse = false;

closeDialog 0;