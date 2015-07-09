[] call life_fnc_spawnMenu;

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