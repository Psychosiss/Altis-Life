IL_DevMod = false;

waitUntil { time > 0 };
IL_Script_Inst = time;

if (IL_DevMod) then
{
	Player globalChat Format["IgiLoad ""%1"" IN.", IL_Script_Inst];
};

_obj_main = _this select 0;
_obj_main_type = (typeOf _obj_main);

if (isnil "IL_Variables") then
{
	IL_Variables = true;
	IL_Check_Veh_Min = 30;
	IL_Check_Veh_Max = 60;
	IL_CDamage = 0;
	IL_Action_LU_Priority = 30;
	IL_Action_O_Priority = 0;
	IL_Action_S_Priority = 0;
	IL_Num_Slots_OFFROAD = -2;
	IL_Num_Slots_VAN = -3;
	IL_Num_Slots_MOHAWK = -7;
	IL_num_Slots_CHINOOK = -8;
	IL_Num_Slots_KAMAZ = -4;
	IL_Num_Slots_TEMPEST = -5;
	IL_Num_Slots_HEMTT = -6;
	IL_Num_Slots_MH9 = -1;
	IL_Num_Slots_C130J = -12;
	IL_Num_Slots_C17 = -22;
	IL_Para_Drop_ATL = 50;
	IL_Para_Jump_ATL = 30;
	IL_Para_Drop_Open_ATL = 150;
	IL_Para_Jump_Open_ATL = 150;
	IL_Para_Drop_Velocity = true;
	IL_Para_Jump_Velocity = true;
	IL_Para_Smoke = true;
	IL_Para_Light = true;
	IL_Para_Smoke_Add = true;
	IL_Para_Light_Add = true;
	IL_Para_Smoke_Default = "SmokeshellGreen";
	IL_Para_Light_Default = "Chemlight_green";
	IL_Para_Smoke_Veh = "SmokeshellBlue";
	IL_Para_Light_Veh = "Chemlight_blue";
	IL_Can_Inside = true;
	IL_Can_CoPilot = true;
	IL_Can_Outside = true;
	IL_SDistL = 2.5;
	IL_SDistL_Heli_offset = 1;
	IL_LU_Speed = 10;
	IL_LU_Alt = 3;
	IL_Ramp = true;
	IL_Mass = true;

	IL_Supported_Vehicles_OFFROAD = ["C_Offroad_01_F","B_G_Offroad_01_F"];
	IL_Supported_Vehicles_VAN = ["C_Van_01_box_F","B_G_Van_01_transport_F","C_Van_01_transport_F"];
	IL_Supported_Vehicles_HEMTT = ["B_Truck_01_covered_F","B_Truck_01_transport_F","B_Truck_01_box_F","B_mas_mar_Truck_01_transport_F"];
	IL_Supported_Vehicles_KAMAZ = ["I_Truck_02_transport_F","O_Truck_02_transport_F","I_Truck_02_covered_F","O_Truck_02_covered_F"];
	IL_Supported_Vehicles_TEMPEST = ["O_Truck_03_transport_F","O_Truck_03_covered_F"];
	IL_Supported_Vehicles_MOHAWK = ["I_Heli_Transport_02_F"];
	IL_Supported_Vehicles_MH9 = ["B_Heli_Light_01_F"];
	IL_Supported_Vehicles_All = IL_Supported_Vehicles_MH9 + IL_Supported_Vehicles_MOHAWK + IL_Supported_Vehicles_KAMAZ + IL_Supported_Vehicles_TEMPEST + IL_Supported_Vehicles_HEMTT + IL_Supported_Vehicles_VAN + IL_Supported_Vehicles_OFFROAD;
	IL_Para_Drop_Vehicles = IL_Supported_Vehicles_MH9 + IL_Supported_Vehicles_MOHAWK;
	IL_Supported_HEMTT = ["B_Truck_01_covered_F","B_Truck_01_transport_F","B_Truck_01_box_F","Marinir_Truck_01_box_FG","B_Truck_01_mover_F","B_Truck_01_ammo_F","B_Truck_01_fuel_F","B_Truck_01_medical_F","B_Truck_01_Repair_F"];
	IL_Supported_KAMAZ = ["I_Truck_02_transport_F","O_Truck_02_transport_F","I_Truck_02_covered_F","O_Truck_02_covered_F"];
	IL_Supported_TEMPEST = ["O_Truck_03_transport_F","O_Truck_03_covered_F"];
	IL_Supported_Strider = ["I_MRAP_03_F","I_MRAP_03_gmg_F","I_MRAP_03_hmg_F"];
	IL_Supported_Hunter = ["B_MRAP_01_F","B_MRAP_01_gmg_F","B_MRAP_01_hmg_F"];
	IL_Supported_Ifrit = ["O_MRAP_02_F","O_MRAP_02_gmg_F","O_MRAP_02_hmg_F"];
	IL_Supported_UGV = ["B_UGV_01_rcws_F","B_UGV_01_F","O_UGV_01_rcws_F","O_UGV_01_F","I_UGV_01_rcws_F","I_UGV_01_F"];
	IL_Supported_VAN = ["C_Van_01_box_F","B_G_Van_01_transport_F","C_Van_01_transport_F"];
	IL_Supported_OFFROAD = ["C_Offroad_01_F","B_G_Offroad_01_F","B_G_Offroad_01_armed_F"];
	IL_Supported_SUV = ["C_SUV_01_F"];
	IL_Supported_Hatchback = ["C_Hatchback_01_F","C_Hatchback_01_sport_F"];
	IL_Supported_Quadbike = ["I_Quadbike_01_F","C_Quadbike_01_F","O_Quadbike_01_F","B_G_Quadbike_01_F","B_Quadbike_01_F"];
	IL_Supported_Supply_Crate = ["B_supplyCrate_F","IG_supplyCrate_F","O_supplyCrate_F","I_supplyCrate_F","C_supplyCrate_F"];
	IL_Supported_Veh_Ammo = ["Box_NATO_AmmoVeh_F","Box_East_AmmoVeh_F","Box_IND_AmmoVeh_F","Land_CargoBox_V1_F","ASC_B_box"];
	IL_Supported_Barrel = ["Land_BarrelEmpty_F","Land_BarrelEmpty_grey_F","Land_BarrelSand_F","Land_BarrelSand_grey_F","Land_BarrelTrash_F","Land_BarrelTrash_grey_F","Land_BarrelWater_F","Land_Portable_generator_F","Land_BarrelWater_grey_F","Land_MetalBarrel_F"];
	IL_Supported_Tank = ["Land_WaterBarrel_F","Land_WaterTank_F"];
	IL_Supported_Rubberboat = ["I_Boat_Transport_01_F","O_Boat_Transport_01_F","B_G_Boat_Transport_01_F","B_Boat_Transport_01_F","C_Rubberboat","O_Lifeboat","B_Lifeboat","Marinir_duck_base_F","B_mas_mar_Boat_Transport_01_F"];
	IL_Supported_SDV = ["I_SDV_01_F","O_SDV_01_F","B_SDV_01_F","B_mas_mar_SDV_01_F"];
	IL_Supported_Box_H1 = ["Box_NATO_Wps_F","Box_East_Wps_F","Box_IND_Wps_F","Box_East_WpsLaunch_F","Box_NATO_WpsLaunch_F","Box_IND_WpsLaunch_F","Box_IND_WpsSpecial_F","Box_East_WpsSpecial_F","Box_NATO_WpsSpecial_F","Box_mas_all_rifle_Wps_F","Box_mas_us_rifle_Wps_F","Box_mas_ru_rifle_Wps_F","Box_mas_mar_NATO_equip_F","Box_mas_mar_NATO_Wps_F"];
	IL_Supported_Box_H2 = ["Box_NATO_AmmoOrd_F","Box_East_AmmoOrd_F","Box_IND_AmmoOrd_F","Box_NATO_Grenades_F","Box_East_Grenades_F","Box_IND_Grenades_F","Box_NATO_Ammo_F","Box_East_Ammo_F","Box_IND_Ammo_F","Box_IND_Support_F","Box_East_Support_F","Box_NATO_Support_F"];
	IL_Supported_Cargo20 = ["Land_Cargo20_blue_F","Land_Cargo20_brick_red_F","Land_Cargo20_cyan_F","Land_Cargo20_grey_F","Land_Cargo20_light_blue_F","Land_Cargo20_light_green_F","Land_Cargo20_military_green_F","Land_Cargo20_orange_F","Land_Cargo20_red_F","Land_Cargo20_sand_F","Land_Cargo20_white_F","Land_Cargo20_yellow_F"];
	IL_Supported_Cargo_MH9 = IL_Supported_Supply_Crate + IL_Supported_Barrel;
	IL_Supported_Cargo_Veh_Offroad = IL_Supported_Quadbike;
	IL_Supported_Cargo_NonVeh_Offroad = (IL_Supported_Supply_Crate + IL_Supported_Veh_Ammo + IL_Supported_Barrel + IL_Supported_Tank + IL_Supported_Box_H1 + IL_Supported_Box_H2);
	IL_Supported_Cargo_Offroad = IL_Supported_Cargo_Veh_Offroad + IL_Supported_Cargo_NonVeh_Offroad;
	IL_Supported_Cargo_Veh_VAN = IL_Supported_Cargo_Veh_Offroad;
	IL_Supported_Cargo_NonVeh_VAN = IL_Supported_Cargo_NonVeh_Offroad;
	IL_Supported_Cargo_VAN = IL_Supported_Cargo_Veh_VAN + IL_Supported_Cargo_NonVeh_VAN;
	IL_Supported_Cargo_Veh_Kamaz = IL_Supported_Quadbike + IL_Supported_Rubberboat + IL_Supported_SDV + IL_Supported_Hatchback + IL_Supported_UGV + IL_Supported_VAN;
	IL_Supported_Cargo_NonVeh_Kamaz = IL_Supported_Supply_Crate + IL_Supported_Veh_Ammo + IL_Supported_Barrel + IL_Supported_Tank + IL_Supported_Box_H1 + IL_Supported_Box_H2 + IL_Supported_Cargo20;
	IL_Supported_Cargo_Kamaz = IL_Supported_Cargo_Veh_Kamaz + IL_Supported_Cargo_NonVeh_Kamaz;
	IL_Supported_Cargo_Veh_HEMTT = IL_Supported_Cargo_Veh_Kamaz + IL_Supported_OFFROAD + IL_Supported_SUV;
	IL_Supported_Cargo_NonVeh_HEMTT = IL_Supported_Cargo_NonVeh_Kamaz;
	IL_Supported_Cargo_HEMTT = IL_Supported_Cargo_Veh_HEMTT + IL_Supported_Cargo_NonVeh_HEMTT;
	IL_Supported_Cargo_Veh_TEMPEST = IL_Supported_Cargo_Veh_HEMTT;
	IL_Supported_Cargo_NonVeh_TEMPEST = IL_Supported_Cargo_NonVeh_HEMTT;
	IL_Supported_Cargo_TEMPEST = IL_Supported_Cargo_Veh_TEMPEST + IL_Supported_Cargo_NonVeh_TEMPEST;
	IL_Supported_Cargo_Veh_Mohawk = IL_Supported_Quadbike + IL_Supported_Rubberboat + IL_Supported_SDV + IL_Supported_Hatchback + IL_Supported_UGV;
	IL_Supported_Cargo_NonVeh_Mohawk = IL_Supported_Supply_Crate + IL_Supported_Veh_Ammo + IL_Supported_Barrel + IL_Supported_Tank;
	IL_Supported_Cargo_Mohawk = IL_Supported_Cargo_Veh_Mohawk + IL_Supported_Cargo_NonVeh_Mohawk;
	IL_Supported_Cargo_Veh_CHINOOK = IL_Supported_Cargo_Veh_Mohawk;
	IL_Supported_Cargo_NonVeh_CHINOOK = IL_Supported_Cargo_NonVeh_Mohawk;
	IL_Supported_Cargo_CHINOOK = IL_Supported_Cargo_Veh_CHINOOK + IL_Supported_Cargo_NonVeh_CHINOOK;
	IL_Supported_Cargo_Veh_C130J = IL_Supported_Cargo_Veh_HEMTT + IL_Supported_Strider + IL_Supported_Hunter + IL_Supported_Ifrit + IL_Supported_HEMTT;
	IL_Supported_Cargo_NonVeh_C130J = IL_Supported_Cargo_NonVeh_Mohawk;
	IL_Supported_Cargo_C130J = IL_Supported_Cargo_Veh_C130J + IL_Supported_Cargo_NonVeh_C130J;
	IL_Supported_Cargo_Veh_C17 = IL_Supported_Cargo_Veh_C130J;
	IL_Supported_Cargo_NonVeh_C17 = IL_Supported_Cargo_NonVeh_C130J;
	IL_Supported_Cargo_C17 = IL_Supported_Cargo_Veh_C17 + IL_Supported_Cargo_NonVeh_C17;
};

if (isnil "IL_Procedures") then
{
	IL_Procedures = true;
	IL_Init_Veh =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format["IgiLoad ""%1"" IL_Init_Veh.", IL_Script_Inst];
		};

		private["_obj","_obj_type","_force"];
		_obj = _this select 0;
		_force = if (count _this > 1) then {_this select 1} else {false};
		_obj_type = (typeOf _obj);

		if ((isNil {_obj getVariable "default_mass"}) || (_force)) then
			{
				if (isNil {_obj getVariable "default_mass"}) then
				{
					_obj setVariable["default_mass", getMass _obj, true];
				} else {
					_obj setMass (_obj getVariable "default_mass");
				};
			};
		if (_obj_type in IL_Supported_Vehicles_MOHAWK) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_MOHAWK, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_copilot"}) || (_force)) then {_obj setVariable["can_copilot", IL_Can_CoPilot, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -2.25, true];};
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 4.5, true];};
			if ((isNil {_obj getVariable "usable_ramp"}) || (_force)) then {_obj setVariable["usable_ramp", IL_Ramp, true];};
		};
		if (_obj_type in IL_Supported_Vehicles_MH9) then
		{
			if ((isNil {_obj getVariable "box_l"}) || (_force)) then {_obj setVariable["box_l", _obj, true];};
			if ((isNil {_obj getVariable "box_r"}) || (_force)) then {_obj setVariable["box_r", _obj, true];};

			if ((isNil {_obj getVariable "box_num_l"}) || (_force)) then {_obj setVariable["box_num_l", 0, true];};
			if ((isNil {_obj getVariable "box_num_r"}) || (_force)) then {_obj setVariable["box_num_r", 0, true];};
			if ((isNil {_obj getVariable "slots_num_l"}) || (_force)) then {_obj setVariable["slots_num_l", IL_Num_Slots_MH9, true];};
			if ((isNil {_obj getVariable "slots_num_r"}) || (_force)) then {_obj setVariable["slots_num_r", IL_Num_Slots_MH9, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_copilot"}) || (_force)) then {_obj setVariable["can_copilot", IL_Can_CoPilot, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -0.48, true];};
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 1, true];};
			if ((isNil {_obj getVariable "usable_ramp"}) || (_force)) then {_obj setVariable["usable_ramp", IL_Ramp, true];};
		};
		if (_obj_type in IL_Supported_Vehicles_OFFROAD) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_OFFROAD, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -0.65, true];};
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 1.5, true];};
		};
		if (_obj_type in IL_Supported_Vehicles_VAN) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_VAN, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -0.6, true];};
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 1, true];};
		};
		if (_obj_type in IL_Supported_Vehicles_KAMAZ) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_KAMAZ, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -0.8, true];};
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", -0.5, true];};
		};
		if (_obj_type in IL_Supported_Vehicles_TEMPEST) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_TEMPEST, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -0.4, true];};
			if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 0.5, true];};
		};
		if (_obj_type in IL_Supported_Vehicles_HEMTT) then
		{
			if ((isNil {_obj getVariable "box_num"}) || (_force)) then {_obj setVariable["box_num", 0, true];};
			if ((isNil {_obj getVariable "slots_num"}) || (_force)) then {_obj setVariable["slots_num", IL_Num_Slots_HEMTT, true];};
			if ((isNil {_obj getVariable "can_load"}) || (_force)) then {_obj setVariable["can_load", true, true];};
			if ((isNil {_obj getVariable "can_outside"}) || (_force)) then {_obj setVariable["can_outside", IL_Can_Outside, true];};
			if (_obj_type in ["B_Truck_01_box_F","Marinir_Truck_01_box_FG"]) then
			{
				if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -0.4, true];};
				if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 0.8, true];};
			} else {
				if ((isNil {_obj getVariable "zload"}) || (_force)) then {_obj setVariable["zload", -0.5, true];};
				if ((isNil {_obj getVariable "load_offset"}) || (_force)) then {_obj setVariable["load_offset", 0, true];};
			};
		};
	};

	IL_Init_Box =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format["IgiLoad ""%1"" IL_Init_Box.", IL_Script_Inst];
		};

		private["_obj","_obj_type","_bbr","_p0","_p1"];
		_obj = _this select 0;
		
		_obj setVariable["attachedPos", 0, true];
		_obj setVariable["attachedTruck", _obj, true];
		_obj setVariable["doors","N", true];
		
		_obj setVariable["slots", 1, true];
		_obj setVariable["cargo_offset", 0, true];
		
		_bbr = boundingBoxReal _obj;
		_p0 = _bbr select 0;
		_p1 = _bbr select 1;
		_obj setVariable["zload_cargo", abs (_p0 select 2), true];
		
		_obj_type = (typeOf _obj);
		
		if (_obj_type in IL_Supported_Cargo20) then
		{
			_obj setVariable["slots", 6, true];
			_obj setVariable["cargo_offset", 2.6, true];
			[_obj, 2400] call IL_SetNewMass;
		};
		
		if (_obj_type in IL_Supported_HEMTT) then
		{
			_obj setVariable["slots", 10, true];
			_obj setVariable["cargo_offset", 4.2, true];
		};
		if (_obj_type in IL_Supported_Strider) then
		{
			_obj setVariable["slots", 6, true];
			_obj setVariable["cargo_offset", 2.2, true];
		};
		if (_obj_type in IL_Supported_Hunter) then
		{
			_obj setVariable["slots", 7, true];
			_obj setVariable["cargo_offset", 1.5, true];
		};
		if (_obj_type in IL_Supported_Ifrit) then
		{
			_obj setVariable["slots", 7, true];
			_obj setVariable["cargo_offset", 1.3, true];
		};
		if (_obj_type in IL_Supported_VAN) then
		{
			_obj setVariable["slots", 6, true];
			_obj setVariable["cargo_offset", 1.8, true];
		};
		if (_obj_type in IL_Supported_UGV) then
		{
			_obj setVariable["slots", 5, true];
			_obj setVariable["cargo_offset", 2.1, true];
		};
		if (_obj_type in IL_Supported_Hatchback) then
		{
			_obj setVariable["slots", 5, true];
			_obj setVariable["cargo_offset", 1.9, true];
		};
		if (_obj_type in IL_Supported_SUV) then
		{
			_obj setVariable["slots", 6, true];
			_obj setVariable["cargo_offset", 2, true];
		};
		if (_obj_type in IL_Supported_OFFROAD) then
		{
			_obj setVariable["slots", 6, true];
			_obj setVariable["cargo_offset", 2.4, true];
		};
		if (_obj_type in IL_Supported_Rubberboat) then
		{
			_obj setVariable["slots", 5, true];
			_obj setVariable["cargo_offset", 2, true];
		};
		if (_obj_type in IL_Supported_SDV) then
		{
			_obj setVariable["slots", 6, true];
			_obj setVariable["cargo_offset", 1.6, true];
		};
		if (_obj_type in IL_Supported_Quadbike) then
		{
			_obj setVariable["slots", 2, true];
			_obj setVariable["cargo_offset", 0.5, true];
		};
		if (_obj_type in IL_Supported_Veh_Ammo) then
		{
			_obj setVariable["slots", 2, true];
			_obj setVariable["cargo_offset", 0.4, true];
		};
		if (_obj_type in IL_Supported_Tank) then
		{
			if (_obj_type == "Land_WaterTank_F") then
			{
				_obj setVariable["slots", 3, true];
				_obj setVariable["cargo_offset", 1, true];
			} else {
				_obj setVariable["slots", 2, true];
				_obj setVariable["cargo_offset", 0.4, true];
			};
			_turn = true;
		};
	};

	IL_Server_SetDir =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format["IgiLoad ""%1"" IL_Server_SetDir.", IL_Script_Inst];
		};
		private ["_obj","_dir"];
		_obj = _this select 1 select 0;
		_dir = _this select 1 select 1;
		
		if (_dir < 0) then
		{
			_dir = _dir + 360;
		};
		if (_dir > 360) then
		{
			_dir = _dir - 360;
		};

		_obj setDir _dir;
		_obj setPos (getPos _obj);
	};

	"IL_SetDir" addPublicVariableEventHandler IL_Server_SetDir;

	IL_Rotate = 
	{
		private ["_obj","_to","_change"];
		
		_obj = _this select 0;
		_to = _this select 1;
		_change = _this select 2;
		
		_change = (getDir _obj + _change) - getDir _to;
		
		IL_SetDir = [_obj, _change];
		if (local _obj) then
		{
			["Cos", IL_SetDir] spawn IL_Server_SetDir;
		} else {
			if (isDedicated) then
			{
				(owner _obj) publicVariableClient "IL_SetDir";
			} else {
				publicVariableServer "IL_SetDir";
			};
		};
	};

	IL_Server_SetMass =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format["IgiLoad ""%1"" IL_Server_SetMass.", IL_Script_Inst];
		};
		private ["_obj","_mass"];
		_obj = _this select 1 select 0;
		_mass = _this select 1 select 1;
		if ((getMass _obj) != _mass) then
		{
			_obj setMass _mass;
		};
	};

	"IL_SetMass" addPublicVariableEventHandler IL_Server_SetMass;
	IL_GetCargoMass =
	{
		private ["_v","_cargo_mass"];
		_v = _this select 0;
		_cargo_mass = 0;
		if (count(attachedObjects _v) > 0) then
		{
			{
				_cargo_mass = _cargo_mass + getMass _x;
			} forEach attachedObjects _v;
		};
		_cargo_mass;
	};

	IL_GetDefaultMass =
	{
		private ["_v"];
		_v = _this select 0;
		_v getVariable "default_mass";
	};

	IL_SetNewMass =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format ["IgiLoad ""%1"" in IL_SetMass", IL_Script_Inst];
		};
		
		if !(IL_Mass) ExitWith {};
		private ["_v","_v_def_mass","_cargo_mass"];
		_v = _this select 0;
		_v_def_mass =  if (count _this > 1) then {_this select 1} else {0};
		_cargo_mass =  if (count _this > 2) then {_this select 2} else {0};
		
		if (_v_def_mass == 0) then
		{
			_v_def_mass = [_v] call IL_GetDefaultMass;
		};
		if (_cargo_mass == 0) then
		{
			_cargo_mass = [_v] call IL_GetCargoMass;
		};
		
		if ((getMass _v) != (_v_def_mass + _cargo_mass)) then
		{
			IL_SetMass = [_v, (_v_def_mass + _cargo_mass)];
			if (local _v) then
			{
				["Cos", IL_SetMass] spawn IL_Server_SetMass;
			} else {
				if (isDedicated) then
				{
					(owner _v) publicVariableClient "IL_SetMass";
				} else {
					publicVariableServer "IL_SetMass";
				};
			};
		};
	};

	IL_Vehicle_Chat =
	{
		private["_v","_msg","_mass_info","_text","_cargo_mass","_v_def_mass"];
		_v = _this select 0;
		_msg = _this select 1;
		_mass_info =  if (count _this > 2) then {_this select 2} else {false};

		_v vehicleChat _msg;
		if (_mass_info && IL_Mass) then
		{
			_cargo_mass = 0;
			_v_def_mass = [_v] call IL_GetDefaultMass;
			_cargo_mass = [_v] call IL_GetCargoMass;
			
			_text = Format["<img image='%1' size='2' align='left'/>", getText(configFile >> "cfgVehicles" >> typeOf _v >> "picture")];
			_text = _text + Format ["<t color='#FFFFFF' size='1.2' shadow='1' shadowColor='#000000' align='center'>%1<br/>", getText(configFile >> "cfgVehicles" >> typeOf _v >> "displayName")];

			_text = _text + "<t color='#FFFFFF' size='1.2' shadow='1' shadowColor='#000000' align='left'>Default mass: ";
			_text = _text + Format ["<t color='#FFFFFF' size='1.2' shadow='1' shadowColor='#000000' align='left'>%1<br/>", _v_def_mass];

			_text = _text + "<t color='#FFFFFF' size='1.2' shadow='1' shadowColor='#000000' align='left'>Cargo   mass: ";
			_text = _text + Format ["<t color='#FFFFFF' size='1.2' shadow='1' shadowColor='#000000' align='left'>%1<br/>", _cargo_mass];

			_text = _text + "<t color='#FFFFFF' size='1.2' shadow='1' shadowColor='#000000' align='left'>Current mass: ";
			_text = _text + Format ["<t color='#FFFFFF' size='1.2' shadow='1' shadowColor='#000000' align='left'>%1<br/>", _v_def_mass + _cargo_mass];
		};
		if (vehicle Player != _v) then
		{
			if (_mass_info && IL_Mass) then
			{
				_text = _text + _msg;
				hint parseText (_text);
			} else {
				Hint Format ["%1", _msg];
			};
		} else {
			if (_mass_info && IL_Mass) then
			{
				hint parseText (_text);
			};
		};
	};

	IL_Move_Attach =
	{
		private ["_veh","_obj","_from","_to","_pos","_step","_steps","_from_x","_from_y","_from_z","_to_x","_to_y","_to_z","_x","_y","_z","_i","_x_step","_y_step","_z_step","_turn"];
		_veh = _this select 0;
		_obj = _this select 1;
		_from = _this select 2;
		_to = _this select 3;
		_step = _this select 4;
		_turn = if (count _this > 5) then {_this select 5} else {false};
		
		_from_x = _from select 0;
		_from_y = _from select 1;
		_from_z = _from select 2;
		if (IL_DevMod) then
		{
			Player globalChat Format ["IgiLoad ""%1"". IL_Move_Attach _from_x =""%2"", _from_y =""%3"", _from_z =""%4""", IL_Script_Inst, _from_x, _from_y, _from_z];
		};

		_to_x = _to select 0;
		_to_y = _to select 1;
		_to_z = _to select 2;
		if (IL_DevMod) then
		{
			Player globalChat Format ["IgiLoad ""%1"". IL_Move_Attach _to_x =""%2"", _to_y =""%3"", _to_z =""%4""", IL_Script_Inst, _to_x, _to_y, _to_z];
		};
		
		_x = _to_x - _from_x;
		_y = _to_y - _from_y;
		_z = _to_z - _from_z;
		if (IL_DevMod) then
		{
			Player globalChat Format ["IgiLoad ""%1"". IL_Move_Attach _x =""%2"", _y =""%3"", _z =""%4""", IL_Script_Inst, _x, _y, _z];
		};
		
		if (((abs _x) > (abs _y)) && ((abs _x) > (abs _z))) then
		{
			_steps = round ((abs _x) / _step);
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". IL_Move_Attach _x > _y and _z, _steps =""%2""", IL_Script_Inst, _steps];
			};
		} else {
			if ((abs _y) > (abs _z)) then
			{
				_steps = round ((abs _y) / _step);
				if (IL_DevMod) then
				{
					Player globalChat Format ["IgiLoad ""%1"". IL_Move_Attach _y > _z, _steps =""%2""", IL_Script_Inst, _steps];
				};
			} else {
				_steps = round ((abs _z) / _step);
				if (IL_DevMod) then
				{
					Player globalChat Format ["IgiLoad ""%1"". IL_Move_Attach _z > _y, _steps =""%2""", IL_Script_Inst, _steps];
				};
			};
		};

		_i = 0;
		_obj AttachTo [_veh, _from];
		while {_i < _steps} do
		{
			_i = _i + 1;
			_pos = [(((_x / _steps) * _i) + _from_x), (((_y / _steps) * _i) + _from_y), (((_z / _steps) * _i) + _from_z)];
			_obj AttachTo [_veh, _pos];
			if (_turn) then
			{
				[_obj, _veh, -90] call IL_Rotate;
				_turn = false;
			};
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". IL_Move_Attach _pos =""%2""", IL_Script_Inst, _pos];
			};
			sleep 0.25;
		};
		_obj AttachTo [_veh, _to];
	};

	IL_Create_And_Attach =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format ["IgiLoad ""%1"" in IL_Create_And_Attach", IL_Script_Inst];
		};
		_type = _this select 0;
		_to = _this select 1;
		_x = if (count _this > 2) then {_this select 2} else {0};
		_y = if (count _this > 3) then {_this select 3} else {0};
		_z = if (count _this > 4) then {_this select 4} else {0};
		_m = createVehicle [_type, position _to, [], 0, "CAN_COLLIDE"];
		_m AttachTo [_to,[_x,_y,_z]];
		_m
	};

	IL_Cargo_Para =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format ["IgiLoad ""%1"" in IL_Cargo_Para", IL_Script_Inst];
		};
		private ["_smoke","_light","_damage","_smoke_type","_chemlight_type","_cargo_pos","_last_attach_pos","_dist","_velocity","_tmp"];
		_cargo = _this select 0;
		_v = _this select 1;
		_last_attach_pos = _this select 2;
		if (((IL_Para_Smoke) || (IL_Para_Smoke_Add)) && (_cargo isKindOf "AllVehicles")) then
		{
			_smoke_type = IL_Para_Smoke_Veh;
		} else {
			_smoke_type = IL_Para_Smoke_Default;
		};
		if (((IL_Para_Light) || (IL_Para_Light_Add)) && (_cargo isKindOf "AllVehicles")) then
		{
			_chemlight_type = IL_Para_Light_Veh;
		} else {
			_chemlight_type = IL_Para_Light_Default;
		};

		_cargo_pos = [0,0,0];
		_damage = getDammage _cargo;
		detach _cargo;
		_dist = _v distance _cargo;
		_tmp = [_cargo] spawn
		{
			while {(getPosATL (_this select 0)) select 2 > IL_Para_Drop_Open_ATL} do
			{
				sleep 0.2;
			};
		};
		while {(_v distance _cargo) - _dist < 20} do
		{
			sleep 0.2;
		};
		if (IL_Para_Drop_Open_ATL > 0) then
		{
			while {(getPosATL _cargo) select 2 > (IL_Para_Drop_Open_ATL + ((velocity _cargo) select 2) * -0.5)} do
			{
				sleep 0.2;
			};
		};
		_chute = createVehicle ["B_Parachute_02_F", position _cargo, [], 0, "CAN_COLLIDE"];
		_chute attachTo [_cargo, _cargo_pos];
		_velocity = velocity _cargo;
		detach _chute;

		if (IL_Para_Drop_Velocity) then
		{
			_chute setVelocity _velocity;
		};
		_cargo attachTo [_chute, _cargo_pos];
		
		if (IL_Para_Smoke) then
		{
			_smoke = [_smoke_type, _cargo] call IL_Create_And_Attach;
		};
		if (IL_Para_Light) then
		{
			_light = [_chemlight_type, _cargo] call IL_Create_And_Attach;
		};
		while {(getPos _cargo) select 2 > 2} do
		{
			sleep 0.2;
		};
		detach _cargo;
		if (IL_Para_Smoke) then
		{
			_smoke attachTo [_cargo,[0,0,2]];
			detach _smoke;
		};
		if (IL_Para_Light) then
		{
			_light attachTo [_cargo,[0,0,2]];
			detach _light;
		};
		if (IL_Para_Smoke_Add) then
		{
			_smoke = [_smoke_type, _cargo] call IL_Create_And_Attach;
			_smoke attachTo [_cargo,[0,0,2]];
			detach _smoke;
		};
		if (IL_Para_Light_Add) then
		{
			_light = [_chemlight_type, _cargo] call IL_Create_And_Attach;
			_light attachTo [_cargo,[0,0,2]];
			detach _light;
		};
		
		_cargo setPosASL getPosASL _cargo;
		
		if (IL_CDamage == 0) then
		{
			_cargo setDamage 0;
		};
		
		if (IL_CDamage == 1) then
		{
			_cargo setDamage _damage;
			if (_damage != (getDammage _cargo)) then
			{
				sleep 1;
				_cargo setDamage _damage;
			};
		};
	};

	IL_Do_Load =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format ["IgiLoad ""%1"" in IL_Do_Load", IL_Script_Inst];
		};

		private["_NoBoxHint","_v","_supported_cargo","_zload","_x_cargo_offset","_cargo_offset","_sdist","_spoint","_slot_num","_counter","_done","_obj_lst","_damage","_obj_type","_doors","_box_num","_dummy","_nic","_turn","_force","_cargo"];
		_NoBoxHint = "The box is in the vicinity. Perhaps it is outside of the loading area.";
		_v = _this select 0;
		_supported_cargo = _this select 1;
		_doors = if (count _this > 2) then {_this select 2} else {"B"};
		_force = if (count _this > 3) then {_this select 3} else {false};
		_cargo = if (count _this > 4) then {_this select 4} else {ObjNull};
		
		_v setVariable["can_load", false, true];
		_zload = _v getVariable "zload";
		_obj_type = (typeOf _v);
		_sdist = 0;

		_counter = 0;
		_done = false;
		_turn = false;

		if ((_obj_type in IL_Supported_Vehicles_VAN) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL;
			_spoint = _v modelToWorld [0,-4.5,-1.6];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		if ((_obj_type in IL_Supported_Vehicles_OFFROAD) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL;
			_spoint = _v modelToWorld [0,-4.5,-1.6];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		if ((_obj_type in IL_Supported_Vehicles_KAMAZ) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL;
			_spoint = _v modelToWorld [0,-6 - (_v getVariable "load_offset"),0];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		if ((_obj_type in IL_Supported_Vehicles_HEMTT) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL;
			_spoint = _v modelToWorld [0,-7 - (_v getVariable "load_offset"),0];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		if ((_obj_type in IL_Supported_Vehicles_TEMPEST) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL;
			_spoint = _v modelToWorld [0,-6.5 - (_v getVariable "load_offset"),0];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		if ((_obj_type in IL_Supported_Vehicles_MOHAWK) && (_doors == "B")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL + IL_SDistL_Heli_offset;
			_spoint = _v modelToWorld [0,-6,-3];
			_box_num = _v getVariable "box_num";
			_slot_num = _v getVariable "slots_num";
		};
		if ((_obj_type in IL_Supported_Vehicles_MH9) && (_doors == "L")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL + IL_SDistL_Heli_offset;
			_spoint = _v modelToWorld [0-3,1.3,-1.3];
			_box_num = _v getVariable "box_num_l";
			_slot_num = _v getVariable "slots_num_l";
		};
		if ((_obj_type in IL_Supported_Vehicles_MH9) && (_doors == "R")) then
		{
			if (IL_DevMod) then
			{
				Player globalChat Format ["IgiLoad ""%1"". Do_load vehicle type: ""%2"" and doors: ""%3""", IL_Script_Inst, _obj_type, _doors];
			};
			_sdist = IL_SDistL + IL_SDistL_Heli_offset;
			_spoint = _v modelToWorld [0+3,1.3,-1.3];
			_box_num = _v getVariable "box_num_r";
			_slot_num = _v getVariable "slots_num_r";
		};
		
		if !(_force) then
		{
			_obj_lst = nearestObjects[ _spoint, _supported_cargo, _sdist];
		} else {
			_obj_lst = [_cargo];
		};

		if (count (_obj_lst) > 0) then
		{
			{
				if (IL_DevMod) then
				{
					Player globalChat Format ["IgiLoad ""%1"". Cargo: ""%2"" found.", IL_Script_Inst, _x];
				};
				if (isNil {_x getVariable "attachedPos"}) then
				{
					if (IL_DevMod) then
					{
						Player globalChat Format ["IgiLoad ""%1"". Init box: ""%2"".", IL_Script_Inst, _x];
					};
					[_x] call IL_Init_Box;
				};
				if ((typeOf _x) in (IL_Supported_Cargo20 + ["Land_WaterTank_F"])) then
				{
					_turn = true;
				};

				if ((abs(_slot_num - _box_num) < (_x getVariable "slots")) && (_box_num != 0)) then
				{
					[_v, "This cargo is to big. "] call IL_Vehicle_Chat;
				} else {
					if (IL_DevMod) then
					{
						Player globalChat Format ["IgiLoad ""%1"". _box_num: ""%2"" _slot_num: ""%3""", IL_Script_Inst,  _box_num, _slot_num];
					};
					if (_obj_type in IL_Supported_Vehicles_MH9) then
					{
						_turn = !_turn;
					};
					if ((_box_num > _slot_num) && !_done) then
					{
						[_v, Format ["Chargement du ""%1"" dans ""%2"" ", getText(configFile >> "cfgVehicles" >> typeOf _x >> "displayName"), getText(configFile >> "cfgVehicles" >> typeOf _v >> "displayName")]] call IL_Vehicle_Chat;
						_done = true;
						_counter = (_box_num);
						_zload = (_v getVariable "zload") + (_x getVariable "zload_cargo");
						_cargo_offset = (_v getVariable "load_offset") + (_x getVariable "cargo_offset");
						if ((typeOf _x) in IL_Supported_UGV) then
						{
							_x_cargo_offset = -0.4;
						} else {
							_x_cargo_offset = 0;
						};
						_damage = getDammage _x;
						
						if ((typeOf _x) in IL_Supported_SDV) then
						{
							_x animate ["periscope", 3]; 
							_x animate ["Antenna", 3]; 
							_x animate ["HideScope", 3]; 
							_x animate["display_on_R", 1];
							[_v, "Waiting for periscope."] call IL_Vehicle_Chat;
							while {_x animationPhase "periscope" < 3} do
							{
								sleep 1;
							};
						};

						if ((_obj_type in IL_Supported_Vehicles_VAN) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-4.5,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						if ((_obj_type in IL_Supported_Vehicles_OFFROAD) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-4.5,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						if ((_obj_type in IL_Supported_Vehicles_KAMAZ) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-6 - _cargo_offset,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						if ((_obj_type in IL_Supported_Vehicles_HEMTT) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-7 - _cargo_offset,_zload], [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						if ((_obj_type in IL_Supported_Vehicles_TEMPEST) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-6.5 - _cargo_offset,_zload], [_x_cargo_offset,_counter - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						if ((_obj_type in IL_Supported_Vehicles_MOHAWK)  && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,-6,-0.75 + _zload], [_x_cargo_offset,-4.5,-0.75 + _zload], 1, _turn] call IL_Move_Attach;
							[_v, _x, [_x_cargo_offset,-4.5,-0.75 + _zload], [_x_cargo_offset,-1.5,_zload], 1, _turn] call IL_Move_Attach;
							[_v, _x, [_x_cargo_offset,-1.5,_zload], [_x_cargo_offset,_counter + 9 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						if ((_obj_type in IL_Supported_Vehicles_MH9)  && (_doors == "L")) then
						{
							[_v, _x, [_x_cargo_offset-3,1.3,-1.3 + _zload], [_x_cargo_offset-1,-0.2,_zload], 1, _turn] call IL_Move_Attach;
						};
						if ((_obj_type in IL_Supported_Vehicles_MH9)  && (_doors == "R")) then
						{
							[_v, _x, [_x_cargo_offset+3,1.3,-1.3 + _zload], [_x_cargo_offset+1,-0.2,_zload], 1, _turn] call IL_Move_Attach;
						};

						_counter = _counter - (_x getVariable "slots");

						if (_doors == "B") then
						{
							_v setVariable["box_num", _counter, true];
						};
						if ((_obj_type in IL_Supported_Vehicles_MH9)  && (_doors == "L")) then
						{
							_v setVariable["box_num_l", _counter, true];
							_v setVariable["box_l", _x, true];
						};
						if ((_obj_type in IL_Supported_Vehicles_MH9)  && (_doors == "R")) then
						{
							_v setVariable["box_num_r", _counter, true];
							_v setVariable["box_r", _x, true];
						};
						
						[_v] call IL_SetNewMass;
						
						if (_x isKindOf "AllVehicles") then
						{
							_x forceSpeed 0;
						};
						
						_x setVariable["attachedPos", _counter, true];
						_x setVariable["attachedTruck", _v, true];
						_x setVariable["doors", _doors, true];
						
						if (IL_CDamage == 0) then
						{
							_x setDamage 0;
						};
						
						if (IL_CDamage == 1) then
						{
							_x setDamage _damage;
							if (_damage != (getDammage _x)) then
							{
								sleep 1;
								_x setDamage _damage;
							};
						};
						
						if (_counter > _slot_num) then
						{
							[_v, Format ["""%1"" a été charger dans ""%2"". Place Libre: ""%3"".", getText(configFile >> "cfgVehicles" >> typeOf _x >> "displayName"), getText(configFile >> "cfgVehicles" >> typeOf _v >> "displayName"), abs(_slot_num - _counter)], true] call IL_Vehicle_Chat;
						} else {
							[_v, Format ["""%1"" a été charger dans ""%2"" Il n'y a pas plus de place.", getText(configFile >> "cfgVehicles" >> typeOf _x >> "displayName"), getText(configFile >> "cfgVehicles" >> typeOf _v >> "displayName")], true] call IL_Vehicle_Chat;
						};
					} else {
						if ((_box_num > _slot_num) && !_done) then
						{
							[_v, _NoBoxHint] call IL_Vehicle_Chat;
						};
					};
				};
				if (_done) exitWith {};
			} forEach (_obj_lst);
		} else {
			[_v, _NoBoxHint] call IL_Vehicle_Chat;
		};
		_v setVariable["can_load", true, true];
	};

	IL_Do_Unload =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format["IgiLoad ""%1"" IL_Do_Unload.", IL_Script_Inst];
		};

		private ["_v","_para","_supported_cargo","_doors","_counter","_done","_obj_lst","_zload","_x_cargo_offset","_cargo_offset","_obj_type","_damage","_nic","_free_slots","_turn","_skip","_last_attach_pos"];
		_v = _this select 0;
		_para = if (count _this > 1) then {_this select 1} else {false};
		_doors = if (count _this > 2) then {_this select 2} else {"B"};
		_v setVariable["can_load", false, true];
		_counter = 0;
		_done = false;
		_turn = false;
		_skip = true;
		_obj_lst = [];
		_obj_type = (typeOf _v);
		if (_obj_type in IL_Supported_Vehicles_MH9) then
		{
			if (_doors == "L") then
			{
				_obj_lst = [_v getVariable "box_l"];
			} else {
				_obj_lst = [_v getVariable "box_r"];
			};
		} else {
			_obj_lst = attachedObjects _v;
		};
		
		if (count (_obj_lst) > 0) then
		{
			{
				_obj_type = (typeOf _v);

				if (_x getVariable "doors" == _doors) then
				{
					if (_doors == "B") then
					{
						_counter = (_v getVariable "box_num");
					};
					if (_doors == "L") then
					{
						_counter = (_v getVariable "box_num_l");
					};
					if (_doors == "R") then
					{
						_counter = (_v getVariable "box_num_r");
					};
					if (((_x getVariable "attachedTruck") == _v) && ((_x getVariable "attachedPos") == (_counter)) && (_counter < 0) && !_done) then
					{
						[_v, Format ["Unloading ""%1"" from ""%2"" started", getText(configFile >> "cfgVehicles" >> typeOf _x >> "displayName"), getText(configFile >> "cfgVehicles" >> typeOf _v >> "displayName")]] call IL_Vehicle_Chat;
						_done = true;
						_skip = false;
						_zload = (_v getVariable "zload") + (_x getVariable "zload_cargo");
						_cargo_offset = (_v getVariable "load_offset") + (_x getVariable "cargo_offset");
						_damage = getDammage _x;

						if ((typeOf _x) in IL_Supported_UGV) then
						{
							_x_cargo_offset = -0.4;
						} else {
							_x_cargo_offset = 0;
						};

						_obj_type = (typeOf _v);
						if ((_obj_type in IL_Supported_Vehicles_VAN) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-4.5,_zload], 1, _turn] call IL_Move_Attach;
						};
						if ((_obj_type in IL_Supported_Vehicles_OFFROAD) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-4.5,_zload], 1, _turn] call IL_Move_Attach;
						};
						if ((_obj_type in IL_Supported_Vehicles_KAMAZ) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-6 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						if ((_obj_type in IL_Supported_Vehicles_HEMTT) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,_counter + 0.25 - _cargo_offset,_zload], [_x_cargo_offset,-7 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						if ((_obj_type in IL_Supported_Vehicles_TEMPEST) && (_doors == "B")) then
						{
							[_v, _x, [_x_cargo_offset,_counter - _cargo_offset,_zload], [_x_cargo_offset,-6.5 - _cargo_offset,_zload], 1, _turn] call IL_Move_Attach;
						};
						if ((_obj_type in IL_Supported_Vehicles_MOHAWK)  && (_doors == "B")) then
						{
							if !(_para) then
							{
								[_v, _x, [_x_cargo_offset,_counter + 9 - _cargo_offset,_zload], [_x_cargo_offset,-1.5,_zload], 1, _turn] call IL_Move_Attach;
							};
							[_v, _x, [_x_cargo_offset,-1.5,_zload], [_x_cargo_offset,-4.5,-0.75 + _zload], 1, _turn] call IL_Move_Attach;
							[_v, _x, [_x_cargo_offset,-4.5,-0.75 + _zload], [_x_cargo_offset,-6,-0.75 + _zload], 1, _turn] call IL_Move_Attach;
							if ((_para) && (_obj_type in IL_Para_Drop_Vehicles)) then
							{
								_last_attach_pos = [_x_cargo_offset,-6,-0.75 + _zload];
							};
						};
						if ((_obj_type in IL_Supported_Vehicles_MH9)  && (_doors == "L")) then
						{
							[_v, _x, [_x_cargo_offset-1,-0.2,_zload], [_x_cargo_offset-3,1.3,-0.75 + _zload], 1] call IL_Move_Attach;
							if ((_para) && (_obj_type in IL_Para_Drop_Vehicles)) then
							{
								_last_attach_pos = [_x_cargo_offset-3,1.3,-0.75 + _zload];
							};
						};
						if ((_obj_type in IL_Supported_Vehicles_MH9)  && (_doors == "R")) then
						{
							[_v, _x, [_x_cargo_offset+1,-0.2,_zload], [_x_cargo_offset+3,1.3,-0.75 + _zload], 1] call IL_Move_Attach;
							if ((_para) && (_obj_type in IL_Para_Drop_Vehicles)) then
							{
								_last_attach_pos = [_x_cargo_offset+3,1.3,-0.75 + _zload];
							};
						};
						
						if ((_para) && (_obj_type in IL_Para_Drop_Vehicles)) then
						{
							[_x, _v, _last_attach_pos] spawn IL_Cargo_Para;
						} else {
							sleep 0.2;
							detach _x;
							_x setVelocity [0, 0, -0.2];
						};

						if (_x isKindOf "AllVehicles") then
						{
							_x forceSpeed -1;
						};
						
						_counter = _counter + (_x getVariable "slots");
						if (_doors == "B") then
						{
							_v setVariable["box_num", _counter, true];
							_free_slots = abs((_v getVariable "slots_num") - (_v getVariable "box_num"));
						};
						if (_doors == "L") then
						{
							_v setVariable["box_num_l", _counter, true];
							_v setVariable["box_l", _v, true];
							_free_slots = abs((_v getVariable "slots_num_l") - (_v getVariable "box_num_l"));
						};
						if (_doors == "R") then
						{
							_v setVariable["box_num_r", _counter, true];
							_v setVariable["box_r", _v, true];
							_free_slots = abs((_v getVariable "slots_num_r") - (_v getVariable "box_num_r"));
						};
						
						[_v] call IL_SetNewMass;
						
						_x setVariable["attachedPos", 0, true];
						_x setVariable["attachedTruck", _x, true];
						_x setVariable["doors","N", true];

						if (IL_CDamage == 0) then
						{
							_x setDamage 0;
						};
						
						if (IL_CDamage == 1) then
						{
							_x setDamage _damage;
							if (_damage != (getDammage _x)) then
							{
								sleep 1;
								_x setDamage _damage;
							};
						};
						[_v, Format ["""%1"" a été décharger du ""%2"". Place Libre: ""%3"".", getText(configFile >> "cfgVehicles" >> typeOf _x >> "displayName"), getText(configFile >> "cfgVehicles" >> typeOf _v >> "displayName"), _free_slots], true] call IL_Vehicle_Chat;
						sleep 1;
					};
				};
				if (_done) exitWith {};
			} forEach (_obj_lst);
			if (_skip) then
			{
				[_v, "Can not find cargo. Try again."] call IL_Vehicle_Chat;
				
				if (_counter < 0) then
				{
					_counter = _counter + 1;
				};
				
				if (_doors == "B") then
				{
					_v setVariable["box_num", _counter, true];
					_free_slots = abs((_v getVariable "slots_num") - (_v getVariable "box_num"));
				};
				if (_doors == "L") then
				{
					_v setVariable["box_num_l", _counter, true];
					_v setVariable["box_l", _v, true];
					_free_slots = abs((_v getVariable "slots_num_l") - (_v getVariable "box_num_l"));
				};
				if (_doors == "R") then
				{
					_v setVariable["box_num_r", _counter, true];
					_v setVariable["box_r", _v, true];
					_free_slots = abs((_v getVariable "slots_num_r") - (_v getVariable "box_num_r"));
				};
			};
		} else {
			[_v, "BOX 404 error. Box not found O.o. Vehicle data reset..."] call IL_Vehicle_Chat;
			[_v, true] call IL_Init_Veh;
			[_v, "Vehicle data reset done."] call IL_Vehicle_Chat;
		};
		[_v] call IL_SetNewMass;
		_v setVariable["can_load", true, true];
	};

	IL_GetOut =
	{
		if (IL_DevMod) then
		{
			Player globalChat Format["IgiLoad ""%1"" IL_GetOut.", IL_Script_Inst];
		};

		private ["_v","_player","_para","_chute",  "_backpack","_pos","_x_offset","_dist","_dist_out","_dist_out_para","_velocity"];
		_v = _this select 0;
		_player = _this select 1;
		_para = if (count _this > 2) then {_this select 2} else {false};

		if ((typeOf _v) in IL_Supported_Vehicles_MH9) then
		{
			_dist_out = 5;
			_dist_out_para = 5;
		};
		if ((typeOf _v) in IL_Supported_Vehicles_MOHAWK) then
		{
			_dist_out = 5;
			_dist_out_para = 11;
		};
		_pos = (_v worldToModel (getPosATL _player));
		_x_offset = _pos select 0;
		if (_x_offset < 0) then
		{
			if ((typeOf _v) in IL_Supported_Vehicles_MH9) then
			{
				_x_offset = 90;
			} else {
				_x_offset = 8;
			};
		} else {
			if ((typeOf _v) in IL_Supported_Vehicles_MH9) then
			{
				_x_offset = -90;
			} else {
				_x_offset = -8;
			};
		};
		
		_player allowDamage false;
		sleep 0.2;
		unassignVehicle _player;
		_player action ["Ejecté",vehicle _player];
		sleep 0.5;
	 
		if !(_para) then
		{
			_player setDir ((getDir _v) + 180);
			_pos = ([_v, _dist_out, ((getDir _v) + 180 + _x_offset)] call BIS_fnc_relPos);
			_pos = [_pos select 0, _pos select 1, ((getPosATL _v) select 2)];
			_player setPosATL _pos;
		} else {
			_pos = ([_v, _dist_out_para, ((getDir _v) + 180 + _x_offset)] call BIS_fnc_relPos);
			_pos = [_pos select 0, _pos select 1, ((getPosATL _v) select 2)];
			_player setPosATL _pos;
			_dist = _v distance _player;
			while {(_v distance _player) - _dist < 20} do
			{
				sleep 0.2;
			};
			if (IL_Para_Jump_Open_ATL > 0) then
			{
				while {(getPosATL _player) select 2 > IL_Para_Jump_Open_ATL} do
				{
					sleep 0.2;
				};
			};
			if !(unitBackpack _player isKindOf "B_Parachute") then
			{
				_chute = createVehicle ["Steerable_Parachute_F", position _player, [], 0, "CAN_COLLIDE"];
				_chute AttachTo [_player, [0,0,0]];
				detach _chute;
				_velocity = velocity _player;
				_player moveInDriver _chute;
				if (IL_Para_Jump_Velocity) then
				{
					_chute setVelocity _velocity;
				};
			};
		};
		_player allowDamage true;
		if (IL_DevMod) then
		{
			Player globalChat Format["IgiLoad ""%1"" IL_GetOut.", IL_Script_Inst];
		};
		if (IL_DevMod) then
		{
			Player globalChat Format["IgiLoad ""%1"" IL_GetOut. Player ATL: ""%2""", IL_Script_Inst, _pos];
		};
	};
};

_vsupported = false;
if (_obj_main_type in IL_Supported_Vehicles_MOHAWK) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_MOHAWK.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;

	_obj_main addAction [
	"Charger le Cargo dans le  CH-49",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_Mohawk] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6,-3], IL_Supported_Cargo_NonVeh_Mohawk, IL_SDistL + IL_SDistL_Heli_offset]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (IL_Can_Inside && ('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-6,-3], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'CargoRamp_Open' == 1)"
	];

	_obj_main addAction [
	"Charger le Véhicule dans le  CH-49",
	{
		[_this select 0, IL_Supported_Cargo_Veh_Mohawk] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6,-3], IL_Supported_Cargo_Veh_Mohawk, IL_SDistL + IL_SDistL_Heli_offset]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (IL_Can_Inside && ('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-6,-3], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load') && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'CargoRamp_Open' == 1)"
	];

	_obj_main addAction [
	"Get in CH-49",
	{
		(_this select 1) moveInCargo (_this select 0);
	},[],IL_Action_LU_Priority,false,true,"",
	"(_this in (nearestObjects[ _target modelToWorld [0,-6,-3], [], IL_SDistL + IL_SDistL_Heli_offset])) && ((_target emptyPositions 'cargo') > 0) && (abs(speed _target) <= IL_LU_Speed) && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'CargoRamp_Open' > 0.43) && (_target getVariable 'usable_ramp')"
	];
	
	_obj_main addAction [
	"Get out CH-49",
	{
		[_this select 0, _this select 1, false] call IL_GetOut;
	},[],IL_Action_LU_Priority,false,true,"",
	"('cargo' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (abs(speed _target) <= IL_LU_Speed) && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'CargoRamp_Open' > 0.43) && (_target getVariable 'usable_ramp')"
	];

	_obj_main addAction [
	"Ejecté",
	{
		[_this select 0, _this select 1, true] call IL_GetOut;
	},[],IL_Action_LU_Priority,false,true,"",
	"('cargo' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (((getPosATL _target) select 2) >= IL_Para_Jump_ATL) && (_target animationPhase 'CargoRamp_Open' > 0.43) && (_target getVariable 'usable_ramp')"
	];
	
	_obj_main addAction [
	"Décharger les Cargo du  CH-49",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (IL_Can_Inside && ('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-6,-3], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed) && (((getPos _target) select 2) <= IL_LU_Alt) && (_target animationPhase 'CargoRamp_Open' == 1)"
	];

	_obj_main addAction [
	" Décharger les cargos avec parachute",
	{
		[_this select 0, true] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'can_load') && (((getPosATL _target) select 2) >= IL_Para_Drop_ATL) && (_target animationPhase 'CargoRamp_Open' == 1)"
	];
	
	_obj_main addAction [
	"Unload ALL cargo with parachute",
	{
		while {((_this select 0) getVariable "box_num") != 0} do
		{
			[_this select 0, true] call IL_Do_Unload;
		};
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'can_load') && (((getPosATL _target) select 2) >= IL_Para_Drop_ATL) && (_target animationPhase 'CargoRamp_Open' == 1)"
	];

	_obj_main addAction [
	"Ouvrir la rampe pour le  CH-49",
	{
		_this select 0 animatedoor ['CargoRamp_Open', 1];
	},[],IL_Action_O_Priority,false,true,"",
	"((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-6,-3], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target animationPhase 'CargoRamp_Open' == 0) && (_target getVariable 'can_load')"
	];

	_obj_main addAction [
	"Fermer la rampe pour le CH-49",
	{
		_this select 0 animatedoor ['CargoRamp_Open', 0];
	},[],IL_Action_O_Priority,false,true,"",
	"((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || ((_this in (nearestObjects[ _target modelToWorld [0,-6,-3], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside'))) && (_target animationPhase 'CargoRamp_Open' == 1) && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"Activer le chargement pour le  Co-Pilot",
	{
		(_this select 0) setVariable["can_copilot", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_copilot') && IL_Can_CoPilot)"
	];

	_obj_main addAction [
	"Désactiver le chargement pour le Co-Pilot",
	{
		(_this select 0) setVariable["can_copilot", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_copilot') && IL_Can_CoPilot)"
	];
	
	_obj_main addAction [
	"Activer le chargement extérieur",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"(((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];

	_obj_main addAction [
	"Désactiver le chargement extérieur",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"(((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];

	_obj_main addAction [
	"Activer la rampe extérieur",
	{
		(_this select 0) setVariable["usable_ramp", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"(((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && !(_target getVariable 'usable_ramp') && IL_Ramp)"
	];

	_obj_main addAction [
	"Désactiver la rampe extérieur",
	{
		(_this select 0) setVariable["usable_ramp", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"(((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'usable_ramp') && IL_Ramp)"
	];
};
if (_obj_main_type in IL_Supported_Vehicles_MH9) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_MH9.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;

	_obj_main addAction [
	"Charger le Cargo dans le  left MH-9",
	{
		[_this select 0, IL_Supported_Cargo_MH9, "L"] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count (nearestObjects[ _target modelToWorld [0-3,1,-1.3], IL_Supported_Cargo_MH9, IL_SDistL + IL_SDistL_Heli_offset]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (IL_Can_Inside && ('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || (((_this in (nearestObjects[ _target modelToWorld [0-3,1,-1.3], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num_l' > _target getVariable 'slots_num_l') && (_target getVariable 'can_load') && (((getPos _target) select 2) <= IL_LU_Alt)"
	];

	_obj_main addAction [
	"Charger le Cargo dans le  right MH-9",
	{
		[_this select 0, IL_Supported_Cargo_MH9, "R"] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count (nearestObjects[ _target modelToWorld [0+3,1,-1.3], IL_Supported_Cargo_MH9, IL_SDistL + IL_SDistL_Heli_offset]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (IL_Can_Inside && ('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || (((_this in (nearestObjects[ _target modelToWorld [0+3,1,-1.3], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num_r' > _target getVariable 'slots_num_r') && (_target getVariable 'can_load') && (((getPos _target) select 2) <= IL_LU_Alt)"
	];

	_obj_main addAction [
	"Décharger les Cargo du  left MH-9",
	{
		[_this select 0, false, "L"] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num_l' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (IL_Can_Inside && ('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || (((_this in (nearestObjects[ _target modelToWorld [0-3,1,-1.3], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed) && (((getPos _target) select 2) <= IL_LU_Alt)"
	];

	_obj_main addAction [
	"Décharger les Cargo du  right MH-9",
	{ 
		[_this select 0, false, "R"] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num_r' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (IL_Can_Inside && ('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot')) || (((_this in (nearestObjects[ _target modelToWorld [0+3,1,-1.3], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed) && (((getPos _target) select 2) <= IL_LU_Alt)"
	];

	_obj_main addAction [
	" Unload cargo with parachute left MH-9",
	{
		[_this select 0, true, "L"] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num_l' < 0) && ((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'can_load') && (((getPosATL _target) select 2) >= IL_Para_Drop_ATL)"
	];
	
	_obj_main addAction [
	" Unload cargo with parachute right MH-9",
	{
		[_this select 0, true, "R"] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num_r' < 0) && ((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'can_load') && (((getPosATL _target) select 2) >= IL_Para_Drop_ATL)"
	];
	
	_obj_main addAction [
	"Unload ALL cargo with parachute",
	{
		[_this select 0, true, "L"] call IL_Do_Unload;
		[_this select 0, true, "R"] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num_r' < 0) && (_target getVariable 'box_num_l' < 0) && ((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'can_load') && (((getPosATL _target) select 2) >= IL_Para_Drop_ATL)"
	];

	_obj_main addAction [
	"Ejecté",
	{
		[_this select 0, _this select 1, true] call IL_GetOut;
	},[],IL_Action_LU_Priority,false,true,"",
	"('cargo' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (((getPosATL _target) select 2) >= IL_Para_Jump_ATL) && (_target getVariable 'usable_ramp')"
	];

	_obj_main addAction [
	"Activer le chargement pour le  Co-Pilot",
	{
		(_this select 0) setVariable["can_copilot", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_copilot') && IL_Can_CoPilot)"
	];

	_obj_main addAction [
	"Désactiver le chargement pour le Co-Pilot",
	{
		(_this select 0) setVariable["can_copilot", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_copilot') && IL_Can_CoPilot)"
	];
	
	_obj_main addAction [
	"Activer le chargement extérieur",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"(((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];

	_obj_main addAction [
	"Désactiver le chargement extérieur",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"(((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];

	_obj_main addAction [
	"Activer la rampe extérieur",
	{
		(_this select 0) setVariable["usable_ramp", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"(((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && !(_target getVariable 'usable_ramp') && IL_Ramp)"
	];

	_obj_main addAction [
	"Désactiver la rampe extérieur",
	{
		(_this select 0) setVariable["usable_ramp", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"(((driver _target == _this) || (('Turret' in (assignedVehicleRole _this)) && (vehicle _this == _target) && (_target getVariable 'can_copilot'))) && (_target getVariable 'usable_ramp') && IL_Ramp)"
	];

};
if (_obj_main_type in IL_Supported_Vehicles_OFFROAD) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_OFFROAD.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"Charger le Cargo dans le  Offroad",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_OFFROAD] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-4.5,0], IL_Supported_Cargo_NonVeh_OFFROAD, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-4.5,0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"Charger le Véhicule dans le  Offroad",
	{
		[_this select 0, IL_Supported_Cargo_Veh_OFFROAD] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-4.5,0], IL_Supported_Cargo_Veh_OFFROAD, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-4.5,0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"Décharger les Cargo du  Offroad",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-4.5,0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];
	_obj_main addAction [
	"Activer le chargement extérieur",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"Désactiver le chargement extérieur",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
if (_obj_main_type in IL_Supported_Vehicles_VAN) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_VAN.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"Charger le Cargo dans le Van",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_VAN] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-4.5,0], IL_Supported_Cargo_NonVeh_VAN, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-4.5,0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"Charger le Véhicule dans le Van",
	{
		[_this select 0, IL_Supported_Cargo_Veh_VAN] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-4.5,0], IL_Supported_Cargo_Veh_VAN, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-4.5,0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"Décharger le Cargo du Van",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-4.5,0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];
	
	_obj_main addAction [
	"Activer le chargement extérieur",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"Désactiver le chargement extérieur",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
if (_obj_main_type in IL_Supported_Vehicles_KAMAZ) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_KAMAZ.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"Charger le Cargo dans le Zamak",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_Kamaz] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_Kamaz, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"Charger le Véhicule dans le Zamak",
	{
		[_this select 0, IL_Supported_Cargo_Veh_Kamaz] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_Kamaz, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"Décharger le Cargo du Zamak",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-6 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];
	_obj_main addAction [
	"Activer le chargement extérieur",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"Désactiver le chargement extérieur",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
if (_obj_main_type in IL_Supported_Vehicles_TEMPEST) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_TEMPEST.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;
	
	_obj_main addAction [
	"Charger le Cargo dans le Tempest",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_TEMPEST] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6.5 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_TEMPEST, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6.5 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"Charger le Véhicule dans le Tempest",
	{
		[_this select 0, IL_Supported_Cargo_Veh_TEMPEST] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-6.5 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_TEMPEST, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || ((((_this in (nearestObjects[ _target modelToWorld [0,-6.5 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset]))) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];
	
	_obj_main addAction [
	"Décharger le Cargo du Tempest",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-6.5 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];
	_obj_main addAction [
	"Activer le chargement extérieur",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];
	
	_obj_main addAction [
	"Désactiver le chargement extérieur",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};
if (_obj_main_type in IL_Supported_Vehicles_HEMTT) then
{
	if (IL_DevMod) then
	{
		Player globalChat Format["IgiLoad ""%1"" Vehicle is in IL_Supported_Vehicles_HEMTT.", IL_Script_Inst];
	};
	_vsupported = true;
	[_obj_main] call IL_Init_Veh;

	_obj_main addAction [
	"Charger le Cargo dans le HEMTT",
	{
		[_this select 0, IL_Supported_Cargo_NonVeh_HEMTT] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_NonVeh_HEMTT, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];

	_obj_main addAction [
	"Charger Véhicule dans le HEMTT",
	{
		[_this select 0, IL_Supported_Cargo_Veh_HEMTT] call IL_Do_Load;
	},[],IL_Action_LU_Priority,true,true,"",
	"(count(nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], IL_Supported_Cargo_Veh_HEMTT, IL_SDistL]) > 0) && (abs(speed _target) <= IL_LU_Speed) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'box_num' > _target getVariable 'slots_num') && (_target getVariable 'can_load')"
	];

	_obj_main addAction [
	"Décharger le Cargo du HEMTT",
	{
		[_this select 0] call IL_Do_Unload;
	},[],IL_Action_LU_Priority,false,true,"",
	"(_target getVariable 'box_num' < 0) && ((IL_Can_Inside && (driver _target == _this)) || (((_this in (nearestObjects[ _target modelToWorld [0,-7 - (_target getVariable 'load_offset'),0], [], IL_SDistL + IL_SDistL_Heli_offset])) && (_target getVariable 'can_outside')))) && (_target getVariable 'can_load') && (abs(speed _target) <= IL_LU_Speed)"
	];

	_obj_main addAction [
	"Activer le chargement extérieur",
	{
		(_this select 0) setVariable["can_outside", true, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && !(_target getVariable 'can_outside') && IL_Can_Outside)"
	];

	_obj_main addAction [
	"Désactiver le chargement extérieur",
	{
		(_this select 0) setVariable["can_outside", false, true];;
	},[],IL_Action_S_Priority,false,true,"",
	"((driver _target == _this) && (_target getVariable 'can_outside') && IL_Can_Outside)"
	];
};

if (!(_vsupported) && (IL_DevMod)) then
{
	Player globalChat Format["Object type: ""%1"" is not supported.", _obj_main_type];
};

if (IL_DevMod) then
{
	Player globalChat Format["IgiLoad ""%1"" END.", IL_Script_Inst];
};