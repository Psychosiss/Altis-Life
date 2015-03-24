#include <macro.h>

private["_type","_index","_price","_var","_amount","_name"];
if((lbCurSel 2402) == -1) exitWith {};
_type = lbData[2402,(lbCurSel 2402)];
_index = [_type,sell_array] call fnc_index;
if(_index == -1) exitWith {};
_index2 = [_type,life_dynMarket_prices] call fnc_index;
//_price = (sell_array select _index) select 1;
_price = 0.0;
if(_index2 == -1) then 
{
	_price = (sell_array select _index) select 1;
} else {
	_price = (life_dynMarket_prices select _index2) select 1;
};
_var = [_type,0] call life_fnc_varHandle;

_amount = ctrlText 2405;
if(!([_amount] call fnc_isnumber)) exitWith {hint "Vous devez mettre des nombres";};
_amount = parseNumber (_amount);
if(_amount > (missionNameSpace getVariable _var)) exitWith {hint "Vous n'avez pas autant d'objets à vendre."};

_price = (_price * _amount);
_name = [_var] call life_fnc_varToStr;
if(([false,_type,_amount] call life_fnc_handleInv)) then
{
	hint format["Vous avez vendu %1 %2 pour %3 €",_amount,_name,[_price] call life_fnc_numberText];
	life_cash = life_cash + _price;
	life_dynMarket_boughtItems pushBack [_type,_amount];
	[] call life_fnc_virt_update;
};

if(life_shop_type == "heroin") then
{
	private["_array","_ind","_val"];
	_array = life_shop_npc getVariable["sellers",[]];
	_ind = [getPlayerUID player,_array] call fnc_index;
	if(_ind != -1) then
	{
		_val = (_array select _ind) select 2;
		_val = _val + _price;
		_array set[_ind,[getPlayerUID player,profileName,_val]];
		life_shop_npc setVariable["sellers",_array,true];
	} else {
		_array pushBack [getPlayerUID player,profileName,_price];
		life_shop_npc setVariable["sellers",_array,true];
	};
};

[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;