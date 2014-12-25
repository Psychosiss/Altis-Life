_this enableSimulation false;
_this allowDamage false;
_this addAction["Acheter des vetements",life_fnc_clothingMenu,"reb",0,false,false,"",' license_civ_rebel && playerSide == civilian'];
_this addAction["Acheter des armes",life_fnc_weaponShopMenu,"rebel",0,false,false,"",' license_civ_rebel && playerSide == civilian'];
_this addAction[format["%1 ($%2)",["license_civ_rebel"] call life_fnc_varToStr,[(["rebel"] call life_fnc_licensePrice)] call life_fnc_numberText],life_fnc_buyLicense,"rebel",0,false,false,"",' !license_civ_rebel && playerSide == civilian '];