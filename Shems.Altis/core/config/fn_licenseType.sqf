private["_type","_ret","_var","_mode"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
_mode = [_this,1,-1,[0]] call BIS_fnc_param;
if(_type == "" OR _mode == -1) exitWith {[]};

switch (_mode) do
{
	case 0:
	{
		switch (_type) do
		{
			case "driver": {_var = "license_civ_driver"};
			case "boat": {_var = "license_civ_boat"};
			case "pilot": {_var = "license_civ_air"};
			case "gun": {_var = "license_civ_gun"};
			case "dive": {_var = "license_civ_dive"};
			case "oil": {_var = "license_civ_oil"};
			case "cair": {_var = "license_cop_air"};
			case "swat": {_var = "license_cop_swat"};
			case "cg": {_var = "license_cop_cg"};
			case "heroin": {_var = "license_civ_heroin"};
			case "marijuana": {_var = "license_civ_marijuana"};
			case "medmarijuana": {_var = "license_civ_medmarijuana"};
			case "rebel": {_var = "license_civ_rebel"};
			case "truck":{_var = "license_civ_truck"};
			case "diamond": {_var = "license_civ_diamond"};
			case "salt": {_var = "license_civ_salt"};
			case "cocaine": {_var = "license_civ_coke"};
			case "sand": {_var = "license_civ_sand"};
			case "iron": {_var = "license_civ_iron"};
			case "copper": {_var = "license_civ_copper"};
			case "cement": {_var = "license_civ_cement"};
			case "mair": {_var = "license_med_air"};
			case "home": {_var = "license_civ_home"};
			case "meth": {_var = "license_civ_meth"};
			case "tabac": {_var = "license_civ_tabac"};
			case "uranium": {_var = "license_civ_uranium"};
			case "uranium1": {_var = "license_civ_uranium"};
			case "uranium2": {_var = "license_civ_uranium"};
			case "uranium2b": {_var = "license_civ_uranium"};
			case "uranium3": {_var = "license_civ_uranium"};
			case "uranium4": {_var = "license_civ_uranium"};
			case "skull": {_var = "license_civ_skull"};
			case "admin": {_var = "license_civ_admin"};
			case "silver": {_var = "license_civ_silver"};
			case "archeologue": {_var = "license_civ_archeologue"};
			case "bois": {_var = "license_civ_bois"};
			default {_var = ""};
		};
	};
	
	case 1:
	{
		switch (_type) do
		{
			case "license_civ_driver": {_var = "driver"};
			case "license_civ_boat": {_var = "boat"};
			case "license_civ_air": {_var = "pilot"};
			case "license_civ_gun": {_var = "gun"};
			case "license_civ_dive": {_var = "dive"};
			case "license_civ_oil": {_var = "oil"};
			case "license_cop_air": {_var = "cair"};
			case "license_cop_swat": {_var = "swat"};
			case "license_cop_cg": {_var = "cg"};
			case "license_civ_heroin": {_var = "heroin"};
			case "license_civ_marijuana": {_var = "marijuana"};
			case "license_civ_medmarijuana": {_var = "medmarijuana"};
			case "license_civ_rebel": {_var = "rebel"};
			case "license_civ_truck":{_var = "truck"};
			case "license_civ_diamond": {_var = "diamond"};
			case "license_civ_salt": {_var = "salt"};
			case "license_civ_coke": {_var = "cocaine"};
			case "license_civ_sand": {_var = "sand"};
			case "license_civ_iron": {_var = "iron"};
			case "license_civ_copper": {_var = "copper"};
			case "license_civ_cement": {_var = "cement"};
			case "license_med_air": {_var = "mair"};
			case "license_civ_home": {_var = "home"};
			case "license_civ_meth": {_var = "meth"};
			case "license_civ_tabac": {_var = "tabac"};
			case "license_civ_uranium": {_var = "uranium"};
			case "license_civ_uranium": {_var = "uranium1"};
			case "license_civ_uranium": {_var = "uranium2"};
			case "license_civ_uranium": {_var = "uranium2b"};
			case "license_civ_uranium": {_var = "uranium3"};
			case "license_civ_uranium": {_var = "uranium4"};
			case "license_civ_skull": {_var = "skull"};
			case "license_civ_admin": {_var = "admin"};
			case "license_civ_silver": {_var = "silver"};
			case "license_civ_archeologue": {_var = "archeologue"};
			case "license_civ_bois": {_var = "bois"};
			default {_var = ""};
		};
	};
};

_ret = [_var,(if(_var != "") then {([_var] call life_fnc_varToStr)})];
_ret;