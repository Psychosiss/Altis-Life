private["_unit","_val","_from"];
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_val = [_this,1,"",[""]] call BIS_fnc_param;
_from = [_this,2,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _unit OR isNull _from OR _val == "") exitWith {};
if(player != _unit) exitWith {};
if(!([_val] call fnc_isnumber)) exitWith {};
if(_unit == _from) exitWith {};

hint format["%1 vous a donner %2 €",_from getVariable["realname",name _from],[(parseNumber (_val))] call life_fnc_numberText];
life_cash = life_cash + (parseNumber(_val));