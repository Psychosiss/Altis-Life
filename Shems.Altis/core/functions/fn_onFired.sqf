private["_unit","_source","_veh","_ammoType","_projectile"];

_unit = _this select 0;
_source = _this select 2;
_ammoType = _this select 4; 
_projectile = _this select 6;

if(_ammoType == "GrenadeHand_stone") then 
{
	_projectile spawn 
	{
		private "_position";
		while {!isNull _this} do 
		{
			_position = getPosATL _this;
			sleep 0.1;
		};
		[[_position],"life_fnc_flashbang",true,false] spawn life_fnc_MP;
	};
};