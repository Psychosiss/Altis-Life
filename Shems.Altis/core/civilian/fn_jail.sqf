private["_bad","_unit","_time"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
hint format["%1", _unit];
if(isNull _unit) exitWith {};
if(_unit != player) exitWith {};
if(life_is_arrested) exitWith {};
_bad = [_this,1,false,[false]] call BIS_fnc_param;
_time = [_this,2,15,[0]] call BIS_fnc_param;

player setVariable["restrained",false,true];
player setVariable["Escorting",false,true];
player setVariable["transporting",false,true];

titleText["Tu as été mis en prison !! Purges ta peine, si tu déconnecte, le temps sera doublé !","PLAIN"];
hint "Bienvenue en prison.";
player setPos [(getMarkerpos "jail_marker" select 0),(getMarkerpos "jail_marker" select 1), +5];

if(_bad) then
{
	waitUntil {alive player};
	sleep 1;
};

if(player distance (getMarkerPos "jail_marker") > 40) then
{
	player setPos (getMarkerPos "jail_marker");
};

[1] call life_fnc_removeLicenses;
if(life_inv_heroinu > 0) then {[false,"heroinu",life_inv_heroinu] call life_fnc_handleInv;};
if(life_inv_heroinp > 0) then {[false,"heroinp",life_inv_heroinp] call life_fnc_handleInv;};
if(life_inv_coke > 0) then {[false,"cocaine",life_inv_coke] call life_fnc_handleInv;};
if(life_inv_cokep > 0) then {[false,"cocainep",life_inv_cokep] call life_fnc_handleInv;};
if(life_inv_turtle > 0) then {[false,"turtle",life_inv_turtle] call life_fnc_handleInv;};
if(life_inv_cannabis > 0) then {[false,"cannabis",life_inv_cannabis] call life_fnc_handleInv;};
if(life_inv_marijuana > 0) then {[false,"marijuana",life_inv_marijuana] call life_fnc_handleInv;};
if(life_inv_meth > 0) then {[false,"meth",life_inv_meth] call life_fnc_handleInv;};
if(life_inv_tabac > 0) then {[false,"tabac",life_inv_tabac] call life_fnc_handleInv;};
if(life_inv_cigare > 0) then {[false,"cigare",life_inv_cigare] call life_fnc_handleInv;};
if(life_inv_kidney > 0) then {[false,"kidney",life_inv_kidney] call life_fnc_handleInv;};
life_is_arrested = true;

removeUniform player;
removeVest player;
removeHeadGear player;
removeAllWeapons player;
removeAllItems player;
{player removeMagazine _x} foreach (magazines player);
player addUniform "U_Rangemaster";

[] spawn
{
	while {true} do
	{
		waitUntil {uniform player == "U_Rangemaster"};
		player setObjectTextureGlobal [0,"images\civ\jail.paa"];
		waitUntil {uniform player != "U_Rangemaster"};
	};
};

player say3D "jail";

[[player,_bad,_time],"life_fnc_jailSys",false,false] spawn life_fnc_MP;
[5] call SOCK_fnc_updatePartial;