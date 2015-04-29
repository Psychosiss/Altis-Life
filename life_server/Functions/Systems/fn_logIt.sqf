private["_mode","_message","_name","_uid"];
_mode = [_this,0,"",[""]] call BIS_fnc_param;
_message = [_this,1,[],[[]]] call BIS_fnc_param;
_name = [_this,2,"",[""]] call BIS_fnc_param;
_uid = [_this,3,"",[""]] call BIS_fnc_param;

{
	_output = switch(_mode) do 
	{
		case "diag_log": {[0,diag_log _x];};
		case "spy_log": {[1,format["1:SPY_LOG:SpyGlass: Name: %1 || UID: %2 || %3",_name,_uid,_x]];};
		default {[1,format["1:%1:extDB: %2",_mode,_x]];};
	};
	if ((_output select 0) isEqualTo 1) then
	{
		"extDB" callExtension (_output select 1);
	};
} forEach _message;