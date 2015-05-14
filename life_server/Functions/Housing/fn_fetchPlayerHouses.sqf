private["_GangQuery","_GangQueryResult","_query","_houses","_DB_fnc_mresToArray","_array","_sel","_house","_HouseCheck2","_containerData"];
if(_this == "") exitWith {};

_DB_fnc_mresToArray =
{
	private "_array";
	_array = [_this,0,"",[""]] call BIS_fnc_param;
	if(_array == "") exitWith {[]};
	_array = toArray(_array);
	for "_i" from 0 to (count _array)-1 do
	{
		_sel = _array select _i;
		if(_sel == 96) then
		{
			_array set[_i,39];
		};
	};
	_array = toString(_array);
	_array = call compile format["%1", _array];
	_array;
};
_return = [];
_GangQuery = format["SELECT id FROM gangs WHERE active='1' AND members LIKE '%2%1%2'",_this,"%"];
waitUntil{!DB_Async_Active};
_GangQueryResult = [_GangQuery,2] call DB_fnc_asyncCall;
_query = format["SELECT pid, pos, inventory, containers FROM houses WHERE (pid='%1' OR gid='%2') AND owned='1'",_this, _GangQueryResult select 0];
waitUntil{!DB_Async_Active};
_houses = [_query,2,true] call DB_fnc_asyncCall;

{
	_HouseCheck2 = true;
	_pos = call compile format["%1",_x select 1];
	_HouseCheck = nearestObjects [_pos,["Box_IND_Grenades_F","B_supplyCrate_F"], 5];
	if(count _HouseCheck != 0) then {_HouseCheck2 = false;};
	_house = nearestBuilding _pos;
	_house allowDamage false;
	_containers = [];
	if(_HouseCheck2)then
	{
		_house setVariable["slots",[],true];
		if(!isNil {(_house getVariable "containers")}) then 
		{
			{
				if(!isNull _x) then 
				{
					deleteVehicle _x;
				};
			} foreach (_house getVariable "containers");
		};
	};
	_containerData = [_x select 2] call _DB_fnc_mresToArray;
	if(typeName _containerData == "STRING") then {_containerData = call compile format["%1", _containerData];};
	{
		if(count _x == 0) exitWith {};
		_className = _x select 0;
		_weapons = (_x select 1) select 0;
		_magazines = (_x select 1) select 1;
		_items = (_x select 1) select 2;
		_backpacks = (_x select 1) select 3;
		_positions = [_house] call life_fnc_getBuildingPositions;
		_pos = [0,0,0];
		_Dir = 0;
		{
			_slots = _house getVariable ["slots",[]];
			if(!(_forEachIndex in _slots)) exitWith
			{
				_slots pushBack _forEachIndex;
				if(_HouseCheck2)then
				{
					_house setVariable["slots",_slots,true];
				};
				_pos = [(_x select 0),(_x select 1),(_x select 2)];
				_Dir = (_x select 3);
			};
		} foreach _positions;
		if(_pos isEqualTo [0,0,0]) exitWith {};
		if(_HouseCheck2)then
		{
			_container = createVehicle[_className,_pos,[],0,"NONE"];
			waitUntil{!isNil "_container"};
			_container allowDamage false;
			_HouseDir = getDir _house;
			_Dir = (_HouseDir - _Dir);
			_container setDir _Dir;
			_container setVectorUp [0,0,1];
			_container setPos _pos;
			_containers pushBack _container;
			clearWeaponCargoGlobal _container;
			clearItemCargoGlobal _container;
			clearMagazineCargoGlobal _container;
			clearBackpackCargoGlobal _container;
			{
				_weaponCount = (_weapons select 1) select _forEachIndex;
				_container addWeaponCargoGlobal [_x,_weaponCount];
			} foreach (_weapons select 0);

			{
				_magazineCount = (_magazines select 1) select _forEachIndex;
				_container addMagazineCargoGlobal [_x,_magazineCount];
			} foreach (_magazines select 0);

			{
				_itemCount = (_items select 1) select _forEachIndex;
				_container addItemCargoGlobal [_x,_itemCount];
			} foreach (_items select 0);

			{
				_backpackCount = (_backpacks select 1) select _forEachIndex;
				_container addBackpackCargoGlobal [_x,_backpackCount];
			} foreach (_backpacks select 0);
		};
		sleep 0.25;
	} foreach _containerData;
	if(_HouseCheck2)then
	{
		_house setVariable["containers",_containers,true];
	};
	_return pushBack [_x select 1,_containers];
} foreach _houses;
missionNamespace setVariable[format["houses_%1",_this],_return];