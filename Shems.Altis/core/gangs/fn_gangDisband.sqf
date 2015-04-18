#include <macro.h>

private "_action";

_action = 
[
	"Vous ête sur le point de dissoudre ce gang<br/><br/>Ete-vous sûr de vouloir supprimer celui-ci ? les membres seront abandonnés.",
	"Dissoudre le gang",
	"Oui",
	"Non"
] call BIS_fnc_guiMessage;

if(_action) then 
{
	hint "Suppression du gang....";
	[[grpPlayer],"TON_fnc_removeGang",false,false] call life_fnc_MP;
} else {
	hint "Gang supprimé";
};