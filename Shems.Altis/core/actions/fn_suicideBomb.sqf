private["_boom", "_list"];
if(vest player != "V_HarnessOGL_gry") exitWith {};

life_isSuiciding = true;

[[0,format["Quelqu'un explose dans 20 secondes"]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
sleep 10;

[[0,format["Quelqu'un explose dans 10 secondes"]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
sleep 6.5;

player say3D "allahuakbar";
sleep 3.5;

if(vest player != "V_HarnessOGL_gry") exitWith {life_isSuicide = false;};
	
removeVest player;
_boom = "Bo_Mk82" createVehicle [0,0,9999];
_boom setPos (getPos player);
_boom setVelocity [100,0,0];

if(alive player) then {player setDamage 1;};

life_isSuicide = false;

[[0,format["%1 blew their load.",name player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;