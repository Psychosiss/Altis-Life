private["_cash","_bank","_player","_index","_zeromoney","_arr","_deltat","_delta","_old","_new","_oldtime","_time_diff","_money_time_over_full","_money_time_over_mot","_message","_money","_checktresholds","_result","_query","_uid","_pname","_money_diff", "_ret"];

_cash = _this select 0;
_bank = _this select 1;
_uid = _this select 2;
_pname = [_this, 3, "<NONAME>"] call BIS_fnc_param;

if(typeName _cash == "STRING") then { _cash = parseNumber _cash; };
if(typeName _bank == "STRING") then { _bank = parseNumber _bank; };

_money = _cash + _bank;
_checktresholds = true;
_message = "No message (OK)";

_index = -1;

{
	if((_x select 0) == _uid) exitWith
	{
		_index = _forEachIndex;
	};
} foreach anticheat_mot_values;

if(_index == -1) then
{
	anticheat_mot_values set [count anticheat_mot_values, [_uid, 0, _money, time] ];
	_checktresholds = false;
} else {
	_arr = anticheat_mot_values select _index;
	_zeromoney = _arr select 2;	
	_oldtime = _arr select 3;
	
	if(_money <= _zeromoney) then
	{
		_arr set [2, _money];
		_checktresholds = false;
		diag_log format["<* ANTICHEAT *> Joueur %1 (id: %2) Updated zeromoney from %3 to %4", _pname,_uid,_zeromoney,_money];
	} else {
		_old = _arr select 1;
		_delta = _money - _zeromoney;
		_new = _old + _delta;
		_arr set [1, _new];
		_arr set [2, _money];
		_checktresholds = true;
	};
};

if(!_checktresholds) exitWith
{
	diag_log format["<* ANTICHEAT *> Player %1 (id: %2) Treshold checking skipped.", _pname,_uid];
};

if(_index != -1) then
{
	_arr = anticheat_mot_values select _index;
	_money_diff = _arr select 1;
	_time_diff = time - (_arr select 3);
	_money_time_over_full = _money_diff / _time_diff;
	_money_time_over_mot = (anticheat_mot_timeconst / _time_diff) * _money_diff;

	diag_log format["<* ANTICHEAT *> Player %1 (id: %2) || MONEY-COMPLETE ($%3 in %4s) ($%5 in %6s)", _pname, _uid, _money_time_over_mot, anticheat_mot_timeconst, _money_diff, _time_diff];	

	_message = "OK";
	
	switch(true) do 	
	{
		case (_money_time_over_mot >= anticheat_mot_treshold_ban):
		{
			_message = format ["!!!DETECTED BAN!!! $%1/%2s (didn't ban, yet)", [_money_time_over_mot] call life_fnc_numberText, anticheat_mot_timeconst];
			diag_log"<* ANTICHEAT *> BAN THRESHOLD VIOLATED!!!";
		};

		case (_money_time_over_mot >= anticheat_mot_treshold):
		{
			_message = format ["!WARNING! $%1/%2s", [_money_time_over_mot] call life_fnc_numberText, anticheat_mot_timeconst];
			diag_log"<* ANTICHEAT *> WARNING threshold violated!!!";
		};

		default
		{
			_message = format ["OK $%1/%2s", [_money_time_over_mot] call life_fnc_numberText, anticheat_mot_timeconst];
		};
	};
};

_message;