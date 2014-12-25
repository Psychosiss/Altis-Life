#include <macro.h>

private["_ui","_units"];
#define iconID 78000
#define scale 0.8

if(visibleMap OR {!alive player} OR {dialog}) exitWith 
{
	500 cutText["","PLAIN"];
};

_ui = uiNamespace getVariable ["Life_HUD_nameTags",displayNull];
if(isNull _ui) then 
{
	500 cutRsc["Life_HUD_nameTags","PLAIN"];
	_ui = uiNamespace getVariable ["Life_HUD_nameTags",displayNull];
};

_units = nearestObjects[(visiblePosition player),["Man","Land_Pallet_MilBoxes_F","Land_Sink_F"], 50];
_units = _units - [player];

{
	private["_name", "_text", "_icon", "_grade", "_hasName"];
	_name = _x getVariable ["realname", name _x];
	_hasName = if(!isNil {(_x getVariable "realname")}) then {true} else {false};
	_idc = _ui displayCtrl (iconID + _forEachIndex);

	if(!(lineIntersects [eyePos player, eyePos _x, player, _x]) && {!isNil {_x getVariable "realname"}}) then 
	{
		_pos = switch(typeOf _x) do 
		{
			case "Land_Pallet_MilBoxes_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 1.5]};
			case "Land_Sink_F": {[visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2]};
			default {[visiblePosition _x select 0, visiblePosition _x select 1, ((_x modelToWorld (_x selectionPosition "head")) select 2)+.5]};
		};

		_sPos = worldToScreen _pos;
		_distance = _pos distance player;

		if(count _sPos > 1 && {_distance < 25}) then 
		{
			_text = "";
			_icon = "";
			_grade = "";
	
			switch (true) do 
			{
				case (_x in (units grpPlayer) && playerSide == civilian): 
				{
					_text = format["<t color='#00FF00'>%1</t>", _name];
				};

				case (!alive _x): 
				{
					_icon = "icons\death.paa";
					_text = format["<img image='%1' size='1'></img>",_icon, _name];
				};

				case(_x getVariable["coplevel", 0] > 0) : 
				{
					switch (_x getVariable["coplevel", 0]) do 
					{
						case (1) : {_grade = "Recrue"; _icon = "a3\UI_F\data\GUI\Cfg\Ranks\private_gs.paa";};
						case (2) : {_grade = "Agent"; _icon = "a3\UI_F\data\GUI\Cfg\Ranks\corporal_gs.paa";};
						case (3) : {_grade = "Caporal"; _icon = "a3\UI_F\data\GUI\Cfg\Ranks\sergeant_gs.paa";};
						case (4) : {_grade = "Sergent"; _icon = "a3\UI_F\data\GUI\Cfg\Ranks\lieutenant_gs.paa";};
						case (5) : {_grade = "Entraineur"; _icon = "a3\UI_F\data\GUI\Cfg\Ranks\major_gs.paa";};
						case (6) : {_grade = "Lieutenent"; _icon = "a3\UI_F\data\GUI\Cfg\Ranks\colonel_gs.paa";};
						case (7) : {_grade = "Capitaine"; _icon = "a3\UI_F\data\GUI\Cfg\Ranks\general_gs.paa";};
						default {};
					};

					_text = format["<img image='%1' size='1'></img><t color='#0000FF'> %2</t>",_icon, _grade, _name];
				};

				case(_x getVariable["medlevel", 0] > 0): 
				{
					_icon = "icons\medical.paa";
					_text = format["<img image='%1' size='1'></img>", _icon, _name];
				};			

				default 
				{
					if(!isNil {(group _x) getVariable "gang_name"}) then 
					{
						_groupname = (group _x) getVariable ["gang_name",""];
						_text = format["", _name, _groupname];
					} else {
						_text = format["", _name];
					};
				};
			};

			_idc ctrlSetStructuredText parseText _text;
			_idc ctrlSetPosition [_sPos select 0, _sPos select 1, 0.4, 0.65];
			_idc ctrlSetScale scale;
			_idc ctrlSetFade 0;
			_idc ctrlCommit 0;
			_idc ctrlShow true;
		} else {
			_idc ctrlShow false;
		};
	} else {
		_idc ctrlShow false;
	};
} foreach _units;