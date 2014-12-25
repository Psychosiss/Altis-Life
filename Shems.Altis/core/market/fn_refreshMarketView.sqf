private["_display","_selectedindex","_index","_shortname"];

disableSerialization;
if(!dialog) exitWith {hint "Impossible de trouver le dialog.";};

_display = findDisplay 39500;

if(isNull _display) exitWith {hint "Dialog non ouvert!";};

_selectedindex = lbCurSel 1500;

if(_selectedindex == -1) then
{
	lbSetCurSel [1500, 0];
	lbClear 1500;

	{
		_index = lbAdd [1500, [[_x select 0, 0] call life_fnc_varHandle] call life_fnc_varToStr];
		lbSetData [1500, _index, _x select 0];
	} foreach life_market_resources;
} else {
	_shortname = lbData [1500, _selectedindex];
	
	ctrlSetText [1000, lbText [1500, _selectedindex] ];
	
	{
		if((_x select 0) == _shortname) exitWith
		{
			ctrlSetText [1001, format["$%1", [_x select 1] call life_fnc_numberText]];
			ctrlSetText [1004, format["$%1", [_x select 2] call life_fnc_numberText]];
			
			if((_x select 2) >= 0) then
			{
				ctrlSetText [1200, "icons\trendup.paa"];
			} else {
				ctrlSetText [1200, "icons\trenddown.paa"];
			};

			ctrlSetText [1005, format["%1$", [_x select 3] call life_fnc_numberText]];
			
			if((_x select 3) >= 0) then
			{
				ctrlSetText [1201, "icons\trendup.paa"];
			} else {
				ctrlSetText [1201, "icons\trenddown.paa"];
			};
		};
	} foreach life_market_prices;
};