waitUntil {!isNull player && player == player};
if (player diarySubjectExists "rules") exitWith {};

player createDiarySubject ["changelog","Mises a jour"];
player createDiarySubject ["serverRules","Reglement général"];
player createDiarySubject ["copRules","Procedure de Police/Reglement"];
player createDiarySubject ["civRules","Reglement"];
player createDiarySubject ["medRules","Procedure médicale/Reglement"];
player createDiarySubject ["safezones","Zone sans danger (interdiction de tuer)"];
player createDiarySubject ["illegalItems","Activités illégales"];
player createDiarySubject ["controls","Controles"];

player createDiaryRecord["changelog",
	[
		"Changelog Officiel",
		"
			Vous pouvez voir les mises à jour de la mission de Tonic et Shems sur : github.com/Shems-SH/Arma-3/commits/master
		"
	]
];

player createDiaryRecord["changelog",
	[
		"Changelog Serveur",
		"
			Vous pouvez voir les mises à jour du serveur sur le site
		"
	]
];

player createDiaryRecord ["serverRules",
	[
		"Glitch", 
		"
			A venir
		"
	]
];

player createDiaryRecord ["serverRules",
	[
		"Action passable de ban/kick", 
		"
			A venir
		"
	]
];

player createDiaryRecord ["serverRules",
	[
		"Cop Interaction", 
		"
			A venir
		"
	]
];

player createDiaryRecord ["serverRules",
	[
		"Nautique", 
		"
			A venir
		"
	]
];

player createDiaryRecord ["serverRules",
	[
		"Aviation", 
		"
			A venir
		"
	]
];

player createDiaryRecord ["serverRules",
	[
		"Terrestre", 
		"
			A venir
		"
	]
];

player createDiaryRecord ["serverRules",
	[
		"Regles de communications", 
		"
			A venir
		"
	]
];

player createDiaryRecord ["serverRules",
	[
		"Random Deathmatching (RDM)", 
		"
			A venir
		"
	]
];

player createDiaryRecord ["serverRules",
	[
		"Regle de nouvelle vie", 
		"
			A venir
		"
	]
];

player createDiaryRecord ["serverRules",
	[
		"Ne soyez pas une bite", 
		"
			A venir
		"
	]
];

player createDiaryRecord ["copRules",
	[
		"Crisis Negotiation",
		"
			A venir
		"
	]
];

player createDiaryRecord ["copRules",
	[
		"La reserve fédérale",
		"
			A venir
		"
	]
];

player createDiaryRecord ["copRules",
	[
		"Aviation",
		"
			A venir
		"
	]
];

player createDiaryRecord ["copRules",
	[
		"Zones interdites", 
		"
			A venir
		"
	]
];

player createDiaryRecord ["copRules",
	[
		"Patrouilles", 
		"
			A venir
		"
	]
];

player createDiaryRecord ["copRules",
	[
		"Barrage", 
		"
			A venir
		"
	]
];

player createDiaryRecord ["copRules",
	[
		"Terrestre", 
		"
			A venir
		"
	]
];

player createDiaryRecord ["copRules",
	[
		"Vitesse", 
		"
			A venir
		"
	]
];

player createDiaryRecord ["copRules",
	[
		"Protocole de la ville", 
		"
			A venir
		"
	]
];

player createDiaryRecord ["copRules",
	[
		"Arrestations et amendes",
		"
			A venir
		"
	]
];

player createDiaryRecord ["copRules",
	[
		"Armes", 
		"
			A venir
		"
	]
];

player createDiaryRecord ["copRules",
	[
		"Utilisation de la force non-létale",
		"
			A venir
		"
	]
];

player createDiaryRecord ["copRules",
	[
		"Raiding/Camping",
		"
			A venir
		"
	]
];

player createDiaryRecord ["copRules",
	[
		"Chain of Command",
		"
			A venir
		"
	]
];

player createDiaryRecord ["copRules",
	[
		"Utilisation de la force létale",
		"
			A venir
		"
	]
];

player createDiaryRecord ["civRules",
	[
		"Reglement",
		"
			A venir
		"
	]
];

player createDiaryRecord ["medRules",
	[
		"Reglement",
		"
			A venir
		"
	]
];

player createDiaryRecord["safezones",
	[
		"Safe Zones",
		"
			A venir
		"
	]
];

player createDiaryRecord ["illegalItems",
	[
		"Reglement rebelle",
		"
			A venir
		"
	]
];

player createDiaryRecord ["illegalItems",
	[
		"Reglement des gangs",
		"
			A venir
		"
	]
];

player createDiaryRecord ["illegalItems",
	[
		"Vehicules illégaux",
		"
			A venir
		"
	]
];

player createDiaryRecord ["illegalItems",
	[
		"Armes illégaux",
		"
			A venir
		"
	]
];

player createDiaryRecord ["illegalItems",
	[
		"Objets illégaux",
		"
			Lingot d 'or = 150 000 € / unité
			Feuille d'Heroine =  1 875 € / unité
			Heroine pure = 3 750 € / unité
			Feuille de Cocaine = 2 500 € / unité
			Cocaine Pure = 5 000 € / unité
			Cannabis = 1 750 € / unité
			Marijuana = 3 500 € / unité
			Viande de tortue = 7 000 € / unité
			Charge explosive = 125 000 € / unité
			Pince coupante = 50 000 € / unité
			Pétrole non purifié = 5 500 € / unité
			Pétrole purifié = 9 500 € / unité
			Methemphetamine = 5 500 € / unité
			Methemphetamine Pure = 9 500 € / unité
			Feuille de tabac = 5 500 € / unité
			Cigare = 9 500 € / unité
			Uranium illégal = 10 000 € / unité
			Viande de chien cru = 2 500 € / unité
			Viande de chien cuisinée = 2 500 € / unité
			Menottes = 10 000 € / unité
			Clé de menottes = 5 000 € / unité
			Organe = 5 000 € / unité
		"
	]
];

player createDiaryRecord ["controls",
	[
		"Touches de controles",
		"
			Y: Ouvrir le menu du joueur<br/>
			U: Ouvrir ou fermer un vehicule<br/>
			F: Sirène (policiers ou medecins)<br/>
			T: Inventaire du vehicule<br/>
			6: Activer le nitro<br/>
			L: Radar<br/>
			Shift + R: Menotter (nécessite des menottes)<br/>
			Shift + G: Assomer<br/>
			Windows: Touche d'interaction pour ramasser les objets ou de la monnaie, récolter, interagir avec un vehicule (reparer,etc) et avec les autres joueurs (menotter,etc...). Si non fonctionnel, allez dans : Echap > Configurer > Commandes > Commandes personnalisées > Util. action 10<br/>
			Shift + L: Activer les gyrophares (policiers ou medecins).<br/>
			Shift + H: Ranger son arme<br/>
			Shift + espace: Sauter<br/>
		"
	]
];