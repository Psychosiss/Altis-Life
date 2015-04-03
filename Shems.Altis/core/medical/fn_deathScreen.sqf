/*
private["_medicsOnline","_medicsNear"];
disableSerialization;

_medicsOnline = ((findDisplay 7300) displayCtrl 7304);
_medicsNear = ((findDisplay 7300) displayCtrl 7305);

waitUntil 
{
	_nearby = if(([independent,getPosATL player,120] call life_fnc_nearUnits)) then {"Oui"} else {"Non"};
	_medicsOnline ctrlSetText format["Medecin(s) actif(s): %1",[independent] call life_fnc_playerCount];
	_medicsNear ctrlSetText format["Medecin proche: %1",_nearby];
	sleep 1;
	(isNull (findDisplay 7300))
};
*/

private["_medicsOnline","_medicsNear"];
disableSerialization;

_medicsOnline = ((findDisplay 7300) displayCtrl 7304);
_medicsNear = ((findDisplay 7300) displayCtrl 7305);

waitUntil 
{
	_nearby = 99999;
	{
		if (side _x == independent && alive _x && _x != player) then
		{
			_distance = (getPosATL life_corpse) distance _x;
			if (_distance < _nearby) then {_nearby = _distance;};
		};
	} foreach playableUnits;
	_medicsOnline ctrlSetText format["Medecin(s) actif(s): %1",[independent] call life_fnc_playerCount];
	if (_nearby == 99999) then 
	{ 
		_medicsNear ctrlSetText format["Medecin proche: None",_nearby]; 
} else { 
	_medicsNear ctrlSetText format["Medecin proche: %1m",[(round _nearby)] call life_fnc_numberText];};
	sleep 1;
	(isNull (findDisplay 7300))
};