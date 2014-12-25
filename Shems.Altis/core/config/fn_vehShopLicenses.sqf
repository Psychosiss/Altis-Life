private["_veh","_ret"];
_veh = _this select 0;
_ret = false;

if(_veh == "B_Quadbike_01_F") exitWith {true};

switch (life_veh_shop select 0) do
{
	case "civ_car": {_ret = license_civ_driver;};
	case "civ_air": {_ret = license_civ_air;};
	case "civ_box": {_ret = true;};
	case "civ_truck":	{_ret = license_civ_truck;};
	case "civ_ship": {_ret = license_civ_boat;};
	case "reb_car": {_ret = license_civ_rebel;};
	case "reb_air": {_ret = license_civ_rebel;};
	case "dep_car": {_ret = true;};
	case "dep_air": {_ret = true;};
	case "kart_shop": {_ret = true;};
	case "med_shop": {_ret = true;};
	case "med_air_hs": {_ret = license_med_air;};
	case "cop_car": {_ret = true;};
	case "cop_air": {_ret = license_cop_air;};
	case "cop_ship": { ret = license_cop_cg;};
	case "donator_shop": {_ret = true;};
};

_ret;