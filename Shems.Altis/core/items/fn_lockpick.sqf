private["_curTarget","_distance","_isVehicle","_title","_progressBar","_cP","_titleText","_dice","_badDistance"];
_curTarget = cursorTarget;
life_interrupted = false;
if(life_action_inUse) exitWith {};
if(isNull _curTarget) exitWith {};
_distance = ((boundingBox _curTarget select 1) select 0) + 2;
if(player distance _curTarget > _distance) exitWith {};
_isVehicle = if((_curTarget isKindOf "LandVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};

if(_isVehicle && _curTarget in life_vehicles) exitWith {hint "Vous avez déjà les cles du véhicule."};
if(!_isVehicle && !isPlayer _curTarget) exitWith {};
if(!_isVehicle && !(_curTarget getVariable["Restrained",false])) exitWith {};

_title = format["Crochetage %1",if(!_isVehicle) then {"Handcuffs"} else {getText(configFile >> "CfgVehicles" >> (typeOf _curTarget) >> "displayName")}];
life_action_inUse = true;
[[player, "alarmevoiture",10],"life_fnc_playSound",true,false] spawn life_fnc_MP;

disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

while {true} do
{
	if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1") then 
	{
		player action ["SwitchWeapon", player, player, 100];
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		player playActionNow "stop";
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		player playActionNow "stop";
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
	};
	sleep 0.195;
	if(isNull _ui) then 
	{
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed) exitWith {};
	if(life_interrupted) exitWith {};
	if((player getVariable["Restrained",false])) exitWith {};
	if(player distance _curTarget > _distance) exitWith {_badDistance = true;};
};

5 cutText ["","PLAIN"];
player playActionNow "stop";

if(!alive player OR life_istazed) exitWith {life_action_inUse = false;};
if((player getVariable["Restrained",false])) exitWith {life_action_inUse = false;};
if(!isNil "_badDistance") exitWith 
{
	titleText["Vous êtes trop loin de la cible.","PLAIN"]; 
	life_action_inUse = false;
};

if(life_interrupted) exitWith 
{
	life_interrupted = false; 
	titleText["Action annulé","PLAIN"]; 
	life_action_inUse = false;
};

if(!([false,"lockpick",1] call life_fnc_handleInv)) exitWith {life_action_inUse = false;};

life_action_inUse = false;

_dice = random(100);
if (_dice < 30) then 
{
	titleText["Vous avez crocheté le véhicule avec succès.","PLAIN"];
	[[_curTarget],"life_fnc_carAlarmSound",nil,true] spawn life_fnc_MP;
	[-50,0] call life_fnc_karmaSys;
	life_vehicles pushBack _curTarget;
	[[getPlayerUID player,profileName,"487"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
} else {
	[[getPlayerUID player,profileName,"215"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	[[0,format["%1 à été vu en train de crocheter un véhicule.",profileName]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
	titleText["Le lockpick est cassé.","PLAIN"];
	[-10,0] call life_fnc_karmaSys;
};

/*
if(!_isVehicle) then 
{
	_curTarget setVariable["Restrained",false,true];
	_curTarget setVariable["Escorting",false,true];
	_curTarget setVariable["transporting",false,true];
} else {
	_dice = random(100);
	if(_dice < 30) then 
	{
		titleText["Vous avez crocheté le véhicule avec succès.","PLAIN"];
		[[_curTarget],"life_fnc_carAlarmSound",nil,true] spawn life_fnc_MP;
		life_vehicles pushBack _curTarget;
		[[getPlayerUID player,profileName,"487"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	} else {
		[[getPlayerUID player,profileName,"215"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		[[0,format["%1 à été vu en train de crocheter un véhicule.",profileName]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
		titleText["Le lockpick est cassé.","PLAIN"];
	};
};
*/