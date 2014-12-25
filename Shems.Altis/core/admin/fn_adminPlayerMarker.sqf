#include <macro.h>

if !("ItemMap" in items player) then {player addweapon "ItemMap";};
	Wookie_Noobs = [];
	Wookie_Bitches = [];

	if (isnil "Wookie_Map_Markers") then {Wookie_Map_Markers = 0;}; 
	if (Wookie_Map_Markers == 0) then {Wookie_Map_Markers = 1; hint "Player Markers ACTIVÉ";} else {Wookie_Map_Markers = 0; hint "Player Markers DÉSACTIVÉ";};

	while {Wookie_Map_Markers == 1} do
	{
		{
			if ((vehicle _x isKindOf "LandVehicle") || (vehicle _x isKindOf "Air") || (vehicle _x isKindOf "Ship")) then 
			{
				if (count (crew vehicle _x) > 0) then 
				{
					{
						if (!(_x in Wookie_Noobs) and (alive _x) and (getPlayerUID _x != "")) then 
						{
							private ["_pos", "_mkr", "_vhc"];
							_vhc = vehicle _x;
							_pos = visiblePosition _x;
							_mkr = createMarkerLocal [format ["CRW%1%2", _pos select 0, _pos select 1], [(_pos select 0) + 20, _pos select 1, 0]]; 
							_vehname = (gettext (configFile >> 'CfgVehicles' >> (typeof vehicle _x) >> 'displayName'));
							_mkr setMarkerTextLocal format[' %1 --- %2 --- %3m',name _x,_vehname,round(_x distance player)];
							_mkr setMarkerTypeLocal "mil_dot"; 
							if ((side _x == side player) and (side _x != resistance)) then {_mkr setMarkerColorLocal "ColorBlue";}else{_mkr setMarkerColorLocal "ColorRed";};
							_mkr setMarkerSizeLocal [1,1];

							Wookie_Noobs set [count Wookie_Noobs, _x];
							[_x, _mkr,_vhc] spawn 
							{
								private ["_u", "_m","_pc"]; 
								_u = _this select 0; 
								_m = _this select 1; 
								while {(Wookie_Map_Markers == 1) and (alive _u) and (vehicle _u != _u) and (getPlayerUID _u != "")} do 
								{
									_pc = ((crew vehicle _u) find _u); 
									_m setMarkerPosLocal ([(visiblePosition _u select 0) + 20, (visiblePosition _u select 1) - (25 + _pc*20), 0]); 
									sleep 0.01; 
								}; 
								deleteMarkerLocal _m;	
								if (_u in Wookie_Noobs) then 
								{ 
									Wookie_Noobs set [(Wookie_Noobs find _u), -1]; 
									Wookie_Noobs = Wookie_Noobs - [-1]; 			
								}; 					
								true;
							};
						};
					} forEach crew vehicle _x;
				}; 
			} else {
				if (!(_x in Wookie_Bitches) and (vehicle _x == _x) and (getPlayerUID _x != "")) then 			 
				{
					private ["_pos", "_mkr"]; 
					_pos = visiblePosition _x;
				
					_mkr = createMarkerLocal [format ["PLR%1%2", _pos select 0, _pos select 1], [(_pos select 0) + 20, _pos select 1, 0]]; 
					_mkr setMarkerTypeLocal "mil_dot";  
					_mkr setMarkerSizeLocal [1,1];
					if ((side _x == side player) and (side _x != resistance)) then {_mkr setMarkerColorLocal "ColorWhite";}else{_mkr setMarkerColorLocal "ColorRedAlpha";};
					_mkr setMarkerTextLocal format ["%1 --- %2", name _x,round(_x distance player)];
					if (_x == player) then 
					{	
						_mkr setMarkerColorLocal "ColorGreen";
					};
					Wookie_Bitches set [count Wookie_Bitches, _x];
					[_x, _mkr] spawn 
					{ 
						private ["_u", "_m"]; 
						_u = _this select 0; 
						_m = _this select 1; 
						while {(Wookie_Map_Markers == 1) and (alive _u) and (vehicle _u == _u) and (getPlayerUID _u != "") } do 
						{
							_m setMarkerPosLocal ([visiblePosition _u select 0, visiblePosition _u select 1, 0]); 
							sleep 0.01; 
						}; 
						deleteMarkerLocal _m;	
						if (_u in Wookie_Bitches) then 
						{ 
							Wookie_Bitches set [(Wookie_Bitches find _u), -1]; 
							Wookie_Bitches = Wookie_Bitches - [-1];
						}; 					
						true;
					}; 
				};
			};
		} forEach playableUnits;
	sleep 0.3;
	};
	{_mkr = str _x; deleteMarkerLocal _mkr;
} forEach playableUnits;