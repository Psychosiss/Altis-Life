#include <macro.h>

private["_value"];
_value = parseNumber(ctrlText 2702);

if(_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint localize "STR_AIM_notnumeric"};
if(_value > life_atmcash) exitWith {hint "Vous n'avez pas assez dans votre compte bancaire."};

__SUB__(life_atmcash,_value);
_gFund = grpPlayer getVariable ["gang_bank",0];
_gFund = _gFund + _value;
grpPlayer setVariable ["gang_bank",_gFund,true];

hint format["Vous avez déposé $%1 dans le compte bancaire de la banque.",[_value] call life_fnc_numberText];
[] call life_fnc_atmMenu;
[] call SOCK_fnc_updateRequest;
[[1,grpPlayer],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;