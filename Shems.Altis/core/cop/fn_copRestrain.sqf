private["_cop","_player"];
_cop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_player = player;
if(isNull _cop) exitWith {};

[] spawn
{
	private "_time";
	while {true} do
	{
		_time = time;
		waitUntil {(time - _time) > (5 * 60)};
		if(!(player getVariable["Restrained",false])) exitWith {};
		if(!([west,getPos player,30] call life_fnc_nearUnits) && (player getVariable["Restrained",false]) && vehicle player == player) exitWith 
		{
			player setVariable["Restrained",false,true];
			player setVariable["Escorting",false,true];
			player setVariable["transporting",false,true];
			player say3D "cuffout";
			detach player;
			titleText["Vous avez automatiquement été démenotté","PLAIN"];
		};
	};
};

titleText[format["Vous avez été menottez par %1",_cop getVariable["realname",name _cop]],"PLAIN"];

while {player getVariable "restrained"} do
{
	if(vehicle player == player) then 
	{
		player playMove "AmovPercMstpSnonWnonDnon_Ease";
	};

	_state = vehicle player;
	waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || !(player getvariable "restrained") || vehicle player != _state};

	if(!alive player) exitWith
	{
		player setVariable ["restrained",false,true];
		player setVariable ["Escorting",false,true];
		player setVariable ["transporting",false,true];
		player say3D "cuffout";
		detach _player;
	};

	if(!alive _cop) exitWith 
	{
		player setVariable ["Escorting",false,true];
		player say3D "cuffout";
		detach player;
	};

	if(vehicle player != player) then
	{
		if(driver (vehicle player) == player) then 
		{
			player action["eject",vehicle player];
		};
	};
};
		
if(alive player) then
{
	player switchMove "AmovPercMstpSlowWrflDnon_SaluteIn";
	player setVariable ["Escorting",false,true];
	player setVariable ["transporting",false,true];
	player say3D "cuffout";
	detach player;
};