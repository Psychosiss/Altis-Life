private["_allVeh","_owners","_trunk","_dbInfo","_uid","_plate","_typeof","_e","_exception","_vehNotAllowed"];

_allVeh = allMissionObjects "Car" + allMissionObjects "Air" + allMissionObjects "Ship";
while {true} do
{
	{
		_typeof = typeOf _x;
		if (_typeof in _vehNotAllowed) then 
		{
			deleteVehicle _x;
		} else {
			_owners = _x getVariable ["vehicle_info_owners",[]];
			_trunk = _x getVariable ["Trunk",[]];
			_dbInfo = _x getVariable["dbInfo",[]];
			if(count _dbInfo > 0) then 
			{
				_uid = _dbInfo select 0;
				_plate = _dbInfo select 1;
			} else {
				_uid = "UNDEFINED";
				_plate = "UNDEFINED";
			};
		} foreach _allVeh;
		sleep 240;
	};
};