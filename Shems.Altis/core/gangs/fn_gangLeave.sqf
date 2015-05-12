private["_grp","_grpMembers"];
if(getPlayerUID player == (group player getVariable "gang_owner")) exitWith {hint "Vous ne pouvez pas quitter le gang, désignez d'abord un nouveau leadeur!"};

_grp = group player;
_grpMembers = group player getVariable "gang_members";
_grpMembers = _grpMembers - [getPlayerUID player];
_grp setVariable["gang_members",_grpMembers,true];
[player] joinSilent (createGroup civilian);

[[4,_grp],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
closeDialog 0;
sleep 1;
[player] joinSilent (createGroup civilian);