#include <macro.h>

if(__GETC__(life_adminlevel) < 3) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};

createDialog "RscDisplayDebugPublic";
[[0,format["%1 a ouvert la console de debug.",profileName]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;