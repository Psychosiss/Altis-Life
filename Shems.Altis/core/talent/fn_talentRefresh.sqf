private["_dialog","_inv","_mats","_item","_struct","_str","_invSize","_matsNeed","_matsNum","_config","_side","_info"];
disableSerialization;
_side = playerSide;
_dialog = findDisplay 966;
_inv = _dialog displayCtrl 969;
_mats = _dialog displayCtrl 972;
_struct = "";
if((lbCurSel 969) == -1) exitWith {hint "Vous devez séléctionné un objet.";};
_item = lbData[969,(lbCurSel 969)];
_config = [] call life_fnc_talentCfg;
{
	if(_item == _x select 1)then
	{
		_info = _x select 3;
		_struct = format["%1<br/>",_info];
	};
} foreach _config;
if(_struct == "") then
{
	_struct = "Tu trouvera une descriptions de la compétence ici";
};

_mats ctrlSetStructuredText parseText format["<t size='0.8px'>%1</t>",_struct];