private "_organThief";
_organThief = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _organThief) exitWith {};

[[1,format["%1 a pris un organe à %2.",name _organThief,name player]],"life_fnc_broadcast",nil,false] call life_fnc_MP;
[_organThief,"kidney",1] call life_fnc_handleInv;
[[getPlayerUID _organThief,name _organThief,"919"],"life_fnc_wantedAdd",false,false] call life_fnc_MP;
sleep 300;
_organThief setVariable["hasOrgan",false,true];