private ["_time"];

if(playerSide != west) exitWith {};
if(isNil "life_pInact_curTarget") exitWith {};

_time = ctrlText 1400;

if(! ([_time] call fnc_isnumber)) exitWith
{
	hint "Vous devez entrer un numéro.";
};

_time = parseNumber _time;
_time = round _time;

if(_time < 5 || _time > 60) exitWith {hint "Vous ne pouvez mettre quelqu'un en prison uniquement entre 5 et 60 minutes.";};

closeDialog 0; 
[life_pInact_curTarget, _time] call life_fnc_arrestAction;
//[life_pInact_curTarget, _time] call life_fnc_arrestActionTroll;
//[life_pInact_curTarget, _time] call life_fnc_arrestActionAsylum;