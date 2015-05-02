private "_message";
if((call life_adminlevel) < 2) exitWith {closeDialog 0;};
_message = "Ceci n'est pas un test. Ceci est votre système de diffusion d'urgence annonçant le début de la purge annuelle sanctionnée par le gouvernement d'Altis. Si vous n'y participez pas, quittez la ville, et courez vers le périphérique ou restez dans une piece isolée dans votre maison. Tout les services d'urgence doivent terminer leur travail et rentrer à la maison.";
[[_message,name player,6],"clientMessage",true,false] spawn life_fnc_MP;

[[purge_kavala,"purge",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
[[purge_pyrgos,"purge",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
[[purge_neochori,"purge",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;
[[purge_badtown,"purge",5000],"life_fnc_playSound",true,false] spawn life_fnc_MP;

sleep 70;

_message = "La purge commence MAINTENENT! Vous serez informés lors de la fin de la purge. Combattre ou se cacher, c'est votre choix.<br/><br/>Laissez le meurtre...<br/><br/><t size='2.5'><t color='#FF1500'>PRENDRE PLACE!!</t></t>";
[[_message,name player,6],"clientMessage",civilian,false] spawn life_fnc_MP;
sleep 900;

_message = "Il reste 15 minutes de purge";
[[_message,name player,6],"clientMessage",civilian,false] spawn life_fnc_MP;

sleep 900;

_message = "La purge se fini dans 5 minutes";
[[_message,name player,6],"clientMessage",civilian,false] spawn life_fnc_MP;

sleep 300;
_message = "La purge est définitivement fini. Merci de votre compréhension. Tout les services d'urgence seront désormais actif et tout les crimes illégaux.<br/><br/><t size='2.5'><t color='#FF1500'>Le règlement est de nouveau actif.</t></t>";
[[_message,name player,6],"clientMessage",civilian,false] spawn life_fnc_MP;