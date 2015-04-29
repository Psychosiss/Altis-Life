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
		if(_number == 0) then { hookerPrice = 100;};
		if(_number == 1) then { hookerPrice = 2000;};
		if(_number == 2) then { hookerPrice = 4000;};
		if(_number == 3) then { hookerPrice = 8000;};
		if(_number == 4) then { hookerPrice = 16000;};
		if(_number == 5) then { hookerPrice = 32000;};
		if(_number == 6) then { hookerPrice = 64000;};
		if(_number == 7) then { hookerPrice = 128000;};
		_pplayer = _this select 0;
		_number1 = ceil(random 100);
		if(_number1<33) then { sexualIll = 0;};
		if(_number1>33) then { sexualIll = 1;};
		if(_number1>66) then { sexualIll = 2;};
		sleep 1;
		_playercosts = hookerPrice;
		_playerSexIll = sexualIll;						
		if(life_money < hookerPrice) exitWith 
		{
			hint "Pas d'argent? Tu n'auras pas de plaisir avec moi!";
		};

		if(life_sex > 0) exitWith
		{
			hint "Les maladies vénériennes? Aller chez le médecin avant de venir ici!";
		};
		hint format["J'aime le doux \n \n Vous devez payer% 1 €. \n\n Et vous devriez passé chez le médecin",_playercosts];
		life_money = life_money - _playercosts;
		life_sex = life_sex + _playerSexIll;
		player say3D "pute";
		sleep 10;
		if(_playerSexIll == 0) then
		{
			_val = 50;
		};

		if(_playerSexIll == 1) then
		{
			player setDamage 0.25;
			_val = 30
		};

		if(_playerSexIll == 2) then
		{
			player setDamage 0.50;
			_val = 15
		};
		_sum = life_happy + _val;
		if(_sum > 100) then 
		{
			_sum = 100; player setFatigue 0; 
			hint "Vous êtes ravi de joie.";
		};
		life_happy = _sum;						
	};
};