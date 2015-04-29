private["_price","_item","_itemInfo","_bad"];

disableSerialization;
if((lbCurSel 38403) == -1) exitWith {hint "Vous devez séléctionner un objet à acheter/vendre."};
_price = lbValue[38403,(lbCurSel 38403)]; if(isNil "_price") then {_price = 0;};
_item = lbData[38403,(lbCurSel 38403)];
_itemInfo = [_item] call life_fnc_fetchCfgDetails;
_bad = "";

if((_itemInfo select 6) != "CfgVehicles") then
{
	if((_itemInfo select 4) in [4096,131072]) then
	{
		if(!(player canAdd _item) && (uiNamespace getVariable["Weapon_Shop_Filter",0]) != 1) exitWith {_bad = "Vous n'avez plus de place dans votre inventaire."};
	};
};

if(_bad != "") exitWith {hint _bad};
if((uiNamespace getVariable["Weapon_Shop_Filter",0]) == 1) then
{
	life_money = life_money + _price;
	[_item,false] call life_fnc_handleItem;
	hint parseText format["You sold a %1 for <t color='#8cff9b'>$%2</t>",_itemInfo select 1,[_price] call life_fnc_numberText];
	[nil,(uiNamespace getVariable["Weapon_Shop_Filter",0])] call life_fnc_weaponShopFilter;
} else {
	private "_hideout";
	_hideout = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;
	if(!isNil "_hideout" && {!isNil {group player getVariable "gang_bank"}} && {(group player getVariable "gang_bank") >= _price}) then 
	{
		_action = 
		[
			format
			[
				"The gang has enough funds to pay for this, would you like to pay with the gangs funds or your own?<br/><br/>Gang Funds: <t color='#8cff9b'>$%1</t><br/>Your Cash: <t color='#8cff9b'>$%2</t>",
				[(group player getVariable "gang_bank")] call life_fnc_numberText,
				[life_money] call life_fnc_numberText
			],
			"Payer avec votre argent ou celui du gang",
			"Argent du gang",
			"Mon argent"
		] call BIS_fnc_guiMessage;
		if(_action) then 
		{
			hint parseText format["Vous avez acheté %1 pour <t color='#8cff9b'>%2 €</t> avec l'argent du gang.",_itemInfo select 1,[_price] call life_fnc_numberText];
			_funds = group player getVariable "gang_bank";
			_funds = _funds - _price;
			group player setVariable["gang_bank",_funds,true];
			[_item,true] spawn life_fnc_handleItem;
			[[1,group player],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
		} else {
			if(_price > life_money) exitWith {hint "Vous n'avez pas assez d'argent sur vous!"};
			hint parseText format["Vous avez acheté %1 pour <t color='#8cff9b'>%2 €</t>",_itemInfo select 1,[_price] call life_fnc_numberText];
			life_money = life_money - _price;
			[_item,true] spawn life_fnc_handleItem;
		};
	} else {
		if(_price > life_money) exitWith {hint "Vous n'avez pas assez d'argent sur vous!"};
		hint parseText format["Vous avez acheté %1 pour <t color='#8cff9b'>%2 €</t>",_itemInfo select 1,[_price] call life_fnc_numberText];
		life_money = life_money - _price;
		[_item,true] spawn life_fnc_handleItem;
	};
};

[] call life_fnc_saveGear;