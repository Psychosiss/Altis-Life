private "_bObject";
_bObject = cursorTarget;
if(isNull cursorTarget) exitWith {};
if(!([false,"bombdetect",1] call life_fnc_handleInv)) exitWith {hint "Vous n'avez pas de detecteur de bombe.";};

[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 5;

if(_bObject getVariable["dchargeplaced",false]) then 
{
	hint "Quelqu'un a truqué une bombe, désamorcer-la!";
	_bObject setVariable["dchargefound",true,true];
} else { 
	hint "Il n'y a aucune bombe ici, cessez d'être paranoique." 
};