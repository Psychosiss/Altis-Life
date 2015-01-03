private["_target","_revivable","_targetName","_ui","_progressBar","_titleText","_cP","_title"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _target) exitWith {};
_revivable = _target getVariable["Revive",FALSE];
if(_revivable) exitWith {};
if(_target getVariable ["Reviving",ObjNull] == player) exitWith {hint "Someone else is already reviving this person";};
if(player distance _target > 5) exitWith {};
_targetName = _target getVariable["name","Unknown"];
_title = format["Reviving %1",_targetName];
life_action_inUse = true;
_target setVariable["Reviving",player,TRUE];
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable ["life_progress",displayNull];
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
	sleep 0.15;
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed) exitWith {};
	if(life_interrupted) exitWith {};
	if((player getVariable["restrained",false])) exitWith {};
	if(player distance _target > 4) exitWith {_badDistance = true;};
	if(_target getVariable["Revive",FALSE]) exitWith {};
	if(_target getVariable["Reviving",ObjNull] != player) exitWith {};
};

5 cutText ["","PLAIN"];
player playActionNow "stop";
if(_target getVariable ["Reviving",ObjNull] != player) exitWith {hint "Someone else is already reviving this person"};
_target setVariable["Reviving",NIL,TRUE];
if(!alive player OR life_istazed) exitWith {life_action_inUse = false;};
if(_target getVariable["Revive",FALSE]) exitWith {hint "This person either respawned or was already revived."};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;};
if(!isNil "_badDistance") exitWith {titleText["You got to far away from the target.","PLAIN"]; life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText["Action annulé","PLAIN"]; life_action_inUse = false;};
life_atmcash = life_atmcash + (call life_revive_fee);
life_action_inUse = false;
_target setVariable["Revive",TRUE,TRUE];
[[profileName],"life_fnc_revived",_target,FALSE] spawn life_fnc_MP;
titleText[format["Vous avez réanimmé %1 et avez reçu %2 € pour vos services.",_targetName,[(call life_revive_fee)] call life_fnc_numberText],"PLAIN"];
sleep 0.6;
player reveal _target;