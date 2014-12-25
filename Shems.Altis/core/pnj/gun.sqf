_this enableSimulation false;
_this allowDamage false;
_this addAction["Acheter une arme",life_fnc_weaponShopMenu,"gun",0,false,false,"",' license_civ_gun && playerSide == civilian'];
_this addAction[format["%1 ($%2)",["license_civ_gun"] call life_fnc_varToStr,[(["gun"] call life_fnc_licensePrice)] call life_fnc_numberText],life_fnc_buyLicense,"gun",0,false,false,"",' !license_civ_gun && playerSide == civilian '];