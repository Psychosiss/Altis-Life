StartProgress = false;
RscSpectator_allowFreeCam = false;
setTerrainGrid = 50;

life_versionInfo = "Altis Life RPG";

[] execVM "scripts\teargas.sqf";
[] execVM "scripts\IgiLoadinit.sqf";

fn_whoDunnit = compile preprocessFileLineNumbers "scripts\fn_whoDunnit.sqf";

StartProgress = true;