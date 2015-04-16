private["_val","_total"];
_val = [_this,0,"",["",0]] call BIS_fnc_param;
_total = [_this,1,"",["",0]] call BIS_fnc_param;

if(_val == _total) then
{
	titleText[format["Vous avez recu une prime de %1 € pour l'arrestation d'un criminel.",[_val] call life_fnc_numberText],"PLAIN"];
} else {
	titleText[format["Vous avez recu une prime de %1 € pour le meurtre d'un criminel de l'interpol, si vous l'aurez arrété, vous aurez recu %2 €",[_val] call life_fnc_numberText,[_total] call life_fnc_numberText],"PLAIN"];
};

life_atmmoney = life_atmmoney + _val;