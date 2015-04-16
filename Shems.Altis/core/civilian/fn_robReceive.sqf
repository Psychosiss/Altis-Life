private["_money"];
_money = [_this,0,0,[0]] call BIS_fnc_param;
if(_money == 0) exitWith {titleText["Je n'ai pas d'argent...","PLAIN"]};

life_money = life_money + _money;
titleText[format["Vous avez dérobé %1 €",[_money] call life_fnc_numberText],"PLAIN"];