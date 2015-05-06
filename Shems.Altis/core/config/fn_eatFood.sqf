private["_food","_val","_sum"];
_food = [_this,0,"",[""]] call BIS_fnc_param;
if(_food == "") exitWith {};

if([false,_food,1] call life_fnc_handleInv) then 
{
	switch _food do
	{
		case "apple": {_val = 10};
		case "salema": {_val = 30};
		case "ornate": {_val = 25};
		case "mackerel": {_val = 30};
		case "tuna": {_val = 100};
		case "mullet": {_val = 80};
		case "catshark": {_val = 100};
		case "turtle": {_val = 100};
		case "turtlesoup": {_val = 100};
		case "donuts": {_val = 30};
		case "burgers": {_val = 35};
		case "tbacon": {_val = 40};
		case "peach": {_val = 10};
		case "frites": {_val = 35};
		case "pizza": {_val = 70};
		case "chickenp": {_val = 20};
		case "rabbitp":{ _val = 20};
		case "dogp": {_val = 30};
		case "kfc_popcorn": {_val = 20};
		case "kfc_wings": {_val = 50};
		case "kfc_bucket": {_val = 100};
	};

	_sum = life_hunger + _val;
	if(_sum > 100) then 
	{
		_sum = 100; 
		player setFatigue 1; 
		hint "Vous avez trop mangé ! Vous vous sentez maintenant balonné.";
	};
	life_hunger = _sum;
};