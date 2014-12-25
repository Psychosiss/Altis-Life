if(!createDialog "marketView") exitWith {hint "";};
disableSerialization;

waitUntil {!isnull (findDisplay 39500)};

[] spawn life_fnc_refreshMarketView;