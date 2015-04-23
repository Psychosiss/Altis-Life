private["_robber","_shop","_kassa","_ui","_progress","_pgText","_cP","_rip","_pos"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_action = [_this,2] call BIS_fnc_param;
 
if(side _robber != civilian) exitWith {hint "Tu ne peux pas braquer se magasin!";};
if(_robber distance _shop > 2) exitWith {hint "Tu dois être plus prêt pour le braquer!";};
 
if !(_kassa) then {_kassa = 1000;};
if (_rip) exitWith {hint "Braquage en cours!";};
if (vehicle player != _robber) exitWith {hint "Sort de ton véhicule!";};
 
if !(alive _robber) exitWith {};
if(!([false,"boltcutter",1] call life_fnc_handleInv)) exitWith {"Vous n'avez pas de pince coupante";};
if (_kassa == 0) exitWith {hint "Il n'y a pas d'argent!";};
 
_rip = true;
_kassa = 20000 + round(random 30000);
_shop removeAction _action;
_shop switchMove "AmovPercMstpSsurWnonDnon";
_chance = random(100);
if(_chance >= 85) then 
{ 
	hint "Une alarme silencieuse à été activé, la police à été avertie!";
	[[1,format["ALARME! - Distributeur: %1 est entrain de se faire braquer!", _shop]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
};
 
_cops = (west countSide playableUnits);
if(_cops < 2) exitWith 
{
	[[_vault,-1],"disableSerialization;",false,false] spawn life_fnc_MP; 
	hint "Il n'y à pas assez de policier pour braquer le magasin!";
};
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Braquage en cours, reste à proximité (2m) (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;
 
if(_rip) then
{
	while{true} do
	{
		sleep 0.85;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["Braquage en cours, reste à proximité (2m) (1%1)...","%"];
		_Pos = position player;
		_marker = createMarker ["Marker200", _Pos];
		"Marker200" setMarkerColor "ColorRed";
		"Marker200" setMarkerText "!ATTENTION! Braquage !ATTENTION!";
		"Marker200" setMarkerType "mil_warning";
		if(_cP >= 1) exitWith {};
		if(_robber distance _shop > 2.5) exitWith {};
		if!(alive _robber) exitWith {};
	};

	if!(alive _robber) exitWith {_rip = false;};
	if(_robber distance _shop > 2.5) exitWith 
	{ 
		deleteMarker "Marker200";
		_shop switchMove ""; 
		hint "Vous devez resté a 2 metres du distributeur, maintenant il est bloqué."; 
		5 cutText ["","PLAIN"]; 
		_rip = false; 
	};

	5 cutText ["","PLAIN"];
	titleText[format["Tu as volé %1 €, mais cours! La police arrive...",[_kassa] call life_fnc_numberText],"PLAIN"];
	deleteMarker "Marker200";
	life_money = life_money + _kassa;
	_rip = false;
	life_use_atm = false;
	sleep (30 + random(180));
	life_use_atm = true;
	if!(alive _robber) exitWith {};
	[[getPlayerUID _robber,name _robber,"211A"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
};
sleep 300;
_action = _shop addAction["Braquer le distributeur",life_fnc_robATM];
_shop switchMove "";