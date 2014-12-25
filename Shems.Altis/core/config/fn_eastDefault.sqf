removeAllContainers player;
removeAllWeapons player;
player addUniform "U_Rangemaster";
player addBackpack "B_Bergen_sgg";
player addHeadgear "H_PilotHelmetFighter_O";
player addMagazine "150Rnd_762x51_Box";
player addWeapon "LMG_Zafir_F";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "ItemRadio";
player assignItem "ItemRadio";
removeGoggles player;
removeHeadGear player;
if(hmd player != "") then 
{
	player unlinkItem (hmd player);
};

[] call life_fnc_saveGear;