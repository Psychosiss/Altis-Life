//enableSaving [false,false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;
RscSpectator_allowFreeCam = false;

if(!isDedicated) then { X_Client = true;};
enableSaving [false,false];

life_versionInfo = "Altis Life RPG fondé par Tonic et developpé par Shems.";

[] execVM "KRON_Strings.sqf";
[] execVM "scripts\antiCheat.sqf";
[] execVM "scripts\antiCheat2.sqf";
[] execVM "scripts\statusBar.sqf";
[] execVM "scripts\safezone.sqf";
[] execVM "scripts\teargas.sqf";
[] execVM "scripts\IgiLoadinit.sqf";
[] execVM "scripts\fn_taxes.sqf";

[] call life_fnc_fastrope;
[] call life_fnc_addKey;

fn_whoDunnit = compile preprocessFileLineNumbers "scripts\fn_whoDunnit.sqf";

StartProgress = true;