enableSaving [false,false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;
RscSpectator_allowFreeCam = false;
setTerrainGrid = 50;

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

MAC_fnc_switchMove = 
{
    private["_object","_anim"];
    _object = _this select 0;
    _anim = _this select 1;
    _object switchMove _anim;
};

fn_whoDunnit = compile preprocessFileLineNumbers "scripts\fn_whoDunnit.sqf";

StartProgress = true;