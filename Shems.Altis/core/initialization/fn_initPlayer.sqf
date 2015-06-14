private ["_handle","_resourceZones"];

_resourceZones = 
[
	"apple_1","apple_4","apple_9",
	"peaches_2","peaches_3","peaches_9",
	"heroin_1",
	"cocaine_1",
	"weed_1",
	"meth_1",
	"tabac_1",
	"warm_marker",
	"lead_1",
	"iron_1",
	"salt_1",
	"sand_1",
	"diamond_1",
	"oil_1","oil_2",
	"rock_1",
	"silver_1",
	"archeo_1"
];

player addRating 99999999;
player addScore 99999999;

[] call life_fnc_initPlayerVariables;

waitUntil {!(isNull (findDisplay 46))};

if("life_blacklisted") exitWith 
{
	["Blacklisted",false,0] call BIS_fnc_endMission;
};

player setVariable["coplevel",life_coplevel,true];
player setVariable["medlevel",life_medicLevel,true];
player setVariable["adminlevel",life_adminlevel,true];

switch playerSide do
{
	case west:
	{
		if(life_cop_level < 1) then 
		{
			["NotWhitelisted",false,true] call BIS_fnc_endMission;
			sleep 35;
		} else {
			_handle = [] spawn life_fnc_initCop;
			waitUntil {scriptDone _handle};
		};
		{_x setMarkerAlphaLocal 0;} forEach _resourceZones;
	};

	case civilian:
	{
		_handle = [] spawn life_fnc_initCiv;
		waitUntil {scriptDone _handle};
		{_x setMarkerAlphaLocal 0;} forEach ["jail"];
	};

	case independent:
	{
		if(life_med_level < 1) exitWith 
		{
			["NotWhitelisted",false,true] call BIS_fnc_endMission;
			sleep 35;
		} else {
			_handle = [] spawn life_fnc_initMedic;
			waitUntil {scriptDone _handle};
		};
		{_x setMarkerAlphaLocal 0;} forEach _resourceZones;
	};

	case sideLogic:
    {
		if(life_adminlevel < 2) exitWith
		{
			hintC "Vous n'avez pas le niveau administratif necessaire pour être Zeus.";
		};
    };
};