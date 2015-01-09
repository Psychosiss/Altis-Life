private["_markers","_units"];
_markers = [];
_units = [];

sleep 0.25;
if(visibleMap) then 
{
	{
		_name = _x getVariable "name";
		_down = _x getVariable ["Revive",false];
		if(!isNil "_name" && !_down) then 
		{
			_units pushBack _x;
		};
	} foreach allDeadMen;

	{
		_marker = createMarkerLocal [format["%1_dead_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorRed";
		_marker setMarkerTypeLocal "loc_Hospital";
		_marker setMarkerTextLocal format["%1",(_x getVariable["name","Unknown Player"])];
		_markers pushBack _marker;
	} foreach _units;
	
	waitUntil {!visibleMap};
	{deleteMarkerLocal _x;} foreach _markers;
};