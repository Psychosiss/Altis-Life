private["_mod","_mode","_karma"];

_mod = _this select 0;
_mode = _this select 1;

if(playerSide != civilian) exitWith {};
if(_mode == 0) exitWith 
{
	if(((life_karma + _mod) <= 12500) && ((life_karma + _mod) >= -12500)) then 
	{
		life_karma = life_karma + _mod;
	} else {
		systemChat "Karma maximum Atteint";
	};
};

_karma = _this select 2;

call life_fnc_killMalus;

if(_karma >= -999) then 
{
	if(life_karma < -12400)exitWith 
	{
		life_karma = -12500;
		systemChat format ["Votre karma a descendu de %1! Karma: %2 (minimum)",_mod, life_karma];
	};
	life_karma = life_karma + _mod;
	systemChat format ["Votre karma a descendu de %1! Karma: %2", _mod, life_karma];
	[9] call SOCK_fnc_updatePartial;
};

if((_karma <= -1000) && (_karma >= -2499)) then 
{
	if(life_karma > 12400) exitWith 
	{
		life_karma = 12500;
		systemChat format ["Pour avoir tué un criminel, vous avez obtenu 100 de karma! Karma: %2 (maximum)",_mod, life_karma];
	};
	life_karma = life_karma + 100;
	systemChat format ["Pour avoir tué un criminel, votre karma augmente de 100! Karma: %2", _mod, life_karma];
	[9] call SOCK_fnc_updatePartial;
};

if((_karma <= -2500) && (_karma >= -4999)) then 
{
	if(life_karma > 12300) exitWith 
	{
		life_karma = 12500;
		systemChat format ["Pour avoir tué un rebelle, votre karma augmente de 200! Karma: %2 (maximum)",_mod, life_karma];
	};
	life_karma = life_karma + 200;
	systemChat format ["Pour avoir tué un rebelle, vous avez obtenu 200 de karma! Karma: %2", _mod, life_karma];
	[9] call SOCK_fnc_updatePartial;
};

if((_karma <= -5000) && (_karma >= -9999)) then 
{
	if(life_karma > 12100) exitWith 
	{
		life_karma = 12500;
		systemChat format ["Pour avoir tué un rebelle recherché, votre karma augmente de 400! Karma: %2 (maximum)",_mod, life_karma];
	};
	life_karma = life_karma + 400;
	systemChat format ["Pour avoir tué un rebelle recherché, votre karma augmente de 400! Karma: %2", _mod, life_karma];
	[9] call SOCK_fnc_updatePartial;
};

if(_karma <= -10000) then 
{
	if(life_karma > 11700) exitWith 
	{
		life_karma = 12500;
		systemChat format ["Für das töten eines hochrangigen Rebellen hast Du 800 Karma bekommen! Karma: %2 (maximum)",_mod, life_karma];
	};
	life_karma = life_karma + 800;
	systemChat format ["Für das töten eines hochrangigen Rebellen hast Du 800 Karma bekommen! Karma: %2", _mod, life_karma];
	[9] call SOCK_fnc_updatePartial;
};