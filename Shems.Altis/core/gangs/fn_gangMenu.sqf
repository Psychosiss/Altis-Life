#define getControl(disp,ctrl) ((findDisplay ##disp) displayCtrl ##ctrl)

private["_ownerID","_gangBank","_gangMax","_gangName","_members","_allUnits","_ctrl"];
disableSerialization;
if(isNull (findDisplay 2620)) then 
{
	if(!(createDialog "Life_My_Gang_Diag")) exitWith {};
};

_ownerID = group player getVariable["gang_owner",""];
if(_ownerID == "") exitWith {closeDialog 0;};
_gangName = group player getVariable "gang_name";
_gangBank = group player getVariable "gang_bank";
_gangMax = group player getVariable "gang_maxMembers";

if(_ownerID != getPlayerUID player) then 
{
	(getControl(2620,2622)) ctrlEnable false;
	(getControl(2620,2624)) ctrlEnable false;
	(getControl(2620,2625)) ctrlEnable false;
	(getControl(2620,2630)) ctrlEnable false;
	(getControl(2620,2631)) ctrlEnable false;
};

(getControl(2620,2629)) ctrlSetText _gangName;
(getControl(2620,601)) ctrlSetText format["Fonds: %1 €",[_gangBank] call life_fnc_numberText];

_members = getControl(2620,2621);
lbClear _members;
{
	if((getPlayerUID _x) == _ownerID) then 
	{
		_members lbAdd format["%1 (Gang Leader)",(_x getVariable["realname",name _x])];
		_members lbSetData [(lbSize _members)-1,str(_x)];
	} else {
		_members lbAdd format["%1",(_x getVariable["realname",name _x])];
		_members lbSetData [(lbSize _members)-1,str(_x)];
	};
} foreach (units group player);

_grpMembers = units group player;
_allUnits = playableUnits;
{
	if(_x in _grpMembers OR side _x != civilian && isNil {(group _x) getVariable "gang_id"}) then 
	{
		_allUnits set[_forEachIndex,-1];
	};
} foreach _allUnits;
_allUnits = _allUnits - [-1];
_ctrl = getControl(2620,2632);
lbClear _ctrl;
{
	_ctrl lbAdd format["%1",_x getVariable["realname",name _x]];
	_ctrl lbSetData [(lbSize _ctrl)-1,str(_x)];
} foreach _allUnits;