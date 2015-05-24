private["_side","_ret"];
_side = [_this,0,civilian,[civilian]] call BIS_fnc_param;

switch _side do
{
	case west:
	{
		_ret = 
		[
			["cop_spawn_1","Kavala","icons\police.paa"],
			["cop_spawn_2","Pyrgos","icons\police.paa"],
			["cop_spawn_3","Neochori","icons\police.paa"],
			["cop_spawn_4","Barrage","icons\police.paa"]
		];
	};

	case civilian:
	{
		_ret = 
		[
			["civ_spawn_1","Kavala","icons\spawn.paa"],
			["civ_spawn_2","Pyrgos","icons\spawn.paa"],
			["civ_spawn_3","Neochori","icons\spawn.paa"]
		];

		if(license_civ_rebel) then 
		{
			_ret = 
			[
				["civ_spawn_10","Kavala","icons\spawn.paa"],
				["civ_spawn_2","Pyrgos","icons\spawn.paa"],
				["civ_spawn_3","Neochori","icons\spawn.paa"],
				["civ_spawn_4","Badtown","icons\spawn.paa"],
				["donor_town","Ville Donator","icons\spawn.paa"],
				["reb_spawn_1","Camp est","icons\rebel.paa"],
				["reb_spawn_2","Camp ouest","icons\rebel.paa"]
			];
		};

		if(count life_houses > 0) then 
		{
			{
				_pos = call compile format["%1",_x select 0];
				_house = nearestBuilding _pos;
				_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
				_return pushBack [format["house_%1",_house getVariable "uid"],_houseName,"icons\house.paa"];
			} foreach life_houses;
		};	
	};

	case independent:
	{
		_ret = 
		[
			["medic_spawn_1","Kavala","icons\health2.paa"],
			["medic_spawn_3","Pyrgos","icons\health2.paa"]
		];
	};
};

_ret;