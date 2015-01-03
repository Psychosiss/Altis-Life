#include <macro.h>

private["_pName","_pReason"];
_pName = _this select 0;
_pReason = _this select 1;
if(isServer && !hasInterface) exitWith {};
hint parseText format["<t align='center'><t color='#FF0000'><t size='3'>SPY-GLASS</t></t><br/>Cheateur Trouvé</t><br/><br/>Nom: %1<br/>UID: %2<br/>Detection: %3",_pName,_pUID,_pReason];