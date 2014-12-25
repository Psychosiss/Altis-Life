private["_sum"];
_sum = ["tabac",1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;

if(_sum > 0) then
{
	life_action_inUse = true;
	titleText["Récolte de Tabac...","PLAIN"];
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	titleFadeOut 5;
	sleep 5;
	if(([true,"tabac",1] call life_fnc_handleInv)) then
	{
		titleText["Vous avez cueilli du Tabac.","PLAIN"];
	};
};

life_action_inUse = false;