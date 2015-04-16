private["_value","_from"];
_value = [_this,0,0,[0]] call BIS_fnc_param;
_from = [_this,1,"",[""]] call BIS_fnc_param;

if (_value == 0 OR _from == "" OR _from == profileName) exitWith {};
life_atmmoney = life_atmmoney + _value;
hint format["%1 a viré %2 € pour vous par la banque.",_from,[_value] call life_fnc_numberText];