#include <macro.h>

if(__GETC__(life_adminlevel) < 3) exitWith {closeDialog 0; hint "Votre niveau admin n'est pas suffisamment élevée.";};

[] spawn 
{
	while {dialog} do 
	{
		closeDialog 0;
		sleep 0.01;
	};
};
 
if(life_god) then 
{
	life_god = false;
	titleText ["God mode désactivé.","PLAIN"]; titleFadeOut 2;
	player allowDamage true;
} else {
	life_god = true;
	titleText ["God mode activé.","PLAIN"]; titleFadeOut 2;
	player allowDamage false;
}; 