private ["_loadoutName","_action","_guncost"];
if(playerSide in [west,independent]) exitWith {hint"You are not allowed to buy that uniform";};
if (vehicle player != player) exitWith { hint "Get out of your vehicle!" };
if(!alive player) exitWith {hint"You dead homie.. dafuq";};
_guncost = 25000;
if(life_cash < _guncost) exitWith {hint format[localize "STR_NOTF_LO_NoCash",_guncost];};
_loadoutName = "Underwater Loadout";
_action = [format["Etes-vous sur de vouloir changer votre équipement contre celui-ci ? :%1: Il coute $%2",_loadoutName,[_guncost] call life_fnc_numberText],"Purchase Loadout","Purchase","No"] call BIS_fnc_guiMessage;
if(_action) then 
{
	hint parseText format["You bought the %1 for <t color='#8cff9b'>$%2</t>",_loadoutName,[_guncost] call life_fnc_numberText];
	life_cash =life_cash - _guncost;
			
titleText ["That'll be $25,000. Now, please undress...","PLAIN"];

sleep 1;
RemoveAllWeapons player;
{player removeMagazine _x;} foreach (magazines player);
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;
{
	player unassignItem _x;
	player removeItem _x;
} foreach (assignedItems player);
titleText[format["Now put on your %1 ...",_loadoutName],"PLAIN"];
sleep 3;

player addUniform "B_Soldier_base_F";
player addGoggles "G_Aviator";
player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";
player addWeapon "hgun_Rook40_F";
player selectWeapon "hgun_Rook40_F";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "ItemRadio";
player assignItem "ItemRadio";
player addItem "NVGoggles_OPFOR";
player assignItem "NVGoggles_OPFOR";
titleText ["...don't forget your bag...","PLAIN"];
player addBackPack "B_Carryall_khk";
life_inv_coffee = life_inv_coffee + 1;
reload player;
titleText [format["Enjoy your %1",_loadoutName],"PLAIN"];
} else {
	hint"Okay, thanks for nothing..";
};

player setObjectTextureGlobal [0,"textures\civ\uniform.paa"];