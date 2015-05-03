player addEventHandler["Killed", {_this spawn life_fnc_onPlayerKilled}];
player addEventHandler["handleDamage", {_this call life_fnc_handleDamage;}];
player addEventHandler["Respawn", {_this call life_fnc_onPlayerRespawn}];
player addEventHandler["Take", {_this call life_fnc_onTakeItem}];
player addEventHandler["Fired", {_this call life_fnc_onFired}];
player addEventHandler["InventoryClosed", {_this call life_fnc_inventoryClosed}];
player addEventHandler["InventoryOpened", {_this call life_fnc_inventoryOpened}];
player addEventHandler["Fired", {_this call life_fnc_tazerFix}];

spawnHandlerIDT = [["#t",true,true,true],"life_fnc_filterChat"] call aniChatEvents_addEventHandler;
spawnHandlerIDR = [["#r",true,true,true],"life_fnc_filterChat"] call aniChatEvents_addEventHandler;
spawnHandlerIDR = [["#e",true,true,true],"life_fnc_emote"] call aniChatEvents_addEventHandler;

"life_fnc_MP_packet" addPublicVariableEventHandler {[_this select 0,_this select 1] call life_fnc_MPexec;};
//"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call life_fnc_MPexec}; // --- Make a test to move this initPlayerLocal -> fn_setupEVH

findDisplay 46 displayAddEventHandler ["KeyUp",life_fnc_keyUpHandler];
findDisplay 46 displayAddEventHandler ["KeyDown",life_fnc_keyDownHandler];
findDisplay 46 displayAddEventHandler ["MouseButtonDown",life_fnc_mouseDownHandler];
findDisplay 46 displayAddEventHandler ["MouseButtonUp",life_fnc_mouseUpHandler];
findDisplay 46 displayAddEventHandler ["MouseZchanged",life_fnc_enableActions];