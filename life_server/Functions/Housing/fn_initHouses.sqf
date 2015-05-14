waitUntil{!DB_Async_Active};
_query = format["DELETE FROM houses WHERE pid NOT IN (SELECT f.playerid FROM players f)"];
[_query,2] call DB_fnc_asyncCall;

private["_queryResult","_query","_count","_abc"];
waitUntil{!DB_Async_Active};
_count = (["SELECT COUNT(*) FROM houses WHERE owned='1'",2] call DB_fnc_asyncCall) select 0;

_abc = 1;
for [{_x=0},{_x<=_count},{_x=_x+10}] do 
{
	waitUntil{!DB_Async_Active};
	_query = format["SELECT houses.id, houses.pid, houses.pos, players.name FROM houses INNER JOIN players ON houses.pid=players.playerid WHERE houses.owned='1' LIMIT %1,10",_x];
	_queryResult = [_query,2,true] call DB_fnc_asyncCall;
	if(count _queryResult == 0) exitWith {};
	{
		_pos = call compile format["%1",_x select 2];
		_house = nearestBuilding _pos;
		_house setVariable["house_owner",[_x select 1,_x select 3],true];
		_house setVariable["house_owned",true,true];
		_house setVariable["house_id",_x select 0,true];
		_house setVariable["locked",true,true];
		_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
		for "_i" from 1 to _numOfDoors do 
		{
			_house setVariable[format["bis_disabled_Door_%1",_i],1,true];
		};
		_abc = _abc + 1;
	} foreach _queryResult;
};
life_HouseInitDone = true;