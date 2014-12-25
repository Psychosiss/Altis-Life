private ["_time"];

if(playerSide != west) exitWith {};
if(isNil "life_pInact_curTarget") exitWith {hint "Invalid destination."};

_time = ctrlText 1400;


if(! ([_time] call fnc_isnumber)) exitWith
{
	hint "You have to enter a number.";
};

_time = parseNumber _time;
_time = round _time;

if(_time < 5 || _time > 60) exitWith { hint "You can only go to jail between 5-60 minutes people!"; };

closeDialog 0; 
[life_pInact_curTarget, _time] call life_fnc_arrestAction;