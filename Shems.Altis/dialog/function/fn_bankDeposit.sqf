private["_value"];
_value = parseNumber(ctrlText 2702);

if(_value > 1000000) exitWith {hint localize "STR_ATM_GreaterThan";};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint localize "STR_AIM_notnumeric"};
if(_value > life_cash) exitWith {hint "Vous n'avez pas cette somme sur vous."};

life_cash = life_cash - _value;
life_atmcash = life_atmcash + _value;

hint format["Vous avez déposé %1 € sur votre compte bancaire",[_value] call life_fnc_numberText];
playSound "atm";
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;