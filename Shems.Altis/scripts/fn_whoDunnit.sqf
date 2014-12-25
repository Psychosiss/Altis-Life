if(isServer) then 
{
	private["_victim","_killer","_distance","_killerWep","_weaponName","_killerVeh","_vehName"];

	_victim = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
	_killer = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;;
	_distance = _killer distance _victim;
	_distance = floor(_distance);
	_killerWep = currentWeapon _killer;
	_weaponName = (configFile >> "cfgWeapons" >> _killerWep);
	_weaponName = format["%1",getText(_weaponName >> "displayName")];
	_killerWep = format["%1",_weaponName];
	_killerVeh = vehicle _killer;
	_vehName = getText(configFile >> "CfgVehicles" >> (typeOf _killerVeh) >> "displayName");
	
	switch (true) do 
	{
		case (_victim == _killer):
		{
			[[1,format["%1 c'est suicidé ou à déconnecté ",_killer getVariable["realname",name _killer]]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
		};
		case (vehicle _killer isKindOf "Car"):
		{
			[[1,format["Mort dans un Véhicule: %1 à tué %2 avec %3",_killer getVariable["realname",name _killer], _victim getVariable["realname",name _victim], _vehName]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
		};
		case (vehicle _killer isKindOf "Air"):
		{
			[[1,format["Crash Aérien : %1 a tué %2 avec %3",_killer getVariable["realname",name _killer], _victim getVariable["realname",name _victim], _vehName]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
		};
		default
		{
			[[1,format["MORT: %1 à tué %2 avec par une %3 d'une distance de %4 Metres",_killer getVariable["realname",name _killer], _victim getVariable["realname",name _victim], _killerWep, _distance]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
		};
	};
};