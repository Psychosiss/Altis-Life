private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {-1};

switch (_type) do
{
	case "admin": {1};
	case "driver": {500};
	case "boat": {1000};
	case "medmarijuana": {1500};
	case "dive": {2000};
	case "cement": {6500};
	case "cg": {8000};
	case "copper": {8000};
	case "iron": {9500};
	case "gun": {10000};
	case "oil": {10000};
	case "salt": {12000};
	case "sand": {14500};
	case "cair": {15000};
	case "mair": {15000};
	case "marijuana": {19500};
	case "truck": {20000};
	case "pilot": {25000};
	case "heroin": {25000};
	case "skull": {30000};
	case "silver": {30000};
	case "cocaine": {30000};
	case "swat": {35000};
	case "diamond": {35000};
	case "meth": {40000};
	case "tabac": {50000};
	case "home": {100000};
	case "rebel": {700000};
	case "uranium": {750000};
};