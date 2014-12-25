private["_rand","_modifier","_price", "_globalchange","_defaultprice","_shortname","_difference"];

_rand = [0,200] call life_fnc_randomRound;

diag_log "MarketChange appelé.";

switch(true) do
{
	case (_rand <= 30):
	{
		{
			if(random(10) <= 4) then
			{
				_modifier = [-20,20] call life_fnc_randomRound;
				if(_modifier < 0) then
				{
					[_x select 0, -(_modifier), true] call life_fnc_marketSell; 
				} else {
					[_x select 0, _modifier, true] call life_fnc_marketBuy; 
				};
			};
		} foreach life_market_prices;
	};
	case (_rand <= 36):
	{
		[[0,"Canal - : Interpol a trouvé un gang international de drogue!"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		["heroinu", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy;
		["heroinp", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy;
		["cocaine", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy;
		["cocainep", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy;
		["marijuana", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy;
		["methu", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy;
		["methp", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy;
		["tabac", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy;
		["cigare", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy;
	};
	case (_rand <= 44):
	{
		[[0,"Canal - : Le prétrole à diminué!"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		["oilp", [20,40] call life_fnc_randomRound, true] call life_fnc_marketBuy;
	};
	case (_rand <= 54):
	{
		[[0,"Canal - : La Chine en déficit!"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		["cement", [20,40] call life_fnc_randomRound, true] call life_fnc_marketBuy;
		["iron_r", [20,30] call life_fnc_randomRound, true] call life_fnc_marketBuy;
		["glass", [25,35] call life_fnc_randomRound, true] call life_fnc_marketBuy;
	};
	case (_rand <= 60):
	{
		[[0,"Canal - : Les investisseurs perdent confiance dans l'or!"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		["goldbarp", [15,30] call life_fnc_randomRound, true] call life_fnc_marketSell;
	};
	case (_rand <= 68):
	{
		[[0,"Canal - : L'industrie électronique nécessite des métaux précieux!"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		["goldbarp", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy;
		["silver", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy;
		["silver_r", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy;
	};
	case (_rand <= 74):
	{
		[[0,"Canal - : Les investisseurs perdent confiance aux dollars!"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		["goldbarp", [15,30] call life_fnc_randomRound, true] call life_fnc_marketBuy;
	};
	case (_rand <= 80):
	{
		[[0,"Canal - : Le nouveau marché de drogue synthétique est inondé!"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		["heroinu", [15,30] call life_fnc_randomRound, true] call life_fnc_marketSell;
		["heroinp", [15,30] call life_fnc_randomRound, true] call life_fnc_marketSell;
		["cocaine", [15,30] call life_fnc_randomRound, true] call life_fnc_marketSell;
		["cocainep", [15,30] call life_fnc_randomRound, true] call life_fnc_marketSell;
		["marijuana", [15,30] call life_fnc_randomRound, true] call life_fnc_marketSell;
		["methu", [15,30] call life_fnc_randomRound, true] call life_fnc_marketSell;
		["methp", [15,30] call life_fnc_randomRound, true] call life_fnc_marketSell;
		["tabac", [15,30] call life_fnc_randomRound, true] call life_fnc_marketSell;
		["cigare", [15,30] call life_fnc_randomRound, true] call life_fnc_marketSell;
	};
	case (_rand <= 90):
	{
		[[0,"Canal - :La Chine a découvert les tortues comme un nouveau médicament! Les militants des droits des animaux sont concernés!"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		["turtle", [4,10] call life_fnc_randomRound, true] call life_fnc_marketBuy;
	};
	default
	{
		{
			_defaultprice = 0;
			_shortname = _x select 0;
			_price = _x select 1;
			_globalchange = _x select 2;
			{
				if((_x select 0) == _shortname) exitWith
				{
					_defaultprice = _x select 1;
				};
			} foreach life_market_resources;
			if(_defaultprice > 0) then
			{
				_difference = _defaultprice - _price;
				_modifier = _difference * (random 0.4);
				_modifier = round _modifier;
				diag_log format["+Market+ Correcting market value of %1 from %2 to %3 by %4", _shortname, _price, (_price + _modifier), _modifier];
				_price = _price + _modifier;
				_globalchange = _globalchange + _modifier;
				life_market_prices set [_forEachIndex,[_shortname, _price,_globalchange,_modifier]];
			} else {
				diag_log format["+Market+ Cannot correct market value of %1", _shortname];
			};
		} foreach life_market_prices;
	};
};

publicVariable "life_market_prices";


/*
	case (_rand <= 30):
	{
		{
			if(random(10) <= 4) then
			{
				_price = _price + _modifier;
				_globalchange = _globalchange + _modifier;
				
				life_market_prices set [_forEachIndex, [_x select 0, _price, _globalchange, _modifier]];
				
				if(_modifier < 0) then
				{
					[_x select 0, -(_modifier), true] call life_fnc_marketSell; 
				} else {
					[_x select 0, _modifier, true] call life_fnc_marketBuy; 
				};
			};
		} foreach life_market_prices;
*/