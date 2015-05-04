closeDialog 0;
private["_mine","_itemWeight","_diff","_itemName","_val"];
switch true do
{
    case (player distance (getMarkerPos "lead_1") < 30): {_mine = "copperore"; _val = 3;};
	case (player distance (getMarkerPos "iron_1") < 30): {_mine = "ironore"; _val = 3;};
	case (player distance (getMarkerPos "salt_1") < 120) : {_mine = "salt"; _val = 5;};
	case (player distance (getMarkerPos "sand_1") < 75) : {_mine = "sand"; _val = 6;};
	case (player distance (getMarkerPos "diamond_1") < 50): {_mine = "diamond"; _val = 2;};
	case (player distance (getMarkerPos "oil_1") < 40) : {_mine = "oilu"; _val = 2;};
	case (player distance (getMarkerPos "oil_2") < 40) : {_mine = "oilu"; _val = 2;};
	case (player distance (getMarkerPos "rock_1") < 50): {_mine = "rock"; _val = 3;};
	case (player distance (getMarkerPos "silver_1") < 40): {_mine = "silver"; _val = 3;};
    default {_mine = "";};
};

if(_mine == "") exitWith {hint "Vous n'êtes pas à proximité d'une mine!";};
if(life_inv_pickaxe > 0) exitWith {hint "Vous devez laché votre pioche!";};

_diff = [_mine,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint "Votre inventaire est plein."};
delay_pickaxe = true;
life_action_in_Use = true;
for "_i" from 0 to 1 do
{
    player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
    waitUntil{animationState player != "AinvPknlMstpSnonWnonDnon_medic_1";};
	playSound "marteau";
    sleep 2.5;
};

if(([true,_mine,_diff] call life_fnc_handleInv)) then
{
    _itemName = [([_mine,0] call life_fnc_varHandle)] call life_fnc_varToStr;
    titleText[format["Vous avez miné %2 %1",_itemName,_diff],"PLAIN"];
};

sleep 2.5;
delay_pickaxe = false;
life_action_in_Use = false;