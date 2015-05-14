private["_pos","_player","_mode","_query","_queryResult","_durationOfRentOfRent"];
_pos = _this select 0;
_player = _this select 1;
_mode = _this select 2;

if(_mode == 0)then
{
	_query = format["SELECT rentdate FROM houses WHERE pos='%1' AND owned='1'", _pos];
	waitUntil{!DB_Async_Active};
	_queryResult = [_query,2] call DB_fnc_asyncCall;
	_durationOfRentOfRent = _player setVariable ["life_durationOfRentOfRent",_queryResult,true];
};

if(_mode == 1)then
{
	_query = format["UPDATE houses SET rentdate = rentdate + 42 WHERE pos='%1'",_pos];
	waitUntil {!DB_Async_Active};
	_thread = [_query,false] spawn DB_fnc_asyncCall;
	waitUntil {scriptDone _thread};
};