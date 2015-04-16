StartProgress = false;
RscSpectator_allowFreeCam = false;
setTerrainGrid = 50;
enableSaving [false,false];

life_versionInfo = "Altis Life RPG fondé par Tonic et developpé par Shems.";

[] execVM "KRON_Strings.sqf";
[] execVM "scripts\teargas.sqf";
[] execVM "scripts\IgiLoadinit.sqf";

fn_whoDunnit = compile preprocessFileLineNumbers "scripts\fn_whoDunnit.sqf";

StartProgress = true;