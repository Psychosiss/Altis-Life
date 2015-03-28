private["_vault","_handle"];
_vault = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vault) exitWith {};
if(typeOf _vault != "Land_Cargo20_blue_F") exitWith {hint "Cela ne peut être utilisé que sur un coffre-fort..."};
if(_vault getVariable["wchargeplaced",false]) exitWith {hint "Une charge de explosive est déjà placé sur ce coffre."};
if(_vault getVariable["gold_open",false]) exitWith {hint "Le coffre est déjà ouvert."};
if(!([false,"underwatercharge",1] call life_fnc_handleInv)) exitWith {};

_vault setVariable["wchargeplaced",true,true];
hint "La minuterie est lancée! Gardez les flics loin de la bombe!";
_handle = [] spawn life_fnc_waterChargeTimer;

waitUntil {scriptDone _handle};
sleep 0.9;
if(!(gold_safe getVariable["wchargeplaced",false])) exitWith {hint "La charge a été désamorcée!"};

_bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL gold_safe select 0, getPosATL gold_safe select 1, (getPosATL gold_safe select 2)+0.5];
gold_safe setVariable["wchargeplaced",false,true];
gold_safe setVariable["gold_open",true,true];

hint "Le coffre est maintenant ouvert!";