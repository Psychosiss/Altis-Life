private ["_hornLogic","_vehicle"];

_vehicle = _this select 0;
_hornLogic = _this select 1;

hideObject _hornLogic;
_hornLogic allowDamage false;
_hornLogic enableSimulation false;
_hornLogic say3D "airHorn";