_unit = _this select 0; 
_msg = _this select 1; 

if (_unit != player) exitWith {};
if ((_msg call aniChatEvents_strlen) > 3) then
{
	_trigger = [_msg, 0, 2] call aniChatEvents_substr; 
	if (_trigger != "#t" && _trigger != "#r") exitWith{};
	if (_trigger == "#t") then
	{
		_filtered = [_msg, 3] call aniChatEvents_substr;
		_nameEnd = -1;
		_filteredArray = toArray _filtered;
		{
			if (_x == 32) exitWith {_nameEnd = _forEachIndex;};
		} forEach _filteredArray;
		if (_nameEnd < 0) exitwith {};
		_recipient = [_filtered,0,_nameEnd] call aniChatEvents_substr;
		_message = [_filtered,_nameEnd + 1] call aniChatEvents_substr;
		if ((_message call aniChatEvents_strlen) > 0) then
		{
			_to = objNull;
			_recipientLow = ([_recipient] call KRON_StrLower);
			{
				if (([(name _x)] call KRON_StrLower) == _recipientLow) then {_to = _x;};
			} forEach playableUnits;
			if (isNull _to) exitWith {};
			[[_message,name player,0],"life_fnc_clientMessage",_to,false] spawn BIS_fnc_MP;
			systemChat format["Vous envoyez un message à %1 : %2",name _to,_message];
		};
	} else {
		if (!isNil "life_last_message") then
		{
			_message = [_msg, 3] call aniChatEvents_substr; 
			if ((_message call aniChatEvents_strlen) > 0) then
			{
				_to = objNull;
				_recipientLow = ([life_last_message] call KRON_StrLower);
				{
					if (([(name _x)] call KRON_StrLower) == _recipientLow) then {_to = _x;};
				} forEach playableUnits;
				if (isNull _to) exitWith {systemChat format["Le téléphone de %1 est eteint.", life_last_message]};
				[[_message,name player,0],"life_fnc_clientMessage",_to,false] spawn BIS_fnc_MP;
				systemChat format["Vous envoyez un message à %1 : %2",name _to,_message];
			};
		} else {
			systemChat "Vous ne pouvez pas répondre si personne ne vous envoie de message.";
		};
	};
};