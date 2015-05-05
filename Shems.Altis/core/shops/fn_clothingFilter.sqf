disableSerialization;
private["_control","_selection","_list","_filter"];
_control = _this select 0;
_selection = _this select 1;
life_clothing_filter = _selection;

if(_selection == 4) then
{
	life_shop_cam camSetTarget (player modelToWorld [0,-.15,1.3]);
	life_shop_cam camSetPos (player modelToWorld [1,-4,2]);
	life_shop_cam camCommit 1;
} else {
	life_shop_cam camSetTarget (player modelToWorld [0,0,1]);
	life_shop_cam camSetPos (player modelToWorld [1,4,2]);
	life_shop_cam camCommit 1;
};

if(isNull (findDisplay 3100)) exitWith {};
_list = (findDisplay 3100) displayCtrl 3101;
lbClear _filter;
lbClear _list;

_clothes = switch (life_clothing_store) do
{
	case "bruce": {[_selection] call life_fnc_clothing_bruce;};
	case "cop": {[_selection] call life_fnc_clothing_cop;};
	case "cop_safe": {[_selection] call life_fnc_clothing_cop_safe;};
	case "cop_training": {[_selection] call life_fnc_clothing_cop_training;};
	case "reb": {[_selection] call life_fnc_clothing_reb;};
	case "advreb": {[_selection] call life_fnc_clothing_advreb;};
	case "dive": {[_selection] call life_fnc_clothing_dive;};
	case "kart": {[_selection] call life_fnc_clothing_kart;};
	case "bounty": {[_selection] call life_fnc_clothing_bounty;};
	case "jet": {[_selection] call life_fnc_clothing_jet;};
	case "heli": {[_selection] call life_fnc_clothing_heli;};
	case "medic": {[_selection] call life_fnc_clothing_med;};
	case "press": {[_selection] call life_fnc_clothing_press;};
	case "donator": {[_selection] call life_fnc_clothing_donator;};
};

if(count _clothes == 0) exitWith {};
{
	_details = [_x select 0] call life_fnc_fetchCfgDetails;
	if(isNil {_x select 1}) then
	{
		_list lbAdd format["%1",(getText(configFile >> (_details select 6) >> (_x select 0) >> "DisplayName"))];
	}
		else
	{
		_list lbAdd format["%1", _x select 1];
	};
	_pic = getText(configFile >> (_details select 6) >> (_x select 0) >> "picture");
	_list lbSetData [(lbSize _list)-1,_x select 0];
	_list lbSetValue [(lbSize _list)-1,_x select 2];
	_list lbSetPicture [(lbSize _list)-1,_pic];
} foreach _clothes;