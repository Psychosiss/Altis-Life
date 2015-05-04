private["_gather","_itemWeight","_diff","_itemName","_val","_resourceZones","_zone","_text","_noesckey","_noEscKey"];
_resourceZones = 
[
	"apple_1","apple_4","apple_9",
	"peaches_2","peaches_3","peaches_9",
	"heroin_1",
	"cocaine_1",
	"weed_1",
	"meth_1",
	"tabac_1",
	"warm_marker",
	"lead_1",
	"iron_1",
	"salt_1",
	"sand_1",
	"diamond_1",
	"oil_1","oil_2",
	"rock_1",
	"silver_1"
];

_zone = "";

gather_var = true;
_noEscKey = (findDisplay 46) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then {true}"];
noEscKey = (findDisplay 46) displayAddEventHandler ["KeyDown", "if ((_this select 1) == 1) then {gather_var = false}"];
titleText ["Appuyez sur echap pour annuler la récolte.","PLAIN",2];
life_action_inUse = true;

while {gather_var} do 
{
	{
		if(player distance (getMarkerPos _x) < 30) exitWith {_zone = _x;};
	} foreach _resourceZones;

	if(_zone == "") exitWith 
	{
		gather_var = false;
		life_action_inUse = false;
	};

	switch true do 
	{
		case (_zone in ["apple_1","apple_4","apple_9"]): {_gather = "apple"; _val = 3;};
		case (_zone in ["peaches_2","peaches_3","peaches_9"]): {_gather = "peach"; _val = 3;};
		case (_zone in ["heroin_1"]): {_gather = "heroinu"; _val = 1;};
		case (_zone in ["cocaine_1"]): {_gather = "cocaine"; _val = 1;};
		case (_zone in ["weed_1"]): {_gather = "cannabis"; _val = 1;};
		case (_zone in ["meth_1"]): {_gather = "methu"; _val = 1;};
		case (_zone in ["tabac_1"]): {_gather = "tabac"; _val = 1;};
		case (_zone in ["warm_marker"]): {_gather = "uranium1"; _val = 1;};
		case (_zone in ["lead_1"] && life_inv_pickaxe > 0): {_gather = "copperore"; _val = 1;};
		case (_zone in ["iron_1"] && life_inv_pickaxe > 0): {_gather = "ironore"; _val = 1;};
		case (_zone in ["salt_1"] && life_inv_pickaxe > 0): {_gather = "salt"; _val = 1;};
		case (_zone in ["sand_1"] && life_inv_pickaxe > 0): {_gather = "sand"; _val = 1;};
		case (_zone in ["diamond_1"] && life_inv_pickaxe > 0): {_gather = "diamond"; _val = 1;};
		case (_zone in ["oil_1","oil_2"] && life_inv_pickaxe > 0): {_gather = "oilu"; _val = 1;};
		case (_zone in ["rock_1"] && life_inv_pickaxe > 0): {_gather = "rock"; _val = 1;};
		case (_zone in ["silver_1"] && life_inv_pickaxe > 0): {_gather = "silver"; _val = 1;};
		default {""};
	};

	if(vehicle player != player) exitWith 
	{ 
		gather_var = false;
	};

	_diff = [_gather,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
	if(_diff == 0) exitWith 
	{
		hint "Tu n'as plus de place dans ton inventaire.";
		gather_var = false;
	};

	for "_i" from 0 to 2 do
	{
		player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
		waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
		sleep 2.5;
	};

	if(([true,_gather,_diff] call life_fnc_handleInv)) then
	{
		_itemName = [([_gather,0] call life_fnc_varHandle)] call life_fnc_varToStr;
		titleText[format"Vous avez recueilli %1 %2(s)",_diff,_itemName,"PLAIN"];
	};
};

life_action_inUse = false;
(findDisplay 46) displayRemoveEventHandler ["KeyDown",_noEscKey];
(findDisplay 46) displayRemoveEventHandler ["KeyDown",noEscKey];