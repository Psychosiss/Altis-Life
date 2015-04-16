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
		if(vehicle player != player) then 
		{
			if(isNil "life_hornLogic") then 
			{
				life_hornLogic = objNull;
			};

			if(!isNull life_hornLogic) then 
			{
				[] spawn 
				{
					_hornTime = time - (life_hornLogic getVariable ["startTime",0]);
					_diff = 0.3 - _hornTime;
					if(_diff > 0) then 
					{
						sleep _diff;
					};
					deleteVehicle life_hornLogic;
					life_hornLogic = objNull;
				};
			};
		};
	};
};