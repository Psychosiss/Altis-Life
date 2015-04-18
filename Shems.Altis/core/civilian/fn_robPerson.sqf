private "_robber";
_robber = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _robber) exitWith {};

if(life_money > 0) then
{
	[[life_money],"life_fnc_robReceive",_robber,false] call life_fnc_MP;
	[[getPlayerUID _robber,_robber getVariable["realname",name _robber],"211"],"life_fnc_wantedAdd",false,false] call life_fnc_MP;
	[[1,format["%1 a pillé %2 pour %3 €",_robber getVariable["realname",name _robber],profileName,[life_money] call life_fnc_numberText]],"life_fnc_broadcast",nil,false] call life_fnc_MP;
	life_money = 0;
} else {
	[[2,format["%1 n'as pas d'argent.",profileName]],"life_fnc_broadcast",_robber,false] call life_fnc_MP;
};