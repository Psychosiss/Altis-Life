private "_enable";
_enable = [_this,0,true,[true]] call BIS_fnc_param;

if (_enable) then 
{
	life_fnc_survival_thread = [] spawn 
	{
		#define TIME_DELTA 1
		#define HEALTH_TIME (60 * 5)
		#define FATIGUE_TIME (60 * 1)
		#define HUNGER_TIME (140 * 60)
		#define THIRST_TIME (120 * 60)
		#define HEALTH_DELTA TIME_DELTA * (100 / HEALTH_TIME) / 100
		#define FATIGUE_DELTA TIME_DELTA * (100 / FATIGUE_TIME) / 100
		#define HUNGER_DELTA TIME_DELTA * (100 / HUNGER_TIME)
		#define THIRST_DELTA TIME_DELTA * (100 / THIRST_TIME)

		private	["_speed","_hunger","_thirst","_death","_exit"];
		_exit = false;
		life_hunger = 100;
		life_thirst = 100;

		while {true} do 
		{
			_speed = (velocity player vectorDistance [0,0,0]) * 3.6;
			_hunger = HUNGER_DELTA;
			_thirst = THIRST_DELTA;
			if (vehicle player == player && {_speed > 0}) then 
			{
				_hunger = _hunger + (_hunger * ( _speed / 10 ));
				_thirst = _thirst + (_thirst * ( _speed / 10 ));
			};

			life_hunger = life_hunger - _hunger;
			life_thirst = life_thirst - _thirst;

			if (damage player >= 0.85) then 
			{
				addCamShake	[2,1,25];
			};

			if (life_hunger <= 0 || {life_thirst <= 0}) exitWith 
			{
				player setFatigue 1;
			};
			uiSleep TIME_DELTA;
		};
	}
} else {
	if (!isNil "life_fnc_survival_thread" && {!isNull life_fnc_survival_thread}) then {terminate life_fnc_survival_thread};
};

/*[] spawn  
{
	private["_fnc_food","_fnc_water"]; 
	_fnc_food = 
	{
		if(life_hunger < 2) then 
		{
			player setDamage 1; 
			hint "Vous êtes mort de faim.";
	} else {
		life_hunger = life_hunger - 10;
		[] call life_fnc_hudUpdate;
		if(life_hunger < 2) then 
		{
			player setDamage 1; 
			hint "Vous êtes mort de faim.";
		};
		switch(life_hunger) do 
		{
			case 30: {hint "Vous ne avez rien mangé depuis un moment... Vous devriez trouver quelque chose à manger.";};
			case 20: {hint "Vous commencez à mourir de faim, vous avez besoin de trouver quelque chose à manger, sinon vous mourrez.";};
			case 10: {hint "Vous êtes maintenant mort de faim, vous allez bientôt mourir si vous ne mangez quelque chose.";player setFatigue 1;};
			};
		};
	};
	
	_fnc_water = 
	{
		if(life_thirst < 2) then 
		{
			player setDamage 1; 
			hint "Vous êtes morts de déshydratation.";
		} else {
			life_thirst = life_thirst - 10;
			[] call life_fnc_hudUpdate;
			if(life_thirst < 2) then 
			{
				player setDamage 1; 
				hint "Vous êtes morts de déshydratation.";
			};
			switch(life_thirst) do 
			{
				case 30: {hint"Vous n'avez rien bu depuis un moment... Vous devriez trouver quelque chose à boire.";};
				case 20: {hint "Vous n'avez rien bu, vous avez besoin de trouver quelque chose à boire ou vous allez bientôt commencer à mourir de déshydratation."; player setFatigue 1;};
				case 10: {hint "Vous souffrez maintenent en déshydratation sévère... trouver quelque chose à boire rapidement."; player setFatigue 1;};
			};
		};
	};

	while{true} do
	{
		sleep 550;
		[] call _fnc_water;
		sleep 200;
		[] call _fnc_food;
	};
};*/



[] spawn
{
	private["_bp","_load","_cfg"];
	while{true} do
	{
		waitUntil {backpack player != ""};
		_bp = backpack player;
		_cfg = getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumload");
		_load = round(_cfg / 8);
		life_maxWeight = life_maxWeightT + _load;
		waitUntil {backpack player != _bp};
		if(backpack player == "") then 
		{
			life_maxWeight = life_maxWeightT;
		};
	};
};

[] spawn
{
	while{true} do
	{
		_oldDamage = damage player;
		waitUntil {_oldDamage != damage player};
		if (_oldDamage != damage player) then
		{
			_damage = (damage player) - _oldDamage;
			if (_damage > 0.2) then
			{
				_pain = (life_pain + _damage);
				if (_pain > 1) then 
				{ 
					_pain = 1; 
				};
				[_pain] spawn life_fnc_setPain;
			};
		};
	};
};

[] spawn
{
	while {true} do
	{
		sleep 1.5;
		if(life_carryWeight > life_maxWeight && !isForcedWalk player) then 
		{
			player forceWalk true;
			player setFatigue 1;
			hint "Votre sac est plein! Lachez des objets pour avancer plus vite.";
		} else {
			if(isForcedWalk player) then 
			{
				player forceWalk false;
			};
		};
	};
};

[] spawn
{
	waitUntil {life_session_completed};
	for "_i" from 0 to (count life_addiction)-1 do
	{
		_new = life_addiction select _i;
		if (_new > 0) then
		{
			_new = _new - 0.02;
			if (_new < 0) then 
			{ 
				_new = 0; 
			};
			life_addiction set [_i, _new];
			if (_new > 0 && (time - (life_used_drug select _i)) > 600) then
			{
				switch true do
				{
					case (_new > 0.4): 
					{ 
						systemChat "Vous êtes fortement en manque."; 
						life_drug_withdrawl = false; 
					};
					case (_new > 0.6): 
					{ 
						systemChat "Obtenez de la drogue avant que votre addiction occupe toutes vos pensées."; 
						life_drug_withdrawl = false; 
					};
					case (_new > 0.9):
					{
						systemChat "You feel shakey and anxious! You need a fix! Vous vous sentez chancelants et anxieux! Vous avez besoin d'une dose!";
						if (!life_drug_withdrawl) then 
						{ 
							[] spawn 
							{ 
								while {life_drug_withdrawl} do 
								{ 
									resetCamShake;
									addCamShake [1, 4, 10];
									sleep 3.5;
								}; 
								resetCamShake;
							}
						};
						life_drug_withdrawl = true;
					};
				};
			};
		};
	};
	sleep 240;
	life_drug_level = life_drug_level - 0.05;
	if (life_drug_level < 0) then 
	{ 
		life_drug_level = 0; 
	};
};

[] spawn  
{
	private["_walkDis","_myLastPos","_MaxWalk","_runHunger","_runDehydrate"];
	_walkDis = 0;
	_myLastPos = (getPos player select 0) + (getPos player select 1);
	_MaxWalk = 1200;
	while{true} do 
	{
		sleep 0.5;
		if(!alive player) then {_walkDis = 0;}
		else
		{
			_CurPos = (getPos player select 0) + (getPos player select 1);
			if((_CurPos != _myLastPos) && (vehicle player == player)) then
			{
				_walkDis = _walkDis + 1;
				if(_walkDis == _MaxWalk) then
				{
					_walkDis = 0;
					life_thirst = life_thirst - 5;
					life_hunger = life_hunger - 5;
					[] call life_fnc_hudUpdate;
				};
			};
			_myLastPos = (getPos player select 0) + (getPos player select 1);
		};
	};
};

[] spawn  
{
	while{true} do
	{
		waitUntil {(player getVariable "missingOrgan")};
		life_max_health = .50;
		while{(player getVariable "missingOrgan")} do 
		{
			life_thirst =  50;
			life_hunger =  50;
			if(damage player < (1 - life_max_health)) then {player setDamage (1 - life_max_health);};
			"dynamicBlur" ppEffectEnable true;
			"dynamicBlur" ppEffectAdjust [2];
			"dynamicBlur" ppEffectCommit 1;
			sleep 5;
		};
		"dynamicBlur" ppEffectEnable false;
		life_max_health = 1;
	};
};

[] spawn
{
	while {true} do
	{
		sleep 1.5;
		if(life_inv_uranium2 != 0) then 
		{
			player forceWalk true;
			player setFatigue 1;
			hint "Tu porte de l'uranium brut tu ne peux pas courir pour le moment!";
		} else {
			if(isForcedWalk player) then 
			{
				player forceWalk false;
			};
		};
	};
};

[] spawn
{
	while {true} do
	{
		private "_damage";
		sleep 1;
		while {((player distance (getMarkerPos "Warm_Marker") < 250) && (player getVariable["Revive",true]))} do
		{
			if(uniform player == "U_C_Scientist") then
			{
				hint "! Tu est dans une zone radioactive ! Mais ta combinaison te protège.";
				sleep 5;
			} else {
				hint "! TU ES DANS UNE ZONE RADIOACTIVE ! Tu risque de mourir si tu n'es pas protégé.";
				_damage = damage player;
				_damage = _damage + 0.1;
				player setDamage (_damage);
				[] call life_fnc_hudUpdate;
				sleep 5;
			};
		};
	};
};

[] spawn 
{
    while {true} do 
	{
        if (life_fatigue < getFatigue player) then 
		{
            player setFatigue life_fatigue;
        };
        sleep 1.5;
    }
};