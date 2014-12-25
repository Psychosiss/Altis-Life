private ["_camera", "_camDistance","_randCamX","_randCamY","_camTime"];

playSound "Intro";
_camDistance = 100;
_randCamX = 75 - floor(random 150);
_randCamY = 75 - floor(random 150);
_camTime = 20;

if(!life_firstSpawn) then 
{
	_camTime = 10;
};

showCinemaBorder true;
camUseNVG false;

_camera = "camera" camCreate [(position player select 0)+_randCamX, (position player select 1)+_randCamY,(position player select 2)+_camDistance];
_camera cameraEffect ["internal","back"];
_camera camSetFOV 2.000;
_camera camCommit 0;
waitUntil {camCommitted _camera};

_camera camSetTarget vehicle player;
_camera camSetRelPos [0,0,2];
_camera camCommit _camTime;
waitUntil {camCommitted _camera};

_camera cameraEffect ["terminate","back"];
camDestroy _camera;
life_firstSpawn = false;