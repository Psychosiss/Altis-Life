private["_type"];
_type = _this select 3;
_price = [_type] call life_fnc_licensePrice;
_license = [_type,0] call life_fnc_licenseType;

if(life_cash < _price) exitWith {hint format["Vous n'avez pas %1 € pour %2",[_price] call life_fnc_numberText,_license select 1];};

life_cash = life_cash - _price;
titleText[format["Vous avez acheté un %1 pour %2 €", _license select 1,[_price] call life_fnc_numberText],"PLAIN"];
missionNamespace setVariable[(_license select 0),true];