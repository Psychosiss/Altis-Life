while {true} do 
{
	sleep (life_dynMarket_PriceUpdateInterval * 60);
	[[0],"life_fnc_update",true,false] spawn life_fnc_MP;
	sleep 5;
	[] spawn TON_fnc_calculatePrices;
	life_dynMarket_UpdateCount = life_dynMarket_UpdateCount + 1;
	if ((life_dynMarket_UpdateCount == life_dynMarket_CreateBackupInterval) && life_dynMarket_CreateBackups) then 
	{
		[] spawn 
		{
			life_dynMarket_UpdateCount = 0;
			[0] call TON_fnc_HandleDB;
		};
	};
};