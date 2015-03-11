private["_robber","_shop","_timer","_funds","_dist","_success"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_action = [_this,2] call BIS_fnc_param;
_timer = 600;
_funds = 75000;
_dist = _robber distance _shop;
_success = false;
_cops = 
{ 
	(isPlayer _x) && (side (group _x) == west)
} count playableUnits;

if (_cops < 4) exitWith 
{
	hint format ["Le casino ne peut etre braquer pour le moment, il y a %1 policier(s) en ligne.", _cops];};
	if(vehicle player != _robber) exitWith { hint "Vous devez laisser votre véhicule ici !";};
	if (alive _robber && {currentWeapon _robber != ""} && {_funds > 0}) then 
	{
		hint format ["Braquage en cours...!S'il vous plaît patientez %1 secondes.",_timer];
		_shop switchMove "AmovPercMstpSsurWnonDnon";
		_shop removeAction _action;
		[[2,"€€€ Quelqu'un est en train de piller le casino €€€"],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		[[getPlayerUID _robber,name _robber,"489"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		while {true} do
		{
			hintSilent format ["%1 seconde(s) restante(s). Tenez vous à proximité de la zone !",_timer];
			sleep 1;
			_timer = _timer - 1;
			_dist = _robber distance _shop;
			if (!alive _robber) exitwith
			{
				_shop switchMove "";
				_action = _shop addAction["Braquer le casino",life_fnc_casino];
			};
			if (_dist >= 40) exitwith 
			{
			hint "Le braquage a échoué!";
			_shop switchMove "";
			_action = _shop addAction["Braquer le casino",life_fnc_casino];
		};
		if(_timer < 1) exitWith 
		{ 
			_success = true;
		};
	};
	if(!_success) exitWith {};
	life_cash = life_cash + _funds;
	hint format["a volé %1 €",_funds];
	_shop switchMove "";
	_funds = 0;
	sleep 18000;
	_action = _shop addAction["Braquer le casino",life_fnc_casino];
};