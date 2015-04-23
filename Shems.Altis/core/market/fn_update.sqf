_mode = _this select 0;
_itemArray = [_this,1,[]] call BIS_fnc_param;
_txt1 = life_dynMarket_UserNotification_Text select 0;
_txt2 = life_dynMarket_UserNotification_Text select 1;
if (isNil "life_dynMarket_boughtItems") then {life_dynMarket_boughtItems = [];};

switch (_mode) do 
{
	case 0:
	{
		[[life_dynMarket_boughtItems],"TON_fnc_getUpdate",false,false] spawn life_fnc_MP;
		if (life_dynMarket_UserNotification) then {hint _txt2;};
		life_dynMarket_boughtItems = [];
	};

	case 1:
	{
		_needToUpdate = false;
		if (!isNil "life_dynMarket_prices") then 
		{
			life_dynMarket_pricesOld = life_dynMarket_prices;
		} else {
			_needToUpdate = true;
		};
		sell_array = _itemArray;
		life_dynMarket_prices = _itemArray;
		if (life_dynMarket_UserNotification) then {hint _txt1;};
		if (_needToUpdate) then {life_dynMarket_pricesOld = life_dynMarket_prices;};
	};
};