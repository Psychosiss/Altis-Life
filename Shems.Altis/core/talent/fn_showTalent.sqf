if(isNull (findDisplay 966)) then
{
	if(!createDialog "life_talent") exitWith {};
};

disableSerialization;


private["_dialog","_inv","_left","_level","_itemInfo","_itemHave","_itemNeed"];
_dialog = findDisplay 966;
_inv = _dialog displayCtrl 969;
lbClear _inv;
_level = [0] call life_fnc_returnInfo;
_left = [1] call life_fnc_returnInfo;
ctrlSetText[967,format["Competences     Niveau:%1     Point Disponible %2",_level ,_left]];
ctrlShow[973,false];

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
ctrlShow[973,false];
[] spawn life_fnc_callShowTalent;