private "_unit";
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;

if (isNull _unit) exitWith {false};

(goggles _unit in (life_masks select 0) || {headgear _unit in (life_masks select 1)} || {uniform _unit in (life_masks select 2)})