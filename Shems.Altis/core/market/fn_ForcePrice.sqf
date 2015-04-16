disableSerialization;
_dialog = findDisplay 7000;
_tochangeName = _dialog displayCtrl 7004;
_tochangePrice = _dialog displayCtrl 7005;
_tochangeNameText = ctrlText _tochangeName;
_tochangePriceText = ctrlText _tochangePrice;
_tochangePriceNumber = parseNumber _tochangePriceText;

if ((_tochangeNameText == "")||(_tochangePriceText == "")) exitWith {hint parseText "dynMarket: Apport invalide";};

_exists = false;
{
	if (_tochangeNameText==_x select 0) then {_exists = true;};
} forEach life_dynMarket_prices;

if (_exists) then 
{
	hint parseText "dynMarket : Ajustement du prix réussi, il sera actualisé à la prochaine mise à jour des prix";
	[[_tochangeNameText,_tochangePriceNumber],"TON_fnc_changePrice",false,false] call life_fnc_MP;
} else {
	hint parseText "dynMarket : L'élément demandé n'existe pas.";
};