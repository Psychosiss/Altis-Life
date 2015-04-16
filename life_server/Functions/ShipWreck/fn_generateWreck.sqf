life_ship_obj_arr = ["Land_Wreck_Traw_F","Land_Wreck_Traw2_F"];
life_ship_chance = 100;
life_ship_positions = [[4462.89,6515.78,-2.19486],[5391.75,25136.2,-1.98308],[25323.2,27886.6,-2.15125]];
_ship_time_interval = [1,5];
life_ship_loot_array = [["apple",20],["peach",20]];
life_ship_loot_amount = 1;
life_ship_time_min = _ship_time_interval select 0;
life_ship_time_max = _ship_time_interval select 1;
life_ship_time_min = life_ship_time_min * 3600;
life_ship_time_max = life_ship_time_max * 3600;

if (life_ship_time_min >= life_ship_time_max OR count life_ship_loot_array < life_ship_loot_amount) exitWith {life_ship_enable = false;};
life_ship_enable = true;

sleep 1;

if (!life_ship_enable) exitWith {};

_chance = floor(random 100);
if (_chance>life_ship_chance) exitWith {};
_toWait = (random (life_ship_time_max - life_ship_time_min)) + life_ship_time_min;
sleep _toWait;

[[7,"<t size='1.4'><t color='#A5DF00'>Navire</t></t><br/><br/><t size='1'>Une épave a été localisée, elle peut contenir des éléments importants!</t>"],"life_fnc_broadcast",true,false] call life_fnc_MP;

_poses = count life_ship_positions;
_inArr = floor(random _poses);
_dest = life_ship_positions select _inArr;

sleep 5;

_marker = createMarker ["wreckMarker", _dest];
"wreckMarker" setMarkerColor "ColorGreen";
"wreckMarker" setMarkerType "Empty";
"wreckMarker" setMarkerShape "ELLIPSE";
"wreckMarker" setMarkerSize [500,500];
_markerText = createMarker ["wreckMarkerText", _dest];
"wreckMarkerText" setMarkerColor "ColorBlack";
"wreckMarkerText" setMarkerText "shipWreck";
"wreckMarkerText" setMarkerType "mil_warning";
"wreckMarker" setMarkerAlpha 0.3;

_type = "";
_chance = floor(random 2);
if (_chance == 1) then {_type = "Land_Wreck_Traw_F"} else {_type = "Land_Wreck_Traw2_F"};

_xPOS = floor(random 400);
_yPOS = floor(random 400);
_wreck = createVehicle [_type, [(_dest select 0) + _xPOS,(_dest select 1) + _yPOS,0],[],0,"CAN_COLLIDE"];
_wreck allowDamage false;
_wreck enableSimulation false;
_wreck setVariable ["trunk_in_use",false,true];
_wreck setVariable ["opened",false,true];
shipWeapons = false;

waitUntil {shipWeapons};

_wreck setVariable ["opened",true,true];
_lootAmount = life_ship_loot_amount;
_lootArray = life_ship_loot_array;
_lootTempToAdd = [];
_lootArrayFinal = [];

while {_lootAmount > 0} do 
{
	_lootAmount = _lootAmount - 1;
	_loot_inArr = count _lootArray;
	_inArr = floor(random _loot_inArr);
	_lootTempToAdd = _lootArray select _inArr;
	_lootArrayFinal = _lootArrayFinal + [_lootTempToAdd];
};

_wreck setVariable ["Trunk",[_lootArrayFinal,500],true];

sleep 1800;

"wreckMarker" setMarkerAlpha 0;
"wreckMarkerText" setMarkerAlpha 0;
deleteMarker "wreckMarker";
deleteMarker "wreckMarkerText";
deleteVehicle _wreck;

[[7,"<t size='1.4'><t color='#A5DF00'>Navire</t></t><br/><br/><t size='1'>Le navire à été pillé avec succès et à disparu!</t>"],"life_fnc_broadcast",true,false] call life_fnc_MP;