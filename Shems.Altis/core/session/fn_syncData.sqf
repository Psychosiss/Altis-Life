_fnc_scriptName = "Player Synchronization";
private["_exit"];
if(isNil "life_session_time") then {life_session_time = false;};
if(life_session_time) exitWith {hint "Vous avez déjà utilisé l'option de synchronisation, vous ne pouvez utiliser cette fonction une fois toutes les 5 minutes.";};

switch (typeName life_fnc_MP_packet) do
{
	case "ARRAY":
	{
		if(count life_fnc_MP_packet == 0) exitWith
		{
			_exit = true;
		};
	};
	default {_exit = true;};
};

if(!isNil "_exit") exitWith 
{
	hint "En raison de certains tricheur tentant corrompre le BIS MP Framework,ils vous ont empêché de profiter de notre mission.\n\nVous pouvez essayer ce nouveau dans une minute si vous pensez que c'est une erreur.";
};

[] call SOCK_fnc_updateRequest;
hint "Sauvegarde en cours.\n\nAttendez 20 secondes.";
[] spawn
{
	life_session_time = true;
	sleep (5 * 60);
	life_session_time = false;
};