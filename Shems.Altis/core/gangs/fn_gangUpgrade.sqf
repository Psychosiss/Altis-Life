#include <macro.h>

private["_maxMembers","_slotUpgrade","_upgradePrice"];
_maxMembers = grpPlayer getVariable ["gang_maxMembers",8];
_slotUpgrade = _maxMembers + 4;
_upgradePrice = round(_slotUpgrade * (__GETC__(life_gangUpgradeBase)) / (__GETC__(life_gangUpgradeMultipler)));
_funds = grpPlayer getVariable "gang_bank";

_action = 
[
	format
	[
		"Vous êtes sur le point de mettre à niveau la limite de membre autorisées pour votre gang." + 
		"<br/><br/>" + "Maximum actuelle: %1" + "<br/>" + 
		"Mise à niveau Maxale: %2" + "<br/>" + 
		"Prix:" + "<t color='#8cff9b'>%3 €</t>",_maxMembers,_slotUpgrade,[_upgradePrice] call life_fnc_numberText
	],
	"Augmentation du nombre de membre acceptés",
	"Acheter",
	"Annuler"
] call BIS_fnc_guiMessage;

if(_action) then 
{
	if((grpPlayer getVariable "gang_bank") < _upgradePrice) exitWith 
	{
		hint parseText format 
		[
			"Vous n'avez pas assez d'argent dans votre compte de banque pour mettre à niveau la limite de membre maximale." + 
			"<br/><br/>" + "Actuel:" + "<t color='#8cff9b'>%1 €</t><br/>" + 
			"Manquant:" + "<t color='#FF0000'>%2 €</t>",
			[_funds] call life_fnc_numberText,
			[_upgradePrice - _funds] call life_fnc_numberText
		];
	};
	__SUB__(_funds,_upgradePrice);
	grpPlayer setVariable["gang_maxMembers",_slotUpgrade,true];
	hint parseText format["Vous avez mis à niveau à partir de %1 à %2 membres maximum pour &lt;t color='#8cff9b'&gt;%3 €&lt;/t&gt;",_maxMembers,_slotUpgrade,[_upgradePrice] call life_fnc_numberText];
	[[2,grpPlayer],"TON_fnc_updateGang",false,false] call life_fnc_MP;
} else {
	hint "Mise à jour annulée.";
};