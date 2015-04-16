"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call life_fnc_MPexec};
if(!hasInterface) exitWith {};
BIS_fnc_endMission = compileFinal (if(typeName BIS_fnc_endMission == "STRING") then {BIS_fnc_endMission} else {str(BIS_fnc_endMission)});
[] execVM "SpyGlass\fn_initSpy.sqf";
[] execVM "core\init.sqf";
[] execVM "core\functions\fn_emptyFuel.sqf";

if((_this select 1)) then 
{
	[] execVM "core\jip.sqf";
};