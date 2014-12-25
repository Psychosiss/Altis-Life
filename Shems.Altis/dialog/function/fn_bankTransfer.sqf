private["_val","_unit","_tax"];
_val = parseNumber(ctrlText 2702);
_unit = call compile format["%1",(lbData[2703,(lbCurSel 2703)])];
if(isNull _unit) exitWith {};
if((lbCurSel 2703) == -1) exitWith {hint "Vous devez choisir une personne."};
if(isNil "_unit") exitWith {hint "Le joueur sélectionné ne semble pas exister."};
if(_val > 1000000) exitWith {hint "Vous ne pouvez pas transférer plus de 1.000.000 $";};
if(_val < 0) exitwith {};
if(!([str(_val)] call life_fnc_isnumeric)) exitWith {hint "Ce n'est pas un format de nombre réel."};
if(_val > life_atmcash) exitWith {hint "Vous n'avez pas autant dans votre compte bancaire!"};
_tax = [_val] call life_fnc_taxRate;
if((_val + _tax) > life_atmcash) exitWith {hint format["Vous n'avez pas assez d'argent dans votre compte en banque, pour transférer %1 € vous aurez besoin %2 € comme taxe fiscale.",_val,_tax]};

life_atmcash = life_atmcash - (_val + _tax);

[[_val,profileName],"clientWireTransfer",_unit,false] spawn life_fnc_MP;
[] call life_fnc_atmMenu;
hint format["Vous avez transféré %1 € à %2.\n\nDes frais de %3 € ont été prise pour le transfert.",[_val] call life_fnc_numberText,_unit getVariable["realname",name _unit],[_tax] call life_fnc_numberText];
playSound "atm";
[1] call SOCK_fnc_updatePartial;