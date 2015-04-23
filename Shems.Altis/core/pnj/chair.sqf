_this enableSimulation false;
_this allowDamage false;
_this addAction ["S'asseoir",life_fnc_actionChairSit,nil,10,true,true,"","player distance _target <= 1.6 && !( _target getVariable ['life_fnc_actionChairSit_busy',false])"];