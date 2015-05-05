_this enableSimulation false; 
_this allowDamage false;
_this setObjectTexture [0, "images\cop\uniform.paa"];
_this addAction["<t color='#1199FF'>[Cop]</t> Marché", life_fnc_virt_menu, "cop", 1.5, true, true, "", "player call life_fnc_isCop"];  
_this addAction["<t color='#1199FF'>[Cop]</t> Vestiaire", life_fnc_clothingMenu, "cop", 1.5, true, true, "", "player call life_fnc_isCop"];  
_this addAction["<t color='#1199FF'>[Cop]</t> Armes", life_fnc_weaponShopMenu, "cop_basic", 1.5, true, true, "", "player call life_fnc_isCop"];  
_this addAction[format["%1 (%2 €)",["license_cop_air"] call life_fnc_varToStr,[(["cair"] call life_fnc_licensePrice)] call life_fnc_numberText],life_fnc_buyLicense,"cair",0,false,false,"",' !license_cop_air && playerSide == west '];
_this addAction[format["%1 (%2 €)",["license_cop_cg"] call life_fnc_varToStr,[(["cg"] call life_fnc_licensePrice)] call life_fnc_numberText],life_fnc_buyLicense,"cg",0,false,false,"",' !license_cop_cg && playerSide == west '];