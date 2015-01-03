private["_ui","_food","_water","_health"];
disableSerialization;

_ui = uiNameSpace getVariable ["playerHUD",displayNull];

if(isNull _ui) then 
{
	[] call life_fnc_hudSetup;
};
_food = _ui displayCtrl 23500;
_water = _ui displayCtrl 23510;
_health = _ui displayCtrl 23515;
_hp = round((1 - (damage player)) * 100);
if (life_heroin_effect > 0) then 
{
	_hp = _hp * (life_drug_level + 1);
};

_food ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.508];
_food ctrlSetText format["%1%2", life_hunger, " %"];
_food ctrlSetBackgroundColor [0,0,0,0.5];
_food ctrlCommit 0;
if(life_thirst < 0.3) then 
{
	_food ctrlSetBackgroundColor [255,0,0,0.5];
};

_water ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.446];
_water ctrlSetText format["%1%2", life_thirst, " %"];
_water ctrlSetBackgroundColor [0,0,0,0.5];
_water ctrlCommit 0;
if(life_thirst < 0.3) then 
{
	_water ctrlSetBackgroundColor [255,0,0,0.5];
};

_health ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.384];
_health ctrlSetText format["%1%2", round((1 - (damage player)) * 100), " %"];
_health ctrlSetBackgroundColor [0,0,0,0.5];
_health ctrlCommit 0;
if(damage player > 0.5) then 
{
	_health ctrlSetBackgroundColor [255,0,0,0.5];
};