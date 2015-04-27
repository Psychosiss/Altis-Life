if (isNil "life_dynMarket_prices") then 
{
	[[getPlayerUID player],"TON_fnc_playerLogged",false,false] spawn life_fnc_MP;
	hint "Chargement des prix...";
	sleep 1;
};

disableSerialization;
_dialog = findDisplay 7100;
_listbox = _dialog displayCtrl 7055;
_blacklist =[]; // exemple _blacklist =["apple"];
{
	_itemdisplayname = [([(_x select 0),0] call life_fnc_varHandle)] call life_fnc_varToStr;
	_itemIconPath = [_x select 0] call life_fnc_getIcon;
	if !(_x select 0 in _blacklist) then 
	{
		_listbox lbAdd format ["%1",_itemdisplayname];
		_listbox lbSetData [(lbSize _listbox)-1,_x select 0];
		if (_itemIconPath!="") then {_listbox lbSetPicture [(lbSize _listbox )-1,_itemIconPath];};
	};
} forEach life_dynMarket_prices;