private["_vault"];
_vault = cursorTarget;
if(isNull _vault) exitWith {};
if(!(_vault getVariable["dchargeplaced",false])) exitWith {hint "Il n'y a pas de dynamite sur le coffre."};
if(!([false,"civdefusekit",1] call life_fnc_handleInv)) exitWith { hint "You have no Defusal Kit"; };

life_action_inUse = true;

if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then 
{
	[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
	player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	sleep 6;
};

if(!alive player) exitWith {life_action_inUse = false;};

life_action_inUse = false;
hint "Bombe activé";
_vault setVariable["dchargeplaced",false,true];
_vault setVariable["dchargefound",false,true];