private["_house","_house2","_mode","_player","_durationOfRentOfRent","_convert","_houseCfg","_action"];
_house = _this select 0;
_mode = _this select 1;
_house2 = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;
_player = player;
_RentDateCheck = false;

diag_log format ["fn_getRentDate : _house: %1", _house];
diag_log format ["fn_getRentDate : _mode: %1", _mode];
diag_log format ["fn_getRentDate : _house2: %1", _house2];
diag_log format ["fn_getRentDate : _player: %1", _player];

if(_mode == 0) then
{
	[[_house, _player,0],"D41_fnc_queryHouseRent",true,false] call life_fnc_MP;
	hint "Association des locataires ...";
	sleep 2;
	life_convertLocation = 0;
	life_take = 0;
	_durationOfRent = player getVariable["life_durationOfRent",[0]];
	_convert = (_durationOfRent select 0) * 4;
	if(isNil "_convert") exitwith {_RentDateCheck = true;};
	life_convertLocation = _convert;
	while {true} do 
	{
		if(life_convertLocation <= 23) exitWith {};
		if(life_convertLocation >= 24) then {life_take = life_take + 1;};
		life_convertLocation = life_convertLocation - 24;
	};
	diag_log format ["fn_getRentDate : life_take = %1  || life_convertLocation(Heures) = %2",life_take, life_convertLocation];
	hint format ["Temps de location restante : %1 Jour(s) et %2 Heure(s)",life_take, life_convertLocation];
};

if(_mode == 1) then
{
	_houseCfg = [(typeOf _house2)] call life_fnc_houseConfig;
	if(isNull _house2) exitWith {};
	if(count _houseCfg == 0) exitWith {};
	_action = [
	format["Les frais de location pour 7 jours supplémentaires sont de <t color='#8cff9b'>%1 €</t>.<br/> Voulez-vous payer le loyer?",
	[(_houseCfg select 0)] call life_fnc_numberText],"Louer","Payer le loyer","Annuler"
	] call BIS_fnc_guiMessage;

	if(_action) then
	{
		life_convertLocation = 0;
		life_take = 0;
		if(!(_house2 isKindOf "House_F")) exitWith {};
		if(life_atmmoney < (_houseCfg select 0)) exitWith {hint "Vous n'avez pas assez d'argent en banque."};
		life_atmmoney = life_atmmoney - (_houseCfg select 0);
		[[_house, _player,1],"D41_fnc_queryHouseRent",true,false] call life_fnc_MP;
		hint "Association de locataires ...";
		sleep 1;
		[[_house, _player,0],"D41_fnc_queryHouseRent",true,false] call life_fnc_MP;
		sleep 2;
		_durationOfRent = player getVariable["life_durationOfRent",[0]];
		_convert = (_durationOfRent select 0) * 4;
		if(isNil "_convert") exitwith {_RentDateCheck = true;};
		life_convertLocation = _convert;
		while{true} do 
		{
			if(life_convertLocation <= 23) exitWith {};
			if(life_convertLocation >= 24) then {life_take = life_take + 1;};
			life_convertLocation = life_convertLocation - 24;
		};
		hint format ["La nouvelle durée restante du bail est de %1 Jour(s) et %2 Heure(s)",life_take, life_convertLocation];
	};
};

if(_RentDateCheck) exitWith {hint "Impossible de trouver la location, si vous pensez que c'est une erreur, contactez l'administration."};