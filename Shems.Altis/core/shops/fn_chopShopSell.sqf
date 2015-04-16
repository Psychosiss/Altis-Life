disableSerialization;
private["_control","_price","_vehicle","_nearVehicles","_price2"];
_control = ((findDisplay 39400) displayCtrl 39402);
_price = _control lbValue (lbCurSel _control);
_vehicle = _control lbData (lbCurSel _control);
_vehicle = call compile format["%1", _vehicle];
_nearVehicles = nearestObjects [getMarkerPos life_chopShop,["Car","Truck"],25];
_vehicle = _nearVehicles select _vehicle;
if(isNull _vehicle) exitWith {};

hint "Selling vehicle please wait....";
life_action_inUse = true;
_price2 = life_money + _price;
[[player,_vehicle,_price,_price2],"TON_fnc_chopShopSell",false,false] call life_fnc_MP;
closeDialog 0;