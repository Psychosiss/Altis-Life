[] spawn 
{
	waitUntil {!isNull (uiNamespace getVariable "RscDisplayRemoteMissions")};
	[[profileName,getPlayerUID player,"MenuBasedHack_RscDisplayRemoteMissions"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
	[[profileName,"Menu Hack: RscDisplayRemoteMissions"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
	sleep 0.5;
	["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
};

[] spawn 
{
	waitUntil {!isNull (uiNamespace getVariable "RscDisplayDebugPublic")};
	closeDialog 0;
	[[profileName,getPlayerUID player,"MenuBasedHack_RscDisplayDebugPublic"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
	[[profileName,"Menu Hack: RscDisplayDebugPublic"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
	sleep 0.5;
	["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
};

[] spawn 
{
	while {true} do 
	{
		waitUntil {!isNull (uiNamespace getVariable "RscDisplayArsenal")};
		closeDialog 0;
		[[profileName,getPlayerUID player,"MenuBasedHack_RscDisplayArsenal"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
		[[profileName,"Menu Hack: BIS Arsenal"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
		sleep 0.5;
		["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
	};
};

[] spawn 
{
	while {true} do 
	{
		waitUntil{!isNull (uiNamespace getVariable "RscDisplayInsertMarker")};
		sleep 0.6;
		_action = buttonAction 1;
		_action2 = buttonAction 2;
		_title = ctrlText 1001;
		if(_action != "" OR _title != localize "$STR_A3_RscDisplayInsertMarker_Title" OR _action2 != "") exitWith 
		{
			closeDialog 0;
			[[profileName,getPlayerUID player,"MenuBasedHack_RscDisplayInsertMarker"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
			[[profileName,"Menu Hack: RscDisplayInsertMarker"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
			sleep 0.5;
			["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
		};
	};
};

[] spawn 
{
	waitUntil {!isNull (findDisplay 19)};
	[[profileName,getPlayerUID player,"MenuBasedHack_DISPLAY_19"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
	[[profileName,"Menu Hack: DISPLAY 19"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
	sleep 0.5;
	["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
};

[] spawn 
{
	waitUntil {!isNull (findDisplay 30)};
	[[profileName,getPlayerUID player,"MenuBasedHack_DISPLAY_30"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
	[[profileName,"Menu Hack: DISPLAY 30"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
	sleep 0.5;
	["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
};

[] spawn 
{
	waitUntil {!isNull (findDisplay 32)};
	[[profileName,getPlayerUID player,"MenuBasedHack_DISPLAY_32"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
	[[profileName,"Menu Hack: DISPLAY 32"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
	sleep 0.5;
	["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
};

[] spawn 
{
	waitUntil {!isNull (findDisplay 45)};
	[[profileName,getPlayerUID player,"MenuBasedHack_DISPLAY_45"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
	[[profileName,"Menu Hack: DISPLAY 45"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
	sleep 0.5;
	["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
};

[] spawn 
{
	waitUntil {!isNull ((findDisplay 49) displayCtrl 0)};
	[[profileName,getPlayerUID player,"MenuBasedHack_DISPLAY_49_C_0"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
	[[profileName,"Menu Hack: DISPLAY 49 CONTROL 0"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
	sleep 0.5;
	["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
};

[] spawn 
{
	waitUntil {!isNull ((findDisplay 64) displayCtrl 101)};
	[[profileName,getPlayerUID player,"MenuBasedHack_DISPLAY_64_C_101"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
	[[profileName,"Menu Hack: DISPLAY 64 CONTROL 101"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
	sleep 0.5;
	["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
};

[] spawn 
{
	waitUntil {!isNull (findDisplay 69)};
	[[profileName,getPlayerUID player,"MenuBasedHack_DISPLAY_69"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
	[[profileName,"Menu Hack: DISPLAY 69"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
	sleep 0.5;
	["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
};

[] spawn 
{
	waitUntil {!isNull (findDisplay 71)};
	[[profileName,getPlayerUID player,"MenuBasedHack_DISPLAY_71"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
	[[profileName,"Menu Hack: DISPLAY 71"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
	sleep 0.5;
	["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
};

[] spawn 
{
	waitUntil {!isNull (findDisplay 125)};
	[[profileName,getPlayerUID player,"MenuBasedHack_DISPLAY_125"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
	[[profileName,"Menu Hack: DISPLAY 125"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
	sleep 0.5;
	["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
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
	waitUntil {!isNull (findDisplay 132)};
	[[profileName,getPlayerUID player,"MenuBasedHack_DISPLAY_132"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
	[[profileName,"Menu Hack: DISPLAY 132"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
	sleep 0.5;
	["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
};

[] spawn 
{
	while {true} do 
	{
		waitUntil {!isNull (findDisplay 148)};
		sleep 0.5;
		if((lbSize 104)-1 > 3) exitWith 
		{
			[[profileName,getPlayerUID player,"MenuBasedHack_RscDisplayConfigureControllers"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
			[[profileName,"Menu Hack: RscDisplayConfigureControllers (JME 313)"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
			sleep 0.5;
			["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
		};
		closeDialog 0;
	};
};

[] spawn 
{
	waitUntil {!isNull (findDisplay 157)};
	[[profileName,getPlayerUID player,"MenuBasedHack_DISPLAY_157"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
	[[profileName,"Menu Hack: DISPLAY 157"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
	sleep 0.5;
	["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
};

[] spawn 
{
	waitUntil {!isNull (findDisplay 162)};
	[[profileName,getPlayerUID player,"MenuBasedHack_DISPLAY_162"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
	[[profileName,"Menu Hack: DISPLAY 162 (Lystic & Bobby Menu Hack)"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
	sleep 0.5;
	["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
};

[] spawn 
{
	waitUntil {!isNull (findDisplay 165)};
	[[profileName,getPlayerUID player,"MenuBasedHack_DISPLAY_165"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
	[[profileName,"Menu Hack: DISPLAY 165"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
	sleep 0.5;
	["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
};

[] spawn 
{
	waitUntil {!isNull (findDisplay 2727)};
	[[profileName,getPlayerUID player,"MenuBasedHack_DISPLAY_2727"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
	[[profileName,"Menu Hack: DISPLAY 2727"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
	sleep 0.5;
	["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
};

[] spawn 
{
	waitUntil {!isNull (findDisplay 3030)};
	[[profileName,getPlayerUID player,"MenuBasedHack_DISPLAY_3030"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
	[[profileName,"Menu Hack: DISPLAY 3030 (Wookie Menu etc)"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
	sleep 0.5;
	["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
};

[] spawn 
{
	while{true} do 
	{
		waitUntil{!isNull (uiNamespace getVariable "RscDisplayInsertMarker")};
		sleep 0.6;
		_action = buttonAction 1;
		_action2 = buttonAction 2;
		_title = ctrlText 1001;
		if(_action != "" OR _title != localize "$STR_A3_RscDisplayInsertMarker_Title" OR _action2 != "") exitWith 
		{
			closeDialog 0;
			[[profileName,getPlayerUID player,"MenuBasedHack_RscDisplayInsertMarker"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
			[[profileName,"Menu Hack: RscDisplayInsertMarker"],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
			sleep 0.5;
			["SpyGlass",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
		};
	};
};