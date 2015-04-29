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
	[[group player],"TON_fnc_removeGang",false,false] spawn life_fnc_MP;
} else {
	hint "Gang supprimé";
};