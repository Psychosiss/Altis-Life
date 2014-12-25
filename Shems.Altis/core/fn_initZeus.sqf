player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
[] spawn life_fnc_copMarkers;

if(life_adminlevel < 2) exitWith
{
    endMission "Loser";
};