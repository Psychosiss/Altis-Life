#define getSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])

private["_unit","_unitID","_members"];
disableSerialization;

if((lbCurSel 2621) == -1) exitWith {hint "You need to select a person to kick!"};
_unit = call compile format["%1",getSelData(2621)];
if(isNull _unit) exitWith {};
if(_unit == player) exitWith {hint "Vous ne pouvez pas vous éjécter!"};

_unitID = getPlayerUID _unit;
_members = group player getVariable "gang_members";
if(isNil "_members") exitWith {};
if(typeName _members != "ARRAY") exitWith {};
_members = _members - [_unitID];
group player setVariable["gang_members",_members,true];

[[4,group player],"TON_fnc_updateGang",false,false] call life_fnc_MP;
sleep 1;
[[_unit,group player],"clientGangKick",_unit,false] call life_fnc_MP;
[] call life_fnc_gangMenu;