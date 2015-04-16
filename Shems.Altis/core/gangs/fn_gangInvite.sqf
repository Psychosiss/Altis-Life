#include <macro.h>

private["_name","_group"];
_name = [_this,0,"",[""]] call BIS_fnc_param;
_group = [_this,1,grpNull,[grpNull]] call BIS_fnc_param;
if(_name == "" OR isNull _group) exitWith {};
if(!isNil {(group player) getVariable "gang_name"}) exitWith {hint "Vous êtes déjà dans un gang."};

_gangName = _group getVariable "gang_name";
_action = 
[
	format["%1 vous a invité à dans le gang %2<br/>Si vous acceptez l'invitation, vous serez une partie de leur gang et aurez accès à des fonds de gangs et cachettes de gangs contrôlés.",_name,_gangName],
	"Invitation de Gang",
	"Oui",
	"Non"
] call BIS_fnc_guiMessage;

if(_action) then 
{
	[player] join _group;
	[[4,_group],"TON_fnc_updateGang",false,false] call life_fnc_MP;
} else {
	_grpMembers = grpPlayer getVariable "gang_members";
	_grpMembers = _grpMembers - [steamid];
	grpPlayer setVariable["gang_members",_grpMembers,true];
	[[4,_grpMembers],"TON_fnc_updateGang",false,false] call life_fnc_MP;
};