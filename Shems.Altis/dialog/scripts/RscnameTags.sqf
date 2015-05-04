private ["_mode","_params"];

_mode = _this select 0;
_params = _this select 1;

switch _mode do 
{
	case "onLoad": 
	{
		life_RscNameTags_drawObjects = [];
		_display = _params select 0;
		life_RscNameTags_loopHndl = ["loop", [_display]] spawn life_RscNameTags_script;
		if (isNil "life_RscNameTags_draw3DHndl") then 
		{
			life_RscNameTags_draw3DHndl = addMissionEventHandler ["Draw3D" , {["draw3D", _this] call life_RscNameTags_script}];
		};
	};

	case "onUnload": 
	{
		if (!isNil "life_RscNameTags_loopHndl") then {terminate life_RscNameTags_loopHndl};
		if (!isNil "life_RscNameTags_draw3DHndl") then {removeMissionEventHandler ["Draw3D", life_RscNameTags_draw3DHndl]};
		life_RscNameTags_drawObjects = nil;
		life_RscNameTags_loopHndl = nil;
		life_RscNameTags_draw3DHndl = nil;
	};

	case "loop": 
	{
		disableSerialization;
		_display = _params select 0;
		_titleColor = [.2,1,0,1] call life_fnc_colorRGBtoHTML;
		_iconColor = [1,1,1,1] call life_fnc_colorRGBtoHTML;

		while {!isNull _display} do 
		{
			_drawObjects = [];
			_objects = if (visibleMap || {!alive player} || {dialog}) then 
			{
				[]
			} else {
				( nearestObjects [ player call life_fnc_getPos3D, ["Man","Car_F","Tank_F","Ship_F","Air","Land_Pallet_MilBoxes_F","Land_Sink_F","Land_InfoStand_V2_F","Land_Device_assembled_F","Land_Laptop_unfolded_F"], 15]) - [player]
			};

			_i = 0;
			{
				_object = _x;
				_title = _object getVariable "nametag_title";
				_subtitle = _object getVariable "nametag_subtitle";
				_prefix = _object getVariable "nametag_prefix";
				_icon = _object getVariable "nametag_icon";
				_masked = [_object] call life_fnc_isMasked;
				_hidden = (uniform _object in ["U_B_FullGhillie_ard","U_B_FullGhillie_sard","U_B_FullGhillie_lsh","U_I_FullGhillie_ard","U_I_FullGhillie_sard","U_I_FullGhillie_lsh"] && {stance _object in ["CROUCH","PRONE"]});
				_gangName = (group _object) getVariable ["gang_name", ""];
				_copRank = _object getVariable ["cop_rank", -1];
				_medRank = _object getVariable ["med_rank", -1];

				if (!isNil "_title" && {!_hidden} && {!(_object getVariable ["nametag_hide", false])} && {!(lineIntersects [eyePos vehicle player, eyePos _object, vehicle player, _object])}) then 
				{
					if (_masked && {_object isKindOf "Man"} && {alive _object}) then 
					{
						if !(_object in units group player) then 
						{
							_title = "Inconnu";
							_subtitle = "Joueur masqué";
							_prefix = "";
						};
						_icon = "icons\mask.paa";
					};

					if (isNil "_prefix") then 
					{
						_prefix = switch true do 
						{
							case (_copRank > 0): 
							{
								switch _copRank do 
								{
									case 1: {"Recrue"};
									case 2: {"Agent"}; 
									case 3: {"Caporal"};
									case 4: {"Sergent"};
									case 5: {"Lieutenant"};
									case 6: {"Lieutenant colonel"};
									case 7: {"Colonel"};
								};
							};

							case (_medRank > 0): 
							{
								switch _medRank do 
								{
									case 1: {"Para-medecin"}; 
									case 2: {"Medecin"};
									case 3: {"Docteur"};
									case 4: {"Chirurgien"};
									case 5: {"Resurecteur"};
								};
							};
							default {""};
						};
					};

					if (_prefix != "") then 
					{
						_prefix = _prefix + " ";
					};

					if (isNil "_subtitle") then 
					{
						_subtitle = switch true do 
						{
							case (_copRank > 0): {"Policier"};
							case (_medRank > 0): {"Medecin"};
							case (_gangName != ""): {_gangName};
							default {""};
						};
					};

					if (isNil "_icon") then 
					{
						_icon = switch true do 
						{
							case (_copRank > 0): 
							{
								switch _copRank do 
								{
									case 1: {"\A3\ui_f\data\gui\cfg\Ranks\private_gs.paa"};
									case 2: {"\A3\ui_f\data\gui\cfg\Ranks\corporal_gs.paa"};
									case 3: {"\A3\ui_f\data\gui\cfg\Ranks\sergeant_gs.paa"};
									case 4: {"\A3\ui_f\data\gui\cfg\Ranks\lieutenant_gs.paa"};
									case 5: {"\A3\ui_f\data\gui\cfg\Ranks\captain_gs.paa"};
									case 6: {"\A3\ui_f\data\gui\cfg\Ranks\colonel_gs.paa"};
									case 7: {"\A3\ui_f\data\gui\cfg\Ranks\colonel_gs.paa"};
									default {""};
								}
							};
							case (_medRank > 0): {"\A3\ui_f\data\gui\Cfg\Ranks\major_gs.paa"};
							default {""};
						};
					};

					if (_icon != "") then 
					{ 
						_icon = format ["<img image='%1' size='1' align='center' color='%2' />", _icon, _iconColor];
					};

					_text = format ["%1<br /><t align='center' color='%2'>%3%4</t>", _icon, _titleColor, _prefix, _title];

					if (_subtitle != "") then 
					{
						_text = format ["%1<br /><t font='PuristaMedium' align='center' size='0.85' color='%2'>%3</t>", _text, "#FFFFFF", _subtitle];
					};
					_idc = 6000 + _i;
					_drawObjects pushBack [_object, parseText _text, _display displayCtrl _idc];
					_i = _i + 1;
				};
				sleep 0.01;
			} forEach _objects;

			for "_x" from (count _drawObjects) to 110 do 
			{
				_ctrl = (_display displayCtrl 6000 + _x);
				_ctrl ctrlShow false;
				_ctrl ctrlSetStructuredText parseText "";
			};
			life_RscNameTags_drawObjects = _drawObjects;
			sleep 0.5;
		};
		["life_RscNameTags"] call life_fnc_createRscLayer;
	};

	case "draw3D": 
	{
		{
			_object = _x select 0;
			_text = _x select 1;
			_ctrl = _x select 2;
			_ctrl ctrlSetStructuredText _text;

			private	"_pos";
			switch true do 
			{
				case (_object isKindOf "Man"): 
				{ 
					_pos = _object selectionPosition "head";
					_pos = [0,0, (_pos select 2) + 0.6];
					_pos = _object modelToWorldVisual _pos;
				};

				case (typeOf _object == "Land_Pallet_MilBoxes_F");
				case (typeOf _object == "Land_Sink_F");
				case (typeOf _object == "Land_InfoStand_V2_F");
				case (typeOf _object == "Land_Device_assembled_F"): 
				{
					_pos = _object call life_fnc_getPos3D;
					_pos set [ 2, ( _pos select 2 ) + 1.8 ];
				};

				case (typeOf _object == "Land_Laptop_unfolded_F"): 
				{ 
					_pos = _object call life_fnc_getPos3D;
					_pos set [ 2, ( _pos select 2 ) + 0.8 ];
				};

				default 
				{
					_pos = boundingBoxReal _object;
					_pos = _object modelToWorldVisual [0,0, (_pos select 1) select 2];
				};
			};

			_posScreen = worldToScreen _pos;

			if (count _posScreen > 1) then 
			{
				_ctrlPos = ctrlPosition _ctrl;
				_pW = _ctrlPos select 2;
				_pH = _ctrlPos select 3;
				_pX = (_posScreen select 0) - (_pW / 2);
				_pY = _posScreen select 1;
				_ctrl ctrlSetPosition [_pX,_pY,_pW,_pH];
				_ctrl ctrlCommit 0;

				if !(ctrlShown _ctrl) then 
				{
					_ctrl ctrlShow true;
				};
			} else {
				_ctrl ctrlShow false;
			};

			if (isPlayer _object && {alive _object} && {_object getVariable ["life_revive_incapacitated", false]}) then 
			{
				drawIcon3D [
					"\A3\ui_f\data\igui\cfg\Actions\heal_ca.paa",
					[ 0.75, 0, 0, 0.9 ],
					_object modelToWorld (object selectionPosition "Spine3"),
					0.6,
					0.6,
					0,
					"",
					1
				];
			};
		} count life_RscNameTags_drawObjects;
	};
};