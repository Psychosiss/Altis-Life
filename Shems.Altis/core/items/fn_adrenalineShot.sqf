_unit = cursorTarget;

if (!([false,"adrenaline",1] call life_fnc_handleInv)) exitWith {};
if (!(_unit getVariable ["downed", false])) exitWith 
{
	hint "Votre cible n'est pas dans le besoin d'adrénaline.";
};

life_action_inUse = true;

_upp = "injection d'adrénaline";
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;
_success=false;
while{true} do
{
	sleep 0.09;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
	if(_cP >= 1) exitWith {_success=true;};
	if(player distance _unit > 5) exitWith {};
	if(!alive player) exitWith {};
};
5 cutText ["","PLAIN"];
life_action_inUse = false;
if (_success) then 
{ 
	_unit setVariable["receiveFirstAid",true,true];
};