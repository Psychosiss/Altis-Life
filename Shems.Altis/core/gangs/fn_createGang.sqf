#include <macro.h>

private["_gangName","_length","_badChar","_chrByte","_allowed"];
disableSerialization;

_gangName = ctrlText (getControl(2520,2522));
_length = count (toArray(_gangName));
_chrByte = toArray (_gangName);
_allowed = toArray("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 ");
if(_length > 32) exitWith {hint "Vous ne pouvez pas avoir un nom de gang de plus de 32 caractères."};
_badChar = false;
{
	if(!(_x in _allowed)) exitWith 
	{
		_badChar = true;
	};
} foreach _chrByte;
if(_badChar) exitWith {hint "You have invalid characters in your gang name. It can only consist of Numbers & letters with an underscore";};
if(life_atmmoney < (__GETC__(life_gangPrice))) exitWith {hint format["Vous n'avez pas assez d'argent en banque.\n\nIl vous manque: %1 €",[((__GETC__(life_gangPrice)) - life_atmmoney)] call life_fnc_numberText];};

[[player,getPlayerUID player,_gangName],"TON_fnc_insertGang",false,false] call life_fnc_MP;
hint "Envoi d'une requete en cours.....";
closeDialog 0;
life_action_gangInUse = true;