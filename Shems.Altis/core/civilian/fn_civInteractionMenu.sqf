#include <macro.h>

#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Title 37401

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4"];
if(!dialog) then 
{
    createDialog "pInteraction_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;};
if(!isPlayer _curTarget && side _curTarget == civilian) exitWith {closeDialog 0;};
_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
life_pInact_curTarget = _curTarget;

_Btn1 ctrlSetText "Démenotter";
_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_unrestrain; closeDialog 0;";

if((_curTarget getVariable["Escorting",false])) then 
{
    _Btn2 ctrlSetText "Stop Escorte";
    _Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_stopEscorting; [life_pInact_curTarget] call life_fnc_civInteractionMenu;";
} else {
    _Btn2 ctrlSetText "Escorter";
    _Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;";
};

_Btn3 ctrlSetText "Torturer";
_Btn3 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_torturePlayer; closeDialog 0;";

_Btn4 ctrlSetText "Véhicule";
_Btn4 buttonSetAction "[life_pInact_curTarget] call life_fnc_putInCar;";

if(playerSide == civilian) then 
{
	_Btn5 ctrlShow false;
	_Btn6 ctrlShow false;
	_Btn7 ctrlShow false;
	_Btn8 ctrlShow false;
	_Btn9 ctrlShow false;
	_Btn10 ctrlShow false;
};