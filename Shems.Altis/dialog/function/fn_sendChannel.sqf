private "_message";
disableSerialization;

waitUntil {!isnull (findDisplay 9000)};

if (life_money < 6000) exitWith 
{ 
	systemChat "Vous devez avoir 6000 € pour envoyer une information.";
};

if (playerSide != civilian) exitWith 
{ 
	systemChat "Vous devez être civil.";
};

if !(life_channel_send) exitWith 
{ 
	systemChat "Vous devez attendre 10 minutes pour renvoyer un message.";
};

life_money = life_money - 6000;
_message = ctrlText 9001;
[[4,format ["Canal - : %1",_message]],"life_fnc_broadcast",true,false] call life_fnc_MP;
life_channel_send = false;

[] spawn
{
	sleep 600;
	life_channel_send = true;
};