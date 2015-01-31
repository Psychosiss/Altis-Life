private["_return","_uItems","_bItems","_vItems","_pItems","_hItems","_yItems","_uMags","_vMags","_bMags","_pMag","_hMag","_uni","_ves","_bag","_handled"];

_return = [];
_return pushBack uniform player;
_return pushBack vest player;
_return pushBack backpack player;
_return pushBack goggles player;
_return pushBack headgear player;
_return pushBack assignedITems player;

if(playerSide == west || playerSide == civilian && {(call life_save_civ)}) then 
{
	_return pushBack primaryWeapon player;
	_return pushBack handgunWeapon player;
} else {
	_return pushBack [];
	_return pushBack [];
};

_uItems = [];
_uMags  = [];
_bItems = [];
_bMags  = [];
_vItems = [];
_vMags  = [];
_pItems = [];
_hItems = [];
_yItems = [];
_uni = [];
_ves = [];
_bag = [];

if(uniform player != "") then
{
	{
		if (_x in (magazines player)) then 
		{
			_uMags = _uMags + [_x];
		} else {
			_uItems = _uItems + [_x];
		};
	} forEach (uniformItems player);
};

if(backpack player != "") then
{
	{
		if (_x in (magazines player)) then 
		{
			_bMags = _bMags + [_x];
		} else {
			_bItems = _bItems + [_x];
		};
	} forEach (backpackItems player);
};

if(vest player != "") then
{
	{
		if (_x in (magazines player)) then 
		{
			_vMags = _vMags + [_x];
		} else {
			_vItems = _vItems + [_x];
		};
	} forEach (vestItems player);
};

if(count (primaryWeaponMagazine player) > 0 && alive player) then
{
	_pMag = ((primaryWeaponMagazine player) select 0);
	if(_pMag != "") then
	{
		_uni = player canAddItemToUniform _pMag;
		_ves = player canAddItemToVest _pMag;
		_bag = player canAddItemToBackpack _pMag;
		_handled = false;

		if(_ves) then
		{
			_vMags = _vMags + [_pMag];
			_handled = true;
		};

		if(_uni && !_handled) then
		{
			_uMags = _uMags + [_pMag];
			_handled = true;
		};

		if(_bag && !_handled) then
		{
			_bMags = _bMags + [_pMag];
			_handled = true;
		};
	};
};

if(count (handgunMagazine player) > 0 && alive player) then
{
	_hMag = ((handgunMagazine player) select 0);
	if(_hMag != "") then
	{
		_uni = player canAddItemToUniform _hMag;
		_ves = player canAddItemToVest _hMag;
		_bag = player canAddItemToBackpack _hMag;
		_handled = false;

		if(_ves) then
		{
			_vMags = _vMags + [_hMag];
			_handled = true;
		};

		if(_uni && !_handled) then
		{
			_uMags = _uMags + [_hMag];
			_handled = true;
		};

		if(_bag && !_handled) then
		{
			_bMags = _bMags + [_hMag];
			_handled = true;
		};
	};
};

if(count (primaryWeaponItems player) > 0) then
{
	{
		_pItems = _pItems + [_x];
	} forEach (primaryWeaponItems player);
};

if(count (handGunItems player) > 0) then
{
	{
		_hItems = _hItems + [_x];
	} forEach (handGunItems player);
};

{
	_name = (_x select 0);
	_val = (_x select 1);
	if (_val > 0) then 
	{
		for "_i" from 1 to _val do 
		{
			_yItems = _yItems + [_name];
		};
	};
} forEach [
    ["life_inv_apple", life_inv_apple],
    ["life_inv_salema", life_inv_salema],
    ["life_inv_ornate", life_inv_ornate],
    ["life_inv_mackerel", life_inv_mackerel],
    ["life_inv_tuna", life_inv_tuna],
    ["life_inv_mullet", life_inv_mullet],
    ["life_inv_catshark", life_inv_catshark],
    ["life_inv_fishingpoles", life_inv_fishingpoles],
    ["life_inv_water", life_inv_water],
    ["life_inv_donuts", life_inv_donuts],
    ["life_inv_turtlesoup", life_inv_turtlesoup],
    ["life_inv_coffee", life_inv_coffee],
    ["life_inv_fuelF", life_inv_fuelF],
    ["life_inv_fuelE", life_inv_fuelE],
    ["life_inv_pickaxe", life_inv_pickaxe],
	["life_inv_pizza", life_inv_pizza],
	["life_inv_frites", life_inv_frites],
    ["life_inv_tbacon", life_inv_tbacon],
    ["life_inv_lockpick", life_inv_lockpick],
    ["life_inv_redgull", life_inv_redgull],
    ["life_inv_peach", life_inv_peach],
    ["life_inv_spikeStrip", life_inv_spikeStrip],
    ["life_inv_defusekit", life_inv_defusekit],
    ["life_inv_storagesmall", life_inv_storagesmall],
    ["life_inv_storagebig", life_inv_storagebig],
	["life_inv_oilu", life_inv_oilu],
	["life_inv_oilp", life_inv_oilp],
	["life_inv_heroinu", life_inv_heroinu],
	["life_inv_heroinp", life_inv_heroinp],
	["life_inv_cannabis", life_inv_cannabis],
	["life_inv_marijuana", life_inv_marijuana],
	["life_inv_burgers", life_inv_burgers],
	["life_inv_turtle", life_inv_turtle],
	["life_inv_copperore", life_inv_copperore],
	["life_inv_ironore", life_inv_ironore],
	["life_inv_ironr", life_inv_ironr],
	["life_inv_copperr", life_inv_copperr],
	["life_inv_salt", life_inv_salt],
	["life_inv_saltr", life_inv_saltr],
	["life_inv_sand", life_inv_sand],
	["life_inv_glass", life_inv_glass],
	["life_inv_diamond", life_inv_diamond],
	["life_inv_diamondr", life_inv_diamondr],
	["life_inv_coke", life_inv_coke],
	["life_inv_cokep", life_inv_cokep],
	["life_inv_cement", life_inv_cement],
	["life_inv_rock", life_inv_rock],
	["life_inv_goldbar", life_inv_goldbar],
	["life_inv_blastingcharge", life_inv_blastingcharge],
	["life_inv_boltcutter", life_inv_boltcutter],
	["life_inv_kidney", life_inv_kidney],
	["life_inv_methu", life_inv_methu],
	["life_inv_methp", life_inv_methp],
	["life_inv_cigare", life_inv_cigare],
	["life_inv_puranium", life_inv_puranium],
	["life_inv_ipuranium", life_inv_ipuranium],
	["life_inv_uranium1", life_inv_uranium1],
	["life_inv_uranium2", life_inv_uranium2],
	["life_inv_uranium3", life_inv_uranium3],
	["life_inv_uranium4", life_inv_uranium4],
	["life_inv_uranium", life_inv_uranium],
	["life_inv_skull", life_inv_skull],
	["life_inv_skullp", life_inv_skullp],
	["life_inv_nitro", life_inv_nitro],
	["life_inv_gpstracker", life_inv_gpstracker],
	["life_inv_demolitioncharge", life_inv_demolitioncharge],
	["life_inv_civdefusekit", life_inv_civdefusekit],
	["life_inv_bombdetect", life_inv_bombdetect],
	["life_inv_goldbarp", life_inv_goldbarp],
	["life_inv_underwatercharge", life_inv_underwatercharge],
	["life_inv_scalpel", life_inv_scalpel],
	["life_inv_silver", life_inv_silver],
	["life_inv_silverr", life_inv_silverr],
	["life_inv_pressluft", life_inv_pressluft],
	["life_inv_speedbomb", life_inv_speedbomb],
	["life_inv_campfire", life_inv_campfire],
	["life_inv_painkillers", life_inv_painkillers],
	["life_inv_tent1", life_inv_tent1],
	["life_inv_tent2", life_inv_tent2],
	["life_inv_dog", life_inv_dog],
	["life_inv_goat", life_inv_goat],
	["life_inv_sheep", life_inv_sheep],
	["life_inv_chicken", life_inv_chicken],
	["life_inv_rabbit", life_inv_rabbit],
	["life_inv_snake", life_inv_snake],
	["life_inv_dogp", life_inv_dogp],
	["life_inv_goatp", life_inv_goatp],
	["life_inv_sheepp", life_inv_sheepp],
	["life_inv_chickenp", life_inv_chickenp],
	["life_inv_rabbitp", life_inv_rabbitp],
	["life_inv_snakep", life_inv_snakep],
	["life_inv_skinningknife", life_inv_skinningknife],
	["life_inv_vammo", life_inv_vammo],
	["life_inv_adrenalineShot", life_inv_adrenalineShot],
	["life_inv_antimatter", life_inv_antimatter]
];

_return pushBack _uItems;
_return pushBack _uMags;
_return pushBack _bItems;
_return pushBack _bMags;
_return pushBack _vItems;
_return pushBack _vMags;
_return pushBack _pItems;
_return pushBack _hItems;

if(call life_save_yinv) then 
{
	_return pushBack _yItems;
} else {
	_return pushBack [];
};

life_gear = _return;