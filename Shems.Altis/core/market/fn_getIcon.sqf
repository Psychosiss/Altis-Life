_itemName = [_this,0,""] call BIS_fnc_param;
_iconPath = "";

switch _itemName do 
{
	case "life_inv_oilu": {_iconPath = "icons\items\oil_unprocessed.paa";};
	case "life_inv_oilp": {_iconPath = "icons\items\oil_processed.paa";};
	case "life_inv_heroinu": {_iconPath = "icons\items\heroin_unprocessed.paa";};
	case "life_inv_heroinp": {_iconPath = "icons\items\heroin_processed.paa";};
	case "life_inv_cannabis": {_iconPath = "icons\items\cannabis.paa";};
	case "life_inv_marijuana": {_iconPath = "icons\items\marijuana.paa";};
	case "life_inv_apple": {_iconPath = "icons\items\apple.paa";};
	case "life_inv_salema": {_iconPath = "icons\items\salema.paa";};
	case "life_inv_ornate": {_iconPath = "icons\items\ornate.paa";};
	case "life_inv_mackerel": {_iconPath = "icons\items\mackerel.paa";};
	case "life_inv_tuna": {_iconPath = "icons\items\tuna.paa";};
	case "life_inv_mullet": {_iconPath = "icons\items\mullet.paa";};
	case "life_inv_catshark": {_iconPath = "icons\items\catshark.paa";};
	case "life_inv_turtle": {_iconPath = "icons\items\turtle.paa";};
	case "life_inv_fishingpoles": {_iconPath = "icons\items\fishingpoles.paa";};
	case "life_inv_water": {_iconPath = "icons\items\water.paa";};
	case "life_inv_coffee": {_iconPath = "icons\items\coffee.paa";};
	case "life_inv_turtlesoup": {_iconPath = "icons\items\turtle_soup.paa";};
	case "life_inv_donuts": {_iconPath = "icons\items\donut.paa";};
	case "life_inv_fuelE": {_iconPath = "icons\items\fuelE.paa";};
	case "life_inv_fuelF": {_iconPath = "icons\items\fuelF.paa";};
	case "life_inv_pickaxe": {_iconPath = "icons\items\pickaxe.paa";};
	case "life_inv_copperore": {_iconPath = "icons\items\copper_ore.paa";};
	case "life_inv_ironore": {_iconPath = "icons\items\iron_ore.paa";};
	case "life_inv_ironr": {_iconPath = "icons\items\iron.paa";};
	case "life_inv_copperr": {_iconPath = "icons\items\copper.paa";};
	case "life_inv_sand": {_iconPath = "icons\items\sand.paa";};
	case "life_inv_salt": {_iconPath = "icons\items\salt_unprocessed.paa";};
	case "life_inv_saltr": {_iconPath = "icons\items\salt.paa";};
	case "life_inv_glass": {_iconPath = "icons\items\glass.paa";};
	case "life_inv_diamond": {_iconPath = "icons\items\diamond_unprocessed.paa";};
	case "life_inv_diamondr": {_iconPath = "icons\items\diamond.paa";};
	case "life_inv_tbacon": {_iconPath = "icons\items\tbacon.paa";};
	case "life_inv_redgull": {_iconPath = "icons\items\redgull.paa";};
	case "life_inv_lockpick": {_iconPath = "icons\items\lockpick.paa";};
	case "life_inv_peach": {_iconPath = "icons\items\peach.paa";};
	case "life_inv_coke": {_iconPath = "icons\items\cocain_unprocessed.paa";};
	case "life_inv_cokep": {_iconPath = "icons\items\cocain_processed.paa";};
	case "life_inv_spikeStrip": {_iconPath = "icons\items\spikestrip.paa";};
	case "life_inv_rock": {_iconPath = "icons\items\rock.paa";};
	case "life_inv_cement": {_iconPath = "icons\items\cement.paa";};
	case "life_inv_goldbar": {_iconPath = "icons\items\goldbar.paa";};
	case "life_inv_blastingcharge": {_iconPath = "icons\items\blastingcharge.paa";};
	case "life_inv_boltcutter": {_iconPath = "icons\items\boltcutter.paa";};
	case "life_inv_defusekit": {_iconPath = "icons\items\defusekit.paa";};
	case "life_inv_storagesmall": {_iconPath = "icons\items\storagesmall.paa";};
	case "life_inv_storagebig": {_iconPath = "icons\items\storagebig.paa";};
	case "life_inv_methu": {_iconPath = "icons\items\meth.paa";};
	case "life_inv_methp": {_iconPath = "icons\items\meth.paa";};
	case "life_inv_tabac": {_iconPath = "icons\items\tabac.paa";};
	case "life_inv_cigare": {_iconPath = "icons\items\cigare.paa";};
	case "life_inv_puranium": {_iconPath = "icons\items\uranium.paa";};
	case "life_inv_ipuranium": {_iconPath = "icons\items\uranium.paa";};
	case "life_inv_uranium1": {_iconPath = "icons\items\uranium.paa";};
	case "life_inv_uranium2": {_iconPath = "icons\items\uranium.paa";};
	case "life_inv_uranium3": {_iconPath = "icons\items\uranium.paa";};
	case "life_inv_uranium4": {_iconPath = "icons\items\uranium.paa";};
	case "life_inv_uranium": {_iconPath = "icons\items\uranium.paa";};
	case "life_inv_skull": {_iconPath = "icons\items\skull.paa";};
	case "life_inv_skullp": {_iconPath = "icons\items\skull.paa";};
	case "life_inv_nitro": {_iconPath = "icons\items\nitro.paa";};
	case "life_inv_kidney": {_iconPath = "icons\items\kidney.paa";};
	case "life_inv_gpstracker": {_iconPath = "icons\items\gpstracker.paa";};
	case "life_inv_civdefusekit": {_iconPath = "icons\items\defusekit.paa";};
	case "life_inv_scalpel": {_iconPath = "icons\items\scalpel.paa";};
	case "life_inv_silver": {_iconPath = "icons\items\silver.paa";};
	case "life_inv_silverr": {_iconPath = "icons\items\silver.paa";};
	case "life_inv_speedbomb": {_iconPath = "icons\items\carbomb.paa";};
	case "life_inv_handcuffs": {_iconPath = "icons\items\handcuffs.paa";};
	case "life_inv_handcuffkeys": {_iconPath = "icons\items\handcuffkeys.paa";};
	case "life_inv_adrenalineShot": {_iconPath = "icons\items\adrenalineShot.paa";};
	case "life_inv_campfire": {_iconPath = "icons\items\campfire.paa";};
	case "life_inv_tent1": {_iconPath = "icons\items\tent1.paa";};
	case "life_inv_tent2": {_iconPath = "icons\items\tent2.paa";};
	case "life_inv_vammo": {_iconPath = "icons\items\vammo.paa";};
	case "life_inv_skinningknife": {_iconPath = "icons\items\skinningknife.paa";};
	case "life_inv_sheep": {_iconPath = "icons\items\sheep.paa";};
	case "life_inv_sheepp": {_iconPath = "icons\items\sheepp.paa";};
	case "life_inv_chicken": {_iconPath = "icons\items\chicken.paa";};
	case "life_inv_chickenp": {_iconPath = "icons\items\chickenp.paa";};
	case "life_inv_snakep": {_iconPath = "icons\items\snakep.paa";};
	case "life_inv_snake": {_iconPath = "icons\items\snake.paa";};
	case "life_inv_rabbit": {_iconPath = "icons\items\rabbit.paa";};
	case "life_inv_rabbitp": {_iconPath = "icons\items\rabbitp.paa";};
	case "life_inv_goat": {_iconPath = "icons\items\goat.paa";};
	case "life_inv_goatp": {_iconPath = "icons\items\goatp.paa";};
	case "life_inv_dog": {_iconPath = "icons\items\dog.paa";};
	case "life_inv_dogp": {_iconPath = "icons\items\dogp.paa";};
	case "life_inv_demolitioncharge": {_iconPath = "icons\items\demoCharge.paa";};
	case default {_iconPath = "";};
};

_iconPath;