#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])

private["_ctrl","_num","_safeInfo"];
disableSerialization;

if((lbCurSel 3502) == -1) exitWith {hint "Vous devez sélectionner un objet";};
_ctrl = ctrlSelData(3502);
_num = ctrlText 3505;
_safeInfo = life_goldObj getVariable["gold",0];

if(!([_num] call fnc_isnumber)) exitWith {hint localize "Vous devez entrer un nombre.";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint "Vous ne pouvez pas prendre moins de 1 unité";};
if(_ctrl != "goldbarp") exitWith {hint "Vous ne pouvez pas mettre autre chose que des lingots d'or dans le coffre."};
if(_num > _safeInfo) exitWith {hint format["Il n'y a pas %1 lingot(s) d'or dans le coffre",_num];};

_num = [_ctrl,_num,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_num == 0) exitWith {hint "Votre inventaire est plein."};

if(!([true,_ctrl,_num] call life_fnc_handleInv)) exitWith {hint "Impossible d'ajouter cela dans votre inventaire.";};
life_goldObj setVariable["gold",_safeInfo - _num,TRUE];
[life_goldObj] call life_fnc_safeInvGold;