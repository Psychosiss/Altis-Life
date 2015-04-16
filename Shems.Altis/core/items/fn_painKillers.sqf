_unit = [_this,3,objNull,[objNull]] call BIS_fnc_param;

if (isNull _unit) exitWith {};

if(!([false,"painkillers",1] call life_fnc_handleInv)) exitWith {};

if (_unit == player) then
{
	[0] spawn life_fnc_setPain;
	titleText["Vous consommez des antalgiques.","PLAIN"];
} else {
	[[0],"life_fnc_setPain",_unit,false] call BIS_fnc_MP;
	titleText[format["Vous nourrissez des antalgiques à %1.", name _unit],"PLAIN"];
};