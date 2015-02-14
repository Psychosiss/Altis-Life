private["_source","_hasLicense","_ui","_needID","_cP","_cost","_type","_winAmount","_rollA","_rollB","_rollC","_slots","_idxA","_idxB","_idxC"];
_source = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,-1,[0]] call BIS_fnc_param;

if(isNull _source) exitWith {};
if(playerSide != civilian) exitWith 
{
	hint "Vous n'êtes pas autorisé à joueur sur ce type de machine!";
	life_is_processing = false;
};

if(player distance _source > 3.5) exitWith 
{
	hint "Vous devez être a moin de 3,5 metres pour jouer.";
	life_is_processing = false;
};

switch (_type) do
{
	case 0:{_cost = 1000;};
	case 1:{_cost = 1000;};
	case 2:{_cost = 2000;};
};
_winAmount = 0;

if(life_cash >= _cost) then
{
	disableSerialization;
	_source say3D "caching";
	5 cutRsc ["life_slotmachine","PLAIN"];
	_ui = uiNameSpace getVariable "life_slotmachine";
	_rollA = _ui displayCtrl 38207;
	_rollB = _ui displayCtrl 38208;
	_rollC = _ui displayCtrl 38209;
	_cP = 0.0;
	_slots = ["textures\slots\SlotMachine\cherry.jpg","textures\slots\SlotMachine\leaf.jpg","textures\slots\SlotMachine\plum.jpg","textures\slots\SlotMachine\grapes.jpg","textures\slots\SlotMachine\glass.jpg","textures\slots\SlotMachine\bell.jpg","textures\slots\SlotMachine\seven.jpg","textures\slots\SlotMachine\bar.jpg"];
	life_is_processing = true;
	_source say3D "slotspinSound";

	while{true} do
	{
		sleep  0.1;
		_cP = _cP + 0.02;
		if(_cp <= 0.5)then
		{
			_idxA = [] call life_fnc_slotMachineRandomizer;
			_rollA ctrlSetText (_slots select _idxA);
		};

		if(_cp <= 0.7)then
		{
			_idxB = [] call life_fnc_slotMachineRandomizer;
			_rollB ctrlSetText (_slots select _idxB);
		};

		if(_cp <= 0.9)then
		{
			_idxC = [] call life_fnc_slotMachineRandomizer;
			_rollC ctrlSetText (_slots select _idxC);
		};

		if(_cP >= 1.1) exitWith {};
		if(player distance _source > 3.5) exitWith {};
	};
	if(player distance _source > 3.5) exitWith 
	{
		hint "Vous devez être a moin de 3,5 metres pour jouer."; 
		5 cutText ["","PLAIN"]; 
		life_is_processing = false;
	};
	life_cash = life_cash - _cost;
	_winAmount = [_idxA,_idxB,_idxC,_type] call life_fnc_slotMachineRewards;
	if(_winAmount > 0) then
	{
		life_cash = life_cash + _winAmount;
		if(_winAmount >= 100000) then
		{
			hint format["Vous avez gagné le jackpot de %1 €",_winAmount]; 
			_source say3D "jackpotSound";
			[[_source],"life_fnc_SlotJackpotSound",nil,true] spawn life_fnc_MP;
			[["jackpotSound"],"life_fnc_casinoSounds",nil,true] spawn life_fnc_MP;
			_cP = 0.01;
			while{true} do
			{
				sleep  0.3;
				_cP = _cP + 0.10;
				if(_cP >= 1) exitWith {};
			};
		} else {
			if(_winAmount == _cost) then
			{
				hint format["Vous avez regagné votre mise. (%1 €)",_winAmount];
			} else {
				hint format["Vous avez gagné %1 €",_winAmount];
			};
		};
	} else {
		hint format["Vous avez perdu votre mise de (%1 €)",_cost];
	};
	
	life_is_processing = false;
} else {
	if(life_cash < _cost) exitWith {hint (format["Vous devez avoir %1 € pour pouvoir jouez sur cette machine.",_cost]);
	life_is_processing = false;};
};

5 cutText ["","PLAIN"];