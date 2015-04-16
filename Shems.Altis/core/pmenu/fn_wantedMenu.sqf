#include <macro.h>

private["_display","_list","_name","_crimes","_bounty","_units"];
disableSerialization;

createDialog "life_wanted_menu";

_display = findDisplay 2400;
_list = _display displayCtrl 2401;
lbClear _list;
_units = [];

ctrlSetText[2404,"Connexion établie..."];

if(__GETC__(life_cop_level) < 3 && __GETC__(life_adminlevel) == 0) then
{
	ctrlShow[2405,false];
};
if(playerside == civilian) then 
{
	ctrlShow[2405,false];
};
[[player],"life_fnc_wantedFetch",false,false] call life_fnc_MP;