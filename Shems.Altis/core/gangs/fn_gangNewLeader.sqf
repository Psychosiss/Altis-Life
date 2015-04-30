#define getSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])

private["_unit","_unitID","_members","_action","_index"];
disableSerialization;

if((lbCurSel 2621) == -1) exitWith {hint "You need to select a person first!"};
_unit = call compile format["%1",getSelData(2621)];
if(isNull _unit) exitWith {};
if(_unit == player) exitWith {hint "You are already the leader!"};

_action = 
[
	format["You are about to transfer leadership over to %1<br/>By transferring leadership you will no longer be in control of the gang unless ownership is transferred back.",_unit getVariable ["realname",name _unit]],
	"Transfer Gang Leadership",
	"You",
	"Non"
] call BIS_fnc_guiMessage;

if(_action) then 
{
	_unitID = getPlayerUID _unit;
	if(_unitID == "") exitWith {};
	group player setVariable["gang_owner",_unitID,true];
	group player selectLeader _unit;
	[[_unit,group player],"clientGangLeader",_unit,false] spawn life_fnc_MP;
	[[3,group player],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
} else {
	hint "Transfer of leadership cancelled.";
};
[] call life_fnc_gangMenu;