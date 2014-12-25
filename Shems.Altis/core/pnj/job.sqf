_this allowDamage false;
_this enableSimulation false;
_this addAction["Livrer un paquet",life_fnc_dpFinish,"dp_1",0,false,false,"",'!isNil "life_dp_point" && life_delivery_in_progress && life_dp_point == _target '];
_this addAction["Obtenir une mission",life_fnc_getDPMission,"dp_1",0,false,false,"",' isNil "life_dp_point" && !life_delivery_in_progress '];