private["_index","_loc","_price","_sp","_kill","_time","_failed"];
_kill = false;
_index = lbCurSel 48402;
_loc = lbData[48402,_index];
_sp = getMarkerPos _loc;
_price = lbValue[48402,(lbCurSel 48402)];
_time = _price / 1000 * 6;
if(_price < 0) exitWith {};
_failed = false;
if(life_cash >= _price) then
{
	life_cash = life_cash - _price;
} else {
	if(life_atmcash < (_price + 1000)) then
	{
		_failed = true;
	} else {
		hint "$1,000 de surcharge à été pris de votre compte en banque.";
		life_atmcash = life_atmcash - _price - 1000;
	};
};
if(_failed) exitWith {hint "Vous n'avez pas assez d'argent";};
closeDialog 0;
cutText["En route vers la destination...","BLACK FADED"];
0 cutFadeOut 9999999;
player setPos getMarkerPos "respawn_civilian";
sleep (_time + 1);
player setPos _sp;
cutText ["You have arrived at your destination.","BLACK IN"];
[true] call life_fnc_sessionHandle;