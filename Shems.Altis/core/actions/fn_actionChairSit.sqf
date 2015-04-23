private ["_chair","_unit","_pos"];
_chair = _this select 0;
_unit = _this select 1;

life_actions_actionChairStand_chair = _chair;

_chair setVariable ["life_fnc_actionChairSit_busy",true,true];

[[_unit,"HubSittingChairA_idle1"],"switchMove"] call life_fnc_MP;

_pos = getPos _chair;
_pos set [2,(_pos select 2) + 1];
_pos = [_pos,0.09,180] call BIS_fnc_relPos;

_unit setDir (getDir _chair) + 180;
_unit setPos _pos;

life_actions_actionChairStand = _unit addAction ["Se lever",life_fnc_actionChairStand,nil,10,false,true,"",""];