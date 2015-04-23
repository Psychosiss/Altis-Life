private "_unit";
_unit = cursorTarget;
if(isNull _unit) exitWith {};
if((player distance _unit > 3)) exitWith {};
if((_unit getVariable "restrained")) exitWith {};
if(side _unit == civilian) exitWith {};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};

if(life_inv_handcuffs < 1) then
{
	hint "Vous n'avez pas de menottes";
} else {
	life_inv_handcuffs = life_inv_handcuffs - 1;
	_unit say3D "cuff";
	_unit setVariable["restrained",true,true];
	hint "La cible n'est pas menotté";
	[[player], "life_fnc_civRestrain",_unit,false] spawn life_fnc_MP;
	[[0,format["%1 a été menotté par %2",_unit getVariable["realname", name _unit], profileName]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
};