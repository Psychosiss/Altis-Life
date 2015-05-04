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
	"silver_1"
];

/*
if("life_blacklisted" call GTA_fnc_const) exitWith 
{
	[ "Blacklisted", false, 0 ] call BIS_fnc_endMission;
};
*/

player addRating 99999999;
player addScore 99999999;

switch playerSide do
{
	case west:
	{
		_handle = [] spawn life_fnc_initCop;
		waitUntil {scriptDone _handle};
		{

			_x setMarkerAlphaLocal 0;

		} forEach _resourceZones;
	};

	case civilian:
	{
		_handle = [] spawn life_fnc_initCiv;
		waitUntil {scriptDone _handle};
	};

	case independent:
	{
		_handle = [] spawn life_fnc_initMedic;
		waitUntil {scriptDone _handle};
		{

			_x setMarkerAlphaLocal 0;

		} forEach _resourceZones;
	};

	case sideLogic:
    {
        _handle = [] spawn life_fnc_initZeus;
        waitUntil {scriptDone _handle};
    };
};