private["_vehicleToFuel","_velocityOfVehicle","_fuelConsumption"];

while{true} do 
{
	_vehicleToFuel = (vehicle player);
	if(isEngineOn _vehicleToFuel && ((driver _vehicleToFuel) == player) && !(_vehicleToFuel isKindOf "Air") && (_vehicleToFuel != player) ) then
	{
		_velocityOfVehicle = sqrt(((velocity _vehicleToFuel select 0)^2)+((velocity _vehicleToFuel select 1)^2))*3.6;
		
		_fuelConsumption = _velocityOfVehicle/100000 + 0.0001;
		if(_fuelConsumption > 0.002) then
		{
			_fuelConsumption = 0.002;
		};
		_vehicleToFuel setFuel ((fuel _vehicleToFuel)-_fuelConsumption);
		
		//hint format["Consommation: %1L/km",_fuelConsumption*10000/2];

		if(fuel _vehicleToFuel < 0.2 && fuel _vehicleToFuel > 0.18) then
		{
			hint "Votre reservoir est bientot vide, dépéchez-vous de le recharger!";
		} else {
			if(fuel _vehicleToFuel < 0.03) then
			{
				hint "Vous devez marcher car vous n'avez plus d'essence!";
			};
		};
	};
	sleep 2;
};