private["_price","_success"];
if((lbCurSel 3101) == -1) exitWith {titleText["Vous n'avez pas choisi les vêtements que vous vouliez acheter.","PLAIN"];};
_success = false;

_price = 0;
{
	if(_x != -1) then
	{
		_price = _price + _x;
	};
} foreach life_clothing_purchase;

if (life_money >= _price) then 
{
	life_money = life_money - _price;
	systemChat format ["Vous avez payé %1 € depuis l'argent que vous avez sur vous.",[_price] call life_fnc_numberText];
	life_clothesPurchased = true;
	_success = true;
} else {
	if (life_inv_debitcard > 0) then 
	{
		if (life_atmmoney < _price) then {hint format ["Vous n'avez pas %1 € dans votre compte banquaire pour la transaction.", [_price] call life_fnc_numberText]
		} else {
			life_atmmoney = life_atmmoney - _price;
			systemChat format ["Vous avez payé %1 € depuis votre banque en utilisant la carte de débit.", [_price] call life_fnc_numberText];
			life_clothesPurchased = true;
			_success = true;
		};
	} else {
		hint format ["Vous n'avez pas %1 € d'argent sur vous ni de carte de débit.", [_price] call life_fnc_numberText]
    };
};
_success;