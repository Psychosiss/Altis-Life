private ["_snowSparse","_snowLight","_snowMedium","_snowHeavy","_snowStorm","_rSnow"];

while {true} do 
{
	_rSnow = [1,5] call BIS_fnc_randomInt;
	switch (_rSnow) do 
	{
		case 1 : 
		{
			_snowSparse = "#particleSource" createVehicleLocal (position player);  
			_snowSparse setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16,12,13,1], "","Billboard", 1, 7, [0,0,0], [0,0,0], 1, 0.0000001, 0.000, 1.7,[0.07],[[1,1,1,1]],[0,1], 0.2, 1.2, "", "",vehicle player];
			_snowSparse setParticleRandom [0,[30,30,20],[0,0,0],0,0.01,[0,0,0,0.1],0,0];
			_snowSparse setParticleCircle [0,[0,0,0]];
			_snowSparse setDropInterval 0.1;
		};

		case 2 : 
		{
			_snowLight = "#particleSource" createVehicleLocal (position player);  
			_snowLight setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16,12,13,1], "","Billboard", 1, 7, [0,0,0], [0,0,0], 1, 0.0000001, 0.000, 1.7,[0.07],[[1,1,1,1]],[0,1], 0.2, 1.2, "", "",vehicle player];
			_snowLight setParticleRandom [0,[30,30,20],[0,0,0],0,0.01,[0,0,0,0.1],0,0];
			_snowLight setParticleCircle [0,[0,0,0]];
			_snowLight setDropInterval 0.01;
		};

		case 3 : 
		{
			_snowMedium = "#particleSource" createVehicleLocal (position player);  
			_snowMedium setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16,12,13,1], "","Billboard", 1, 7, [0,0,0], [0,0,0], 1, 0.0000001, 0.000, 1.7,[0.07],[[1,1,1,1]],[0,1], 0.2, 1.2, "", "",vehicle player];
			_snowMedium setParticleRandom [0,[30,30,20],[0,0,0],0,0.01,[0,0,0,0.1],0,0];
			_snowMedium setParticleCircle [0,[0,0,0]];
			_snowMedium setDropInterval 0.001;
		};

		case 4 : 
		{
			_snowHeavy = "#particleSource" createVehicleLocal (position player);  
			_snowHeavy setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16,12,13,1], "","Billboard", 1, 7, [0,0,0], [0,0,0], 1, 0.0000001, 0.000, 1.7,[0.07],[[1,1,1,1]],[0,1], 0.2, 1.2, "", "",vehicle player];
			_snowHeavy setParticleRandom [0,[30,30,20],[0,0,0],0,0.01,[0,0,0,0.1],0,0];
			_snowHeavy setParticleCircle [0,[0,0,0]];
			_snowHeavy setDropInterval 0.0001;
		};

		case 5 : 
		{
			_snowStorm = "#particleSource" createVehicleLocal (position player);  
			_snowStorm setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16,12,13,1], "","Billboard", 1, 7, [0,0,0], [0,0,0], 1, 0.0000001, 0.000, 1.7,[0.07],[[1,1,1,1]],[0,1], 0.2, 1.2, "", "",vehicle player];
			_snowStorm setParticleRandom [0,[30,30,20],[0,0,0],0,0.01,[0,0,0,0.1],0,0];
			_snowStorm setParticleCircle [0,[0,0,0]];
			_snowStorm setDropInterval 0.00001;
		};        
	};
	sleep 20 + (random 1800);
	deleteVehicle _snowSparse;
	deleteVehicle _snowLight;
	deleteVehicle _snowMedium;
	deleteVehicle _snowHeavy;
	deleteVehicle _snowStorm;

	if (random 1 <= 0.05) then 
	{
		sleep 1 + (random 1200);
	};
};  