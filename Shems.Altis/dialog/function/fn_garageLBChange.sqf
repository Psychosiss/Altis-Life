#include <macro.h>

disableSerialization;
private["_control","_index","_className","_dataArr","_vehicleColor","_vehicleInfo","_trunkSpace","_sellPrice","_retrievePrice","_insurePrice","_insure"];
_control = _this select 0;
_index = _this select 1;
_dataArr = _control lbData _index; 
_dataArr = call compile format["%1",_dataArr];
_className = _dataArr select 0;
_insure = (_dataArr select 2);
_vehicleColor = [_className,_dataArr select 1] call life_fnc_vehicleColorStr;
_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
_trunkSpace = [_className] call life_fnc_vehicleWeightCfg;
_retrievePrice = [_className,__GETC__(life_garage_prices)] call fnc_index;
_sellPrice = [_className,__GETC__(life_garage_sell)] call fnc_index;
_insurePrice = [_className,__GETC__(life_insure_prices)] call fnc_index;
_retrievePrice = if(_retrievePrice == -1) then {1000} else {(__GETC__(life_garage_prices) select _retrievePrice) select 1;};
_sellPrice = if(_sellPrice == -1) then {1000} else {(__GETC__(life_garage_sell) select _sellPrice) select 1;};
_insurePrice = if(_insurePrice == -1) then {1000} else {(__GETC__(life_insure_prices) select _insurePrice) select 1;};

(getControl(2800,2803)) ctrlSetStructuredText parseText format[
	"
		Prix de sortie: <t color='#8cff9b'>%1 €</t><br/>
		Prix de vente: <t color='#8cff9b'>%2 €</t><br/>
		Prix de l'assurance: <t color='#8cff9b'>%9 €</t><br/>
		Etat de l'assurance: %10<br/>
		Couleur: %8<br/>
		Vitesse max: %3 km/h<br/>
		Chevaux: %4<br/>
		Places: %5<br/>
		Place inventaire: %6<br/>
		Place essence: %7<br/>
		Résistance : %11
	",
	[_retrievePrice] call life_fnc_numberText,
	[_sellPrice] call life_fnc_numberText,
	_vehicleInfo select 8,
	_vehicleInfo select 11,
	_vehicleInfo select 10,
	if(_trunkSpace == -1) then {"Aucun"} else {_trunkSpace},
	_vehicleInfo select 12,
	_vehicleColor,
	[_insurePrice] call life_fnc_numberText,
	if(_insure == 1) then {"<t color='#8cff9b'>Assuré</t>"} else {"<t color='#FF0000'>Non assuré</t>"},
	_vehicleInfo select 9
];

if(_insure == 1) then 
{
	ctrlShow [97480,False];
} else {
	ctrlShow [97480,True];
};

ctrlShow [2805,true];
ctrlShow [2803,true];
ctrlShow [2830,true];