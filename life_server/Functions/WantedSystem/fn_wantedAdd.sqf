private["_uid","_type","_index","_data","_crimes","_val","_customBounty","_name"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_type = [_this,2,"",[""]] call BIS_fnc_param;
_customBounty = [_this,3,-1,[0]] call BIS_fnc_param;
if(_uid == "" OR _type == "" OR _name == "") exitWith {};

switch(_type) do
{
	case "1": {_type = ["Conduite sans permis de conduire",1500]};
    case "2": {_type = ["Vol de véhicule",3500]};
    case "3": {_type = ["Vol de véhicule civil étranger",5000]};
    case "4": {_type = ["Conduite sans lumières",350]};
    case "5": {_type = ["Vitesse excessive",3500]};
    case "6": {_type = ["Conduite dangereuse",2500]};
    case "7": {_type = ["Tentative de vol de véhicule de police",7500]};
    case "8": {_type = ["Vol de véhicules de police",20000]};
    case "9": {_type = ["Atterrissage dans une zone d'exclusion aérienne",2500]};
    case "10": {_type = ["Conduite de véhicules illégaux",10000]};
    case "11": {_type = ["Délit De Fuite Après Un Accident",5000]};
    case "12": {_type = ["Delit De Fuite Devant La Police",7500]};
    case "13": {_type = ["Délit De Fuite Devant La Police",25000]};
    case "14": {_type = ["Écraser Un Humain",5000]};
    case "15": {_type = ["Résistance à la violence de l'Etat",15000]};
    case "16": {_type = ["Ne pas suivre le pôle",5000]};
    case "17": {_type = ["Insulte",2500]};
    case "18": {_type = ["Harcèlement d'un agent de police",8000]};
    case "19": {_type = ["Entrer dans le pôle de la zone de barrage",5000]};
    case "20": {_type = ["Tuer un policier",25000]};
    case "21": {_type = ["Feu sur la police",15000]};
    case "22": {_type = ["Destruction de biens de la police",15000]};
    case "23": {_type = ["infractions relatives aux drogues",12000]};
    case "24": {_type = ["Possession d'armes à feu sans permis",5000]};
    case "25": {_type = ["Arme dans la ville",2500]};
    case "26": {_type = ["Possession d'une arme interdite",10000]};
    case "27": {_type = ["sage de l'arme à l'intérieur des villes",10000]};
    case "28": {_type = ["Prise d'otages",30000]};
    case "29": {_type = ["Attaque sur des personnes/véhicules",10000]};
    case "30": {_type = ["Hold-up",200000]};
    case "31": {_type = ["Meurtre",60000]};
    case "32": {_type = ["Révolte",35000]};
    case "33": {_type = ["Attaque par le rebelle",35000]};
    case "34": {_type = ["Attaque / siège des capitales",25000]};
    case "35": {_type = ["atterrissage dans une zone d'exclusion aérienne",1500]};
    case "36": {_type = ["Voler en-dessous de 150m à kavala",2000]};
    case "37": {_type = ["Sortie de la prison",25000]};
    case "38": {_type = ["Voler sans permis de vol",1200]};
    case "39": {_type = ["Klaxons gênants durablement",1000]};
    case "40": {_type = ["Commerce avec les biens exotiques",25000]};
	case "187V": {_type = ["Homicide Routier",6500]};
	case "187": {_type = ["Homicide Involontaire",8500]};
	case "207": {_type = ["Enlèvement",3500]};
	case "207A": {_type = ["Tentative D'enlèvement",2000]};
	case "211": {_type = ["Attaque Station De Essence",1000]};
	case "211A": {_type = ["Pillage de Distributeur",1000]};
	case "213": {_type = ["Utilisation D'explosifs",10000]};
	case "215": {_type = ["Tentative De Vol D'Automobile",2000]};
	case "261": {_type = ["Viol",5000]};
	case "261A": {_type = ["Tentative De Viol",3000]};
	case "459": {_type = ["Cambriolage",6500]};
	case "459A": {_type = ["Pillage de la reserve fédérale",65000]};
	case "480": {_type = ["Délit De Fuite",1300]};
	case "481": {_type = ["Possession de substance illicite",1000]};
	case "482": {_type = ["Intention De Distribuer",5000]};
	case "483": {_type = ["Trafic De Drogue",9500]};
	case "485": {_type = ["Tentative de crochetage de menottes",2500]};
	case "486": {_type = ["Crochetage de menotte",5000]};
	case "487": {_type = ["Grand Vol",1500]};
	case "488": {_type = ["Petit Vol",700]};
	case "800": {_type = ["Torture sur humain",10000]};
	case "901": {_type = ["Evasion de Prison",4500]};
	case "902": {_type = ["Vitesse Excessive",2000]};
	case "9021": {_type = ["Vitesse Excessive",5000]};
	case "9022": {_type = ["Vitesse Excessive",8000]};
	case "902": {_type = ["Sortir un prisonnier",75000]};
	case "919": {_type = ["Trafic d'organes",20000]};
	default {_type = [];};
};

if(count _type == 0) exitWith {};

if(_customBounty != -1) then {_type set[1,_customBounty];};

_index = [_uid,life_wanted_list] call fnc_index;

if(_index != -1) then
{
	_data = life_wanted_list select _index;
	_crimes = _data select 2;
	_crimes pushBack (_type select 0);
	_val = _data select 3;
	life_wanted_list set[_index,[_name,_uid,_crimes,(_type select 1) + _val]];
	[[_name,_uid,_crimes,(_type select 1) + _val],_uid] spawn TON_fnc_saveBounties;
} else {
	life_wanted_list pushBack [_name,_uid,[(_type select 0)],(_type select 1)];
	[[_name,_uid,[(_type select 0)],(_type select 1)],_uid] spawn TON_fnc_saveBounties;
};