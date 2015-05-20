private["_dp","_dis","_price","_karma"];
_dp = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(!(life_neg_DelivItem in magazines player)) exitWith {hint "Où est la livraison ? Pourquoi avez vous les mains vides ?"};

life_neg_delivery_in_progress = false;
life_dp_point = nil;
_dis = round((getPos life_dp_start) distance (getPos _dp));
_karma = round(0.005 * _dis);
_price = round(0.5 * _dis);

["DeliverySucceeded",[format["Vous avez recu %1 € et votre karma a changé de %2 .",[_price] call life_fnc_numberText, [_karma] call life_fnc_numberText]]] call BIS_fnc_showNotification;
life_cur_task setTaskState "Succeeded";
player removeSimpleTask life_cur_task;
life_karma = life_karma - _karma;
life_money = life_money + _price;
player removeMagazine life_neg_DelivItem;
[9] call SOCK_fnc_updatePartial;