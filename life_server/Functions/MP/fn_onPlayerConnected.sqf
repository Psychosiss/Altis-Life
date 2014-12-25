private ["_function","_args","_execute"];
_args = [_this,1,[]] call bis_fnc_param;
_execute = [_this,2,false,[false]] call bis_fnc_param;

if !(_execute) then 
{
	if (isserver) then 
	{
		_function = [_this,0,"",["",{}]] call bis_fnc_param;

		if (typename _function == typename {}) then 
		{
			private ["_code"];
			_code = _function;
			_function = "BIS_fnc_onPlayerConnected_function" + str (["BIS_fnc_onPlayerConnected_function",1] call bis_fnc_counter);
			missionnamespace setvariable [_function,_code];
		};

		[[_function,_args,true],"BIS_fnc_onPlayerConnected",true,true] call bis_fnc_mp;
		true
	} else {
		"BIS_fnc_onPlayerConnected can be called only on server." call bis_fnc_error;
		false
	};
} else {
	_function = [_this,0,"",[""]] call bis_fnc_param;

	[[player,_args],_function,false,false] call bis_fnc_mp;
	true
};