_price = 0;
_kind = _this select 0;
{
	_curItemName = _x select 0;
	_curItemPrice = _x select 1;
	if (_curItemName == _kind) then {_price = _curItemPrice};
} forEach life_dynMarket_prices;
_price;