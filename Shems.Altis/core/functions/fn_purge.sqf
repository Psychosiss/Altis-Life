private "_message";
if((call life_adminlevel) < 2) exitWith {closeDialog 0;};
_message = "Ceci n'est pas un test. Ceci est votre syst�me de diffusion d'urgence annon�ant le d�but de la purge annuelle sanctionn�e par le gouvernement d'Altis. Si vous n'y participez pas, quittez la ville, et courez vers le p�riph�rique ou restez dans une piece isol�e dans votre maison. Tout les services d'urgence doivent terminer leur travail et rentrer � la maison.";
[[_message,name player,6],"clientMessage",true,false] spawn life_fnc_MP;

[[purge_kavala,"purge",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
[[purge_pyrgos,"purge",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
[[purge_neochori,"purge",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
[[purge_badtown,"purge",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;

sleep 70;

_message = "La purge commence MAINTENENT! Vous serez inform�s lors de la fin de la purge. Combattre ou se cacher, c'est votre choix.<br/><br/>Laissez le meurtre...<br/><br/><t size='2.5'><t color='#FF1500'>PRENDRE PLACE!!</t></t>";
[[_message,name player,6],"clientMessage",civilian,false] spawn life_fnc_MP;
sleep 900;

_message = "Il reste 15 minutes de purge";
[[_message,name player,6],"clientMessage",civilian,false] spawn life_fnc_MP;

sleep 900;

_message = "La purge se fini dans 5 minutes";
[[_message,name player,6],"clientMessage",civilian,false] spawn life_fnc_MP;

sleep 300;
_message = "La purge est d�finitivement fini. Merci de votre compr�hension. Tout les services d'urgence seront d�sormais actif et tout les crimes ill�gaux.<br/><br/><t size='2.5'><t color='#FF1500'>Le r�glement est de nouveau actif.</t></t>";
[[_message,name player,6],"clientMessage",civilian,false] spawn life_fnc_MP;