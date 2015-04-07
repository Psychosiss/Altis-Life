private["_val"];
_val = parseNumber(ctrlText 2702);
if(_val > 1000000) exitWith {hint "Vous ne pouvez pas retirer plus de 1.000.000 €";};
if(_val < 0) exitwith {};
if(!([str(_val)] call life_fnc_isNumeric)) exitWith {hint "Ce n'est pas dans un format de nombre réel."};
if(_val > life_atmcash) exitWith {hint "Vous n'avez pas autant dans votre compte en banque!"};
if(_val < 100 && life_atmcash > 20000000) exitWith {hint "Vous ne pouvez pas retirer moins de 100 €."};

life_cash = life_cash + _val;
life_atmcash = life_atmcash - _val;
hint format ["Vous avez retiré %1 € de votre compte bancaire",[_val] call life_fnc_numberText];
playSound "atm";
[] call life_fnc_atmMenu;
[6] call SOCK_fnc_updatePartial;