private["_query","_queryResult"];

_query = format["SELECT id, owner, name, maxmembers, bank, members FROM gangs WHERE active='1' AND members LIKE '%2%1%2'",_this,"%"];
waitUntil{!DB_Async_Active};
_queryResult = [_query,2,true] call DB_fnc_asyncCall;

if(count _queryResult > 0) then 
{
	missionNameSpace setVariable[format["gang_%1",_this],_queryResult select 0];
} else {
	missionNameSpace setVariable[format["gang_%1",_this],_queryResult];
};