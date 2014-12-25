private ["_value"];
_value = [] call bis_fnc_countdown;
if (_value <= 0 && ismultiplayer) then 
{
	_value = if (estimatedEndServerTime != 0) then 
	{
		((estimatedEndServerTime - servertime) max 0)
	} else {
		-1
	};
};
_value