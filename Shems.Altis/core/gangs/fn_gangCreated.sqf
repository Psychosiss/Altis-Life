private "_group";
life_action_gangInUse = nil;

if(life_atmmoney < ((call life_gangPrice))) exitWith 
{
	hint format["Vous n'avez pas assez d'argent en banque.\n\nIl vous manque: %1 €",[(((call life_gangPrice)) - life_atmmoney)] call life_fnc_numberText];
	{(group player) setVariable[_x,nil,true];} foreach ["gang_id","gang_owner","gang_name","gang_members","gang_maxmembers","gang_bank"];
};

life_atmmoney = life_atmmoney - ((call life_gangPrice));

hint format["Vous avez créé le gang %1 pour %2 €",(group player) getVariable "gang_name",[((call life_gangPrice))] call life_fnc_numberText];