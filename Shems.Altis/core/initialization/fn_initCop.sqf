private "_playerPosition";

_playerPosition = cop_position;
diag_log format ["%1",_playerPosition];

if (!life_is_alive) then
{
	[] call life_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)};
	waitUntil{isNull (findDisplay 38500)};
	life_is_alive = true;
} else {
	player setPos _playerPosition;
	life_is_alive = true;
};

player setVariable["cop_level",(call life_cop_level),true];
player setVariable["med_level",(call life_med_level),true];
player setVariable["adminlevel",(call life_adminlevel),true];

[] spawn
{
	while {true} do
	{
		waitUntil {uniform player == "U_Rangemaster"};
		player setObjectTextureGlobal [0,"images\cop\uniform.paa"];
		waitUntil {uniform player != "U_Rangemaster"};
	};
};