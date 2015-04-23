disableSerialization;
private["_search","_ui","_progress","_cP","_pgText"];
if(life_action_inUse) exitWith {hint "Attendez que l'action se termine."};
_search = nearestObjects[getPos air_sp, ["Air"],5];
if(count _search == 0) exitWith {hint "Aucun hélicoptère sur l'héliport."};
if(life_money < 1000) exitWith {hint "Vous devez avoir 1000 € pour l'entretion de votre hélicoptère."};
life_money = life_money - 1000;
life_action_inUse = true;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Servicing Chopper (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;

while {true} do
{
	sleep  0.2;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["Servicing Chopper (%1%2)...",round(_cP * 100),"%"];
	if(_cP >= 1) exitWith {};
};

if(!alive (_search select 0) || (_search select 0) distance air_sp > 10) exitWith {life_action_inUse = false; hint "The vehicle is no longer alive or on the helipad!"};
if(!local (_search select 0)) then
{
	[[(_search select 0),1],"life_fnc_setFuel",(_search select 0),false] spawn life_fnc_MP;
} else {
	(_search select 0) setFuel 1;
};
(_search select 0) setDamage 0;

5 cutText ["","PLAIN"];
titleText ["Your chopper is now repaired and refuelled.","PLAIN"];
life_action_inUse = false;