life_session_tries = life_session_tries + 1;
if(life_session_completed) exitWith {};
if(life_session_tries > 3) exitWith 
{
	cutText["Une erreur c'est produite lors de la mise en place du client.","BLACK FADED"]; 
	0 cutFadeOut 999999999;
};

0 cutText ["Reception de requête du serveur... Validation en cours...","BLACK FADED"];
0 cutFadeOut 9999999;

if(isNil "_this") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(typeName _this == "STRING") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(count _this == 0) exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((_this select 0) == "Error") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((getPlayerUID player) != _this select 0) exitWith {[] call SOCK_fnc_dataQuery;};

if(!isServer && (!isNil "life_adminlevel" OR !isNil "life_cop_level" OR !isNil "life_donator" OR !isNil "life_med_level")) exitWith 
{
	[[profileName,getPlayerUID player,"VariablesAlreadySet"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
	[[profileName,format["Variables définies avant l'initialisation du client...\nlife_adminlevel: %1\nlife_cop_level: %2\nlife_donator: %3\nlife_med_level: %4",life_adminlevel,life_cop_level,life_donator,life_med_level]],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
	sleep 0.9;
	["SpyGlass",false,false] call BIS_fnc_endMission;
};

life_money = parseNumber (_this select 2);
life_atmmoney = parseNumber (_this select 3);
//life_adminlevel = compileFinal (if(typeName parseNumber(_this select 4) == "STRING") then {parseNumber(_this select 4)} else {str(parseNumber(_this select 4))});
life_adminlevel = parseNumber (_this select 4);
//life_donator = compileFinal (if(typeName parseNumber(_this select 5) == "STRING") then {parseNumber(_this select 5)} else {str(parseNumber(_this select 5))});
life_donator = compileFinal (_this select 5);

if(count (_this select 6) > 0) then 
{
	{
		missionNamespace setVariable [(_x select 0),(_x select 1)];
	} foreach (_this select 6);
};

if(profileName != _this select 1) exitWith 
{
	hint format["Votre ancien nom : %1",_this select 1];
	[format["Veuillez remettre votre précédent nom !<br/><br/>Votre ancien nom : <t color='#b20303'>%1</t><br/><br/>Si vous avez des problèmes pour changer votre pseudo, parlez-en à l'administration.", _this select 1], "Changement de nom", "D'accord"] call BIS_fnc_guiMessage;
	["NameChanged",false,false] call BIS_fnc_endMission;
};

life_gear = _this select 8;
[] call life_fnc_loadGear;

switch(playerSide) do 
{
	case west: 
	{
		life_cop_level = compileFinal (if(typeName parseNumber(_this select 7) == "STRING") then {parseNumber(_this select 7)} else {str(parseNumber(_this select 7))});
		life_med_level = compileFinal (if(typeName 0 == "STRING") then {0} else {str(0)});
		life_blacklisted = _this select 9;
		cop_position = _this select 10;
		life_is_alive = _this select 11;
	};

	case civilian: 
	{
		life_is_arrested = _this select 7;
		civ_position = _this select 9;
		life_is_alive = _this select 10;
		life_cop_level = compileFinal (if(typeName 0 == "STRING") then {0} else {str(0)});
		life_med_level = compileFinal (if(typeName 0 == "STRING") then {0} else {str(0)});
		life_houses = _this select 12;
		{
			_house = nearestBuilding (call compile format["%1", _x select 0]);
			life_vehicles pushBack _house;
		} foreach life_houses;

		life_gangData = _this select 13;
		if(count life_gangData != 0) then 
		{
			[] spawn life_fnc_initGang;
		};
		[] spawn life_fnc_initHouses;
	};

	case independent: 
	{
		life_med_level = compileFinal (if(typeName parseNumber(_this select 7) == "STRING") then {parseNumber(_this select 7)} else {str(parseNumber(_this select 7))});
		life_cop_level = compileFinal (if(typeName 0 == "STRING") then {0} else {str(0)});
		med_position = _this select 9;
		life_is_alive = _this select 10;
	};
};

life_paycheck = life_paycheck + (life_donator * 500);

switch (life_licenses) do
{
	case "license_civ_admin":{life_paycheck = life_paycheck + 10000;};
};

if (playerside == west) then
{
	switch(life_cop_level) do
	{
		case 0: {life_paycheck = life_paycheck;};
		case 1: {life_paycheck = life_paycheck + 1750;};
		case 2: {life_paycheck = life_paycheck + 2250;};
		case 3: {life_paycheck = life_paycheck + 3000;};
		case 4: {life_paycheck = life_paycheck + 3500;};
		case 5: {life_paycheck = life_paycheck + 4000;};
		case 6: {life_paycheck = life_paycheck + 4500;};
		case 7: {life_paycheck = life_paycheck + 5000;};
	};
};

if(count (_this select 15) > 0) then //12
{
	{
		life_vehicles pushBack _x;
	} foreach (_this select 15); //12
};

life_session_completed = true;