if (player getVariable["restrained",false]) exitWith {};

if (!life_show_actions) then
{
	[] spawn
	{
		while {life_show_actions} do
		{
			life_cursorTarget = nearestObject (screenToWorld [0.5,0.5]);
			sleep 1;
		};
		life_cursorTarget = objNull;
	};
	[] spawn life_fnc_setupActions;
};
life_show_actions = true;
if (time > life_action_time) exitWith {life_action_time = time + 9;};
life_action_time = time + 9;

waitUntil {life_action_time < time};

{player removeAction _x;} foreach life_actions;
life_actions = [];
life_show_actions = false;