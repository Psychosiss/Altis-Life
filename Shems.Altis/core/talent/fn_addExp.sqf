private["_exp","_level","_multi"];

_exp = _this select 0;
_level = [0] call life_fnc_returnInfo;
_multi = 1;
diag_log format ["Niveau: %1 | Experience: %2",_level, _exp];
if(_level >= 1 && _level <= 10) then {_multi = 1;};
if(_level > 10 && _level <= 15) then {_multi = 1.5;};
if(_level > 15 && _level <= 20) then {_multi = 2;};
if(_level > 20 && _level <= 30) then {_multi = 2.5;};

_exp = round(_exp * _multi);

life_exp = life_exp + _exp;