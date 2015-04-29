private["_ctrl","_num"];
disableSerialization;
_ctrl = (lbData[##3503,(lbCurSel ##3503)]);
_num = ctrlText 3506;

if(!([_num] call fnc_isnumber)) exitWith {hint "Invalid Number format";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint "Vous ne pouvez pas entrer dans quelque chose en dessous de 1!";};
if(_ctrl != "goldbar") exitWith {hint "Vous ne pouvez pas enregistrer quoi que ce soit mais les lingots d'or dans le coffre-fort."};
if(_num > life_inv_goldbar) exitWith {hint format["Vous n'avez pas %1 lingot(s) d'or",_num];};

if(!([false,_ctrl,_num] call life_fnc_handleInv)) exitWith {hint "Impossible de supprimer l'élément(s) à partir de votre inventaire pour mettre dans le coffre.";};
_safeInfo = life_safeObj getVariable["safe",0];
life_safeObj setVariable["safe",_safeInfo + _num,true];

[life_safeObj] call life_fnc_safeInventory;