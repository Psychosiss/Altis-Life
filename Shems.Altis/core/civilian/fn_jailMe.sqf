private["_ret","_bad","_time","_bail","_esc","_countDown","_time"];
_ret = [_this,0,[],[[]]] call BIS_fnc_param;
_bad = [_this,1,false,[false]] call BIS_fnc_param;
_time = [_this,2,15,[0]] call BIS_fnc_param;
_time = time + (_time * 60);

if(count _ret > 0) then {life_bail_amount = (_ret select 3);} else {life_bail_amount = 1500;};
_esc = false;
_bail = false;

if(_time <= 0) then {_time = time + (15 * 60); hintC "S'il vous plait rapportez-le: JAIL_FALLBACK_15, temps à zero!";};

[_bad,_time] spawn
{
	life_canpay_bail = false;
	if(_this select 0) then
	{
		sleep ((_this select 1) * 0.5);
	} else {
		sleep ((_this select 1) * 0.2);
	};
	life_canpay_bail = nil;
};

while {true} do
{
	if((round(_time - time)) > 0) then
	{
		_countDown = if(round (_time - time) > 60) then {format["%1 minute(s)",round(round(_time - time) / 60)]} else {format["%1 second(s)",round(_time - time)]};
		if(isNil "life_canpay_bail") then
		{
			hintSilent format["Time Remaining:\n %1\n\nCan pay bail:\nBail Price: $%2",_countDown,[life_bail_amount] call life_fnc_numberText];
		} else {
			hintSilent format["Remaining time:\n %1\n",_countDown];
		};
	};

	if(player distance (getMarkerPos "jail_marker") > 150) exitWith
	{
		_esc = true;
	};

	if(life_bail_paid) exitWith
	{
		_bail = true;
	};

	if((round(_time - time)) < 1) exitWith {hint ""};
	if(!alive player && ((round(_time - time)) > 0)) exitWith {};
	sleep 1;
};


switch (true) do
{
	case (_bail):
	{
		life_is_arrested = false;
		life_bail_paid = false;
		hint "Vous avez payé votre caution. Vous êtes libre!";
		removeUniform player;
		player addUniform "U_C_Poloshirt_tricolour";
		serv_wanted_remove = [player];
		player setPos (getMarkerPos "jail_release");
		[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
		[5] call SOCK_fnc_updatePartial;
	};

	case (_esc):
	{
		life_is_arrested = false;
		hint "Vous vous êtes enfui.";
		[[0,format["%1 s'est enfui de la prison !",name player]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
		[[getPlayerUID player,name player,"901"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		[5] call SOCK_fnc_updatePartial;
	};

	case (alive player && !_esc && !_bail):
	{
		life_is_arrested = false;
		hint "Vous avez servi votre temps en prison. Vous êtes libéré.";
		removeUniform player;
		player addUniform "U_C_Poloshirt_tricolour";
		[[getPlayerUID player],"life_fnc_wantedRemove",false,false] spawn life_fnc_MP;
		player setPos (getMarkerPos "jail_release");
		[5] call SOCK_fnc_updatePartial;
	};
};