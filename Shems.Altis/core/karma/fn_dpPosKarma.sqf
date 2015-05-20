private["_dp","_target","_item"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_item = ["life_bloodBank","life_pizzas","life_teddybear","life_explosive"] call BIS_fnc_selectRandom;
life_pos_DelivItem = "";

if(str(_target) in life_pos_karma_points) then
{
	private "_point";
	_point = life_pos_karma_points - [(str(_target))];
	_dp = _point call BIS_fnc_selectRandom;
} else {
	_dp = life_pos_karma_points call BIS_fnc_selectRandom;
};

if(!(player canAdd _item)) exitWith {hint "Votre inventaire est plein";};
player addMagazine _item;

life_pos_DelivItem = _item;
life_dp_start = _target;

life_pos_delivery_in_progress = true;
life_dp_point = call compile format["%1",_dp];

_dp = [_dp,"_"," "] call KRON_Replace;
life_cur_task = player createSimpleTask [format["Delivery_%1",life_dp_point]];
life_cur_task setSimpleTaskDescription [format["Vous avez livré ce packet à %1",toUpper _dp],"Delivery Job",""];
life_cur_task setTaskState "Assigned";
player setCurrentTask life_cur_task;

["DeliveryAssigned",[format["Livrer ce paquet à %1",toUpper _dp]]] call bis_fnc_showNotification;

[] spawn
{
	waitUntil {!life_pos_delivery_in_progress OR !alive player};
	if(!alive player) then
	{
		life_cur_task setTaskState "Failed";
		player removeSimpleTask life_cur_task;
		["DeliveryFailed",["Vous avez omis de livrer le colis car vous êtes morts."]] call BIS_fnc_showNotification;
		life_pos_delivery_in_progress = false;
		life_dp_point = nil;
	};
};