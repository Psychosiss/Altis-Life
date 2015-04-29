private "_value";
_value = parseNumber(ctrlText 2702);

if(_value > 1000000) exitWith {hint "Vous ne pouvez pas déposer plus de 1.000.000 € à la fois.";};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isNumeric)) exitWith {hint "La quantité saisie n'est pas une valeur numérique."};
if(_value > life_atmmoney) exitWith {hint "Vous n'avez pas assez dans votre compte bancaire."};

life_atmmoney = life_atmmoney - _value;
_gFund = group player getVariable ["gang_bank",0];
_gFund = _gFund + _value;
group player setVariable ["gang_bank",_gFund,true];

hint format["Vous avez déposé %1 € dans le compte bancaire de la banque.",[_value] call life_fnc_numberText];
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;
[[1,group player],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;