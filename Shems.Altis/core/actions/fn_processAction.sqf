private["_vendor","_type","_itemInfo","_oldItem","_oldItem2","_newItem","_cost","_upp","_hasLicense","_itemName","_oldVal","_oldVal2","_ui","_progress","_pgText","_cP","_error1","_error2"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,"",[""]] call BIS_fnc_param;

if(isNull _vendor OR _type == "" OR (player distance _vendor > 10)) exitWith {};

_error = false;

_itemInfo = switch (_type) do
{
	case "oil": 
	{
		["oilu","oilp",1200,"Processing Oil"];
		playSound "oil";
	};
	
	case "diamond": 
	{
		["diamond","diamondc",1350,"Processing Diamond"]
	};
	
	case "heroin": 
	{
		["heroinu","heroinp",2100,"Processing Heroin"]
	};
	
	case "copper": 
	{
		["copperore","copper_r",750,"Processing Copper"]
	};
	
	case "iron": 
	{
		["ironore","iron_r",1120,"Processing Iron"]
	};
	
	case "sand": 
	{
		["sand","glass",650,"Processing Sand"]
	};
	
	case "glassbottle":
	{
		["glass","bottles",650,"Making Bottles",false]
	};
	
	case "salt": 
	{
		["salt","salt_r",450,"Processing Salt"]
	};
	
	case "cocaine": 
	{
		["cocaine","cocainep",1500,"Processing Cocaine"]
	};
	
	case "marijuana": 
	{
		["cannabis","marijuana",500,"Processing Marijuana"]
	};
	
	case "heroin": 
	{
		["heroinu","heroinp",1720,"Processing Heroin"]
	};
	
	case "uranium1": 
	{
		["uranium1","uranium2",5000,"Nettoyage de l'Uranium"]
	};
	
	case "uranium4": 
	{
		["uranium4","uranium",15000,"Séchage de l'Uranium"]
	};
	
	case "cement": 
	{
		["rock","cement",350,"Mixing Cement"]
	};
	
	case "meth": 
	{
		["methu","methp",5000,"Cooking Meth"]
	};
	
	case "tabac": 
	{
		["tabac","cigare",8000,"Rouler les Cigares"]
	};
	
	case "skull": 
	{
		["skull","skullp",1500,"Restauration d'une antiquité"]
	};
	
	case "silver": 
	{
		["silver","silver_r",1120,"Fonte de l'argent"];
	};

    default 
	{
		//[]
		[];
	};
};

if(count _itemInfo == 0) exitWith {};

_oldItem = _itemInfo select 0;
_newItem = _itemInfo select 1;
_cost = _itemInfo select 2;
_upp = _itemInfo select 3;

if(_vendor in [mari_processor,coke_processor,heroin_processor]) then 
{
	_hasLicense = true;
} else {
	_hasLicense = missionNamespace getVariable (([_type,0] call life_fnc_licenseType) select 0);
};

_itemName = [([_newItem,0] call life_fnc_varHandle)] call life_fnc_varToStr;
_oldVal = missionNamespace getVariable ([_oldItem,0] call life_fnc_varHandle);
_cost = _cost * _oldVal;

if(_oldVal == 0) exitWith {};

disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (0%1)...","%",_upp];
_progress progressSetPosition 0.01;
_cP = 0.01;

life_is_processing = true;

if(_hasLicense) then
{
	while{true} do
	{
		sleep  0.3;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		//if(player distance _vendor > 10) exitWith {};
		if(player distance _vendor > 10) exitWith 
		{
			_ui = "StatusBar" call BIS_fnc_rscLayer;
			_ui cutRsc["StatusBar","PLAIN"];
		};
	};

	if(player distance _vendor > 10) exitWith {hint "Vous devez rester a 10m du traitement."; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;};
	5 cutText ["","PLAIN"];
	titleText[format["Vous avez traiter %1 en %2",_oldVal,_itemName],"PLAIN"];
	life_is_processing = false;
	_ui = "StatusBar" call BIS_fnc_rscLayer;
	_ui cutRsc["StatusBar","PLAIN"];
} else {
	if(life_cash < _cost) exitWith 
	{
		hint format["Vous avez besoin de %1 € pour traiter sans licence!",[_cost] call life_fnc_numberText]; 
		5 cutText ["","PLAIN"]; 
		life_is_processing = false;
	};

	while{true} do
	{
		sleep  0.9;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(player distance _vendor > 10) exitWith {};
	};

	if(player distance _vendor > 10) exitWith {hint "Vous devez rester a 10m du traitement."; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(life_cash < _cost) exitWith {hint format["Vous avez besoin de %1$ pour traiter sans licence!",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;};
	5 cutText ["","PLAIN"];
	titleText[format["Vous avez traiter %1 en %2 pour %3 €",_oldVal,_itemName,[_cost] call life_fnc_numberText],"PLAIN"];
	life_cash = life_cash - _cost;
	life_is_processing = false;
	_ui = "StatusBar" call BIS_fnc_rscLayer;
	_ui cutRsc["StatusBar","PLAIN"];
};