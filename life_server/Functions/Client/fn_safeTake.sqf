private["_ctrl","_num","_safeInfo"];
disableSerialization;

if((lbCurSel 3502) == -1) exitWith {hint "Vous devez séléctionner un item!";};
_ctrl = (lbData[##3502,(lbCurSel ##3502)]);
_num = ctrlText 3505;
_safeInfo = life_safeObj getVariable["safe",0];

if(!([_num] call fnc_isnumber)) exitWith {hint "Format invalide";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint "Vous ne pouvez pas entrer dans quelque chose en dessous de 1!";};
if(_ctrl != "goldbar") exitWith {hint "Vous ne pouvez pas enregistrer quoi que ce soit mais les lingots d'or dans le coffre-fort."};
if(_num > _safeInfo) exitWith {hint format["Il n'y a pas %1 lingot(s) d'or dans le coffre-fort!",_num];};

_num = [_ctrl,_num,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_num == 0) exitWith {hint "Your inventory is full."};

if(!([true,_ctrl,_num] call life_fnc_handleInv)) exitWith {hint "Vous ne pouvez pas ajouter cela dans votre inventaire.";};
life_safeObj setVariable["safe",_safeInfo - _num,TRUE];
[life_safeObj] call life_fnc_safeInventory;