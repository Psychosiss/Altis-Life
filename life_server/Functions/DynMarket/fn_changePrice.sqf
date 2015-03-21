_itemName = _this select 0;
_itemPrice = _this select 1;

_index = -1;
{
	_index = _index + 1;
	_curItemName = _x select 0;
	_curItemPrice = _x select 1;
	_curItemAmountSold = _x select 2;
	if (_curItemName==_itemName) then 
	{
		life_dynMarket_Items_CurrentPriceArr set [_index,[_curItemName,_itemPrice,_curItemAmountSold]];
	};
} forEach life_dynMarket_Items_CurrentPriceArr;