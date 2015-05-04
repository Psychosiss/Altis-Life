private "_method";
if(life_money < 500) then
{
	if(life_atmmoney < 500) exitWith {_method = 0;};
	_method = 2;
} else {
	_method = 1;
};

switch _method do
{
	case 0: {hint "Vous n'avez pas 500 €."};
	case 1: {vehicle player setDamage 0; life_money = life_money - 500; hint "Vous avez réparé votre véhicule pour 500 €";};
	case 2: {vehicle player setDamage 0; life_atmmoney = life_atmmoney - 500; hint "Vous avez réparé votre véhicule pour 500 €";};
};