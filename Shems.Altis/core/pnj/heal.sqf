_this enableSimulation false;
_this allowDamage false;
_this addAction["Se soigner",life_fnc_healHospital,"heilen"];
_this addAction["Verifer la santé",life_fnc_healHospital,"checken"];
_this addAction["Traiter une maladie",life_fnc_healHospital,"behandeln"];
_this setVariable["realname","Krankenhaus"];