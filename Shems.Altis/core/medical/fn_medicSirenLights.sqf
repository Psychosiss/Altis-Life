private "_vehicle";
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {};
if(!(typeOf _vehicle in ["C_Offroad_01_F"])) exitWith {};

_trueorfalse = _vehicle getVariable["lights",FALSE];

if(_trueorfalse) then 
{
	_vehicle setVariable["lights",FALSE,TRUE];
} else {
	_vehicle setVariable["lights",TRUE,TRUE];
	[[_vehicle,0.22],"life_fnc_medicLights",true,false] spawn life_fnc_MP;
};