#include <macro.h>

life_action_inUse = false;
private["_civ","_invs","_license","_robber","_guns","_gun"];
_civ = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_invs = [_this,1,[],[[]]] call BIS_fnc_param;
_robber = [_this,2,false,[false]] call BIS_fnc_param;
if(isNull _civ) exitWith {};

_illegal = 0;
_inv = "";
if(count _invs > 0) then
{
	{
		_inv = _inv + format["%1 %2<br/>",_x select 1,[([_x select 0,0] call life_fnc_varHandle)] call life_fnc_varToStr];
		_index = [_x select 0,sell_array] call fnc_index;
		if(_index != -1) then
		{
			_illegal = _illegal + ((_x select 1) * ((sell_array select _index) select 1));
		};
	} foreach _invs;
	if(_illegal > 6000) then
	{
		[[getPlayerUID _civ,_civ getVariable["realname",name _civ],"482"],"life_fnc_wantedAdd",false,false] call life_fnc_MP;
	};

	[[getPlayerUID _civ,_civ getVariable["realname",name _civ],"481"],"life_fnc_wantedAdd",false,false] call life_fnc_MP;
	[[0,format["%1 a %2 € de contrebande sur lui.",(_civ getVariable["realname",name _civ]),[_illegal] call life_fnc_numberText]],"life_fnc_broadcast",west,false] call life_fnc_MP;
} else {
	_inv = "Aucun objet illégale";
};
if(!alive _civ || player distance _civ > 5) exitWith {hint format["Impossible de rechercher %1",_civ getVariable["realname",name _civ]]};
hint parseText format["<t color='#FF0000'><t size='2'>%1</t></t><br/><t color='#FFD700'><t size='1.5'><br/>Objets Illegaux</t></t><br/>%2<br/><br/><br/><br/><t color='#FF0000'>%3</t>",(_civ getVariable["realname",name _civ]),_inv,if(_robber) then {"Voleur de la banque"} else {""}];

if(_robber) then
{
	[[0,format["%1 a été identifié comme le pilleur de la banque fédérale!",(_civ getVariable["realname",name _civ])]],"life_fnc_broadcast",true,false] call life_fnc_MP;
};