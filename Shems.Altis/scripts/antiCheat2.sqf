if(isServer) exitWith {};
waitUntil {!isnull player && player == player};
waitUntil {!isNil {life_fnc_broadcast}};

private["_cfg","_patches","_sel","_name","_patches"];
_cfg = configFile >> "CfgPatches";
_patches = [];
for "_i" from 0 to count (_cfg)-1 do
{
	_sel = _cfg select _i;
	if(isClass _sel) then
	{
		_name = configName _sel;
		_patches set[count _patches,_name];
	};
};

if("DevCon" in _patches) then
{
	[[0,format["%1 utilise l'addon DevCon.",name player]],"life_fnc_broadcast",nil,false] spawn BIS_fnc_MP;
	disableUserInput true;
};

[] spawn 
{
	while {true} do
	{
		waitUntil {!isNull (findDisplay 3030)};
		[[0,format["%1 utilise un menu cheat, reportez-le.",name player]],"life_fnc_broadcast",nil,false] spawn BIS_fnc_MP;
		[[format["anticheat:%1:%2:%3",name player,getPlayerUID player,"MenuBasedHack_DISPLAY_3030"],player],"fnc_log_ac",false,false] spawn BIS_fnc_MP;
		closeDialog 0;
	};
};

[] spawn
{
	while {true} do
	{
		waitUntil {!isNull ((findDisplay 64) displayCtrl 101)};
		[[0,format["%1 utilise un menu cheat, reportez-le.",name player]],"life_fnc_broadcast",nil,false] spawn BIS_fnc_MP;
		[[format["anticheat:%1:%2:%3",name player,getPlayerUID player,"MenuBasedHack_DISPLAY_64_C_101"],player],"fnc_log_ac",false,false] spawn BIS_fnc_MP;
		closeDialog 0;
	};
};

[] spawn
{
	while {true} do
	{
		waitUntil {!isNull (findDisplay 162)};
		[[0,format["%1 utilise un menu cheat, reportez-le.",name player]],"life_fnc_broadcast",nil,false] spawn BIS_fnc_MP;
		[[format["anticheat:%1:%2:%3",name player,getPlayerUID player,"MenuBasedHack_DISPLAY_162"],player],"fnc_log_ac",false,false] spawn BIS_fnc_MP;
		ctrlactivate ((findDisplay 162) displayCtrl 2);
		closeDialog 0;
	};
};

[] spawn
{
	while {true} do
	{
		waitUntil {!isNull (findDisplay 129)};
		closeDialog 0;
	};
};

[] spawn
{
	while {true} do
	{
		waitUntil {!isNull (uiNamespace getVariable "RscDisplayRemoteMissions")};
		[[0,format["%1 utilise un menu cheat, reportez-le.",name player]],"life_fnc_broadcast",nil,false] spawn BIS_fnc_MP;
		[[format["anticheat:%1:%2:%3",name player,getPlayerUID player,"MenuBasedHack_RscDisplayRemoteMissions"],player],"fnc_log_ac",false,false] spawn BIS_fnc_MP;
		closeDialog 0;
	};
};

[] spawn
{
	waitUntil {(unitRecoilCoefficient player) < 1};
	[[0,format["%1 utilise un menu cheat, reportez-le.",name player]],"life_fnc_broadcast",nil,false] spawn BIS_fnc_MP;
	[[format["anticheat:%1:%2:%3",name player,getPlayerUID player,"RecoilBasedHack"],player],"fnc_log_ac",false,false] spawn BIS_fnc_MP;
};

W_O_O_K_I_E_ANTI_ANTI_HAX = compileFinal "";
W_O_O_K_I_E_FUD_ANTI_ANTI_HAX = compileFinal "";

[] spawn 
{
	private["_blacklist"];
	_blacklist = 
	[
		"W_O_O_K_I_E_FUD_Pro_RE","W_O_O_K_I_E_FUD_Car_RE","W_O_O_K_I_E_FUD_FuckUp_GunStore","W_O_O_K_I_E_FUD_M_E_N_U_initMenu","W_O_O_K_I_E_FuckUp_GunStore_a","W_O_O_K_I_E_M_E_N_U_funcs_inited",
		"Menu_Init_Lol","W_O_O_K_I_E_Pro_RE","W_O_O_K_I_E_Debug_Mon","W_O_O_K_I_E_Debug_1337","Veh_S_P_A_W_N_Shitt","sfsefse","tw4etinitMenu","tw4etgetControl","efr4243234","sdfwesrfwesf233","sdgff4535hfgvcxghn",
		"adadawer24_1337","lkjhgfuyhgfd","dayz_serverObjectMonitor","fsfgdggdzgfd","fsdddInfectLOL","Wookie_List","Wookie_Pro_RE","Wookie_Car_RE","Wookie_Debug_Mon","faze_funcs_inited","CLASS911_BindHandler",
		"advertising_banner_infiSTAR","atext_star_xa","Monky_hax_dbclick","qopfkqpofqk","debug_star_colorful","AntiAntiAntiAntiHax","antiantiantiantih4x","CLASS911_AL_Asylum","CLASS911_GodAll",
		"hub","scrollinit","gfYJV","Lystic_LMAOOOOOOOOOOOOOOOOOOO","Lystic_Re","Lysto_Lyst","Menulocations","Lystic_Init","scroll_m_init_star","exstr1","pathtoscrdir3","Monky_funcs_inited","CLASS911_Music5",
		"Monky_initMenu","player_zombieCheck","godlol","playericons","abcdefGEH","wierdo","go_invisible_infiSTAR","serverObjectMonitor","enamearr","initarr3","locdb","sCode","infAmmoIndex","CLASS911_Binds",
		"nukeDONEstar","Wookie_List","Wookie_Pro_RE","FUCKTONIC","CLASS911_GOD_TOGGLE","CLASS911_VEHGOD_TOGGLE","CLASS911_MapMarkers_TOGGLE","CLASS911_SUCHFASTSHOTS_TOGGLE","CLASS911_NoRecoil_TOGGLE",
		"CLASS911_SUCHUNLIMITEDAMMO_TOGGLE","CLASS911_VehicleSpeedhack_TOGGLE","CLASS911_ESPTURTLE_TOGGLE","CLASS911_CLIPPIN_TOGGLE","CLASS911_BigBullets_TOGGLE","CLASS911_VehicleMarkers_TOGGLE",
		"CLASS911_Terrain_TOGGLE","CLASS911_POOP_PUMPERS_TOGGLE","CASE911_909093344343INV_TOGGLE","CLASS911_Distance_TOGGLE","CLASS911_Menu","CLASS911_MakeInvis","CASE911_getControl","CLASS911_Run",
		"CLASS911_LoadMenu","CLASS911_Menu_Header","CLASS911_ALTISLIFE","CLASS911_Menu_Main","CLASS911_Menu_Target","CLASS911_ALLL","CLASS911_Menu_COOL","CLASS911_KICKSTART","CLASS911_Menu_Spawn",
		"CLASS911_Menu_Weapons","CLASS911_ViewDistance","CLASS911_Heal","CLASS911_VehicleMarkers","CLASS911_Terrain","CLASS911_SUCHFASTSHOTS","CLASS911_SUCHUNLIMITEDAMMO","CLASS911_VehicleSpeedhack",
		"CLASS911_ESPTURTLE","CLASS911_CLIPPIN","CLASS911_TP","CLASS911_GOD","CLASS911_VEHGOD","CLASS911_MapMarkers","CLASS911_BigBullets","BigFuckinBullets_0202020DDDEEDED","CLASS911_FLYING_POOP",
		"POOOOP_PUUMMPERS_ALLDAY_move_forward","CASE911_909093344343INV","CLASS911_Loadout1","CLASS911_Loadout2","CLASS911_Loadout3","CLASS911_Loadout4","CLASS911_Loadout5","CLASS911_Loadout6","CLASS911_Loadout7",
		"CLASS911_Loadout8","CLASS911_Loadout9","CLASS911_Loadout10","CLASS911_Loadout11","CLASS911_SKYHIGH","CLASS911_JOINMYICECREAMTRUCK","CLASS911_OMFGJJMODE","CLASS911_EXECUTER","CLASS911_SUCHESPOMFG",
		"CLASS911_TELELELELEHHEEE555","CLASS911_TTTTT9990000","CLASS911_OMFGISEEU66","CLASS911_KillTarget","CLASS911_KIIIIIICKCKKCKCGOMNE4","CLASS911_2MNJ","CLASS911_Swasticopter11","CLASS911_GiantCock",
		"CLASS911_CHICKENS","CLASS911_TeleToVeh","CLASS911_KillAll","CLASS911_TPALL","CreateCHICKENSALLDAY98998239893","CLASS911_Alarm","CLASS911_Music","CLASS911_Music2","CLASS911_Music3","CLASS911_Music4",
		"CLASS911_Music6","CLASS911_Music7","CLASS911_Baghead","CLASS911_Conehead","CLASS911_ServerChat","CLASS911_ServerMessage","CLASS911_MassSellingMessege","CLASS911_TimeDay","CLASS911_TimeNight","CLASS911_ServerRocket",
		"CLASS911_Kamakazi_100","CLASS911_Kamakazi_500","CLASS911_Kamakazi_50","CLASS911_NewsBanner","CLASS911_AL_Liscenses","CLASS911_AL_Drink","CLASS911_AL_Eat","CLASS911_AL_NoIllegal","CLASS911_AL_Money",
		"CLASS911_AL_NoWeight","CLASS911_AL_SuperFoods","CLASS911_AL_Unrestrain","CLASS911_AL_restrain","CLASS911_AL_NoEscort","CLASS911_AL_NoTransport","CLASS911_GIMMECAR334","CLASS911_AL_NoTaze","CLASS911_AL_Impound"
	];
	
	while {true} do
	{
		private["_var"];
		{
			_var = missionNamespace getVariable _x;
			if(!isNil {_var}) then
			{
				missionNamespace setVariable [_x,nil];
				[[0,format["%1 was flagged for using cheats.\n\nVar flagged: %2",name player,_x]],"life_fnc_broadcast",nil,false] spawn BIS_fnc_MP;
				[[format["anticheat:%1:%2:%3",name player,getPlayerUID player,_x],player],"fnc_log_ac",false,false] spawn BIS_fnc_MP;
				waitUntil {isNull player};
			};
		} foreach _blacklist;
		sleep 1;
	};
};