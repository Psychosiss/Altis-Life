enableSaving [false,false];
if(!(_this select 0)) exitWith {};
[] call compile PreprocessFileLineNumbers "\life_server\init.sqf";

{  
	private "_building";
	_building = (_x select 0) nearestObject (_x select 1);
	_building hideObjectGlobal true;
	_building enableSimulationGlobal false;
} forEach [
	[[5184,14511,0.5],1090057], 	//--- Checkpoint 1 building
	[[3654,13196,0],1117336],
	[[16764,12744,0.5],922691],	//--- Pyrgos building site
	[[3691,13156,10],1120919],
	[[3637,13099,10],1120806],
	[[14529,16713,17],523286],	//--- Airport terminal ATC tower
	[[12356,14354,8],702232],		//--- Neochori bank warhouse
	[[17014,12808,16],921267]	//--- Pyrgos office building opposite garage
];

{
	inGameUISetEventHandler [_x,""];
} forEach ["PrevAction","Action","NextAction"];

[8,true,12] call life_fnc_timeManager;
//true call life_fnc_simulationManager;