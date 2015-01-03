if(life_cash < 500) exitWith 
{
	hint "Vous devez avoir 500 € pour faire un saut en parachute.";
};
life_cash = life_cash - 500;
if(life_action_inUse) exitWith {};
life_action_inUse = true;
life_skydive_backpack = backpack player;
life_skydive_backpackItems = backpackItems player;

_pos = getPosATL player;
_pos set[2,6000];

cutText ["","BLACK OUT",5];
sleep 3;
cutText ["Vous allez bientot arrivez dans la zone de largage. Préparez-vous à sauter!", "BLACK FADED"];
0 cutFadeOut 999999; 
sleep 1;

player setVelocity [0,0,0];
player setPos (getMarkerPos "respawn_civilian");
player addBackpack "B_Parachute";

for "_i" from 0 to 3 do
{
	playSound "airplane";
	sleep 2.2;
};
sleep 5;
player setPosATL _pos;
_currentView = viewDistance;
setViewDistance 6000;
cutText["","PLAIN"];  

waitUntil {isTouchingGround player};
hint "Ill take that backpack back, here is your old one!";
removeBackpack player;
player addBackpack life_skydive_backpack;
clearBackpackCargo player;
{
	[_x,true,true] call life_fnc_handleItem;
} foreach life_skydive_backpackItems;

setViewDistance _currentView;
life_action_inUse = false;