private["_unit","_amount"];
if(playerSide != west) exitWith {hint "Savez-vous qui vous ête ?"};
if((lbCurSel 2406) == -1) exitWith {hint "Vous devez séléctionner quelqu'un."};
if((lbCurSel 2407) == -1) exitWith {hint "Vous devez séléctionner un crime."};
_unit = lbData [2406,lbCurSel 2406];
_unit = call compile format["%1",_unit];
_amount = lbData [2407,lbCurSel 2407];
if(isNil "_unit") exitWith {};
if(side _unit == west) exitWith {hint "Pourquoi essayez vous de faire cela ? Voulez-vous une guerre policière ?"};
if(_unit == player) exitWith {hint "Vous ne pouvez pas vous mettre en homme recherché.";};
if(isNull _unit) exitWith {};

[[1,format["%1 a été ajouté à l'interpol.",_unit getVariable["realname",name _unit],_amount,getPlayerUID _unit]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;

[[getPlayerUID _unit,_unit getVariable["realname",name _unit],_amount],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;