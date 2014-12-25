switch (true) do
{
	case ((vehicle player) isKindOf "Man"): {setViewDistance tawvd_foot};
	case ((vehicle player) isKindOf "LandVehicle"): {setViewDistance tawvd_car};
	case ((vehicle player) isKindOf "Air"): {setViewDistance tawvd_air};
};