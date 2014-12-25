private["_type","_message"];

_type = [_this,0,0,[[],0]] call BIS_fnc_param;
_message = [_this,1,"",[""]] call BIS_fnc_param;
if(_message == "") exitwith {};

if(typeName _type == typeName []) then
{
	for "_i" from 0 to (count _type)-1 do
	{
		switch((_type select _i)) do
		{
			case 0: {systemChat _message};
			case 1: {hint format["%1", _message]};
			case 2: {titleText[format["%1",_message],"PLAIN"];};
			case 3: {diag_log format["%1", _message]};
			case 4: {[_message,(player getVariable["realname",name player])] call life_fnc_AAN;};
			case 5: {hint parseText format["%1", _message]};
			case 6: {systemChat _message; hint _message; titleText [_message, "PLAIN"]; playSound "message";};
		};
	};
} else {
	switch (_type) do
	{
		case 0: {systemChat _message};
		case 1: {hint format["%1", _message]};
		case 2: {titleText[format["%1",_message],"PLAIN"];};
		case 3: {diag_log format["%1", _message]};
		case 4: {[_message,(player getVariable["realname",name player])] call life_fnc_AAN;};
		case 5: {hint parseText format["%1", _message]};
		case 6: {systemChat _message; hint _message; titleText [_message, "PLAIN"]; playSound "message";};
	};
};