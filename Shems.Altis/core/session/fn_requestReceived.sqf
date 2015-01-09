#include <macro.h>

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

life_cash = parseNumber (_this select 2);
life_atmcash = parseNumber (_this select 3);
__CONST__(life_adminlevel,parseNumber(_this select 4));
__CONST__(life_donator,parseNumber(_this select 5));

if(count (_this select 6) > 0) then 
{
	{
		missionNamespace setVariable [(_x select 0),(_x select 1)];
	} foreach (_this select 6);
};

life_gear = _this select 8;
[] call life_fnc_loadGear;

switch(playerSide) do 
{
	case west: 
	{
		__CONST__(life_coplevel, parseNumber(_this select 7));
		__CONST__(life_medicLevel,0);
		__CONST__(life_eastlevel,0);
		life_blacklisted = _this select 9;
	};
	
	case civilian: 
	{
		life_is_arrested = _this select 7;
		__CONST__(life_coplevel,0);
		__CONST__(life_medicLevel,0);
		__CONST__(life_eastlevel,0);
		life_houses = _this select 9;
		{
			_house = nearestBuilding (call compile format["%1", _x select 0]);
			life_vehicles set[count life_vehicles,_house];
		} foreach life_houses;
		
		life_gangData = _This select 10;
		if(count life_gangData != 0) then 
		{
			[] spawn life_fnc_initGang;
		};
		[] spawn life_fnc_initHouses;
	};
	
	case independent: 
	{
		__CONST__(life_medicLevel, parseNumber(_this select 7));
		__CONST__(life_copLevel,0);
		__CONST__(life_eastlevel,0);
	};
	
	case east: 
	{
        __CONST__(life_eastlevel, parseNumber(_this select 7));
		__CONST__(life_coplevel,0);
		__CONST__(life_medicLevel,0);
        east_gear = _this select 8;
        [] spawn life_fnc_eastloadGear;
    };
};

switch (life_licenses) do
{
	case "license_civ_admin":{life_paycheck = life_paycheck + 10000;};
};

if (playerside == west) then
{
	switch(life_coplevel) do
	{
		case 0: {life_paycheck = life_paycheck;};
		case 1: {life_paycheck = life_paycheck + 1750;};
		case 2: {life_paycheck = life_paycheck + 2250;};
		case 3: {life_paycheck = life_paycheck + 3000;};
		case 4: {life_paycheck = life_paycheck + 3500;};
		case 5: {life_paycheck = life_paycheck + 4000;};
		case 6: {life_paycheck = life_paycheck + 4500;};
		case 7: {life_paycheck = life_paycheck + 5000;};
		case 8: {life_paycheck = life_paycheck + 5500;};
		case 9: {life_paycheck = life_paycheck + 6500;};
		case 10: {life_paycheck = life_paycheck + 7000;};
	};
};

life_session_completed = true;