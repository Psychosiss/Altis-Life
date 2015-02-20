#include <macro.h>

if(__GETC__(life_adminlevel) < 1) exitWith {closeDialog 0; hint "Votre niveau admin n'est pas suffisamment élevée.";};

[] spawn 
{
	while {dialog} do 
	{
		closeDialog 0;
		sleep 0.01;
	};
};

tele = {
	_pos = [_this select 0, _this select 1, _this select 2];
	(vehicle player) setPos [_pos select 0, _pos select 1, 0];
	onMapSingleClick "";
	openMap [false, false];
	hint "Vous avez été téléporté à la position sélectionnée.";
};
openMap [true, false];
onMapSingleClick "[_pos select 0, _pos select 1, _pos select 2] call tele";