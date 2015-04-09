private "_this";

if (isNil "_this") exitWith {diag_log "aniChatEvents_removeEventHandler: Fournir des paramètres suffisants"};
if (typeName _this != typeName true && typeName _this != typeName 1) exitWith {diag_log "aniChatEvents_removeEventHandler: Verifiez votre syntaxe"};

if (typeName _this == typeName true) then
{
	if (_this) then
	{
		aniChatEvents_eventQueue = [];
	};
} else {
	private "_eventHandler";
	aniChatEvents_eventQueue set [_this-1, objNull];
	for "_eventHandler" from (count aniChatEvents_eventQueue)-1 to 0 step -1 do
	{
		if (typeName (aniChatEvents_eventQueue select _eventHandler) == typeName []) exitWith {};
		aniChatEvents_eventQueue set [_eventHandler, 0];
	};
	aniChatEvents_eventQueue = aniChatEvents_eventQueue - [0];
};