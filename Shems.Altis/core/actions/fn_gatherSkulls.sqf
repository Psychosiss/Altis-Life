private "_sum";
_sum = ["skull",1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(life_action_in_use) exitWith {};

if(_sum > 0) then
{
	life_action_in_use = true;
	["Récolte d'ossements", 5] call life_fnc_showProgress;
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	titleFadeOut 5;
	sleep 5;

	if(([true,"skull",1] call life_fnc_handleInv)) then
	{
		titleText["Tu as récolté un crâne.","PLAIN"];
	};
};

life_action_in_use = false;