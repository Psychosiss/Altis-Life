private["_group"];
_group = [_this,0,grpNull,[grpNull]] call BIS_fnc_param;
if(isNull _group) exitWith {};

hint "The leader has disbanded the gang.";
[player] joinSilent (createGroup civilian);
if(count units _group == 0) then {
	deleteGroup _group;
};