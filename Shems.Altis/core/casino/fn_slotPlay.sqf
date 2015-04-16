_delay = 7;

with missionNamespace do 
{
	if ((player getVariable ["slotmachine_lastplay", 0]) + _delay > time) exitWith {};
	player setVariable ["slotmachine_lastplay", time];
	
	_bet = player getVariable ["slotmachine_bet", 0];
	if (life_money < _bet) exitWith 
	{
		hint "Vous n'avez pas assez d'argent.";
	};
	
	playSound "caching";
	
	disableSerialization;
	ctrlEnable [88808, false];
	
	life_slotPlayNow = [player, _bet];
	publicVariableServer "life_slotPlayNow";
};
