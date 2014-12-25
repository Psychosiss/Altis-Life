private ["_this", "_needle", "_callback", "_flags", "_paramNum"];

if (isNil "_this") exitWith {diag_log "aniChatEvents_addEventHandler: please provide sufficient parameters"};
if (typeName _this != typeName []) exitWith {diag_log "aniChatEvents_addEventHandler: please check your syntax"};
if (count _this < 2) exitWith {diag_log "aniChatEvents_addEventHandler: please check your syntax"};

_needle = _this select 0;
_callback = _this select 1;
_flags = [false, false, false]; 

if (typeName _callback != typeName "") exitWith {diag_log "aniChatEvents_addEventHandler: the callback-parameter must be a string!"};
if (typeName _needle == typeName []) then
{
	private "_param";
	
	_paramNum 	= count _needle;
	if (_paramNum > 1) then
	{
		for "_param" from 1 to (_paramNum-1) do
		{
			if (typeName (_needle select _param) == typeName true && _param <= (count _flags)) then
			{
				_flags set [_param-1, _needle select _param];
			};			
		};
	};
	_needle		= _needle select 0;
};

aniChatEvents_eventQueue set [count aniChatEvents_eventQueue, [_needle, _callback, _flags]];

_paramNum = count aniChatEvents_eventQueue;
_paramNum;