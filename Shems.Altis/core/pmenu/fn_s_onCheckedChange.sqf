private["_option","_state"];
_option = _this select 0;
_state = _this select 1;

switch(_option) do 
{
	case "tags": 
	{
		if(_state == 1) then 
		{
			life_tagson = true;
			LIFE_ID_PlayerTags = ["LIFE_PlayerTags","onEachFrame","life_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;
		} else {
			life_tagson = !true;
			[LIFE_ID_PlayerTags,"onEachFrame"] call BIS_fnc_removeStackedEventHandler;
		};
	};

	case "objects": 
	{
		if(_state == 1) then 
		{
			life_revealObjects = true;
			LIFE_ID_RevealObjects = ["LIFE_RevealObjects","onEachFrame","life_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;
		} else {
			life_revealObjects = !true;
			[LIFE_ID_RevealObjects,"onEachFrame"] call BIS_fnc_removeStackedEventHandler;
		};
	};

	case "sidechat": 
	{
		if(_state == 1) then 
		{
			life_sidechat = true;
		} else {
			life_sidechat = !true;
		};
		[[player,life_sidechat,playerSide],"TON_fnc_managesc",false,false,true] spawn life_fnc_MP;
	};
};