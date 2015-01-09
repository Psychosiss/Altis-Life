#include <macro.h>

private["_type","_price","_amount","_diff","_name","_hideout","_marketprice"];
if((lbCurSel 2401) == -1) exitWith {hint "You need to select an item to buy."};
_type = lbData[2401,(lbCurSel 2401)];
_price = lbValue[2401,(lbCurSel 2401)];
_amount = ctrlText 2404;
_marketprice = [_type] call life_fnc_marketGetBuyPrice;
if(_marketprice != -1) then
{
	_price = _marketprice;
};

if(!([_amount] call fnc_isnumber)) exitWith {hint "You didn't enter an actual number";};
_diff = [_type,parseNumber(_amount),life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
_amount = parseNumber(_amount);
if(_diff <= 0) exitWith {hint "You don't have enough space for that amount!"};
_amount = _diff;
_hideout = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;
if((_price * _amount) > life_cash && {!isNil "_hideout" && {!isNil {grpPlayer getVariable "gang_bank"}} && {(grpPlayer getVariable "gang_bank") <= _price * _amount}}) exitWith {hint "Vous n'avez pas assez d'argent."};

_name = [([_type,0] call life_fnc_varHandle)] call life_fnc_varToStr;

if(([true,_type,_amount] call life_fnc_handleInv)) then
{
	if(!isNil "_hideout" && {!isNil {grpPlayer getVariable "gang_bank"}} && {(grpPlayer getVariable "gang_bank") >= _price}) then 
	{
		_action = 
		[
			format
			[
				"The gang has enough funds to pay for this, would you like to pay with the gangs funds or your own?<br/><br/>Argent du gang: <t color='#8CFF9B'>$%1</t><br/>Votre argent: <t color='#8CFF9B'>$%2</t>",
				[(grpPlayer getVariable "gang_bank")] call life_fnc_numberText,
				[life_cash] call life_fnc_numberText
			],
			"Payer avec votre argent ou celui du gang",
			"Argent du gang",
			"Mon argent"
		] call BIS_fnc_guiMessage;
		if(_action) then 
		{
			hint format["Vous avez acheté %1 %2 pour %3 € avec l'argent du gang.",_amount,_name,[(_price * _amount)] call life_fnc_numberText];
			_funds = grpPlayer getVariable "gang_bank";
			_funds = _funds - (_price * _amount);
			grpPlayer setVariable["gang_bank",_funds,true];
			[[1,grpPlayer],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
		} else {
			if((_price * _amount) > life_cash) exitWith {[false,_type,_amount] call life_fnc_handleInv; hint "Vous n'avez pas assez d'argent.";};
			hint format["Vous avez acheté %1 %2 pour %3 €",_amount,_name,[(_price * _amount)] call life_fnc_numberText];
			__SUB__(life_cash,_price);
		};
	} else {
		if((_price * _amount) > life_cash) exitWith {hint "Vous n'avez pas assez d'argent."; [false,_type,_amount] call life_fnc_handleInv;};
		hint format["Vous avez acheté %1 %2 pour %3 €",_amount,_name,[(_price * _amount)] call life_fnc_numberText];
		__SUB__(life_cash,(_price * _amount));
		if(_marketprice != -1) then 
		{
			[_type, _amount] spawn
			{
				sleep 120;
				[_this select 0,_this select 1] call life_fnc_marketBuy;
			};			
		};
	};
	[] call life_fnc_virt_update;
	playSound "Caching";
};

[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;