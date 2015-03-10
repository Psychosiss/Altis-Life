private["_player","_weap","_ammo"];

_player = _this select 0;
_weap = currentWeapon _player;
_ammo = _player ammo _weap;

if(playerSide == west) then 
{
	if (_weap == "hgun_P07_snds_F") then 
	{
		if (_ammo > 0) then 
		{
			_player setAmmo ["hgun_P07_snds_F",0];
		};
	};
};