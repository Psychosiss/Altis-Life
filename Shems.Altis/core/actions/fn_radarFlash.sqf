_speed = speed player;
_pay = 0;
_veh = vehicle player;
if((_veh getVariable "siren")) exitWith {};
if(getPosATL _veh select 2 > 20) exitWith {hint "Vous avez de la chance, les radars ne flashent pas les hélicos!";};
if(!license_civ_driver) exitWith 
{
	serv_killed = [player,"9023"];
	publicVariableServer "serv_killed";
	cutText[format[" !!! Vous avez été flashé à %1 km/h !!! \n\n\n N'ayant pas le permis, vous êtes recherché...",round _speed,[_pay] call life_fnc_numberText],"WHITE OUT"];
	0.0001 cutFadeOut 5;
	sleep 0.5;
	0.0001 cutFadeOut 5;
};
if((round _speed > 135) && (round _speed < 145)) then {_pay = 2000;};
if((round _speed > 144) && (round _speed < 161)) then {_pay = 5000;};
if(round _speed > 160) then {_pay = 8000;};

if(life_atmcash < _pay) exitWith 
{
	if(_pay == 2000) then {
		serv_killed = [player,"902"];
		publicVariableServer "serv_killed"
	};
	if(_pay == 5000) then {
		serv_killed = [player,"9021"];
		publicVariableServer "serv_killed"
	};
	if(_pay == 8000) then {
		serv_killed = [player,"9022"];
		publicVariableServer "serv_killed"
	};
	cutText[format[" !!! Vous avez été flashé à %1 km/h !!! \n\n\n Vous écopez d'une amende de %2 $ mais n'ayant pas les moyens, vous êtes recherché ! \n\n\n Vous n'avez plus de permis !",round _speed,[_pay] call life_fnc_numberText],"WHITE OUT"];
	0.0001 cutFadeOut 5;
	sleep 0.5;
	0.0001 cutFadeOut 5;
	license_civ_driver = false;
};
if((round _speed > 135) && (round _speed < 145)) then 
{
	if(life_atmcash >= _pay) then {
		cutText[format[" !!! Vous avez été flashé à %1 km/h !!! \n\n\n Vous écopez d'une amende de %2 $ retirés de votre compte bancaire !",round _speed,[_pay] call life_fnc_numberText],"WHITE OUT"];
		0.0001 cutFadeOut 5;
		sleep 0.5;
		0.0001 cutFadeOut 5;
		life_atmcash = life_atmcash - _pay;
	};
};

if((round _speed > 144) && (round _speed < 161)) then 
{
	if(life_atmcash >= _pay) then {
		cutText[format[" !!! Vous avez été flashé à %1 km/h !!! \n\n\n Vous écopez d'une amende de %2 $ retirés de votre compte bancaire !",round _speed,[_pay] call life_fnc_numberText],"WHITE OUT"];
		0.0001 cutFadeOut 5;
		sleep 0.5;
		0.0001 cutFadeOut 5;
		life_atmcash = life_atmcash - _pay;
	};
};

if(round _speed > 160) then 
{
	_pay = 5000;
	if(life_atmcash >= _pay) then 
	{
		cutText[format[" !!! Vous avez été flashé à %1 km/h !!! \n\n\n Vous écopez d'une amende de %2 $ retirés de votre compte bancaire ! \n\n\n Vous n'avez plus de permis !",round _speed,[_pay] call life_fnc_numberText],"WHITE OUT"];
		0.0001 cutFadeOut 5;
		sleep 0.5;
		0.0001 cutFadeOut 5;
		license_civ_driver = false;
		life_atmcash = life_atmcash - _pay;
	};
};