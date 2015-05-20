private["_unit","_killer"];
disableSerialization;
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_killer = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_unit setVariable["Revive",false,true];
_unit setVariable["name",profileName,true];
_unit setVariable["Restrained",false,true];
_unit setVariable["Escorting",false,true];
_unit setVariable["transporting",false,true];
_unit setVariable["steam64id",(getPlayerUID player),true];
_unit setVariable["missingOrgan",false,true];
_unit setVariable["hasOrgan",false,true]; 

life_deathCamera  = "CAMERA" camCreate (getPosATL _unit);
showCinemaBorder true;
life_deathCamera cameraEffect ["Internal","Back"];
createDialog "DeathScreen";
life_deathCamera camSetTarget _unit;
life_deathCamera camSetRelPos [0,3.5,4.5];
life_deathCamera camSetFOV .5;
life_deathCamera camSetFocus [50,0];
life_deathCamera camCommit 0;

(findDisplay 7300) displaySetEventHandler ["KeyDown","if((_this select 1) == 1) then {true}"];

_unit spawn
{
	private["_maxTime","_RespawnBtn","_Timer"];
	disableSerialization;
	_RespawnBtn = ((findDisplay 7300) displayCtrl 7302);
	_Timer = ((findDisplay 7300) displayCtrl 7301);
	_maxTime = time + (life_respawn_timer * 120);
	_RespawnBtn ctrlEnable false;
	waitUntil 
	{
		_Timer ctrlSetText format["Réapparition: %1",[(_maxTime - time),"MM:SS.MS"] call BIS_fnc_secondsToString]; 
		round(_maxTime - time) <= 0 || isNull _this || life_request_timer
	};

	if (life_request_timer) then 
	{
		_maxTime = time + (life_respawn_timer * 60);
		waitUntil 
		{
			_Timer ctrlSetText format["Réapparition: %1",[(_maxTime - time),"MM:SS.MS"] call BIS_fnc_secondsToString]; 
			round(_maxTime - time) <= 0 || isNull _this
		};
	};
	life_request_timer = false;
	_RespawnBtn ctrlEnable true;
	_Timer ctrlSetText "Vous pouvez réapparaitre";
};

[] spawn life_fnc_deathScreen;

[_unit] spawn
{
	private "_unit";
	_unit = _this select 0;
	waitUntil 
	{
		if(speed _unit == 0) exitWith {true}; 
		life_deathCamera camSetTarget _unit; 
		life_deathCamera camSetRelPos [0,3.5,4.5]; 
		life_deathCamera camCommit 0;
	};
};

if(!isNull _killer && {_killer != _unit} && {side _killer != west} && {alive _killer}) then 
{
	if(vehicle _killer isKindOf "LandVehicle") then 
	{
		[[getPlayerUID _killer,_killer getVariable["realname",name _killer],"187V"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;

		if(!local _killer) then 
		{
			[[2],"life_fnc_removeLicenses",_killer,false] spawn life_fnc_MP;
		};
		[[-100,1,life_karma],"life_fnc_karmaSys",_killer,false] call life_fnc_MP;
	} else {
		[[getPlayerUID _killer,_killer getVariable["realname",name _killer],"187"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		
		if(!local _killer) then 
		{
			[[3],"life_fnc_removeLicenses",_killer,false] spawn life_fnc_MP;
		};
		[[-100,1,life_karma],"life_fnc_karmaSys",_killer,false] call life_fnc_MP;
	};
};

if(side _killer == west && playerSide != west) then 
{
	life_copRecieve = _killer;

	if(!life_use_atm && {life_money > 0}) then 
	{
		[format["%1 € ont été remis à la banque férérale car le voleur a été neutralisé.",[life_money] call life_fnc_numberText],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		life_money = 0;
	};
};

if(!isNull _killer && {_killer != _unit}) then 
{
	life_removeWanted = true;
};

case (_victim == _killer):
{
	life_atmmoney = life_atmmoney - 3000;
};

_handle = [_unit] spawn life_fnc_dropItems;
waitUntil {scriptDone _handle};

life_hunger = 100;
life_thirst = 100;
life_carryWeight = 0;
life_money = 0;

[] call life_fnc_hudUpdate;
[[player,life_sidechat,playerSide],"TON_fnc_managesc",false,false] spawn life_fnc_MP;

[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;