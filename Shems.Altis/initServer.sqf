enableSaving [false,false];
if(!(_this select 0)) exitWith {};
[] call compile PreprocessFileLineNumbers "\life_server\init.sqf";
[8,true,12] call life_fnc_timeManager;
true call life_fnc_simulationManager;