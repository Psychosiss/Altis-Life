if(dialog) exitWith {};
life_goldObj = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull life_goldObj) exitWith {};
if(playerSide != civilian) exitWith {};
if((life_goldObj getVariable["gold",-1]) < 1) exitWith {hint "Le coffre est vide";};
if((life_goldObj getVariable["inUse",false])) exitWith {hint "Quelqu'un accède déjà au coffre.."};
if(!createDialog "Gold_Safe") exitWith {hint "Erreur lors de la création du dialogue"};
disableSerialization;
ctrlSetText[3501,"Coffre"];
[life_goldObj] call life_fnc_safeInvGold;
life_goldObj setVariable["inUse",true,true];
[life_goldObj] spawn
{
	waitUntil {isNull (findDisplay 3500)};
	(_this select 0) setVariable["inUse",false,true];
};