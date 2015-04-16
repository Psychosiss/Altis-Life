#include <macro.h>

private["_grp","_grpMembers"];
if(steamid == (grpPlayer getVariable "gang_owner")) exitWith {hint "You cannot leave the gang without appointing a new leader first!"};

_grp = grpPlayer;
_grpMembers = grpPlayer getVariable "gang_members";
_grpMembers = _grpMembers - [steamid];
_grp setVariable["gang_members",_grpMembers,true];
[player] joinSilent (createGroup civilian);

[[4,_grp],"TON_fnc_updateGang",false,false] call life_fnc_MP;
closeDialog 0;
sleep 1.0;
[player] joinSilent (createGroup civilian);