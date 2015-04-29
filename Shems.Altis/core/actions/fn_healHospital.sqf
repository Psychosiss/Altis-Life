_mode = _this select 3;

switch (_mode) do 
{
	case "heilen":
	{
		if(life_money < 50) exitWith {hint "Vous n'avez pas 50 € pour être guéri."};
		titleText["Docteur Poliashkoff vous guérit... ne vous inquiétez pas...","PLAIN"];
		sleep 2;
		titleText["oups... Je pense que j'ai mis l'aiguille trop loin..","PLAIN"];
		sleep 5;
		if(player distance (_this select 0) > 5) exitWith {titleText["Vous avez besoin de rester dans un rayon de 5 m, de sorte que le médecin peut vous traiter.","PLAIN"]};
		titleText["Vous êtes maintenant en parfaite santé!","PLAIN"];
		player setdamage 0;
		life_money = life_money - 50;
	};

	case "checken":
	{
		if(life_checked == 1) exitWith { hint "Vous avez déjà un check-up. Vous devez être vous-même traité maintenant."; };
		if(life_sex == 0) then
		{
			hint format["diagnostique: \n\n Nom: %1 \n\n maladie: aucune",name player];
			life_checked = 0;
		};

		if(life_sex == 1) then
		{
			hint format["diagnostique: \n\n Nom: %1 \n\n maladie: blennorragie \n\n Vous devriez maintenant être traité!",name player];
			life_checked = 1;
		};

		if(life_sex == 2) then
		{
			hint format["diagnostique: \n\n Nom: %1 \n\n maladie: SIDA \n\n Vous devriez maintenant être traité.",name player];
			life_checked = 1;
		 };
	};

	case "behandeln":
	{
		if(life_checked == 0) exitWith {hint "Comment dois-je vous traiter si je ne sais même pas ce que vous avez? Donc, nous allons vérifier par nous-même.";};
		if(life_sex == 1) then
		{
			if(life_money < 1000) exitWith {hint "J'ai trouvé en vous une maladie sexuellement transmissible que vous n'avez tout simplement pas laisser assez d'argent pour vous soignez!";};
			titleText["J'ai découvert la gonorrhée en vous. Je vais vous guérir maintenant. \n Cela peut prendre jusqu'à 20 secondes.","PLAIN"];
			sleep 20;
			titleText["Vous êtes guéri! Vous allez mieux!","PLAIN"];
			life_money = life_money - 1000;
			player setDamage 0;
			life_sex = 0;
			life_checked = 0;
		};

		if(life_sex == 2) then
		{
			if(life_money < 10000) exitWith {hint "J'ai trouvé en vous une maladie sexuellement transmissible que vous n'avez tout simplement pas laisser assez d'argent pour vous soignez!";};
			titleText["J'ai découvert le SIDA en vous. Je vais vous guérir maintenant. \n Cela peut prendre jusqu'à 40 secondes.","PLAIN"];
			sleep 40;
			titleText["Vous êtes guéri! Vous allez mieux!","PLAIN"];
			life_money = life_money - 10000;
			player setDamage 0;
			life_sex = 0;
			life_checked = 0;
		};
	};
};