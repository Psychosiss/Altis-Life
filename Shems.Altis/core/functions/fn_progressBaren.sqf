private["_cpRate","_title","_progressBar","_titleText","_cp","_ui","_object"];
_object = _this Select 0;
_cpRate = 0.0045;
disableSerialization;
_title = "Sortir un prisonnier";

life_action_inUse = true;

disableSerialization;
_title = "Breaking out prisoner";
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

while {true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then 
	{
		[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
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
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed) exitWith {};
	if(life_interrupted) exitWith {};
};

5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR life_istazed) exitWith {life_action_inUse = false;};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;};
if(life_interrupted) exitWith 
{
	life_interrupted = false; 
	titleText["Action Annulée","PLAIN"]; 
	life_action_inUse = false;
};

life_action_inUse = false;

_object setPos (getMarkerPos "jail_breakout");

[[getPlayerUID player,profileName,"902"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;