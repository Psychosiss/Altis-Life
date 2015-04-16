private["_corpse","_animals","_success"];

_corpse = life_cursorTarget;
_animals = ["Cock_random_F","Goat_random_F","Hen_random_F","Sheep_random_F","Alsatian_Random_F","Rabbit_F","Snake_random_F"];

if (isNull _corpse || !((typeOf _corpse) in _animals) || alive _corpse) exitWith 
{ 
	hint "Ce n'est pas un cadavre valable pour le dépecage!"; 
};

[[player,"AinvPknlMstpSnonWnonDnon_medic_2"],"life_fnc_animSync",true,false] call life_fnc_MP;
player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_2";
sleep 5.2;

_success = false;
_item = switch (typeOf _corpse) do
{
	case "Cock_random_F";
	case "Hen_random_F": {"chicken"};
	case "Goat_random_F": {"goat"};
	case "Sheep_random_F": {"sheep"};
	case "Alsatian_Random_F": {"dog"};
	case "Rabbit_F": {"rabbit"};
	case "Snake_random_F": {"snake"};
	default {""};
};

if (_item != "") then 
{ 
	_success = [true,_item,1] call life_fnc_handleInv; 
};

if (_success) then 
{ 
	[[0,2], format["Vous avez massacré %1 et collécté %2.", getText(configFile >> "CfgVehicles" >> (typeOf _corpse) >> "displayName"),[[_item,0] call life_fnc_varHandle] call life_fnc_varToStr]] call life_fnc_broadcast; 
} else { 
	[[0,2], "Vous êtes incapable de porter quelque chose, votre sac est sûrement plein."] call life_fnc_broadcast; 
};

deleteVehicle _corpse;