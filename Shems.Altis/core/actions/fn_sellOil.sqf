#include <macro.h>

private["_index","_price","_val"];
_index = ["oilp",sell_array] call fnc_index;
_price = (sell_array select _index) select 1;
_val = life_inv_oilp;
_price = _price * _val;

if(([false,"oilp",_val] call life_fnc_handleInv)) then
{
	titleText[format["Vous avez vendu %1 baril(s) de pétrole pour %2 €",_val,[_price] call life_fnc_numberText],"PLAIN"];
	life_money = life_money + _price;
};