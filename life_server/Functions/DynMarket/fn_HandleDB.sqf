_switch = _this select 0;
_whatanumber = 1;

switch (_switch) do
{
	case 0:
	{
		_query = "";
		switch (_whatanumber) do 
		{
			case 1: {_query = format["UPDATE dynmarket SET prices='%1'",life_dynMarket_Items_CurrentPriceArr];};
		};
		waitUntil {sleep (random 0.3); !DB_Async_Active};
		_queryResult = [_query,1] call DB_fnc_asyncCall;
		diag_log "dynMarket : Formatage des prix réussi depuis la base de donnée";
	};
	
	case 1:
	{
		_query = switch(_whatanumber) do 
		{
			case 1: {_returnCount = 11; format["SELECT prices FROM dynmarket WHERE id='1'"];};
		};
		waitUntil{sleep (random 0.3); !DB_Async_Active};
		_tickTime = diag_tickTime;
		_queryResult = [_query,2] call DB_fnc_asyncCall;
		_pricearray = _queryResult select 0;
		if (count _pricearray < 1) then 
		{
			diag_log "dynMarket : impossible de charger les prix depuis la base de donnée";
		} else {
			life_dynMarket_Items_CurrentPriceArr = _pricearray;
			diag_log "dynMarket : Chargement des prix réussi";
		};
	};
};