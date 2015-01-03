if("ItemRadio" in assignedItems player) then
{
	createDialog "Life_my_smartphone";
	} else {
		hint parseText format ["<t size='1.0' font='puristaMedium' align='center' color='#FFFFFF'>Vous n'avez pas de téléphone</t><br/><br/>"
	];
};