private["_dialog","_inv","_mats","_item","_struct","_str","_invSize","_matsNeed","_matsNum","_config","_itemFilter"];
disableSerialization;
_dialog = findDisplay 666;
_inv = _dialog displayCtrl 669;
_mats = _dialog displayCtrl 672;
_struct = "";
if((lbCurSel 669) == -1) exitWith {hint "Vous devez d'abord séléctionner un objet!";};
_item = lbData[669,(lbCurSel 669)];
_itemFilter = lbData[673,(lbCurSel 673)];

_config = [_itemFilter] call life_fnc_craftCfg;
{
	if(_item == _x select 0)then
	{
		_matsNeed = _x select 1;
		_invSize = count _matsNeed;
		for [{_i = 0},{_i < _invSize - 1},{_i = _i + 2}] do 
		{
			_str = [_matsNeed select _i] call life_fnc_varToStr;
			_matsNum = _matsNeed select _i+1;
			_struct = _struct + format["%1x %2<br/>",_matsNum,_str];

		};
	};
} foreach (_config select 1);

if(_struct == "") then
{
	_struct = "No material needed";
};

_mats ctrlSetStructuredText parseText format["<t size='0.8px'>%1</t>",_struct]; 