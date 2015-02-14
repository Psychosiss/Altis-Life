private ["_pos"];

player setVariable ["playerSurrender", true, true];

while 
{ 
	player getVariable ["playerSurrender", false] 
} do {
	player playMove "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";

	if (!alive player) then 
	{
		player setVariable ["playerSurrender", false, true];
	};
};

player playMoveNow "AmovPercMstpSsurWnonDnon_AmovPercMstpSnonWnonDnon";