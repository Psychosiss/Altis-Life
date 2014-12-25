private["_mode","_val","_sum"];
_mode = _this select 3;
_val = 0;

switch (_mode) do 
{
	case "ficken": 
				{
					if(playerSide == west) exitWith
					{
						hint "T'es un flic! Avec toi, c'est trop chaud! Baises quand tu ne sera plus flic!";
					};
					if(currentWeapon player != "") exitWith
					{
						hint "Range ton flingue!";
					};
					
							_number = ceil(random 7);
							if(_number == 0) then { hookerprice = 100;};
							if(_number == 1) then { hookerprice = 2000;};
							if(_number == 2) then { hookerprice = 4000;};
							if(_number == 3) then { hookerprice = 8000;};
							if(_number == 4) then { hookerprice = 16000;};
							if(_number == 5) then { hookerprice = 32000;};
							if(_number == 6) then { hookerprice = 64000;};
							if(_number == 7) then { hookerprice = 128000;};
							_pplayer = _this select 0;

							_number1 = ceil(random 100);
							if(_number1<33) then { sexualill = 0;};
							if(_number1>33) then { sexualill = 1;};
							if(_number1>66) then { sexualill = 2;};
					
					sleep 1;
					_playercosts = hookerprice;
					_playersexill = sexualill;						
						if(life_cash < hookerprice) exitWith 
						{
							hint "Pas d'argent? Tu n'auras pas de plaisir avec moi!";
						};
						if(life_sex_ill > 0) exitWith
						{
							hint "Les maladies vénériennes? Aller chez le médecin avant de venir ici!";
						};
						hint format["'ai aimé le doux \n \n Vous devez payer% 1 €. \n\n Et vous devriez passé chez le médecin",_playercosts];
						life_cash = life_cash - _playercosts;
						life_sex_ill = life_sex_ill + _playersexill;

						sleep 10;
						player say3D "pute";
						if(_playersexill == 0) then
						{
							_val = 50;
						};
						if(_playersexill == 1) then
						{
							player setDamage 0.25;
							_val = 30
						};
						if(_playersexill == 2) then
						{
							player setDamage 0.50;
							_val = 15
						};	
						_sum = life_happy + _val;
						if(_sum > 100) then {
							_sum = 100; player setFatigue 0; hint "Vous êtes ravi de joie.";
						};
						life_happy = _sum;						
				};
};