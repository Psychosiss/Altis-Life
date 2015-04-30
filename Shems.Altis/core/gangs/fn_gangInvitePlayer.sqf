#define getSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])

private "_unit";
disableSerialization;

if((lbCurSel 2632) == -1) exitWith {hint "Vous devez séléctionner quelqu'un à ajouter au gang!"};
_unit = call compile format["%1",getSelData(2632)];
if(isNull _unit) exitWith {};
if(_unit == player) exitWith {hint "You cannot kick yourself!"};
if(!isNil {(group _unit) getVariable "gang_name"}) exitWith {hint "Ce joueur est déjà dans un gang."};
if(count(group player getVariable ["gang_members",8]) == (group player getVariable ["gang_maxMembers",8])) exitWith {hint "Your gang has reached its maximum allowed slots, please upgrade your gangs slot limit."};

_action = 
[
	format["Vous êtes sur le point d'inviter %1 dans votre gang, si il accepte l'invitation il aura accès à l'argent du gang.",_unit getVariable ["realname",name _unit]],
	"Transfer Gang Leadership",
	"Oui",
	"Non"
] call BIS_fnc_guiMessage;

if(_action) then 
{
	[[profileName,group player],"life_fnc_gangInvite",_unit,false] spawn life_fnc_MP;
	_members = group player getVariable "gang_members";
	_members pushBack getPlayerUID _unit;
	group player setVariable["gang_members",_members,true];
	hint format["Vous avez invité %1 dans votre gang.",_unit getVariable["realname",name _unit]];
} else {
	hint "Invitation annulé";
};