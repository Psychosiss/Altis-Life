private ["_cursorTarget","_intersects","_screenPos","_distance","_cameraVector","_position"];

{
	player reveal [_x,4]
} forEach (nearestObjects[player,["Man"],1.5]);

_cursorTarget = cursorTarget;

if ( isNull _cursorTarget ) then 
{
	_screenPos = screenToWorld [0.5,0.5];
	_distance = player distance _screenPos;
	_cameraVector = [positionCameraToWorld [0,0, 0], positionCameraToWorld [0,0,1]] call BIS_fnc_vectorFromXtoY;  
	_position = [eyePos player, [_cameraVector call BIS_fnc_unitVector,_distance] call BIS_fnc_vectorMultiply] call BIS_fnc_vectorAdd;
	_position = [_screenPos select 0,_screenPos select 1,_position select 2];
	_intersects  = lineIntersectsWith [eyePos player,_position, player,objNull,true];
	if (count _intersects > 0) then {_cursorTarget = _intersects select (count _intersects - 1)};
};

_cursorTarget