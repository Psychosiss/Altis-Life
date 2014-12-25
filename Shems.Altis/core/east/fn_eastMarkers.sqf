private["_markers","_east"];
_markers = [];
_east = [];
sleep 0.5;
if(visibleMap) then 
{
    {if(side _x == east) then {_east set[count _east,_x];}} foreach playableUnits;
    {
        _marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
        _marker setMarkerColorLocal "ColorGreen";
        _marker setMarkerTypeLocal "Mil_dot";
        _marker setMarkerTextLocal format["%1", name _x];
        _markers set[count _markers,[_marker,_x]];
    } foreach _east;
    while {visibleMap} do
    {
        {
            private["_marker","_unit"];
            _marker = _x select 0;
            _unit = _x select 1;
            if(!isNil "_unit") then
            {
                if(!isNull _unit) then
                {
                    _marker setMarkerPosLocal (visiblePosition _unit);
                };
            };
        } foreach _markers;
        if(!visibleMap) exitWith {};
        sleep 0.02;
    };
    {deleteMarkerLocal (_x select 0);} foreach _markers;
    _markers = [];
    _east = [];
};