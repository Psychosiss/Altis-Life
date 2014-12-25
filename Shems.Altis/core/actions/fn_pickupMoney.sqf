if((time - life_action_delay) < 1.5) exitWith {
	hint "Vous ne pouvez pas utiliser cette touche aussi rapidement...";
	if(!isNil {(_this select 0) getVariable "inUse"}) then {
		_this select 0 setVariable["inUse",false,true];
	};
};
private["_obj","_val"];
_obj = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_val = (_obj getVariable "item") select 1;
if(isNil {_val}) exitWith {};
if(isNull _obj || player distance _obj > 3) exitWith {if(!isNull _obj) then {_obj setVariable["inUse",false,true];};};
if((_obj getVariable["PickedUp",false])) exitWith {deleteVehicle _obj;};
_obj setVariable["PickedUp",TRUE,TRUE];
if(!isNil {_val}) then
{
	deleteVehicle _obj;
	//waitUntil {isNull _obj};
	
	//Stop people picking up huge values of money which should stop spreading dirty money.
	switch (true) do
	{
		case (_val > 20000000) : {_val = 100000;};
		case (_val > 5000000) : {_val = 250000;};
		default {};
	};
	
	player playmove "AinvPknlMstpSlayWrflDnon";
	titleText[format["Vous avez trouvé $%1",[_val] call life_fnc_numberText],"PLAIN"];
	life_cash = life_cash + _val;
	life_action_delay = time;
};