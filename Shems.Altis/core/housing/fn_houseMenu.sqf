#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Btn8 37457
#define Btn9 37458
#define Btn10 37459
#define Title 37401

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7"];
if(!dialog) then {
	createDialog "pInteraction_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;};

_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn8 = _display displayCtrl Btn8;
_Btn9 = _display displayCtrl Btn9;
_Btn10 = _display displayCtrl Btn10;
_Btn1 ctrlShow false;
_Btn2 ctrlShow false;
_Btn3 ctrlShow false;
_Btn4 ctrlShow false;
_Btn5 ctrlShow false;
_Btn6 ctrlShow false;
_Btn7 ctrlShow false;
_Btn8 ctrlShow false;
_Btn9 ctrlShow false;
_Btn10 ctrlShow false;

life_pInact_curTarget = _curTarget;
if(_curTarget isKindOf "House_F" && playerSide == west) exitWith 
{
	if((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _curTarget OR (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _curTarget) then {
		
		_Btn1 ctrlSetText "Reparer";
		_Btn1 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_repairDoor; closeDialog 0;";
		_Btn1 ctrlShow true;

		_Btn2 ctrlSetText "Ouvrir / Fermer";
		_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_doorAnimate; closeDialog 0;";
		_Btn2 ctrlShow true;
		
	} else {
		if(!isNil {_curTarget getVariable "house_owner"}) then 
		{
			_Btn1 ctrlSetText "Propriétaire";
			_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_copHouseOwner;";
			_Btn1 ctrlShow true;

			_Btn2 ctrlSetText "Forcer la porte";
			_Btn2 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_copBreakDoor; closeDialog 0;";
			_Btn2 ctrlShow true;

			_Btn3 ctrlSetText "Fouiller";
			_Btn3 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_raidHouse; closeDialog 0;";
			_Btn3 ctrlShow true;
			
			if(player distance _curTarget > 3.6) then 
			{
				_Btn3 ctrlEnable false;
			};
			
			_Btn4 ctrlSetText "Fermer";
			_Btn4 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_lockupHouse; closeDialog 0;";
			_Btn4 ctrlShow true;
		} else {
			closeDialog 0;
		};
	};
};

_houseCfg = [(typeOf _curTarget)] call life_fnc_houseConfig;
if(_houseCfg isEqualTo []) exitWith {closeDialog 0;};

if(!(_curTarget in life_vehicles)) then 
{
	_Btn1 ctrlSetText "Acheter";
	_Btn1 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_buyHouse;";
	_Btn1 ctrlShow true;

	_Btn2 ctrlSetText "Placer une charge";
	_Btn2 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_demolitionCharge; closeDialog 0;";
	_Btn2 ctrlShow true;

	if(!isNil {_curTarget getVariable "house_owner"}) then 
	{
		_Btn1 ctrlEnable false;
	};
} else {
	if((typeOf _curTarget) in ["Land_i_Garage_V1_F","Land_i_Garage_V2_F"]) then 
	{
		_Btn1 ctrlSetText "Vendre le garage";
		_Btn1 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_sellHouse; closeDialog 0;";
		_Btn1 ctrlShow true;

		if(((_curTarget getVariable "house_owner") select 0) != (getPlayerUID player)) then 
		{
			_Btn1 ctrlEnable false;
		};

		_Btn2 ctrlSetText "Garage";
		_Btn2 buttonSetAction "[life_pInact_curTarget,""Car""] spawn life_fnc_vehicleGarage; closeDialog 0;";
		_Btn2 ctrlShow true;

		_Btn3 ctrlSetText "Ranger le vehicule";
		_Btn3 buttonSetAction "[life_pInact_curTarget,player] spawn life_fnc_storeVehicle; closeDialog 0;";
		_Btn3 ctrlShow true;

		_Btn4 ctrlSetText "Louer";
		_Btn4 buttonSetAction "[getPosATL cursorTarget,0] spawn life_fnc_getRentDate; closeDialog 0;";
		_Btn4 ctrlShow true;
		if(((_curTarget getVariable "house_owner") select 0) != (getPlayerUID player)) then {_Btn4 ctrlEnable false;};

		_Btn5 ctrlSetText "Payer le loyer";
		_Btn5 buttonSetAction "[getPosATL cursorTarget,1,life_pInact_curTarget] spawn life_fnc_getRentDate; closeDialog 0;";
		_Btn5 ctrlShow true;
		if(((_curTarget getVariable "house_owner") select 0) != (getPlayerUID player)) then {_Btn5 ctrlEnable false;};
	} else {
		_Btn1 ctrlSetText "Vendre la maison";
		_Btn1 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_sellHouse; closeDialog 0;";
		_Btn1 ctrlShow true;
		if(((_curTarget getVariable "house_owner") select 0) != (getPlayerUID player)) then {_Btn1 ctrlEnable false;};

		if(_curTarget getVariable ["locked",false]) then 
		{
			_Btn2 ctrlSetText "Ouvrir stockage";
		} else {
			_Btn2 ctrlSetText "Fermer stockage";
		};
		_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_lockHouse; closeDialog 0;";
		_Btn2 ctrlShow true;

		if(isNull (_curTarget getVariable ["lightSource",ObjNull])) then 
		{
			_Btn3 ctrlSetText localize "Allumer lumières";
		} else {
			_Btn3 ctrlSetText localize "Eteindre lumières";
		};
		_Btn3 buttonSetAction "[life_pInact_curTarget] call life_fnc_lightHouseAction; closeDialog 0;";
		_Btn3 ctrlShow true;

		_Btn4 ctrlSetText "Louer";
		_Btn4 buttonSetAction "[getPosATL cursorTarget,0] spawn life_fnc_getRentDate; closeDialog 0;";
		_Btn4 ctrlShow true;
		if(((_curTarget getVariable "house_owner") select 0) != (getPlayerUID player)) then {_Btn4 ctrlEnable false;};

		_Btn5 ctrlSetText "Payer le loyer";
		_Btn5 buttonSetAction "[getPosATL cursorTarget,1,life_pInact_curTarget] spawn life_fnc_getRentDate; closeDialog 0;";
		_Btn5 ctrlShow true;
		if(((_curTarget getVariable "house_owner") select 0) != (getPlayerUID player)) then {_Btn5 ctrlEnable false;};
	};
};