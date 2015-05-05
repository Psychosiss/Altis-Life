private ["_unit","_copy"];
_unit = [_this,0,player,[objNull]] call BIS_fnc_param;
_copy = [_this,1,false,[true]] call BIS_fnc_param;

if (_copy) then 
{
	_unit setVariable ["nametag_title", _unit getVariable ["nametag_title", profileName], true];
	_unit setVariable ["restrained", _unit getVariable "restrained", true];
	_unit setVariable ["escorting", _unit getVariable "escorting", true];
	_unit setVariable ["transporting", _unit getVariable "transporting", true];
} else {
	_unit setVariable ["nametag_title",profileName,true];
	_unit setVariable ["restrained",nil,true];
	_unit setVariable ["escorting",nil,true];
	_unit setVariable ["transporting",nil,true];
};

switch true do 
{
	case ([] call life_fnc_isCop): 
	{
		_unit setVariable ["cop_rank", life_cop_level, true];
	};

	case ([] call life_fnc_isMedic): 
	{
		_unit setVariable ["med_rank", life_med_level, true];
	};
};