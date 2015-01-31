private["_vendor","_dialog","_item","_left","_side","_already","_upp","_ui","_progress","_pgText","_cP","_need"];
disableSerialization;
if(life_is_processing) exitWith {hint "Vous êtes occupé et ne pouvez pas apprendre pour le moment."};
_side = playerSide;
_left = [1] call life_fnc_returnInfo;
_dialog = findDisplay 966;
if(_left == 0) exitWith {hint "Vous n'avez pas assez de points";};
if((lbCurSel 969) == -1) exitWith {hint "Vous devez séléctionné un objet";};
_item = lbData[969,(lbCurSel 969)];
_config = [] call life_fnc_talentCfg;
{
	_need = _x select 2;
	diag_log format ["MARK 1 NEED: %1 ITEM: %2", _need, _item];
	if(_item == _x select 1)exitWith
	{
		diag_log format ["MARK 2 NEED: %1 ITEM: %2 VAR: %3", _need, _item, (missionNamespace getVariable[_need,true])];
		if(!(missionNamespace getVariable[_need,true]) && _need != "ok") then
		{
			hint "Vous n'avez pas la compétences requises";
		} else {
			if(missionNamespace getVariable[_item,true])then
			{
				hint "Vous connaissez déja cette compétence";
			} else {
				_vendor = getPos player;
				_upp = "Apprentissage";
				5 cutRsc ["life_progress","PLAIN"];
				_ui = uiNameSpace getVariable "life_progress";
				_progress = _ui displayCtrl 38201;
				_pgText = _ui displayCtrl 38202;
				_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
				_progress progressSetPosition 0.01;
				_cP = 0.01;
				life_is_processing = true;
				while{true} do
				{
					sleep  0.3;
					_cP = _cP + 0.01;
					_progress progressSetPosition _cP;
					_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
					if(_cP >= 1) exitWith {};
					if(player distance _vendor > 5) exitWith {};
				};
				if(player distance _vendor > 5) exitWith {hint "Tu dois rester prêt du maitre des compétences"; 5 cutText ["","PLAIN"]; life_is_processing = false;};			
				missionNamespace setVariable[_item,true];
				titleText[format["Tu as appris : %1",(_x select 0)],"PLAIN"];
				[7] call SOCK_fnc_updatePartial;
				life_is_processing = false;
			};
		};
	};
} foreach _config;
5 cutText ["","PLAIN"];
closeDialog 0;