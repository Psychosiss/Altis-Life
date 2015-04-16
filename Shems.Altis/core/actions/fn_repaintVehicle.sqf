private["_index","_veh","_color","_color_index"];

if(!isNull (findDisplay 2300)) then 
{
	_veh = nearestObject [position player, "LandVehicle"];
	_color = lbcursel 2303;
	_color_index = lbValue[2303,_color];
	closeDialog 0;
	_baseprice = 10000;
	_vehicleData = _veh getVariable["vehicle_info_owners",[]];
	_vehOwner = (_vehicleData select 0) select 0;
	if(life_money < _basePrice) exitWith {hint "Vous n'avez pas 10.000 € Pour repeindre votre véhicule."};
	if(isNil {_vehicleData}) exitWith {hint "Il n'y a pas d'information sur ce véhicule, il est soit loué ou cheaté."};
	if ((getPlayerUID player) != _vehOwner) exitWith {hint "Vous n'êtes pas le propriétaire du véhicule."};
	life_action_inUse = true;
	_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
	_upp = format["Peinture %1",_displayName];
	disableSerialization;
	5 cutRsc ["life_progress","PLAIN"];
	_ui = uiNameSpace getVariable "life_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
	_cP = 0.01;

	while{true} do
	{
		if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then 
		{
			[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] call life_fnc_MP;
			player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
		}; 
		sleep 0.29;
		player say3D "spraycan";
		_cP = _cP + 0.01;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp]; 
		if(_cP >= 1) exitWith {};
		if(!alive player) exitWith {};
		if(player != vehicle player) exitWith {};
		if(life_interrupted) exitWith {};
	};

	life_action_inUse = false;
	5 cutText ["","PLAIN"];
	player playActionNow "stop";
	if(life_interrupted) exitWith 
	{
		life_interrupted = false; 
		titleText["Annulé","PLAIN"]; 
		life_action_inUse = false;
	};
	if(player != vehicle player) exitWith 
	{
		titleText["Vous devez sortir du véhicule afin de le peindre!","PLAIN"];
	};
	life_money = life_money - _basePrice;
	[[_veh,_color_index],"TON_fnc_vehicleRepaint",false,false] call life_fnc_MP;
	[_veh,_color_index] call life_fnc_colorVehicle;
	[] call SOCK_fnc_updateRequest;
	hint format["Véhicule: %1 || Nouvelle couleur: %2 || Propriétaire: %3",_veh,_color_index,_vehicledata];
};