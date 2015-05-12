private["_vendor","_type","_itemInfo","_oldItem","_oldItem2","_newItem","_cost","_upp","_hasLicense","_itemName","_oldVal","_oldVal2","_ui","_progress","_pgText","_cP","_error1","_error2"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,"",[""]] call BIS_fnc_param;

if(isNull _vendor OR _type == "" OR (player distance _vendor > 10)) exitWith {};

_error1 = false;
_error2 - false;

_itemInfo = switch _type do
{
	case "oil": {["oilu","oilp",1200,"Processing Oil"];playSound "oil";}; //test playsound
	case "diamond": {["diamond","diamondc",1350,"Taillage du diamant"]};
	case "heroin": {["heroinu","heroinp",2100,"Purification de l'héroine"]};
	case "copper": {["copperore","copper_r",750,"Processing Copper"]};
	case "iron": {["ironore","iron_r",1120,"Processing Iron"]};
	case "sand": {["sand","glass",650,"Traitement du sable"]};
	case "salt": {["salt","salt_r",450,"Traitement du sel"]};
	case "cocaine": {["cocaine","cocainep",1500,"Purification de la cocaine"]};
	case "marijuana": {["cannabis","marijuana",500,"Purification de la marijuana"]};
	//case "heroin": {["heroinu","heroinp",1720,"Purification de l'heroine"]};
	case "uranium1": {["uranium1","uranium2",5000,"Nettoyage de l'Uranium"]};
	case "uranium4": {["uranium4","uranium",15000,"Séchage de l'Uranium"]};
	case "cement": {["rock","cement",350,"Melange du ciment"]};
	case "meth": {["methu","methp",5000,"Cuisinage de la Meth"]};
	case "tabac": {["tabac","cigare",8000,"Roulement des cigares"]};
	case "skull": {["skull","skullp",1500,"Restauration d'une antiquité"]};
	case "silver": {["silver","silver_r",1120,"Fonte de l'argent"];};
	case "mash": {["water","mash",100,"Mixing Grain Mash",true,"cornmeal"]};
	case "whiskey": {["yeast","whiskey",1000,"Fermenting Whiskey",true,"rye"]};
	case "beer": {["yeast","beerp",1500,"Brewing Beer",true,"hops"]};
	case "moonshine": {["yeast","moonshine",250,"Moonshining",true,"mash"]};
	case "bottledshine": {["moonshine","bottledshine",500,"Bootle Moonshine",true,"bottles"]};
	case "bottledbeer": {["beerp","bottledbeer",500,"Bottle Beer",true,"bottles"]};
	case "bottledwhiskey": {["whiskey","bottledwhiskey",500,"Bottle Whiskey",true,"bottles"]};
	case "glassbottle": {["glass","bottles",650,"Making Bottles",false]};
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
		if(player distance _vendor > 10) exitWith {};
	};

	if(player distance _vendor > 10) exitWith {hint "Vous devez rester a 10m du traitement."; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;};
	5 cutText ["","PLAIN"];
	titleText[format["Vous avez traiter %1 en %2",_oldVal,_itemName],"PLAIN"];
	life_is_processing = false;
} else {
	if(life_money < _cost) exitWith 
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
	if(life_money < _cost) exitWith {hint format["Vous avez besoin de %1 € pour traiter sans licence!",[_cost] call life_fnc_numberText]; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([false,_oldItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([true,_newItem,_oldVal] call life_fnc_handleInv)) exitWith {5 cutText ["","PLAIN"]; [true,_oldItem,_oldVal] call life_fnc_handleInv; life_is_processing = false;};
	5 cutText ["","PLAIN"];
	titleText[format["Vous avez traiter %1 en %2 pour %3 €",_oldVal,_itemName,[_cost] call life_fnc_numberText],"PLAIN"];
	life_money = life_money - _cost;
	life_is_processing = false;
};