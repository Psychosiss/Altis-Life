bombVehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull bombVehicle) exitWith {};
if(player getVariable["playercharge",false]) exitWith {hint "La bombe est déja placé !"};
if(bombVehicle getVariable["dchargeplaced",false]) exitWith {hint "Une charge est déjà placé sur ce coffre."};
if(!([false,"demolitioncharge",1] call life_fnc_handleInv)) exitWith {hint "Vous n'avez pas de charge de démolition";};
closeDialog 0;

player setVariable["playercharge",true,true];
bombVehicle setVariable["dchargeplaced",true,true];

bTouchOff = 
{
	if(!(bombVehicle getVariable["dchargeplaced",false])) exitWith 
	{
		hint "La bombe a été désarmé !"; 
		player removeAction touchoffAction; 
		player setVariable["playercharge",false,true];
	};
	_bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL bombVehicle select 0, getPosATL bombVehicle select 1, (getPosATL bombVehicle select 2) + 0.5];
	player setVariable["playercharge",false,true];
	bombVehicle setVariable["dchargeplaced",false,true];
	hintSilent "La bombe a détonné";
	player removeAction touchoffAction;
};

[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 6;
touchoffAction = player addAction ["Arreter la programmation de l'explosif", bTouchOff,"",0,false,false,"",' player distance bombVehicle < 110 '];
hintSilent "La bombe est placé !";