private["_house","_uid","_action","_houseCfg","_mustBuy"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_uid = getPlayerUID player;

if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};
if((_house getVariable["house_owned",false])) exitWith {hint "Cette maison est déjà habité"};
if(!isNil {(_house getVariable "house_sold")}) exitWith {hint "Cette maison a été récemment vendu et est en cours de traitement dans la base de données."};
if(!license_civ_home) exitWith {hint "Vous n'avez pas de droit de propriété"};

[[_uid,player],"TON_fnc_buyHouseCheck",false,false] call life_fnc_MP;
life_isBuying = 1;
hint "Association des locataires ...";
closeDialog 0;
sleep 1.5;

_mustBuy = player getVariable["life_CanBuyHouse",[6]];
if(_mustBuy >= (call life_houseLimit)) exitWith {life_isBuying = 0; hint format["Vous avez suffisament de maison",(call life_houseLimit)]};
life_isBuying = 0;

_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
if(count _houseCfg == 0) exitWith {};

_action = 
[
	format["Voulez-vous vraiement acheter cette maison ?",
	[(_houseCfg select 0)] call life_fnc_numberText,
	(_houseCfg select 1)],"Acheter la Maison","Acheter","Annuler"
] call BIS_fnc_guiMessage;

if(life_atmmoney < (_houseCfg select 0)) exitWith {hint format ["Vous n'avez pas assez d'argent!"]};
if(_action) then 
{
	if(life_atmmoney < (_houseCfg select 0)) exitWith {hint format ["Vous n'avez pas assez d'argent!"]};
	life_atmmoney = life_atmmoney - (_houseCfg select 0);
	[1] call SOCK_fnc_updatePartial;
	sleep 0.5;
	[[_uid,_house],"TON_fnc_addHouse",false,false] spawn life_fnc_MP;
	_house setVariable["house_owner",[_uid,profileName],true];
	_house setVariable["house_soldCheck",false,true];
	_house setVariable["locked",true,true];
	_house setVariable["house_owned",true,true];
	_house setVariable["Trunk",[[],0],true];
	_house setVariable["containers",[],true];
	_house setVariable["uid",round(random 99999),true];
	life_vehicles pushBack _house;
	life_houses pushBack [str(getPosATL _house),[]];
	_marker = createMarkerLocal [format["house_%1",(_house getVariable "uid")],getPosATL _house];
	_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
	_marker setMarkerTextLocal _houseName;
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTypeLocal "loc_Lighthouse";
	_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
	for "_i" from 1 to _numOfDoors do 
	{
		_house setVariable[format["bis_disabled_Door_%1",_i],1,true];
	};
};