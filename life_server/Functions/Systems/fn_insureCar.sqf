private["_vid","_pid","_query","_sql", "_unit", "_price", "_thread"];

_vid = [_this,0,-1,[0]] call BIS_fnc_param;
_pid = [_this,1,"",[""]] call BIS_fnc_param;
_unit = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;
_price = [_this,3,0,[0]] call BIS_fnc_param;

_query = format["UPDATE vehicles SET insure='1' WHERE pid='%1' AND id='%2'",_pid,_vid];

waitUntil {!DB_Async_Active};
_thread = [_query,1] call DB_fnc_asyncCall;