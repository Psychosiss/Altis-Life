private "_val";
if(isNil {life_ticket_unit}) exitWith {hint "La personne n'existe pas"};
if(isNull life_ticket_unit) exitWith {hint "La personne n'existe pas."};
_val = ctrlText 2652;
if(!([_val] call fnc_isnumber)) exitWith {hint "Vous devez entrer des nombres."};
if((parseNumber _val) > 1000000) exitWith {hint "Vous ne pouvez pas mettre une amende de plus de 1 000 000 €."};
[[0,format["%1 à mis une amende de %2 € à %3",profileName,[(parseNumber _val)] call life_fnc_numberText,life_ticket_unit getVariable["realname",name life_ticket_unit]]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
[[player,(parseNumber _val)],"life_fnc_ticketPrompt",life_ticket_unit,false] spawn life_fnc_MP;
closeDialog 0;