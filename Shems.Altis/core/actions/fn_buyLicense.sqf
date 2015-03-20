private["_type"];
_type = _this select 3;
_success = false;
_price = [_type] call life_fnc_licensePrice;
_license = [_type,0] call life_fnc_licenseType;

if (life_cash >= _price) then 
{
	life_cash = life_cash - _price;
	systemChat format["Vous avez payé %1 € depuis l'argent que vous avez sur vous.",[_price], _license select 1 call life_fnc_numberText];
	missionNamespace setVariable[(_license select 0),true];
	PlaySound "caching";
	_success = true;
} else {
	if (life_inv_debitcard > 0) then
	{
		if (life_atmcash < _price) then {hint format["Vous n'avez pas %1 € dans votre compte banquaire pour la transaction.", [_price] call life_fnc_numberText]
		} else {
			life_atmcash = life_atmcash - _price;
			systemChat format["Vous avez payé %1 € depuis votre banque en utilisant la carte de débit.", [_price], _license select 1 call life_fnc_numberText];
			missionNamespace setVariable[(_license select 0),true];
			PlaySound "caching";
			_success = true;
		};
	} else {
		hint format ["Vous n'avez pas %1 € d'argent sur vous ni de carte de débit.", [_price] call life_fnc_numberText]
	};
};
_success;