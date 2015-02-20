#include <macro.h>

if(__GETC__(life_adminlevel) < 3) exitWith {closeDialog 0; hint "Votre niveau admin n'est pas suffisamment élevée.";};

createDialog "RscDisplayDebugPublic";