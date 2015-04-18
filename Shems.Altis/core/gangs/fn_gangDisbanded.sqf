private "_group";
_group = [_this,0,grpNull,[grpNull]] call BIS_fnc_param;
if(isNull _group) exitWith {};
if(!isNull (findDisplay 2620)) then {closeDialog 2620};
hint "Le chef a supprimé le gang.";
[player] joinSilent (createGroup civilian);
if(count units _group == 0) then 
{
	deleteGroup _group;
};