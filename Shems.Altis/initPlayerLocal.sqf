if(!hasInterface) exitWith {};
#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
__CONST__(BIS_fnc_endMission,BIS_fnc_endMission);
[] execVM "core\init.sqf";
[] execVM "core\functions\fn_emptyFuel.sqf";

if((_this select 1)) then 
{
	[] execVM "core\jip.sqf";
};