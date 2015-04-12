private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit OR !(_unit getVariable["Restrained",false])) exitWith {};

if(life_inv_handcuffs > 0) then
{
    life_inv_handcuffs = life_inv_handcuffs + 1;
} else {
    [true,"handcuffs",1] call life_fnc_handleInv;
};

_unit setVariable["Restrained",false,true];
_unit setVariable["Escorting",false,true];
_unit setVariable["transporting",false,true];
_unit say3D "cuffout";
detach _unit;

[[0,format["%1 à été démenotté par %2",_unit getVariable["realname",name _unit], profileName]],"life_fnc_broadcast",west,false] call life_fnc_MP;