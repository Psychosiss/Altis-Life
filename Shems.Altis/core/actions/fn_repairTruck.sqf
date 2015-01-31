private["_veh","_upp","_ui","_progress","_pgText","_cP","_displayName"];
_veh = cursorTarget;
life_interrupted = false;
if(isNull _veh) exitwith {};
if((_veh isKindOf "Car") OR (_veh isKindOf "Ship") OR (_veh isKindOf "Air")) then
{
	if("ToolKit" in (items player)) then
	{
		life_action_inUse = true;
		_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		_upp = format["Réparation %1",_displayName];
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
			if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1") then 
			{
				player action ["SwitchWeapon", player, player, 100];
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
				player playActionNow "stop";
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
				player playActionNow "stop";
				player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
			};
			sleep 0.195;
			_cP = _cP + 0.01;
			_progress progressSetPosition _cP;
			_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
			//if(_cP >= 1) exitWith {};
			//if(!alive player) exitWith {};
			//if(player != vehicle player) exitWith {};
			//if(life_interrupted) exitWith {};
			if(_cP >= 1) exitWith 
			{
				_ui = "StatusBar" call BIS_fnc_rscLayer;
				_ui cutRsc["StatusBar","PLAIN"];
			};

			if(!alive player) exitWith 
			{
				_ui = "StatusBar" call BIS_fnc_rscLayer;
				_ui cutRsc["StatusBar","PLAIN"];
			};

			if(player != vehicle player) exitWith 
			{
				_ui = "StatusBar" call BIS_fnc_rscLayer;
				_ui cutRsc["StatusBar","PLAIN"];
			};

			if(life_interrupted) exitWith 
			{
				_ui = "StatusBar" call BIS_fnc_rscLayer;
				_ui cutRsc["StatusBar","PLAIN"];
			};
		};
		
		life_action_inUse = false;
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
		if(life_interrupted) exitWith {life_interrupted = false; titleText["Action annulé","PLAIN"]; life_action_inUse = false;};
		if(player != vehicle player) exitWith {titleText["Vous devez être sortie de votre véhicule pour le reparer.","PLAIN"];};
		player removeItem "ToolKit";
		_veh setDamage 0;
		titleText["Vous avez réparé ce vehicule.","PLAIN"];
	};
};
_ui = "StatusBar" call BIS_fnc_rscLayer;
_ui cutRsc["StatusBar","PLAIN"];