private "_cop";
_cop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _cop) exitWith {};

_licenses = "";
{
	if(missionNamespace getVariable (_x select 0) && _x select 1 == "civ") then
	{
		_licenses = _licenses + ([_x select 0] call life_fnc_varToStr) + "<br/>";
	};
} foreach life_licenses;

if(_licenses == "") then {_licenses = "Aucune license<br/>";};

[[profileName,_licenses],"life_fnc_licensesRead",_cop,false] call life_fnc_MP;