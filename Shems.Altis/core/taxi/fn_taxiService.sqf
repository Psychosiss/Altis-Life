private["_display","_locations","_price","_kill","_pos1","_pos2","_dest_name","_distance","_time"];
disableSerialization;
_kill = "";

if(vehicle player != player) exitWith {hint "Vous devez sortir de votre vehicule pour prendre le taxi.";};
if(!dialog) then
{
	createDialog "Life_taxi_menu";
	life_taxi_location = (_this select 3) select 0;
};

_display = findDisplay 48400;
_locations = _display displayCtrl 48402;
lbClear _locations;

switch (life_taxi_location) do
{
	case "donor_town": {ctrlSetText[48401,"Ville naturelle"];};
	case "civ_spawn_4": {ctrlSetText[48401,"Badtown"];};
	case "civ_spawn_3": {ctrlSetText[48401,"Neochori"];};
	case "civ_spawn_2": {ctrlSetText[48401,"Pyrgos"];};
	case "civ_spawn_10": {ctrlSetText[48401,"Kavala"];};
	case "reb_spawn_2": {ctrlSetText[48401,"Camp ouest"];};
	case "reb_spawn_1": {ctrlSetText[48401,"Camp est"];};
	case "reb_spawn_1": {ctrlSetText[48401,"Camp est"];};
	case "cop_spawn_1": {ctrlSetText[48401,"Kavala"];};
	case "cop_spawn_2": {ctrlSetText[48401,"Pyrgos"];};
	case "cop_spawn_3": {ctrlSetText[48401,"Neochori"];};
	case "cop_spawn_4": {ctrlSetText[48401,"Barrage"];};
	case "medic_spawn_1": {ctrlSetText[48401,"Kavala"];};
	case "medic_spawn_3": {ctrlSetText[48401,"Pyrgos"];};
};

if(_kill != "") exitWith 
{
	hint _kill;
	closeDialog 0;
};

{
	if(playerSide == _x select 2) then 
	{
		_dest_name = (_x select 0);
		if(life_taxi_location != _dest_name) then
		{
			_pos1 = getMarkerPos life_taxi_location;
			_pos2 = getMarkerPos _dest_name;
			_distance = _pos1 distance _pos2;
			_price = _distance;
			_price = round(_price / 2);
			_time = round(_distance / 1000 * 6);
			_locations lbAdd format["Fare to %1 - Regular (%2s): $%3 Speedy (%4s): $%5 ",_x select 1, [_time] call life_fnc_numberText, [_price] call life_fnc_numberText, [round(_time / 3)] call life_fnc_numberText, [round(_price * 2)] call life_fnc_numberText];
			_locations lbSetData [(lbSize _locations)-1,_dest_name];
			_locations lbSetValue [(lbSize _locations)-1,_price];
		};
	};
} foreach life_taxi_stands;