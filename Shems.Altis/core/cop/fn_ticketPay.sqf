if(isnil {life_ticket_val} OR isNil {life_ticket_cop}) exitWith {};
if(life_money < life_ticket_val) exitWith
{
	if(life_atmmoney < life_ticket_val) exitWith 
	{
		hint "You don't have enough money in your bank account or on you to pay the ticket.";
		[[1,format["%1 couldn't pay the ticket due to not having enough money.",profileName]],"life_fnc_broadcast",life_ticket_cop,false] spawn life_fnc_MP;
		closeDialog 0;
	};
	hint format["Vous avez payé l'amende de %1 €",[life_ticket_val] call life_fnc_numberText];
	life_atmmoney = life_atmmoney - life_ticket_val;
	life_ticket_paid = true;
	[[0,format["%1 a payé une amende d'un montant de  %2 €,profileName,[life_ticket_val] call life_fnc_numberText]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
	[[1,format["%1 payé l'amende.",profileName]],"life_fnc_broadcast",life_ticket_cop,false] spawn life_fnc_MP;
	[[life_ticket_val,player,life_ticket_cop],"life_fnc_ticketPaid",life_ticket_cop,false] spawn life_fnc_MP;
	[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
	closeDialog 0;
};

life_money = life_money - life_ticket_val;
life_ticket_paid = true;

[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
[[0,format["%1 paye l'amende de %2 €",profileName,[life_ticket_val] call life_fnc_numberText]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
closeDialog 0;
[[1,format["%1 paye l'amende.",profileName]],"life_fnc_broadcast",life_ticket_cop,false] spawn life_fnc_MP;
[[life_ticket_val,player,life_ticket_cop],"life_fnc_ticketPaid",life_ticket_cop,false] spawn life_fnc_MP;