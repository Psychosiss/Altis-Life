#include <macro.h>

private ["_idleTime,_tps,_actuPos,_dist,_distAparcour,_timeWhenRespawn,_tpsRest"];

while{true} do
{
    _idleTime = 60 * 20;
    _tps = time;
    _actuPos = getPosATL player;
    _distAparcour = 2;
    _dist = 0;

    while{true} do
    {
        sleep 5;
        if(((player getVariable "Incapacitated") == 1) OR (player getVariable "restrained")) exitWith {};
        if (__GETC__(life_adminlevel) != 0) exitWith {};
        _timeWhenRespawn = round abs (time - _tps);
        _tpsRest = _idleTime - _timeWhenRespawn;
        _dist = _actuPos distance getPosATL player;
        if(_timeWhenRespawn > _idleTime) then {failMission "LOSER";};
        if(_dist > _distAparcour) exitWith {};
        if(_tpsRest < _idleTime/2) then
        {
            hint format ["Vous êtes considéré comme absent depuis %1 seconde(s), vous serez kick dans %2 seconde(s)", _timeWhenRespawn, _timeRest];
        };
    };
    sleep 15;
};
