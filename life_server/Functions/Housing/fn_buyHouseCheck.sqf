private["_house","_uid","_housePos","_query","_mustBuy"];

_uid = [_this,0,"",[""]] call BIS_fnc_param;
_player = _this select 1;
_query = format["SELECT COUNT(*) FROM houses WHERE pid = '%1'", _uid];
waitUntil{!DB_Async_Active};
_queryResult = [_query,2] call DB_fnc_asyncCall;
_mustBuy = _player setVariable ["life_CanBuyHouse",_queryResult select 0,true];