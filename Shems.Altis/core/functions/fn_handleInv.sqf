private["_math","_item","_num","_return","_var","_weight","_value","_diff"];
_math = [_this,0,false,[false]] call BIS_fnc_param;
_item = [_this,1,"",[""]] call BIS_fnc_param;
_num = [_this,2,0,[0]] call BIS_fnc_param;
if(_item == "" OR _num == 0) exitWith {false};

_var = [_item,0] call life_fnc_varHandle;
if(_math) then
{
	_diff = [_item,_num,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
	_num = _diff;
	if(_num <= 0) exitWith {false};
};
_weight = ([_item] call life_fnc_itemWeight) * _num;
_value = missionNamespace getVariable _var;

if(_math) then
{
	if((life_carryWeight + _weight) <= life_maxWeight) then
	{
		missionNamespace setVariable[_var,(_value + _num)];
		
		if((missionNamespace getVariable _var) > _value) then
		{
			life_carryWeight = life_carryWeight + _weight;
			_return = true;
		} else {
			_return = false;
		};
	} else {
		_return = false;
	};
} else {
	if((_value - _num) < 0) then
	{
		_return = false;
	} else {
		missionNamespace setVariable[_var,(_value - _num)];
		
		if((missionNamespace getVariable _var) < _value) then
		{
			life_carryWeight = life_carryWeight - _weight;
			_return = true;
		} else {
			_return = false;
		};
	};
};

_return;