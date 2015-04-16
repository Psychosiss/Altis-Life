_chair = _this select 0; 
_unit = _this select 1; 

[[_unit, "Crew"], "MAC_fnc_switchMove"] call BIS_fnc_MP; 
_unit setPos (getPos _chair); 
_unit setDir ((getDir _chair) - 180); 
standup = _unit addAction ["Se lever","scripts\standup.sqf"];
_unit setPos [getpos _unit select 0, getpos _unit select 1,((getpos _unit select 2) + 1)];