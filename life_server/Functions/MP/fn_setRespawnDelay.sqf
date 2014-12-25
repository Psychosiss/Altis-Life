private ["_condition","_delayMax","_description","_delay","_return","_time"];

_condition = [_this,0,{false},[{}]] call bis_fnc_param;
_delayMax = [_this,1,0,[0]] call bis_fnc_param;
_description = [_this,2,"",[""]] call bis_fnc_param;
_delay = 0;

while {!alive player} do 
{
	_return = [call _condition,0,false,[false]] call bis_fnc_paramIn;
	if (call _condition) then 
	{
		titletext [_description,"plain"];
		if (_delay == 0) then 
		{
			_delay = _delayMax;
			setPlayerRespawnTime (playerrespawnTime + _delay);
		};
	} else {
		if (_delay != 0) then 
		{
			setPlayerRespawnTime (playerrespawnTime - _delay);
			_delay = 0;
		};
	};
	_time = time + 1;
	waituntil {time > _time};
};

titletext ["","plain"];
setPlayerRespawnTime getnumber (missionconfigfile >> "respawnDelay")