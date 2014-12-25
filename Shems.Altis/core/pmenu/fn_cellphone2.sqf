if("ItemRadio" in assignedItems player) then
{
	createDialog "Life_my_smartphone";
	}else{
		hint parseText format ["<t size='1.0' font='puristaMedium' align='center' color='#FFFFFF'>Vous n'avez pas de téléphone</t><br/><br/>
		<t size='0.90 'font='puristaLight' align='left'>You must have have a cellphone (Radio) for use this. You can buy cellphone in a store</t><br/>"
	];
};