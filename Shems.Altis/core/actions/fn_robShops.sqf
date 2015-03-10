private["_robber","_shop","_kassa","_ui","_progress","_pgText","_cP","_rip","_pos"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_kassa = 1000;
_action = [_this,2] call BIS_fnc_param;
_rip = false;

if(side _robber != civilian) exitWith {hint "Tu ne peux pas braquer se magasin!";};
if(_robber distance _shop > 5) exitWith {hint "Tu dois être plus prêt pour le braquer!";};

if (_rip) exitWith {hint "Braquage en cours!";};
if (vehicle player != _robber) exitWith {hint "Sort de ton véhicule!";};

if !(alive _robber) exitWith {};
if (currentWeapon _robber == "") exitWith {hint "Tu, as besoin d'une arme!";};
if (_kassa == 0) exitWith {hint "Il n'y a pas d'argent!";};

_rip = true;
_kassa = 10000 + round(random 10000);
_shop removeAction _action;
_shop switchMove "AmovPercMstpSsurWnonDnon";
_chance = random(100);
if(_chance >= 85) then 
{
	hint "Une alarme silencieuse à été activé, la police à été avertie!";
	[[1,format["ALARME! - Magasin: %1 est entrain de se faire braquer!", _shop]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
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
_pgText ctrlSetText format["Braquage en cours, reste à proximité (5m) (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;
 
if(_rip) then
{
	while{true} do
	{
		sleep 0.95;
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["Braquage en cours, reste à proximité (5m) (%1%2)...",round(_cP * 100),"%"];
		_Pos = position player;
		_marker = createMarker ["Marker200", _Pos];
		"Marker200" setMarkerColor "ColorRed";
		"Marker200" setMarkerText "!ATTENTION! BRAQUAGE";
		"Marker200" setMarkerType "mil_warning";			
		if(_cP >= 1) exitWith {};
		if(_robber distance _shop > 10.5) exitWith {};
		if!(alive _robber) exitWith {};
	};
	if!(alive _robber) exitWith {_rip = false;};
	if(_robber distance _shop > 10.5) exitWith 
	{ 
		deleteMarker "Marker200"; 
		_shop switchMove ""; 
		hint "Tu dois rester à proximité pour le braquage! - Maintenant la caisse est bloqué."; 5 cutText ["","PLAIN"]; 
		_rip = false; 
	};
	5 cutText ["","PLAIN"];
	titleText[format["Tu as volé %1 €, mais cours! La police arrive...",[_kassa] call life_fnc_numberText],"PLAIN"];
	life_cash = life_cash + _kassa;
	_rip = false;
	life_use_atm = false;
	sleep (30 + random(180));
	life_use_atm = true;
	if!(alive _robber) exitWith {};
	[[getPlayerUID _robber,_robber getVariable["realname",name _robber],"212"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
};
sleep 300;
deleteMarker "Marker200";
_action = _shop addAction["Braquer le magasin",life_fnc_robShops];	
_shop switchMove "";