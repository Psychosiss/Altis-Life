private ["_bet","_dialog","_jackpot","_cash"];

disableSerialization;

_bet = _this;
player setVariable ["slotmachine_bet", _bet];

createDialog "life_slotmachine_menu";

_dialog = findDisplay 88800;
_jackpot = _dialog displayCtrl 88804;
_cash = _dialog displayCtrl 88807;
_cash ctrlSetText format ["Vous argent: %1 €", [life_cash] call life_fnc_formatMoney];

life_jackpot = nil;
life_getJackpot = player;
publicVariableServer "life_getJackpot";
waitUntil {!isNil {life_jackpot}};

_jackpot ctrlSetText format ["Jackpot Actuel: %1 €", [life_jackpot] call life_fnc_formatMoney];