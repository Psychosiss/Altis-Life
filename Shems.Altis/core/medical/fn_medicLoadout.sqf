removeAllContainers player;
removeAllWeapons player;
player addUniform "U_Rangemaster";
player addBackpack "B_Carryall_khk";
player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";
player addWeapon "hgun_P07_snds_F";
player addItem "FirstAidKit";
player addItem "FirstAidKit";
player addItem "FirstAidKit";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemRadio";
player assignItem "ItemRadio";
removeGoggles player;
removeHeadGear player;
if(hmd player != "") then 
{
	player unlinkItem (hmd player);
};

[[player,0,"images\med\uniform.jpg"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;