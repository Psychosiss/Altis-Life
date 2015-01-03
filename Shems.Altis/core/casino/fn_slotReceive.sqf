disableSerialization;
_delay = 7;

life_slot_update = 
{
	private ["_machine", "_bet", "_display", "_jackpot", "_bettext", "_won"];
	disableSerialization;
	_won = player getVariable ["slotmachine_lastwon", 0];
	_pot = _this select 0;
	_bet = _this select 1;
	_dialog = findDisplay 88800;
	_jackpot = _dialog displayCtrl 88804;
	_bettext = _dialog displayCtrl 88805;
	_last = _dialog displayCtrl 88806;
	_cash = _dialog displayCtrl 88807;
	_jackpot ctrlSetText format ["Jackpot Actuel: %1 $", [_pot] call life_fnc_formatMoney];
	_bettext ctrlSetText format ["Votre mise: %1 $", [_bet] call life_fnc_formatMoney];
	_last ctrlSetText format ["Dernière victoire: %1 $", [_won] call life_fnc_formatMoney];
	_cash ctrlSetText format ["Votre argent: %1 $", [life_cash] call life_fnc_formatMoney];
};

_bet = _this select 0;
_r1 = _this select 1;
_r2 = _this select 2;
_r3 = _this select 3;
_won = _this select 4;
_jackpot = _this select 5;

[(_jackpot - _won - _bet), _bet] call life_slot_update;

life_no_injection = true;
life_cash = life_cash - _bet;

_bar = 0;
_seven = 1;
_bell = 2;
_diamond = 3;
_grapes = 4;
_plum = 5;
_cherry = 6;
_heart = 7;
_display = findDisplay 88800;

player say3D "slot_spin";
sleep 0.5;
{
	_ctrl = _display displayCtrl _x;
	_ctrl ctrlSetText "images\slots\SlotMachine\spinning.paa";
	sleep 1.0;
} forEach [88801, 88802, 88803];

sleep 1;
{
	_r = _x select 0;
	_idc = _x select 1;
	_ctrl = _display displayCtrl _idc;
	switch (_r) do 
	{
		case _bar: 
		{
			_ctrl ctrlSetText "images\slots\SlotMachine\bar.paa"
		};
		
		case _seven: 
		{
			_ctrl ctrlSetText "images\slots\SlotMachine\seven.paa"
		};
		
		case _bell: 
		{
			_ctrl ctrlSetText "images\slots\SlotMachine\bell.paa"
		};
		
		case _diamond: 
		{
			_ctrl ctrlSetText "images\slots\SlotMachine\diamond.paa"
		};
		
		case _grapes: 
		{
			_ctrl ctrlSetText "images\slots\SlotMachine\grapes.paa"
		};
		
		case _plum: 
		{
			_ctrl ctrlSetText "images\slots\SlotMachine\plum.paa"
		};
		
		case _cherry: 
		{
			_ctrl ctrlSetText "images\slots\SlotMachine\cherry.paa"
		};
		
		case _heart: 
		{
			_ctrl ctrlSetText "images\slots\SlotMachine\heart.paa"
		};
	};
	sleep 0.5;
} forEach [[_r1, 88801], [_r2, 88802], [_r3, 88803]];

if(_won > 0) then 
{
	player say3D "slot_payoff";
	life_no_injection = true;
	life_cash = life_cash + _won;
};

player setVariable ["slotmachine_lastwon", _won];

[_jackpot, _bet] call life_slot_update;

ctrlEnable [88808, true];