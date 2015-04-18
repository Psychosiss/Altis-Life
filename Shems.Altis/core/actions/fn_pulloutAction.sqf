private "_crew";

_crew = crew cursorTarget;
{
	if(_x getVariable "restrained") then
	{
		_x setVariable ["transporting",false,true]; 
		_x setVariable ["Escorting",false,true];
		[[_x],"life_fnc_pullOutVeh",_x,false] call life_fnc_MP;
	};
} foreach _crew;