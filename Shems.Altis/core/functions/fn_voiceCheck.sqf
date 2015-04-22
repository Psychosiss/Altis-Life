while {true} do 
{
	waitUntil {((!isNull findDisplay 63) && (!isNull findDisplay 55))};
	sleep 1;
	if (!((ctrlText ((findDisplay 55) displayCtrl 101)) == "")) then 
	{
		if ((ctrlText ((findDisplay 63) displayCtrl 101) == localize "str_channel_side")) then 
		{
			if (isNil "life_speaking_warnings") then
			{
				life_speaking_warnings = 0;
				[] spawn
				{
					sleep 120;
					life_speaking_warnings = nil;
				};
			} else {
				life_speaking_warnings = life_speaking_warnings + 1;
			};

			switch (life_speaking_warnings) do
			{
				case 0: {systemChat ("VOUS PARLEZ DANS LE SIDE CHANNEL. PREMIER AVERTISSEMENT.");};
				case 1: {systemChat ("VOUS PARLEZ DANS LE SIDE CHANNEL. DEUXIEME AVERTISSEMENT.");};
				case 2: {systemChat ("VOUS PARLEZ DANS LE SIDE CHANNEL. TROISIEME ET DERNIER AVERTISSEMENT.");};
				case 3:
				{
					[[format["SIDECHAT: %1 à été kické pour avoir parlé dans le side channel.", player getVariable["realname",name player]]],"life_fnc_logIt",false,false] call BIS_fnc_MP;
					[[player,false,playerSide],"TON_fnc_managesc",false,false] call BIS_fnc_MP;
					sleep 0.5;
					["SpeakingSideChat",false,false] call BIS_fnc_endMission;
				};

				default
				{
					[[format["SIDECHAT: %1 à été kické pour avoir parlé dans le side channel.", player getVariable["realname",name player]]],"life_fnc_logIt",false,false] call BIS_fnc_MP;
					[[player,false,playerSide],"TON_fnc_managesc",false,false] call BIS_fnc_MP;
					sleep 0.5;
					["SpeakingSideChat",false,false] call BIS_fnc_endMission;
				};
			};
			sleep 2;
		};
	} else {};
};