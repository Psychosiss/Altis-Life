#define CLEANUP_INTERVAL (0.5 * 60)
#define CLEANUP_TIME_VEHICLE (7 * 60) 
#define CLEANUP_TIME_VEHICLEDEAD (2 * 60) 
#define CLEANUP_TIME_VEHICLEDISABLED (20 * 60) 
#define CLEANUP_TIME_ITEM (10 * 60)

_fnc_resetCleanup = 
{
	(_this select 0) setVariable ["cleanup_tick", nil];
};

_fnc_cleanup = 
{
	private ["_object","_delay","_tick"];
	_object = _this select 0;
	_delay = _this select 1;
	_tick = _object getVariable "cleanup_tick";
	if (_object getVariable ["cleanup_ignore", false]) exitWith {};
	if ( !isNil "_tick" ) then 
	{
		if ( diag_tickTime >= _tick ) then 
		{
			deleteVehicle _object;
		};
	} else {
		_object setVariable ["cleanup_tick", diag_tickTime + _delay];
	};
};

while {true} do 
{
	uiSleep CLEANUP_INTERVAL;
	diag_log format ["%1 :DEBUT: %2", _fnc_scriptName, diag_tickTime];
	if (isServer) then 
	{
		{
			deleteVehicle _x;
		} count allMissionObjects "CraterLong";

		{
			deleteVehicle _x;
		} count allMissionObjects "Ruins";

		{
			deleteVehicle _x;
		} count allMissionObjects "#destructioneffects";

		{
			if (local _x && 
			{
				_x getVariable ["corpse", false]}) then 
				{
					detach _x;
					deleteVehicle _x;
				};
		} count allDeadMen;
		{[_x, CLEANUP_TIME_ITEM] call _fnc_cleanup;} count allMissionObjects "GroundWeaponHolder";
		{[_x, CLEANUP_TIME_ITEM] call _fnc_cleanup;} count allMissionObjects "WeaponHolderSimulated";
		{
			switch true do 
			{
				case ([_x, ["Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F","Land_Can_V3_F","Land_Suitcase_F"]] call life_fnc_isKindOf): 
				{
					[_x, CLEANUP_TIME_ITEM] call _fnc_cleanup;
				};

				case ([ _x, ["Car_F","Tank_F","Ship_F","Air"]] call life_fnc_isKindOf): 
				{
					if (!alive _x) exitWith 
					{
						[_x, CLEANUP_TIME_VEHICLEDEAD] call _fnc_cleanup;
					};

					if (!canMove _x) exitWith 
					{
						[_x, CLEANUP_TIME_VEHICLEDISABLED] call _fnc_cleanup;
					};

					_ownerUID = _x getVariable ["vehicle_owner",""];

					if (count crew _x <= 0 && {isNull (_ownerUID call life_fnc_unitByUID )}) then 
					{
						[ _x, CLEANUP_TIME_VEHICLE ] call _fnc_cleanup;
					} else {
						[ _x ] call _fnc_resetCleanup;
					};
				};
			};
		} count vehicles;
	};

	{
		_group = _x;
		if (local _group && {count units _group <= 0}) then 
		{
			deleteGroup _x;
		};
	} forEach allGroups;
	diag_log format ["%1 :FIN: %2", _fnc_scriptName, diag_tickTime];
};