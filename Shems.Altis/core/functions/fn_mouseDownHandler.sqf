private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh"];
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_handled = false;

switch (_code) do 
{
	case 0: 
	{
		_vehicle = vehicle player;
		if(!dialog && !visibleMap && playerSide == west && life_cop_level >= 5 && _vehicle != player && (driver _vehicle) == player && (typeOf _vehicle == "B_MRAP_01_F" || typeOf _vehicle == "I_MRAP_03_F")) then 
		{
			if(isNil "life_hornLogic") then 
			{
				life_hornLogic = objNull;
			};

			if(isNull life_hornLogic) then 
			{
				_vehicle removeWeaponGlobal "TruckHorn2";
				_vehicle removeWeaponGlobal "TruckHorn";
				life_hornLogic = "Land_ClutterCutter_small_F" createVehicle ([0,0,0]);
				life_hornLogic attachTo [_vehicle, [0,1,0]];
				life_hornLogic setVariable ["startTime", time, false];
				[[_vehicle, life_hornLogic], "life_fnc_airHorn", true, false, false] call BIS_fnc_MP;
				_handled = true;
			};
		};
	};
};

_handled