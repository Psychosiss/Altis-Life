private["_mode","_packet","_array","_flag"];
_mode = [_this,0,0,[0]] call BIS_fnc_param;
_packet = [getPlayerUID player,playerSide,nil,_mode];
_array = [];
_flag = switch playerSide do 
{
	case west: {"cop"}; 
	case civilian: {"civ"}; 
	case independent: {"med"}; 
};

switch _mode do 
{
	case 0: 
	{
		_packet set[2,life_money];
	};
	
	case 1: 
	{
		_packet set[2,life_atmmoney];
	};
	
	case 2: 
	{
		{
			if(_x select 1 == _flag) then
			{
				_array pushBack [_x select 0,(missionNamespace getVariable (_x select 0))];
			};
		} foreach life_licenses;
		_packet set[2,_array];
	};
	
	case 3: 
	{
		[] call life_fnc_saveGear;
		_packet set[2,life_gear];
	};
	
	case 4: {};
	
	case 5: 
	{
		_packet set[2,life_is_arrested];
	};
	
	case 6: 
	{
		_packet set[2,life_money];
		_packet set[4,life_atmmoney];
	};

	case 7: {};
};

[_packet,"DB_fnc_updatePartial",false,false] spawn life_fnc_MP;