private "_target";
_target = lbData[2902,lbCurSel (2902)];
_target = call compile format["%1", _target];
if((call life_adminlevel) < 1) exitWith {closeDialog 0; hint "Votre niveau admin n'est pas suffisamment élevée.";};
if(isNil "_target") exitwith {};
if(isNull _target) exitWith {};
if(_unit == player) exitWith {hint "Vous ne pouvez pas le faire sur vous-même.";};

_target setPos (getPos player);
hint format["Vous avez téléporté %1 sur votre position",_target getVariable["realname",name _target]];