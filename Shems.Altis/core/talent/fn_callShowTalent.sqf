private["_coco","_progress","_ui","_pgText","_percent","_point"];
_coco = [2] call life_fnc_returnInfo;
_percent = _coco * 100;

disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (%3%1)...","%","Experience",(floor _percent)];
_progress progressSetPosition _coco;

sleep 10;
5 cutText ["","PLAIN"];