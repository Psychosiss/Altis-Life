private["_dialog","_inv","_config","_itemInfo","_side","_itemNeed"];
_side = playerSide;
if(!dialog) then 
{
	createDialog "life_talent";
};
disableSerialization;

if(life_is_processing) exitWith 
{
	closeDialog 2001;
	closeDialog 0;
};

_dialog = findDisplay 966;
_left = [1] call life_fnc_returnInfo;
ctrlSetText[967,format["Menu des Compétences     Point Disponible %1", _left]];

_inv = _dialog displayCtrl 969;
lbClear _inv;

_config = [] call life_fnc_talentCfg;
{
	_itemInfo = _x select 0;
	_itemHave = _x select 1;
	_itemNeed = _x select 2;
	_inv lbAdd format["%1",_itemInfo];
	_inv lbSetColor [(lbSize _inv)-1,[1,0,0,1]];
	if((missionNamespace getVariable[_itemNeed,true]) || (_itemNeed == "ok"))then {_inv lbSetColor [(lbSize _inv)-1,[1,0.5,0,1]];};
	if((missionNamespace getVariable[_itemHave,true]))then {_inv lbSetColor [(lbSize _inv)-1,[0,1,0,1]];};
	_inv lbSetData [(lbSize _inv)-1,(_x select 1)];
} foreach _config;