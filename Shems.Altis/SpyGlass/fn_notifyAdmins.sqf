#include <macro.h>

private["_pName","_pReason"];
_pName = _this select 0;
_pReason = _this select 1;

if(isServer && !hasInterface) exitWith {};
if(__GETC__(life_adminlevel) < 1) exitWith {};
hint parseText format["<t align='center'><t color='#FF0000'><t size='3'>SPYGLASS</t></t><br/>Cheater Trouvé</t><br/><br/>Nom: %1<br/>Detection: %2",_pName,_pReason];