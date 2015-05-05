private["_value","_gFund","_uid"];

_value = parseNumber(ctrlText 2702);
_uid = getPlayerUID player;

if(_value > 1000000) exitWith {hint "Vous ne pouvez pas déposer plus de 1.000.000 € à la fois.";};
if((playerSide == west) OR (playerSide == independent)) exitWith {hint "Arrête de glitcher bordel!";};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isNumeric)) exitWith {hint "La quantité saisie n'est pas une valeur numérique."};
if (((group player getVariable "gang_owner") != _uid) && ((player getVariable "gang_rank") < 2)) exitWith {hint parseText "Tu dois etre leader du gang pour retirer les fonds du gang."};
if(_value > group player getVariable "gang_bank") exitWith {hint "Il n'y as pas assez d'argent sur le compte du gang"};

if(group player getVariable["gang_bank_inUse",true]) exitWith {hint "Quelqu'un utilise déjà le compte du Gang.";};
group player setVariable["gang_bank_inUse",true,true];

[_value] spawn
{
	private "_value";
	_value = _this select 0;
	if(_value < 0) exitWith {};
	sleep (random(2));
	if(_value > group player getVariable "gang_bank") exitWith {hint "Il n'y as pas assez d'argent sur le compte du gang"};
	life_money = life_money + _value;
	_gFund = (group player) getVariable ["gang_bank",0];
	_gFund = _gFund - _value;
	(group player) setVariable ["gang_bank",_gFund,true];
	hint parseText format["Tu as retiré <t color='#d16428'>%1 €</t> sur le compte en banque du gang",[_value] call life_fnc_numberText];
	[] call life_fnc_atmMenu;
	[6] call SOCK_fnc_updatePartial;
	[[1,group player],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
	group player setVariable["gang_bank_inUse",false,true];
};