life_dynMarket_chance = 20;
life_dynMarket_Events =
[
	["An Oiltanker has sunken! The price went drasticaly down!",["oilp"],-1], // -1 MEANS CHANGE PRICE TO MAX, -2 TO MIN, OR A VALUE TO WHICH THE PRICE BE CHANGED TO
	["The citizens seem to live healthier, fruites now have a high price!",["apple","peach"],100]
];

_random = floor(random 100) + 1;
if (_random > life_dynMarket_chance) exitWith {life_dynMarket_waitForEvent = true;};
_eventCount = count life_dynMarket_Events;
_randomEventID = floor(random _eventCount);
_eventToHappen = life_dynMarket_Events select _randomEventID;
_eventMessage = _eventToHappen select 0;
_eventItems = _eventToHappen select 1;
_eventToPrice = _eventToHappen select 2;

{
	_itemName = _x;
	_itemNewPrice = 0;
	_index = -1;
	{
		_index = _index + 1;
		if (_x select 0 == _itemName) then 
		{
			if (_eventToPrice == -1) then 
			{
				{
					{
						if (_x select 0 == _itemName) then {_itemNewPrice = _x select 2;};
					} forEach (_x select 1);
				} forEach life_dynMarket_Items_Groups;
				life_dynMarket_sellarraycopy set [_index,[_x select 0,_itemNewPrice]];
				life_dynMarket_Items_CurrentPriceArr set [_index,[_x select 0,_itemNewPrice,0]];
			} else {
				if (_eventToPrice == -2) then 
				{
					{
						{
							if (_x select 0 == _itemName) then {_itemNewPrice = _x select 3;};
						} forEach (_x select 1);
					} forEach life_dynMarket_Items_Groups;
					life_dynMarket_sellarraycopy set [_index,[_x select 0,_itemNewPrice]];
					life_dynMarket_Items_CurrentPriceArr set [_index,[_x select 0,_itemNewPrice,0]];
				} else {
					life_dynMarket_sellarraycopy set [_index,[_x select 0,_eventToPrice]];
					life_dynMarket_Items_CurrentPriceArr set [_index,[_x select 0,_eventToPrice,0]];
				};
			};
		};
	} forEach life_dynMarket_sellarraycopy;
} forEach _eventItems;

life_dynMarket_waitForEvent = true;

sleep 2;

[[0,_eventMessage],"life_fnc_broadcast",true,false] call life_fnc_MP;