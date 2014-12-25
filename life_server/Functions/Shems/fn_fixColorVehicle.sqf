/*
   go on fn_vehiceSpawn.sqf and add : 
   [_vehicle,_vInfo select 8] spawn SHEMS_fnc_fixColorVehicle;
*/
   
private["_vehicle","_color"];

_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_color = _this select 1;

sleep 5;
[[_vehicle,_color],"life_fnc_colorVehicle",true,false] spawn life_fnc_MP;