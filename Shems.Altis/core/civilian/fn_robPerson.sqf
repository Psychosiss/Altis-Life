private["_robber"];
_robber = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _robber) exitWith {};

if(life_cash > 0) then
{
	[[life_cash],"life_fnc_robReceive",_robber,false] spawn life_fnc_MP;
	[[getPlayerUID _robber,_robber getVariable["realname",name _robber],"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	[[1,format["%1 a pillé %2 pour %3 €",_robber getVariable["realname",name _robber],profileName,[life_cash] call life_fnc_numberText]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
	life_cash = 0;
} else {
	[[2,format["%1 n'as pas d'argent.",profileName]],"life_fnc_broadcast",_robber,false] spawn life_fnc_MP;
};