_this enableSimulation false;
_this allowDamage false;
_this addAction["<t color='#ADFF2F'>DAB</t>",life_fnc_atmMenu,"",0,FALSE,FALSE,"",' vehicle player == player && player distance _target < 4 '];
_this addAction["Piller",life_fnc_robATM,"",0,FALSE,FALSE,"",' vehicle player == player && player distance _target < 2.5 '];