life_combatTime = time;
if (!life_firstCombatActive) then
{
	[] spawn
	{
		life_firstCombatActive = true;
		while {(life_combatTime > (time - 60))} do
		{
			if ((cameraView == "External") && ((vehicle player) == player)) then 
			{
				player switchCamera "Internal";
			};
			sleep 0.2;
		};
		life_firstCombatActive = false;
	};
};