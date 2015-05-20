private["_value","_action"];
if((call life_adminlevel) < 1) exitWith {closeDialog 0; hint "Votre niveau admin n'est pas suffisamment élevée.";};
_value = parseNumber(ctrlText 9922);
if(_value < 0) exitWith {};
if(_value > 10000000) exitWith {hint "Vous ne pouvez pas aller au-dessus 1.000.000 €."};

_action = 
[
	format ["Vous êtes sur le point de vous donner %1 €",[_value] call life_fnc_numberText],
	"Compensation",
	"Oui",
	"Non"
] call BIS_fnc_guiMessage;

if(_action) then 
{
	life_money = life_money + _value;
	hint format ["Vous avez ajouté %1 € à votre compte.",[_value] call life_fnc_numberText];
	closeDialog 0;
} else {
	hint "Action annulé";
	closeDialog 0;
};