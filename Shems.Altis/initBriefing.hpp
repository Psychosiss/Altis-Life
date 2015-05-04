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
		"City Protocol", 
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
			A venir
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