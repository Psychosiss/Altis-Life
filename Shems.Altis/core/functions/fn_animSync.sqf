/*
private["_unit","_anim"];
_unit = [_this,0,ObjNull,[Objnull]] call BIS_fnc_param;
_anim = [_this,1,"",[""]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
_unit switchMove _anim;
*/

private["_unit","_anim","_type"];
_unit = [_this,0,ObjNull,[Objnull]] call BIS_fnc_param;
_anim = [_this,1,"",[""]] call BIS_fnc_param;
_type = [_this,2,"switch",["switch"]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
if (_type == "switch") then 
{
	_unit switchMove _anim;
};

if (_type == "playNow") then 
{
	_unit playMoveNow _anim;
};