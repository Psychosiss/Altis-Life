private["_unit","_bool","_side"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_bool = [_this,1,false,[false]] call BIS_fnc_param;
_side = [_this,2,civilian,[west]] call BIS_fnc_param;

if (isNull _unit) exitWith {};

switch _side do
{
	case west:
	{
		if(_bool) then
		{
			life_radio_west radioChannelAdd [_unit];
		} else {
			life_radio_west radioChannelRemove [_unit];
		};
	};
	
	case civilian:
	{
		if(_bool) then
		{
			life_radio_civilian radioChannelAdd [_unit];
		} else {
			life_radio_civilian radioChannelRemove [_unit];
		};
	};
	
	case independent:
	{
		if(_bool) then
		{
			life_radio_independent radioChannelAdd [_unit];
		} else {
			life_radio_independent radioChannelRemove [_unit];
		};
	};
};