private["_binConfigPatches","_cfgPatches"];

W_O_O_K_I_E_ANTI_ANTI_HAX = compileFinal (if(typeName "No" == "STRING") then {"No"} else {str("No")});
W_O_O_K_I_E_FUD_ANTI_ANTI_HAX = compileFinal (if(typeName "No" == "STRING") then {"No"} else {str("No")});
E_X_T_A_S_Y_ANTI_ANTI_HAX = compileFinal (if(typeName "CopyPasta" == "STRING") then {"CopyPasta"} else {str("CopyPasta")});
E_X_T_A_S_Y_Pro_RE = compileFinal (if(typeName "Iswhat" == "STRING") then {"Iswhat"} else {str("Iswhat")});
E_X_T_A_S_Y_Car_RE = compileFinal (if(typeName "Youdo" == "STRING") then {"Youdo"} else {str("Youdo")});
DO_NUKE = compileFinal (if(typeName "LOL" == "STRING") then {"LOL"} else {str("LOL")});
JxMxE_spunkveh = compileFinal (if(typeName "Blah" == "STRING") then {"Blah"} else {str("Blah")});
JxMxE_spunkveh2 = compileFinal (if(typeName "Blah" == "STRING") then {"Blah"} else {str("Blah")});
JxMxE_spunkair = compileFinal (if(typeName "Blah" == "STRING") then {"Blah"} else {str("Blah")});
JJJJ_MMMM___EEEEEEE_LLYYSSTTIICCC_SHIT_RE = compileFinal (if(typeName "No" == "STRING") then {"No"} else {str("No")});
JJJJ_MMMM___EEEEEEE_LLYYSSTTIICCC_SHIT_RE_OLD = compileFinal (if(typeName "No" == "STRING") then {"No"} else {str("No")});
JJJJ_MMMM___EEEEEEE_SPAWN_VEH = compileFinal (if(typeName "No" == "STRING") then {"No"} else {str("No")});
JJJJ_MMMM___EEEEEEE_SPAWN_WEAPON = compileFinal (if(typeName "No" == "STRING") then {"No"} else {str("No")});

waitUntil {!isNil "SPY_fnc_menuCheck" && !isNil "SPY_fnc_variablecheck" && !isNil "SPY_fnc_cmdMenuCheck"};

if((call SPY_cfg_runPatchCheck)) then 
{
	_binConfigPatches = configFile >> "CfgPatches";
	for "_i" from 0 to count (_binConfigPatches)-1 do 
	{
		_patchEntry = _binConfigPatches select _i;
		if(isClass _patchEntry) then {
			if(!((configName _patchEntry) in (call SPY_cfg_patchList))) exitWith 
			{
				[[profileName,getPlayerUID player,(configName _patchEntry)],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
				[[profileName,format["Unknown Addon Patch: %1",(configName _patchEntry)]],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
				sleep 0.5;
				["SpyGlass",false,false] call BIS_fnc_endMission;
			};
		};
	};
};

private["_children","_allowedChildren"];
_children = [configFile >> "RscDisplayMPInterrupt" >> "controls",0] call BIS_fnc_returnChildren;
_allowedChildren = [
"Title","MissionTitle","DifficultyTitle","PlayersName","ButtonCancel","ButtonSAVE","ButtonSkip","ButtonRespawn","ButtonOptions",
"ButtonVideo","ButtonAudio","ButtonControls","ButtonGame","ButtonTutorialHints","ButtonAbort","DebugConsole","Feedback","MessageBox"
];

{
	if(!((configName _x) in _allowedChildren)) exitWith 
	{
		[[profileName,getPlayerUID player,"Modified_MPInterrupt"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
		[[profileName,"Devcon like executor detected"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
		sleep 0.5;
		["SpyGlass",false,false] call BIS_fnc_endMission;
	};
} foreach _children;

private["_onLoad","_onUnload"];
_onLoad = getText(configFile >> "RscDisplayInventory" >> "onLoad");
_onUnload = getText(configFile >> "RscDisplayInventory" >> "onUnload");

if(_onLoad != "[""onLoad"",_this,""RscDisplayInventory"",'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""") exitWith {
	[[profileName,getPlayerUID player,"Modified_RscDisplayInventory_onLoad"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
	[[profileName,"Modified RscDisplayInventory_onLoad (CheatEngine injection)"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
	sleep 0.5;
	["SpyGlass",false,false] call BIS_fnc_endMission;
};

if(_onUnload != "[""onUnload"",_this,""RscDisplayInventory"",'IGUI'] call compile preprocessfilelinenumbers ""A3\ui_f\scripts\initDisplay.sqf""") exitWith {
	[[profileName,getPlayerUID player,"Modified_RscDisplayInventory_onUnload"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
	[[profileName,"Modified RscDisplayInventory_onUnload (CheatEngine injection)"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
	sleep 0.5;
	["SpyGlass",false,false] call BIS_fnc_endMission;
};

[] call SPY_fnc_menuCheck;
[] spawn SPY_fnc_cmdMenuCheck;
[] spawn SPY_fnc_variableCheck;

[] spawn 
{
	waitUntil {(!isNil "life_fnc_moveIn")};
	while {true} do 
	{
		if((unitRecoilCoefficient player) < 1) then 
		{
			[[profileName,getPlayerUID player,"No_recoil_hack"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
			[[profileName,"No recoil hack"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
			sleep 0.5;
			["SpyGlass",false,false] call BIS_fnc_endMission;
		};
		sleep 1.5;
	};
};