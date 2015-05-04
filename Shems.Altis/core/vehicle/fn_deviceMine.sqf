private["_vehicle","_resourceZones","_zone","_weight","_item","_vInv","_itemIndex","_useBug"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {};
if(!isNil {_vehicle getVariable "mining"}) exitWith {hint "Ce véhicule est déjà en exploitation minière.";};
closeDialog 0;
life_action_inUse = true;
_useBug = false;
_weight = [_vehicle] call life_fnc_vehicleWeight;
if((_weight select 1) >= (_weight select 0)) exitWith 
{
	hint "Le véhicule est plein."; 
	life_action_inUse = false;
};

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

{
	if(player distance (getMarkerPos _x) < 150) exitWith {_zone = _x;};
} foreach _resourceZones;

if(_zone == "") exitWith 
{
	hint "Vous n'êtes pas à proximité d'un champ de ressources.";
	life_action_inUse = false;
};

_item = switch true do 
{
	case (_zone in ["apple_1","apple_4","apple_9"]): {"apple"};
	case (_zone in ["peaches_2","peaches_3","peaches_9"]): {"peach"};
	case (_zone in ["heroin_1"]): {"heroinu"};
	case (_zone in ["cocaine_1"]): {"cocaine"};
	case (_zone in ["weed_1"]): {"cannabis"};
	case (_zone in ["meth_1"]): {"methu"};
	case (_zone in ["tabac_1"]): {"tabac"};
	case (_zone in ["warm_marker"]): {"uranium1"};
	case (_zone in ["lead_1"]): {"copperore"};
	case (_zone in ["iron_1"]): {"ironore"};
	case (_zone in ["salt_1"]): {"salt"};
	case (_zone in ["sand_1"]): {"sand"};
	case (_zone in ["diamond_1"]): {"diamond"};
	case (_zone in ["oil_1","oil_2"]): {"oilu"};
	case (_zone in ["rock_1"]): {"rock"};
	case (_zone in ["silver_1"]): {"silver"};
	default {""};
};

if(_item == "") exitWith 
{
	hint "Mauvaise ressource ?"; 
	life_action_inUse = false;
};
_vehicle setVariable ["mining",true,true];
[_vehicle,"life_fnc_soundDevice",true,false] spawn life_fnc_MP;

life_action_inUse = false;

while {true} do 
{
	if(!alive _vehicle OR isNull _vehicle) exitWith {};
	if(isEngineOn _vehicle) exitWith {titleText["Vous ne pouvez pas allumé le véhicule sur l'exploitation minière.","PLAIN"];};
	titleText["Le véhicule mine...","PLAIN"];
	_time = time + 27;

	waitUntil 
	{
		if(isEngineOn _vehicle) exitWith {titleText["Vous ne pouvez pas allumé le véhicule sur l'exploitation minière.","PLAIN"]; true};
		if(round(_time - time) < 1) exitWith {true};
		sleep 0.2;
		false
	};
	if(isEngineOn _vehicle) exitWith {titleText["Vous ne pouvez pas allumé le véhicule sur l'exploitation minière.","PLAIN"];};
	_vInv = _vehicle getVariable ["Trunk",[[],0]];
	_items = _vInv select 0;
	_space = _vInv select 1;
	if (_space < 0) exitWith {hint "Usebug logué sur ce véhicule, minage désactivé, inventaire supprimé."; _useBug = true;};
	_itemIndex = [_item,_items] call fnc_index;
	_weight = [_vehicle] call life_fnc_vehicleWeight;
	_sum = [_item,15,_weight select 1,_weight select 0] call life_fnc_calWeightDiff;
	if(_sum < 1) exitWith {titleText["Le véhicule est plein.","PLAIN"];};
	_itemWeight = ([_item] call life_fnc_itemWeight) * _sum;
	if(_itemIndex == -1) then 
	{
		_items pushBack [_item,_sum];
	} else {
		_val = _items select _itemIndex select 1;
		_items set[_itemIndex,[_item,_val + _sum]];
	};
	
	if(fuel _vehicle == 0) exitWith {titleText["Le véhicule est en panne de carburant","PLAIN"];};

	if(local _vehicle) then 
	{
		_vehicle setFuel (fuel _vehicle)-0.045;
	} else {
		[[_vehicle,(fuel _vehicle)-0.04],"life_fnc_setFuel",_vehicle,false] spawn life_fnc_MP;
	};
	
	if(fuel _vehicle == 0) exitWith {titleText["Le véhicule est en panne de carburant","PLAIN"];};
	titleText[format["Cycle terminé, l'appareil a miné %1",_sum],"PLAIN"];
	_vehicle setVariable["Trunk",[_items,_space + _itemWeight],true];
	_weight = [_vehicle] call life_fnc_vehicleWeight;
	_sum = [_item,15,_weight select 1,_weight select 0] call life_fnc_calWeightDiff;
	if(_sum < 1) exitWith {titleText["Le véhicule est plein.","PLAIN"];};
	sleep 2;
};

if (_useBug) exitWith
{
	_vehicle setVariable ["Trunk",[[],0],true];
};

_vehicle setVariable["mining",nil,true];