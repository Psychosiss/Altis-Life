#include <macro.h>

switch(playerSide) do
{
	case civilian:
	{
		switch(true) do
		{
			default
			{
				[
					["Veste Capacité 1","talent_civ_vest1","ok","Permet l'achat de veste moyenne qui augmente votre capacité de charge"],
					[" - Veste Capacité 2","talent_civ_vest2","talent_civ_vest1","Permet l'achat de veste grand format qui augmente votre capacité de charge"],
					[" - - Filet Camo","talent_civ_vest3","talent_civ_vest2","Vous permet de placer des fillets de camouflage"],
					[" - - - Restriction de vue","talent_civ_look","talent_civ_vest3","Vous permet de bloquer la vue d'un joueur en vue 1er personne pendant 1 minute"],
					["Camionette","talent_civ_truck1","ok","Permet d'acheter et d'utiliser des camionettes"],
					[" - Zamak & Tempest","talent_civ_truck2","talent_civ_truck1","Permet d'acheter et d'utiliser le Zamak et le Tempest"],
					[" - - Helico Léger","talent_civ_helico1","talent_civ_truck2","Permet d'acheter et d'utiliser le Humming Birds"],
					[" - - - Helico Lourd","talent_civ_helico2","talent_civ_helico1","Permet d'acheter et d'utiliser l'Orca"],
					[" - - - - Huron","talent_civ_helico3","talent_civ_helico2","Permet d'acheter et d'utiliser le Huron"],
					[" - - HEMTT","talent_civ_truck3","talent_civ_truck2","Permet d'acheter et d'utiliser le HEMTT"],
					[" - - - Conteneur","talent_civ_truck4","talent_civ_truck3","Permet l'achat de Conteneur de transport"],
					[" - - - - Mineuse Portable","talent_civ_truck5","talent_civ_truck4","Permet l'achat de mineuse portable"],
					[" - - - - - Capacité Vehicule+","talent_civ_truck6","talent_civ_truck5","Augmente la capacité de vos véhicules de 25%"],
					["Salaire +","talent_civ_extra1","ok","Augmente votre salaire de 1000$ (Nécessite déco/reco)"],
					[" - Recolte +","talent_civ_extra2","talent_civ_extra1","Permet de récolter 1 unité de plus"],
					[" - - Recolte ++","talent_civ_extra3","talent_civ_extra2","Permet de récolter 2 unité de plus"],
					[" - - - Verrouillage Usine","talent_civ_utils7","talent_civ_extra3","Vous permet de verrouiller les usine pendant 2 minutes après un traitement"],
					[" - - - Recolte exp +","talent_civ_extra4","talent_civ_extra3","La recolte vous rapporte 25% d'experience supplémentaire"],
					[" - - - - Salaire ++","talent_civ_extra5","talent_civ_extra4","Augmente votre salaire de 2000$ (Nécessite déco/reco)"],
					[" - - - - - Appel Justicier","talent_civ_extra9","talent_civ_extra5","Permet d'utiliser directement votre téléphone pour contacter les justiciers"],
					[" - - - - - Pière St jo","talent_civ_extra6","talent_civ_extra5","Permet de se TP dans une safe zone (utilisable 1fois/h)"],
					[" - - - - - - Transfo exp +","talent_civ_extra7","talent_civ_extra6","La transformation vous rapporte 50% d'experience suplémentaire"],
					[" - - - - Recolte exp ++","talent_civ_extra8","talent_civ_extra4","La recolte vous rapporte 50% d'experience supplémentaire"],
					[" - - - - - Recolte Automatique","talent_civ_gather","talent_civ_extra8","Vous permet d'utiliser la récolte automatique"],
					["Kit Reparation +","talent_civ_utils1","ok","Vous avez 20% de chance de ne pas perdre de kit réparation quand vous réparez"],
					[" - Kit Reparation ++","talent_civ_utils2","talent_civ_utils1","Vous avez 30% de chance de ne pas perdre de kit réparation quand vous réparez"],
					[" - - Kit Reparation +++","talent_civ_utils3","talent_civ_utils2","Vous avez 50% de chance de ne pas perdre de kit réparation quand vous réparez"],
					[" - - Kit Soins +","talent_civ_utils4","talent_civ_utils2","Les trousse de soins vous soigne à 90hp"],
					[" - - - Medic Kit","talent_civ_utils5","talent_civ_utils4","Permet l'achat de MediKit"],
					[" - - - - Reanimation","talent_civ_utils6","talent_civ_utils5","Vous pouvez réanimé quelqu'un avec un Medic Kit"],
					["Craft","talent_civ_craft1","ok","Permet de craft partout des objets de base type 1"],
					[" - Craft +","talent_civ_craft2","talent_civ_craft1","Permet de craft partout des objets de base type 2"],
					[" - - Craft ++","talent_civ_craft3","talent_civ_craft2","Permet de craft partout des objets de base type 3"],
					["Recolte Type 1","talent_civ_work1","ok","Permet de récolter la Pierre/Bois/Sable"],
					[" - Recolte Type 2","talent_civ_work2","talent_civ_work1","Permet de récolter Fer/Cuivre/Argent"],
					[" - - Recolte Type 3","talent_civ_work3","talent_civ_work2","Permet de récolter Charbon/Poudre/Aluminium"],
					[" - - - Recolte Type 4","talent_civ_work4","talent_civ_work3","Permet de récolter Sels/Pétrole/Diamant"],
					[" - - - - Recolte Type 5","talent_civ_work5","talent_civ_work4","Permet de récolter du Cannabis"],
					[" - - - - - Recolte Type 6","talent_civ_work6","talent_civ_work5","Permet de récolter de l'héroine"],
					[" - - - - - - Recolte Type 7","talent_civ_work7","talent_civ_work6","Permet de récolter de la Cocaine"],
					["Voir Niveau Joueur","talent_civ_showlevel","ok","Permet de voir le niveau des autres joueurs à coté de leur pseudo"]
				]
			};
		};
	};
	
	case west:
	{
		switch(true) do
		{
			default
			{
				[
					["Menotte Infinit","talent_west_tool1","ok","Permet de récupérer des menottes quand on relache une personne"],
					[" - Pistolet IEM V1","talent_west_tool2","talent_west_tool1","Permet l'utilisation d'un pistolet IEM avec une distance maximum de 10m"],
					[" - - Prison: Karma","talent_west_tool3","talent_west_tool2","Permet d'envoyer les personnes avec le Karma négatif en prison si il refuse de payer leurs amendes de Karma"],
					[" - - - Mise en fourrière","talent_west_tool7","talent_west_tool3","Permet d'envoyer les véhicules au garage à partir du menu interaction"],
					[" - - - FlashBang: Karma","talent_west_tool4","talent_west_tool3","Permet l'achat des grenades FlashBang"],
					[" - - - - Pistolet IEM V2","talent_west_tool5","talent_west_tool4","Permet l'utilisation d'un pistolet IEM avec une distance maximum de 50m"],
					[" - - - - - Pistolet IEM V3","talent_west_tool6","talent_west_tool5","Permet l'utilisation d'un pistolet IEM avec une distance maximum de 100m"],
					[" - - - - - - Retrait License","talent_west_tool8","talent_west_tool6","Permet de choisir et retirer des licenses à une personne avec du Karma négatif"],
					["Arme Type 1","talent_west_arme1","ok","Vous permet d'achetez et fabriqué des Pistolets"],
					[" - Arme Type 2","talent_west_arme2","talent_west_arme1","Vous permet d'achetez et fabriqué des Mitraillette"],
					[" - - Arme Type 3","talent_west_arme3","talent_west_arme2","Vous permet d'achetez et fabriqué des Fusils d'Assault"],
					[" - - - Arme Type 4","talent_west_arme4","talent_west_arme3","Vous permet d'achetez et fabriqué des Machines Guns"],
					[" - - - - Arme Type 5","talent_west_arme5","talent_west_arme4","Vous permet d'achetez et fabriqué des Sniper d'Assault"],
					["-----Arme Type 6","talent_west_arme6","talent_west_arme5","Vous permet d'achetez et fabriqué des Sniper Rifle"],
					["Camionette","talent_west_truck1","ok","Permet d'acheter et d'utiliser des camionettes"],
					[" - Zamak","talent_west_truck2","talent_west_truck1","Permet d'acheter et d'utiliser le Zamak"],
					[" - - Hunter","talent_west_hunter","talent_west_truck2","Permet d'acheter et d'utiliser le Hunter"],
					[" - Humming Bird","talent_west_helico1","talent_west_truck1","Permet d'acheter et d'utiliser le Humming Birds"],
					[" - - Orca","talent_west_helico2","talent_west_helico1","Permet d'acheter et d'utiliser l'Orca"],
					["Salaire +","talent_west_bonus1","ok","Augmente votre salaire de 2000$ (Nécessite déco/reco)"],
					[" - Transporteur Justicier","talent_west_bonus7","talent_west_bonus1","Permet d'utiliser les transporteurs justicier (50 mana)"],
					[" - Prime sur Karma X2","talent_west_bonus2","talent_west_bonus1","L'argent et l'expérience que vous touchez sur les amendes Karma sont doublé"],
					[" - - Voir Justicier","talent_west_bonus5","talent_west_bonus2","Vous permet de voir les autres justiciers sur la carte"],
					[" - - Salaire ++","talent_west_bonus3","talent_west_bonus2","Augmente votre salaire de 3000$ (Nécessite déco/reco)"],
					[" - - - Infiltration","talent_west_bonus4","talent_west_bonus3","Permet de voir la position des personnes au Karma négatif des les hotels à Karma"],
					[" - - - - Transformation Karma +","talent_west_bonus6","talent_west_bonus4","Permet de doubler le gain de Karma quand on transforme"],
					["Barriere","talent_west_item1","ok","Permet d'utiliser des Barrieres"],
					[" - Herse","talent_west_item2","talent_west_item1","Permet d'utiliser des Herses"],
					[" - - Poste de Garde","talent_west_item3","talent_west_item2","Permet d'utiliser des Poste de Garde"],
					[" - - - Drone","talent_west_item4","talent_west_item3","Permet d'acheter et d'utiliser des Drone Darder"],
					["Recolte Type 1","talent_west_work1","ok","Permet de récolter la Pierre/Bois/Sable"],
					[" - Recolte Type 2","talent_west_work2","talent_west_work1","Permet de récolter Sels/Pétrole/Diamant"],
					["Recolte Type 3","talent_west_work3","ok","Permet de récolter Fer/Cuivre/Argent"],
					[" - Recolte Type 4","talent_west_work4","talent_west_work3","Permet de récolter Charbon/Poudre/Aluminium"],
					["Regeneration 1","talent_west_self1","ok","Permet de récupérer 1HP/min jusqu'a 80hp"],
					[" - Regeneration 2","talent_west_self2","talent_west_self1","Permet de récupérer 1HP/min jusqu'a 100hp"],
					[" - - Fouille","talent_west_self3","talent_west_self2","Permet d'ouvrir le sac à dos des joueurs avec Karma négatif"],
					[" - - - Réanimation","talent_west_self4","talent_west_self3","Permet de réanimé un joueurs (Exepté les bandits)"],
					["Récolte Automatique","talent_west_gather","ok","Vous permet d'utiliser la récolte automatique"],
					["Voir Niveau Joueur","talent_west_showlevel","ok","Permet de voir le niveau des autres joueurs à coté de leur pseudo"]
				]
			};
		};
	};	
	
	case independent:
	{
		switch(true) do
		{
			default
			{
				[
					["Craft Kit de Soins","talent_indep_support1","ok","Permet de craft partout des Kit de Soins"],
					[" - Reanimation","talent_indep_support2","talent_indep_support1","Permet de réanimé avec un MediKit "],
					[" - - Reparation Rapide","talent_indep_support3","talent_indep_support2","Augmente votre vitesse de réparation des véhicules"],
					[" - - - Pneu Autogonflant","talent_indep_support4","talent_indep_support3","Permet d'utiliser un Kit de réparation pour réparer les pneu du véhicules en restant à l'interieur de celui ci"],
					[" - - - - Bricoleur en Herbe","talent_indep_support5","talent_indep_support4","Permet de ne plus consommer de Kit de réparation quand on répare normalement"],
					["Craft Munition 1","talent_indep_craft1","ok","Permet de fabriqué des munitions de type 1"],
					[" - Craft Munition 2","talent_indep_craft2","talent_indep_craft1","Permet de fabriqué des munitions de type 2"],
					[" - - Craft Munition 3","talent_indep_craft3","talent_indep_craft2","Permet de fabriqué des munitions de type 3"],
					[" - - - Craft Munition Partout","talent_indep_craft4","talent_indep_craft3","Permet de fabriqué des munitions partout!"],
					["Camionette","talent_indep_truck1","ok","Permet d'acheter et d'utiliser des camionettes"],
					[" - Zamak/Tempest","talent_indep_truck2","talent_indep_truck1","Permet d'acheter et d'utiliser le Zamak et le Tempest"],
					[" - - Tempest Mineur","talent_indep_truck3","talent_indep_truck2","Permet d'acheter et d'utiliser le Tempest Mineur"],
					[" - - Humming Birds","talent_indep_helico1","talent_indep_truck2","Permet d'acheter et d'utiliser le Humming Birds"],
					[" - - - Orca","talent_indep_helico2","talent_indep_helico1","Permet d'acheter et d'utiliser l'Orca"],
					["Arme Type 1","talent_indep_arme1","ok","Vous permet d'achetez et fabriqué des Pistolets"],
					[" - Arme Type 2","talent_indep_arme2","talent_indep_arme1","Vous permet d'achetez et fabriqué des Mitraillette"],
					[" - - Arme Type 3","talent_indep_arme3","talent_indep_arme2","Vous permet d'achetez et fabriqué des Fusils d'Assault"],
					[" - - - Arme Type 4","talent_indep_arme4","talent_indep_arme3","Vous permet d'achetez et fabriqué des Machines Guns"],
					["Salaire +","talent_indep_bonus1","ok","Augmente votre salaire de 1500$ (Nécessite déco/reco)"],
					[" - Appel Justicier","talent_indep_bonus5","talent_indep_bonus1","Permet d'utiliser directement votre téléphone pour contacter les justiciers"],
					[" - Traceur Gang","talent_indep_bonus2","talent_indep_bonus1","Permet de voir les membres du gang sur la carte"],
					[" - - Exp Reparation +","talent_indep_bonus6","talent_indep_bonus2","Permet de doubler les gains d'exp quand on répare un véhicule"],
					[" - - Halo Jump","talent_indep_bonus3","talent_indep_bonus2","Permet d'être parachuter à 500m de hauteur par apport à votre position (45min de rechargement)"],
					[" - - - Oeil Qui Vois Tout","talent_indep_bonus4","talent_indep_bonus3","Permet de voir tout les joueurs sur la carte pendant 1min (30min de rechargement)"],
					["Recolte Type 1","talent_indep_work1","ok","Permet de récolter Fer/Cuivre/Argent"],
					[" - Recolte Type 2","talent_indep_work2","talent_indep_work1","Permet de récolter Charbon/Poudre/Aluminium"],
					["Recolte Type 3","talent_indep_work3","ok","Permet de récolter la Pierre/Bois/Sable"],
					[" - Recolte Type 4","talent_indep_work4","talent_indep_work3","Permet de récolter Sels/Pétrole/Diamant"],
					[" - - Recolte Illegal 1","talent_indep_work5","talent_indep_work4","Permet de récolter du Cannabis"],
					[" - - - Recolte Illegal 2","talent_indep_work6","talent_indep_work5","Permet de récolter de l'héroine"],
					[" - - - - Recolte Illegal 3","talent_indep_work7","talent_indep_work6","Permet de récolter de la Cocaine"],
					["Récolte Automatique","talent_indep_gather","ok","Vous permet d'utiliser la récolte automatique"],
					["Voir Niveau Joueur","talent_indep_showlevel","ok","Permet de voir le niveau des autres joueurs à coté de leur pseudo"],
					["Voir les Mort","talent_indep_showdead","talent_indep_showlevel","Permet de voir les joueurs mort sur la carte"]
				]
			};
		};
	};
	
	case east:
	{
		switch(true) do
		{
			default
			{
				[
					["Assomer","talent_east_bad1","ok","Permet d'assomer avec une armes"],
					[" - Assomer + Vole","talent_east_bad2","talent_east_bad1","Permet d'assomer sans armes et permet de voler l'argent"],
					[" - - Otage","talent_east_bad3","talent_east_bad2","Permet de prendre en otage avec des menottes"],
					[" - - - Intimidation","talent_east_bad7","talent_east_bad3","Permet d'intimider un joueurs (Touche: 2)"],
					[" - - - Cagoule","talent_east_bad4","talent_east_bad3","Permet d'aveugler des otages avec un sceau"],
					[" - - - - Vente Otage","talent_east_bad5","talent_east_bad4","Permet de vendre des otages"],
					[" - - - - - Vente Otage+","talent_east_bad6","talent_east_bad5","Double le prix de vente des otages"],
					["Arme Type 1","talent_east_arme1","ok","Vous permet d'achetez et fabriqué des Pistolets"],
					[" - Arme Type 2","talent_east_arme2","talent_east_arme1","Vous permet d'achetez et fabriqué des Mitraillette"],
					[" - - - Arme Type 3","talent_east_arme3","talent_east_arme2","Vous permet d'achetez et fabriqué des Fusils d'Assault"],
					[" - - - - Arme Type 4","talent_east_arme4","talent_east_arme3","Vous permet d'achetez et fabriqué des Machines Guns"],
					[" - - - - - FlashBang","talent_east_flashbang","talent_east_arme4","Vous permet d'achetez des grenades Flashbang"],
					[" - - - - - Arme Type 5","talent_east_arme5","talent_east_arme4","Vous permet d'achetez et fabriqué des Sniper d'Assault"],
					[" - - - - - - Arme Type 6","talent_east_arme6","talent_east_arme5","Vous permet d'achetez et fabriqué des Sniper Rifle"],
					[" - - - - - - - Viseur Type 1","talent_east_viseur1","talent_east_arme6","Vous permet de fabriqué des viseurs type 1 partout"],
					[" - - - - - - - - Viseur Type 2","talent_east_viseur2","talent_east_viseur1","Vous permet de fabriqué des viseurs type 2 partout"],
					["Camionette","talent_east_truck1","ok","Permet d'acheter et d'utiliser des camionettes"],
					[" - Zamak","talent_east_truck2","talent_east_truck1","Permet d'acheter et d'utiliser le Zamak"],
					[" - - Humming Bird","talent_east_helico1","talent_east_truck2","Permet d'acheter et d'utiliser le Humming Birds"],
					[" - - - Orca","talent_east_helico2","talent_east_helico1","Permet d'acheter et d'utiliser l'Orca"],
					[" - Ifrit","talent_east_ifrit","talent_east_truck1","Permet d'acheter et d'utiliser un Ifrit"],
					[" - - 4X4 Armé","talent_east_4x4","talent_east_ifrit","Permet d'acheter et d'utiliser un 4X4 Armé"],
					["Salaire +","talent_east_bonus1","ok","Augmente votre salaire de 3000$ (Nécessite déco/reco)"],
					[" - Fortification","talent_east_bonus2","talent_east_bonus1","Permet d'utiliser des Poste de Garde"],
					[" - - Espionage Usine","talent_east_bonus5","talent_east_bonus2","Permet de voir toutes les usines en fonctionement sur la carte en pendant 15 seconde"],
					[" - - Espionage Justicier","talent_east_bonus3","talent_east_bonus2","Permet de voir tout les justiciers sur la carte pendant 2min (30min de rechargement)"],
					[" - - - Extraction","talent_east_bonus4","talent_east_bonus3","Permet de se TP au camp bandit le plus proche"],
					[" - - - - Detecteur Mouvement","talent_east_item1","talent_east_bonus4","Permet d'utiliser les detecteurs de mouvements"],
					[" - - - - - Herse 4X4","talent_east_item2","talent_east_item1","Permet de jeter une herse derrier votre véhicules (4X4 seulement)"],
					["Crochetage Voiture","talent_east_lockpick1","ok","Permet de crocheter les voitures et camions avec 20% de réussite"],
					[" - Crochetage Helico","talent_east_lockpick2","talent_east_lockpick1","Permet de crocheter les hélicos avec 20% de réussite"],
					[" - - Crochetage Bateau","talent_east_lockpick3","talent_east_lockpick2","Permet de crocheter les bateaux et camions avec 20% de réussite"],
					[" - - - Crochetage Voiture +","talent_east_lockpick4","talent_east_lockpick3","Permet de crocheter les voitures et camions avec 50% de réussite"],
					[" - - - - Conduite Pro","talent_east_drive","talent_east_lockpick4","Permet de conduire tout type de véhicules terrestre"],
					[" - - - Crochetage Helico +","talent_east_lockpick5","talent_east_lockpick3","Permet de crocheter les hélicos avec 50% de réussite"],
					[" - - - - Pilotage Pro","talent_east_fly","talent_east_lockpick5","Permet de pilote tout type d'hélicoptère"],
					[" - - - Crochetage Bateau +","talent_east_lockpick6","talent_east_lockpick3","Permet de crocheter les bateaux avec 50% de réussite"],
					["Recolte Type 1","talent_east_work1","ok","Permet de récolter la Pierre/Bois/Sable"],
					[" - Recolte Type 2","talent_east_work2","talent_east_work1","Permet de récolter Fer/Cuivre/Argent"],
					[" - - Recolte Type 3","talent_east_work3","talent_east_work2","Permet de récolter Charbon/Poudre/Aluminium"],
					[" - - - Recolte Type 4","talent_east_work4","talent_east_work3","Permet de récolter Sels/Pétrole/Diamant"],
					["Recolte Illegal 1","talent_east_worki1","ok","Permet de récolter du Cannabis"],
					[" - Recolte Illegal 2","talent_east_worki2","talent_east_worki1","Permet de récolter de l'héroine"],
					[" - - Recolte Illegal 3","talent_east_worki3","talent_east_worki2","Permet de récolter de la Cocaine"],
					[" - - - Specialisation Récolte","talent_east_recolte","talent_east_worki3","Permet de récolter 1 unité de plus (Cannabis,Heroine,Cocaine uniquement)"],
					["Récolte Automatique","talent_east_gather","ok","Vous permet d'utiliser la récolte automatique"],
					["Voir Niveau Joueur","talent_east_showlevel","ok","Permet de voir le niveau des autres joueurs à coté de leur pseudo"]
				];
			};
		};
	};
};