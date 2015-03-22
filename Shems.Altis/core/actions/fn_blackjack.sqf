_store = blackjack;
_denied1 = false;
_price = 2500;

if(life_cash < _price) exitWith {hint "Vous n'avez pas assez d'argent. Avec moi, un tour coûte 2500 €";};
life_cash = life_cash - _price;
removeAllActions blackjack;
hint "Vous êtes dans le train!";
_number = ceil(random 10);
_pplayer = _this select 0;
if (_number == 0) then {robberyreward = 5000; hint "19! Propre, après tout, gagné!";};
if (_number == 1) then {robberyreward = 0; hint "18! Malheureusement perdu!";};
if (_number == 2) then {robberyreward = 0; hint "8! Échec ...";};						
if (_number == 3) then {robberyreward = 0; hint "14! C'est mieux mais ...";};
if (_number == 4) then {robberyreward = 0; hint "16! Rapide! Allez, encore un tour ..!";};
if (_number == 5) then {robberyreward = 0; hint "12! Incroyablement, ma grand-mère joue mieux que vous!";};
if (_number == 6) then {robberyreward = 0; hint "13! Encore perdu .. Vraiment mauvais ..!";};
if (_number == 7) then {robberyreward = 7500; hint "20! Parfait! Tu as gagné!";};
if (_number == 8) then {robberyreward = 0; hint "10! Avec ça tu ne gagnes rien du tout ...!";};
if (_number == 9) then {robberyreward = 0; hint "11! L comme Loooooser!";};
if (_number == 10) then {robberyreward = 10000; hint "21!!! Jackpot!!";};
life_action_inUse = true;
sleep 2;
_robberycash = robberyreward;
_timer = time + (1 * 5);	
_toFar = false;
_vault = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

while {true} do
{
	_countDown = if(round(_timer - time) > 60) then {format["%1 minute(s)",round(round(_timer - time) / 60)]} else {format["%1 second(s)",round(_timer - time)]};
	hintSilent format["Vous devez rester à la table et attendre votre tour\n\nTemps restant: \n%1\n\nDistance:% 2m!",_countDown,round(player distance _vault)];
	if(player distance _vault > 5) exitWith {_toFar = true;};
	if((round(_timer - time)) < 1) exitWith {};
	if(!alive player) exitWith {};
	if(life_istazed) exitWith {hint "Vous étiez tazé, jeu pas!";};
};

switch(true) do
{
	case (_toFar):
	{
		hint "Vous êtes trop loin, rester à la table.";
		_denied1 = false;
		life_action_inUse = false;
	};

	case (!alive player):
	{
		hint "Le jeu a mal tourné, car tu es mort.";
		_denied1 = false;
		life_action_inUse = false;
	};

	case (life_istazed):
	{
		hint "Vous étiez tazé, jeu a échoué!";
		_denied1 = false;
		life_action_inUse = false;
	};

	case ((round(_timer - time)) < 1):
	{
		hint format["Vous avez gagné %1 €.", _robberycash];
		life_cash = life_cash + _robberycash;
		_denied1 = false;
		life_action_inUse = false;
	};	
};

sleep 10;
blackjack addAction["Partie de blackjack (2500 €)",life_fnc_blackjack,"blackjack"];
life_action_inUse = false;