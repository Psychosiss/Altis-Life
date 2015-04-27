private "_resource";
_resource = [_this,0,"",[""]] call BIS_fnc_param;

["onUnload",[]] call (missionNamespace getVariable [_resource,{}]);

(_resource call BIS_fnc_rscLayer) cutText ["","PLAIN"];