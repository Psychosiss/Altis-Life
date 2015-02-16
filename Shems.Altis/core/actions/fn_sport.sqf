_price = 5000;

if(life_cash < _price) exitWith {hint "Vous n'avez pas assez d'argent!";};
if(life_hunger < 50) exitWith {hint "Vous devriez manger quelque chose avant de commencer à faire du sport!";};
if(life_thirst < 50) exitWith {hint "Vous devriez boire quelque chose avant de commencer à faire du sport!";};

life_cash = life_cash - _price;
life_thirst = life_thirst - 30;
life_hunger = life_hunger - 30;
[] call life_fnc_hudUpdate;
player setFatigue 0;

[] spawn
{
	life_redgull_effect = time;
	titleCut ["","BLACK FADED",999];
	titleText["Entrainement...","PLAIN"];
	sleep 3;
	titleCut ["","BLACK IN",3];
	titleText["Apres le sport vous etes en pleine forme, mais vous devez boire et manger.","PLAIN"];
	player enableFatigue false;
	waitUntil {!alive player OR ((time - life_redgull_effect) > (20 * 60))};
	player enableFatigue true;
};