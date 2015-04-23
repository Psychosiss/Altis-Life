private "_unit";
_unit = _this select 1;
if(life_bail_paid) exitWith {};
if(isNil {life_bail_amount}) then {life_bail_amount = 3500;};
if(!isNil "life_canpay_bail") exitWith {hint "Vous devez faire 3 minutes de prison pour ensuite payer la caution."};
if(life_atmmoney < life_bail_amount) exitWith {hint format["Vous n'avez pas %1 € pour payer l'amende.",life_bail_amount];};

life_atmmoney = life_atmmoney - life_bail_amount;
life_bail_paid = true;
[[0,format["%1 est mis sous caution!", _unit getVariable ["realname",name _unit]]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;