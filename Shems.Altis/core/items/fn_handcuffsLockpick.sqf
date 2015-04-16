private["_unit","_string","_isPlayer","_title","_progressBar","_cP","_ui","_titleText","_dice","_badDistance"];
_unit = cursorTarget;
_string = "Handcuffs";

life_interrupted = false;

if(life_action_inUse) exitWith {};
if(isNil "_unit" OR isNull _unit) exitWith {};
if(!(isPlayer _unit)) exitWith {};
if(player distance _unit > 2) exitWith {};
if(!(_unit getVariable["Restrained",false])) exitWith {};

_isPlayer = if(isPlayer _unit) then {true} else {false};
_title = format["Crochetage %1",_string];

life_action_inUse = true;

disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_string];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

while {true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then 
	{
		[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] call life_fnc_MP;
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.26;
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
	if(life_istazed) exitWith 
	{
		_ui = "StatusBar" call BIS_fnc_rscLayer;
		_ui cutRsc["StatusBar","PLAIN"];
	};

	if(life_interrupted) exitWith 
	{
		_ui = "StatusBar" call BIS_fnc_rscLayer;
		_ui cutRsc["StatusBar","PLAIN"];
	};

	if((player getVariable["Restrained",false])) exitWith 
	{
		_ui = "StatusBar" call BIS_fnc_rscLayer;
		_ui cutRsc["StatusBar","PLAIN"];
	};

	if(player distance _curTarget > _distance) exitWith 
	{
		_badDistance = true;
		_ui = "StatusBar" call BIS_fnc_rscLayer;
		_ui cutRsc["StatusBar","PLAIN"];
	};
};

5 cutText ["","PLAIN"];
player playActionNow "stop";

if(!alive player OR life_istazed) exitWith 
{
	life_action_inUse = false;
	_ui = "StatusBar" call BIS_fnc_rscLayer;
	_ui cutRsc["StatusBar","PLAIN"];
};

if((player getVariable["Restrained",false])) exitWith 
{
	life_action_inUse = false;
	_ui = "StatusBar" call BIS_fnc_rscLayer;
	_ui cutRsc["StatusBar","PLAIN"];
};

if(!isNil "_badDistance") exitWith 
{
	titleText["Vous êtes trop loin de la cible.","PLAIN"]; 
	life_action_inUse = false;
	_ui = "StatusBar" call BIS_fnc_rscLayer;
	_ui cutRsc["StatusBar","PLAIN"];
};

if(life_interrupted) exitWith 
{
	life_interrupted = false; 
	titleText["Action annulé","PLAIN"]; 
	life_action_inUse = false;
	_ui = "StatusBar" call BIS_fnc_rscLayer;
	_ui cutRsc["StatusBar","PLAIN"];
};

if(!([false,"lockpick",1] call life_fnc_handleInv)) exitWith 
{
	life_action_inUse = false;
	_ui = "StatusBar" call BIS_fnc_rscLayer;
	_ui cutRsc["StatusBar","PLAIN"];
};

life_action_inUse = false;

_dice = random(100);
if(_dice < 70) then 
{
    titleText["Vous avez crocheté ces menottes avec succès.","PLAIN"];
	_unit setVariable["Restrained",false,true];
	_unit setVariable["Escorting",false,true];
	_unit setVariable["transporting",false,true];
	[[getPlayerUID player,profileName,"486"],"life_fnc_wantedAdd",false,false] call life_fnc_MP;
} else {
	titleText["Le lockpick est cassé.","PLAIN"];
	[[0,format["%1 à été vu en train de crocheter un véhicule.",profileName]],"life_fnc_broadcast",west,false] call life_fnc_MP;
	[[getPlayerUID player,profileName,"485"],"life_fnc_wantedAdd",false,false] call life_fnc_MP;
}; 