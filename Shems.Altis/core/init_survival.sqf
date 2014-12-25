[] spawn  
{
	private["_fnc_food","_fnc_water"]; 
	_fnc_food = 
	{
		if(life_hunger < 2) then 
		{
			player setDamage 1; 
			hint "You have starved to death.";
	} else {
		life_hunger = life_hunger - 10;
		[] call life_fnc_hudUpdate;
		if(life_hunger < 2) then 
		{
			player setDamage 1; 
			hint "You have starved to death.";
		};
		switch(life_hunger) do 
		{
			case 30: {hint "You haven't eaten anything in awhile, You should find something to eat soon!";};
			case 20: {hint "You are starting to starve, you need to find something to eat otherwise you will die.";};
			case 10: {hint "You are now starving to death, you will die very soon if you don't eat something";player setFatigue 1;};
			};
		};
	};
	
	_fnc_water = 
	{
		if(life_thirst < 2) then 
		{
			player setDamage 1; 
			hint "You have died from dehydration.";
		} else {
			life_thirst = life_thirst - 10;
			[] call life_fnc_hudUpdate;
			if(life_thirst < 2) then 
			{
				player setDamage 1; 
				hint "You have died from dehydration.";
			};
			switch(life_thirst) do 
			{
				case 30: {hint"You haven't drank anything in awhile, You should find something to drink soon.";};
				case 20: {hint "You haven't drank anything in along time, you should find something to drink soon or you'll start to die from dehydration"; player setFatigue 1;};
				case 10: {hint "You are now suffering from severe dehydration find something to drink quickly!"; player setFatigue 1;};
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
};

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
	waitUntil 
	{ 
		life_session_completed 
	};
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
				switch (true) do
				{
					case (_new > 0.4): 
					{ 
						systemChat "You are craving a high."; life_drug_withdrawl = false; 
					};
					case (_new > 0.6): 
					{ 
						systemChat "Getting high occupies all of your thoughts."; life_drug_withdrawl = false; 
					};
					case (_new > 0.9):
					{
						systemChat "You feel shakey and anxious! You need a fix!";
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
		private["_damage"];
		sleep 1;
		while {((player distance (getMarkerPos "Warm_Marker") < 250) && (player getVariable["Revive",TRUE]))} do
		{
			if(uniform player == "U_C_Scientist") then
			{
				hint "! Tu est dans une zone radioactive ! Mais ta combinaison te protège.";
				sleep 5;
			}else
			{
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

_illegalmarkers = ["heroin_1","cocaine_1","weed_1","weed_2","meth_1","tabac_1","turtle_2","turtle_1_name_1","turtle_1_name","turtle_1"];

if (playerSide == west) then {{ deleteMarkerLocal _x; } forEach _illegalmarkers;};

_illegalmarkers = ["prison"];

if (playerSide == civilian) then {{ deleteMarkerLocal _x; } forEach _illegalmarkers;};