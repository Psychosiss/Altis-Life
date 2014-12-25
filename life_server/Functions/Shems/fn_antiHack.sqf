"SHEMS_ANTI_HACK" addPublicVariableEventHandler 
{
	_player = (_this select 1) select 0;
	_msg = (_this select 1) select 1;
	diag_log format ["%1", _msg];
	[[4, format ["%1 utilise un menu d'hack!!!", name _player]], "life_fnc_broadcastMessage", true, false] spawn BIS_fnc_MP;
};

publicVariable "SHEMS_fnc_clientAntiHack";
BIS_fnc_endMission = compileFinal "";
publicVariable "BIS_fnc_endMission";