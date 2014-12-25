private["_val"];
#include <macro.h>
if(__GETC__(life_wilcorank) < 1) exitWith {closeDialog 0;};
_bank = _this select 0;

_val = parseNumber(ctrlText 2904);
if(_bank) then {
	life_bankedwonga = life_bankedwonga + _val;
} else {
	life_wonga = life_wonga + _val;	
};

hint format["Added %1 To your character.",_val];
[] call life_fnc_p_updateMenu;