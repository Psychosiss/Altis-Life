#include <macro.h>

private "_unit";
disableSerialization;

if((lbCurSel 2632) == -1) exitWith {hint "Vous devez séléctionner quelqu'un à ajouter au gang!"};
_unit = call compile format["%1",getSelData(2632)];
if(isNull _unit) exitWith {};
if(_unit == player) exitWith {hint "You cannot kick yourself!"};
if(!isNil {(group _unit) getVariable "gang_name"}) exitWith {hint "Ce joueur est déjà dans un gang."};
if(count(grpPlayer getVariable ["gang_members",8]) == (grpPlayer getVariable ["gang_maxMembers",8])) exitWith {hint "Your gang has reached its maximum allowed slots, please upgrade your gangs slot limit."};

_action = 
[
	format["Vous êtes sur le point d'inviter %1 dans votre gang, si il accepte l'invitation il aura accès à l'argent du gang.",_unit getVariable ["realname",name _unit]],
	"Transfer Gang Leadership",
	"Oui",
	"Non"
] call BIS_fnc_guiMessage;

if(_action) then 
{
	[[profileName,grpPlayer],"life_fnc_gangInvite",_unit,false] call life_fnc_MP;
	_members = grpPlayer getVariable "gang_members";
	_members pushBack getPlayerUID _unit;
	grpPlayer setVariable["gang_members",_members,true];
	hint format["Vous avez invité %1 dans votre gang.",_unit getVariable["realname",name _unit]];
} else {
	hint "Invitation annulé";
};