private["_fish","_type","_typeName"];
if(!(vehicle player isKindOf "Ship")) exitWith {};
_fish = (nearestObjects[getPos vehicle player,["Fish_Base_F"],20]);
life_net_dropped = true;
titleText["Déployement du filet de pêche...","PLAIN"];
sleep 5;
if(count _fish == 0) exitWith 
{
	titleText["Vous n'avez pas attraper de poisson...","PLAIN"]; 
	life_net_dropped = false;
};

{
	if(_x isKindOf "Fish_Base_F") then
	{
		switch true do
		{
			case ((typeOf _x) == "Salema_F"): {_typeName = "Salema"; _type = "salema";};
			case ((typeOf _x) == "Ornate_random_F") : {_typeName = "Ornate"; _type = "ornate";};
			case ((typeOf _x) == "Mackerel_F") : {_typeName = "Mackerel"; _type = "mackerel";};
			case ((typeOf _x) == "Tuna_F") : {_typeName = "Tuna"; _type = "tuna";};
			case ((typeOf _x) == "Mullet_F") : {_typeName = "Mullet"; _type = "mullet";};
			case ((typeOf _x) == "CatShark_F") : {_typeName = "Poisson chat"; _type = "catshark";};
			default {_type = "";};
		};
		sleep 3;
		if(([true,_type,1] call life_fnc_handleInv)) then
		{
			deleteVehicle _x;
			titleText[format["Vous avez attrapé un(e) %1",_typeName],"PLAIN"];
		};
	};
} foreach (_fish);

sleep 1.5;
titleText["Filet de pêche remonté.","PLAIN"];
life_net_dropped = false;