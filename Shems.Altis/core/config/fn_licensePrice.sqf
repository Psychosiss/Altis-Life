private "_type";
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {-1};

switch _type do
{
	case "driver": {10000};
	case "boat": {10000};
	case "pilot": {50000};
	case "gun": {150000};
	case "dive": {10000};
	case "oil": {500000};
	case "cair": {15000};
	case "cg": {8000};
	case "heroin": {150000};
	case "marijuana": {100000};
	case "medmarijuana": {1500};
	case "rebel": {2000000};
	case "truck": {20000};
	case "diamond": {70000};
	case "salt": {20000};
	case "cocaine": {200000};
	case "sand": {15000};
	case "meth": {400000};
	case "iron": {40000};
	case "copper": {10000};
	case "cement": {5000};
	case "mair": {15000};
	case "home": {1000000};
	case "advrebel": {15000000};
	case "jet": {5000000};
	case "skull": {30000};
	case "silver": {30000};
	case "swat": {35000};
	case "tabac": {50000};
	case "uranium": {750000};
};