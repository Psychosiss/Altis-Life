private["_unit","_id","_time"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_time = [_this,1,15] call BIS_fnc_param;

if(isNull _unit) exitWith {};
if(isNil "_unit") exitwith {};
if(!(_unit isKindOf "Man")) exitWith {};
if(!isPlayer _unit) exitWith {};
if(!(_unit getVariable "restrained")) exitWith {};
if(!((side _unit) in [civilian,west])) exitWith {};
if(isNull _unit) exitWith {};
if(_time < 1) exitwith {};

[[_unit,player,false],"life_fnc_wantedBounty",false,false] spawn life_fnc_MP;

if(isNull _unit) exitWith {};
detach _unit;
[[_unit,false,_time],"life_fnc_jailAsylum",_unit,false] spawn life_fnc_MP;
[[0,"%1 a été arrêté par %2",true, [_unit getVariable["realname",name _unit], profileName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;