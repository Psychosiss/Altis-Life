private ["_resource","_type","_speed","_showOnMap"];
_resource = [_this,0,"",[""]] call BIS_fnc_param;
_type = [_this,1,"PLAIN",[""]] call BIS_fnc_param;
_speed = [_this,2,0,[0]] call BIS_fnc_param;
_showOnMap = [_this,3,true,[true]] call BIS_fnc_param;

(_resource call BIS_fnc_rscLayer) cutRsc [_resource,_type,_speed,_showOnMap];