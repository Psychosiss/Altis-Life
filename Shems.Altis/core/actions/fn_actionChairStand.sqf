private ["_unit","_chair"];
_unit = _this select 0;

_chair = life_actions_actionChairStand_chair;
_chair setVariable ["life_fnc_actionChairSit_busy",false,true];

_pos = getPos _chair;
_pos = [_pos,1.5,90] call BIS_fnc_relPos;

[[_unit,"amovpercmstpsnonwnondnon"],"switchMove"] call life_fnc_MP;

_unit setPos _pos;
_unit removeAction life_actions_actionChairStand;

life_actions_actionChairStand_chair = nil;
life_actions_actionChairStand = nil;