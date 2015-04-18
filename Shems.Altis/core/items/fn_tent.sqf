private "_unit";
_item = _this select 0;
_unit = cursorTarget;
_class = switch (_item) do
{
	case "tent1": {"Land_TentA_F"};
	case "tent2": {"Land_TentDome_F"};
};

if ((player distance (getMarkerPos "city")) < 200 || (player distance (getMarkerPos "civ_spawn_3")) < 200 || (player distance (getMarkerPos "civ_spawn_4")) < 200 || (player distance (getMarkerPos "civ_spawn_2")) < 200) exitWith {hint "You are too close to a populated city to place a tent."};
if(!([false,_item,1] call life_fnc_handleInv)) exitWith {};
closeDialog 0;

life_action_inUse = true;

player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 1.5;
waitUntil {animationState player != "ainvpknlmstpsnonwnondnon_medic_1"};

life_action_inUse = false;

_tent = _class createVehicle (getPos player);
_tent setVariable ["Trunk", [[],0], true];
_tent setVariable ["owner", player, true];
[[_tent],"life_fnc_simDisable",false,false] call BIS_fnc_MP;

titleText["Vous avez dressé une tente à proximité.","PLAIN"];