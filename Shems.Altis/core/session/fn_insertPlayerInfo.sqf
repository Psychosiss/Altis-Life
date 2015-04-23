if(life_session_completed) exitWith {};
cutText["Le serveur n'a pas trouvé toutes les informations du joueur correspondant à votre UID, essayez un autre slot.","BLACK FADED"];
0 cutFadeOut 9999999;

[[getPlayerUID player,profileName,life_money,life_atmmoney,player],"DB_fnc_insertRequest",false,false] spawn life_fnc_MP;