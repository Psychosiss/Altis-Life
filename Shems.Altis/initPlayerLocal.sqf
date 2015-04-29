[] call compileFinal PreprocessFileLineNumbers "KRON_Strings.sqf";

if(!hasInterface) exitWith {};

BIS_fnc_endMission = compileFinal (if(typeName BIS_fnc_endMission == "STRING") then {BIS_fnc_endMission} else {str(BIS_fnc_endMission)});

[] execVM "SpyGlass\fn_initSpy.sqf";
[] execVM "core\init.sqf";
[] execVM "core\functions\fn_emptyFuel.sqf";

if((_this select 1)) then 
{
	{
		_index = _x getVariable "life_VEH_color";
		if(!isNil "_index") then 
		{
			[_x,_index] spawn life_fnc_colorVehicle;
		};
	} foreach (allMissionObjects "Car");

	{
		_index = _x getVariable "life_VEH_color";
		if(!isNil "_index") then 
		{
			[_x,_index] spawn life_fnc_colorVehicle;
		};
	} foreach (allMissionObjects "Air");
};

false call life_fnc_simulationManager;