with missionNamespace do 
{
	private ["_params","_functionName","_target","_isPersistent","_isCall","_ownerID"];

	_params = [_this,0,[]] call BIS_fnc_param;
	_functionName =	[_this,1,"",[""]] call BIS_fnc_param;
	_target = [_this,2,true,[objNull,true,0,[],sideUnknown,grpNull,""]] call BIS_fnc_param;
	_isPersistent =	false;
	_isCall = [_this,4,false,[false]] call BIS_fnc_param;

	if (typeName _target == typeName objNull && {local _target}) then 
	{
		life_fnc_MP_packet = [1, _params, _functionName, _target, _isPersistent, _isCall];
		["life_fnc_MP_packet", life_fnc_MP_packet] spawn life_fnc_MPexec;
	} else {
		life_fnc_MP_packet = [0, _params, _functionName, _target, _isPersistent, _isCall];
		publicVariableServer "life_fnc_MP_packet";
	};
/*
	if(isServer && isDedicated) then 
	{
		life_fnc_MP_packet = [0,_params,_functionName,_target,_isPersistent,_isCall,"__SERVER__","__SERVER__"];
	} else {
		life_fnc_MP_packet = [0,_params,_functionName,_target,_isPersistent,_isCall,profileName,getPlayerUID player];
	};
	publicvariableserver "life_fnc_MP_packet";
*/
	if !(isMultiplayer) then 
	{
		["life_fnc_MP_packet",life_fnc_MP_packet] call life_fnc_MPexec;
	};
	life_fnc_MP_packet
};