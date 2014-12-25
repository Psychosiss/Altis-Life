private["_sum"];
_sum = ["methu",1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(life_action_in_use) exitWith {};

if(_sum > 0) then
{
	life_action_in_use = true;

	titleText["Création de la Meth...","PLAIN"];
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	titleFadeOut 5;
	sleep 5;

	if(([true,"methu",1] call life_fnc_handleInv)) then
	{
		titleText["Vous avez fabriqué de la meth.","PLAIN"];
	};
};

life_action_in_use = false;
