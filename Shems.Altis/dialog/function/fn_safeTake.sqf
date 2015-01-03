#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])

private["_ctrl","_num","_safeInfo"];
disableSerialization;

if((lbCurSel 3502) == -1) exitWith {hint "You need to select an item!";};
_ctrl = ctrlSelData(3502);
_num = ctrlText 3505;
_safeInfo = life_safeObj getVariable["safe",0];
if(!([_num] call fnc_isnumber)) exitWith {hint "Entrer un nombre";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint "You can't enter anything below 1!";};
if(_ctrl != "goldbar") exitWith {hint "You can't store anything but gold bars in the safe."};
if(_num > _safeInfo) exitWith {hint format["There isn't %1 gold bar(s) in the safe!",_num];};
_num = [_ctrl,_num,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_num == 0) exitWith {hint "Votre inventaire est plein."};
if(!([true,_ctrl,_num] call life_fnc_handleInv)) exitWith {hint "Couldn't add it to your inventory.";};
life_safeObj setVariable["safe",_safeInfo - _num,TRUE];
[life_safeObj] call life_fnc_safeInventory;