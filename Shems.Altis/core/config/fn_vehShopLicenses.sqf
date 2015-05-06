private["_veh","_ret"];
_veh = _this select 0;
_ret = false;

if(_veh == "B_Quadbike_01_F") exitWith {true};

switch (life_veh_shop select 0) do
{
	case "kart_shop": {_ret = license_civ_driver;};
	case "med_shop": {_ret = true;};
	case "med_air_hs": {_ret = license_med_air;};
	case "civ_car": {_ret = license_civ_driver;};
	case "event_derby": {_ret = true;};
	case "event_helicopters": {_ret = true;
	case "press_car": {_ret = true;};
	case "press_helicopters": {_ret = true;};
	case "civ_truck": {_ret = license_civ_truck;};
	case "reb_car": {_ret = license_civ_rebel;};
	case "cop_car": {_ret = true;};
	case "civ_air": {_ret = license_civ_air;};
	case "cop_air": {_ret = license_cop_air;};
	case "civ_ship": {_ret = license_civ_boat;};
	case "cop_ship": 
	{
		if(_veh == "B_Boat_Armed_01_minigun_F") then
		{
			_ret = license_cop_cg;
		} else {
			_ret = true;
		};
	};
	case "civ_jet": {_ret = license_civ_jet;};
	case "civ_box": {_ret = true;};
	case "dep_car": {_ret = true;};
	case "dep_air": {_ret = true;};
};

_ret;