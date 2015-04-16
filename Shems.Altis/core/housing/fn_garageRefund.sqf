#include <macro.h>

_price = _this select 0;
_unit = _this select 1;
if(_unit != player) exitWith {};
life_atmmoney = life_atmmoney + _price