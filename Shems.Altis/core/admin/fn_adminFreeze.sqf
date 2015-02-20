#include <macro.h>

if(__GETC__(life_adminlevel) < 3) exitWith {closeDialog 0; hint "Votre niveau admin n'est pas suffisamment élevée.";};

private["_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitWith {};
if(isNull _unit) exitWith {};
if(_unit == player) exitWith {hint "Vous ne pouvez pas le faire sur vous-même.";};


if(life_frozen) then 
{
	[{hint "Vous n'êtes plus gelé";},"BIS_fnc_Spawn",_unit,false] call BIS_fnc_MP;
	[{disableUserInput false;},"BIS_fnc_Spawn",_unit,false] call BIS_fnc_MP;
	hint format["Vous avez permis le contrôle à %1.",_unit getVariable["realname",_unit]];
	life_frozen = false;
} else {
	[{hint "Vous avez été gelé par un administrateur.";},"BIS_fnc_Spawn",_unit,false] call BIS_fnc_MP;
	[{disableUserInput true;},"BIS_fnc_Spawn",_unit,false] call BIS_fnc_MP;
	hint format["Vous avez désactivé le contrôle à %1.",_unit getVariable["realname",_unit]];
	life_frozen = true;
};