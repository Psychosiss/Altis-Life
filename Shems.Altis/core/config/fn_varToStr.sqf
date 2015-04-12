private["_var"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
if(_var == "") exitWith {""};

switch (_var) do
{
	case "life_inv_oilu": {"Pétrole non purifié"};
	case "life_inv_oilp": {"Pétrole purifié"};
	case "life_inv_heroinu": {"Feuille d'Heroine"};
	case "life_inv_heroinp": {"Heroine pure"};
	case "life_inv_cannabis": {"Cannabis"};
	case "life_inv_marijuana": {"Marijuana"};
	case "life_inv_apple": {"Pomme"};
	case "life_inv_salema": {"Chaire de Saumon"};
	case "life_inv_ornate": {"Chaire de Rouget"};
	case "life_inv_mackerel": {"Chaire de Maquereau"};
	case "life_inv_tuna": {"Chaire de Thon"};
	case "life_inv_mullet": {"Chaire de Mullet"};
	case "life_inv_catshark": {"Chaire de Requin Tigre"};
	case "life_inv_turtle": {"Viande de tortue"};
	case "life_inv_fishingpoles": {"Canne à pêche"};
	case "life_inv_water": {"Bouteille d'eau"};
	case "life_inv_burgers": {"Hamburger"};
	case "life_inv_coffee": {"Café"};
	case "life_inv_turtlesoup": {"Soupe de tortue"};
	case "life_inv_donuts": {"Donuts"};
	case "life_inv_fuelE": {"Jerrican Vide"};
	case "life_inv_fuelF": {"Jerrican d'essence"};
	case "life_inv_pickaxe": {"Pioche"};
	case "life_inv_copperore": {"Minerai de cuivre"};
	case "life_inv_ironore": {"Minerai de fer"};
	case "life_inv_ironr": {"Lingot de fer"};
	case "life_inv_copperr": {"Lingot de cuivre"};
	case "life_inv_sand": {"Sable"};
	case "life_inv_salt": {"Sel"};
	case "life_inv_saltr": {"Sel Raffinné"};
	case "life_inv_glass": {"Verre"};
	case "life_inv_diamond": {"Diamant non taillé"};
	case "life_inv_diamondr": {"Diamant taillé"};
	case "life_inv_tbacon": {"Bacon"};
	case "life_inv_redgull": {"Boisson energisante"};
	case "life_inv_lockpick": {"Crochetage"};
	case "life_inv_peach": {"Pêche"};
	case "life_inv_coke": {"Feuille de Cocaine"};
	case "life_inv_cokep": {"Cocaine Pure"};
	case "life_inv_spikeStrip": {"Herse"};
	case "life_inv_rock": {"Pierre"};
	case "life_inv_cement": {"Ciment"};
	case "life_inv_goldbar": {"Lingo d'or"};
	case "life_inv_blastingcharge": {"Charges d'explosifs"};
	case "life_inv_boltcutter": {"Pince coupante"};
	case "life_inv_defusekit": {"Desamorceur"};
	case "life_inv_storagesmall": {"Petit coffre"};
	case "life_inv_storagebig": {"Grand coffre"};
	case "life_inv_kidney": {"Organe"};
	case "life_inv_methu": {"Feuille de Meth"};
	case "life_inv_methp": {"Meth Pure"};
	case "life_inv_tabac": {"Feuille de Tabac"};
	case "life_inv_cigare": {"Cigare"};
	case "life_inv_puranium": {"Produit Uranium"};
	case "life_inv_ipuranium": {"Uranium illégal"};
	case "life_inv_uranium1": {"Déchets d'Uranium"};
	case "life_inv_uranium2": {"Uranium Brut"};
	case "life_inv_uranium3": {"Uranium Purifié"};
	case "life_inv_uranium4": {"Uranium Concentré"};
	case "life_inv_uranium": {"Uranium"};
	case "life_inv_skull": {"Crâne"};
	case "life_inv_pressluft": {"Marteau-Pickeur"};
	case "life_inv_skullp": {"Antiquité restaurée"};
	case "life_inv_nitro": {"Kit Nitro"};
	case "life_inv_frites": {"frites"};
	case "life_inv_pizza": {"pizza"};
	case "life_inv_gpstracker": {"Trackeur véhicule"};
	case "life_inv_bombdetect": {"Detecteur de bombe"};
	case "life_inv_civdefusekit": {"Desamorceur"};
	case "life_inv_demolitioncharge": {"Charge de démolition"};
	case "life_inv_scalpel": {"Scalpel chirurgicale"};
	case "life_inv_silver": {"Minerai d'argent"};
	case "life_inv_silverr": {"Lingot d'argent"};
	case "life_inv_speedbomb": {"Bombe à Vitesse"};
	case "life_inv_campfire": {"Kit de feu de camp"};
	case "life_inv_painkillers": {"Analgésique"};
	case "life_inv_tent1": {"Tente (A-forme)"};
	case "life_inv_tent2": {"Tente (forme de dôme)"};
	case "life_inv_dog": {"Viande de chien cru"};
	case "life_inv_goat": {"Viande de chèvre cru"};
	case "life_inv_sheep": {"Viande de mouton cru"};
	case "life_inv_chicken": {"Viande de poulet cru"};
	case "life_inv_rabbit": {"Viande de lapin cru"};
	case "life_inv_snake": {"Viande de serpent cru"};
	case "life_inv_dogp": {"Viande de chien cuisinée"};
	case "life_inv_goatp": {"Viande de chèvre cuisinée"};
	case "life_inv_sheepp": {"Viande de mouton cuisinée"};
	case "life_inv_chickenp": {"Viande de poulet cuisinée"};
	case "life_inv_rabbitp": {"Viande de lapin cuisinée"};
	case "life_inv_snakep": {"Viande de serpent cuisinée"};
	case "life_inv_skinningknife": {"Couteau de dépeçage"};
	case "life_inv_vammo": {"Munitions de véhicules"};
	case "life_inv_adrenaline": {"Adrenaline"};
	case "life_inv_debitcard": {"Carte de débit"};
	case "life_inv_underwatercharge": {"Charge sous marine"};
	case "life_inv_handcuffs": {"Menottes"};
	case "life_inv_handcuffkeys": {"Clés de menottes"};

	case "license_civ_driver": {"Permis de conduire"};
	case "license_civ_air": {"Permis aérien"};
	case "license_civ_dive": {"Permis de plongée"};
	case "license_civ_boat": {"Permis bateau"};
	case "license_cop_air": {"Permis aérien"};
	case "license_civ_truck": {"Permis poid lourd"};
	case "license_med_air": {"Permis aérien"};
	case "license_civ_home": {"Droit de propriété"};
	case "license_civ_skull": {"Permis archéologie"};
	case "license_civ_gun": {"License arme légal"};
	case "license_cop_swat": {"License SWAT"};
	case "license_civ_rebel": {"License rebelle"};
	case "license_civ_diamond": {"Traitement de diamant"};
	case "license_civ_heroin": {"Traitement d'héroine"};
	case "license_civ_oil": {"Traitement de pétrole"};
	case "license_civ_copper": {"Traitement de cuivre"};
	case "license_civ_silver": {"Traitement d'argent"};
	case "license_civ_sand": {"Traitement de sable"};
	case "license_civ_salt": {"Traitement de sel"};
	case "license_civ_coke": {"Traitement de cocaine"};
	case "license_civ_marijuana": {"Traitement de marijuana"};
	case "license_civ_iron": {"Traitement de fer"};
	case "license_civ_meth": {"Traitement de Meth"};
	case "license_civ_tabac": {"Traitement de Tabac"};
	case "license_civ_cement": {"Fabrication de ciment"};
	case "license_cop_cg": {"Garde de côte"};
	case "license_civ_uranium": {"Formation Uranium"};
	case "license_civ_admin": {"Administrateur"};
};