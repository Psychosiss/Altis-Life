private ["_index","_gang","_gangPaycheck","_owner","_myGang"];

while {true} do 
{
	sleep 600;
	_index = [life_my_gang,life_gang_list] call fnc_index;
	if (!(_index == -1)) then 
	{
		_gang = (life_gang_list select _index);
		_gangPaycheck = 0;
		{
			_owner = _x getVariable ["gangControl", ""];
			_myGang = (_gang select 0);

			if ((_owner != "") AND (_myGang == _owner)) then 
			{
				_gangPaycheck = _gangPaycheck + 15000;
			};
		} forEach life_gang_flags;
		
		if (_gangPaycheck > 0) then 
		{
			if (alive player) then 
			{
				hint format["You have received $%1 due to your Gang's Territories.",[_gangPaycheck] call life_fnc_numberText];
				hint "The next payment is due in 10 minutes.";
				life_atmCash = life_atmCash + _gangPaycheck;
			} else {
				hint "You missed a Gang Payout due to being dead.";
			};
			_gangPaycheck = 0;
		};
	};
};