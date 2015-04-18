private "_unit";

_unit = cursorTarget;
if(!(_unit getVariable ["missingOrgan",FALSE])) then {hint "Cette personne a des reins et n'a pas besoin de chirurgie!"};
if (side player == independent) then {hint "Vous utilisez un scalpel, afin qu'il puisse vivre avec un seul rein!"}; 
sleep 15;
if(player distance (_this select 0) > 5) exitWith {hint "Vous êtes trop loin pour guérir cette personne!"};
if (side player == independent) then {hint "Vous avez réussi une intervention chirurgicale, et obtenez une récompense!"}; 
_unit setVariable["missingOrgan",false,true];
sleep 0.1;
_unit setdamage 0;
_unit setFatigue .5;
life_money = life_money + 15000;  