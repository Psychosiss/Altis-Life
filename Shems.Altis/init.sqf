enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

if(!isDedicated) then { X_Client = true;};
enableSaving[false,false];

life_versionInfo = "Altis Life RPG fondé par Tonic et developper par Shems.";
[] execVM "library.sqf";
[] execVM "scripts\antiCheat.sqf";
[] execVM "scripts\antiCheat2.sqf";
[] execVM "scripts\statusBar.sqf";
[] execVM "scripts\safezone.sqf";
[] execVM "scripts\teargas.sqf";
[] execVM "scripts\IgiLoadinit.sqf";

[] call life_fnc_fastrope;
[] call life_fnc_addKey;

fn_whoDunnit = compile preprocessFileLineNumbers "scripts\fn_whoDunnit.sqf";

{_x setMarkerAlphaLocal 0} forEach ["mrkRed","mrkRed_1","mrkRed_1_1","mrkRed_1_3","mrkGreen"];

if (isServer) then 
{
	[] execVM "\life_server\Functions\Custom\fn_setDate.sqf"
};

if(isDedicated && isNil("life_market_prices")) then
{
	[] call life_fnc_marketConfiguration;
	diag_log "Prix du marché remis à zero!";
	"life_market_prices" addPublicVariableEventHandler
	{ 
		diag_log format["Prix du marché mis a jour! %1", _this select 1]; 
	};
	[] execFSM "core\fsm\server.fsm";
	diag_log "FSM executé";
};

StartProgress = true;