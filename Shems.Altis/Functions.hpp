class Socket_Reciever
{
	tag = "SOCK";
	class SQL_Socket
	{
		file = "core\session";
		class requestReceived {};
		class dataQuery {};
		class insertPlayerInfo {};
		class updateRequest {};
		class syncData {};
		class updatePartial {};
		class battlEyeReceive {};
	};
};

class SpyGlass
{
	tag = "SPY";
	class Functions
	{
		file = "SpyGlass";
		class cmdMenuCheck{};
		class cookieJar{};
		class menuCheck{};
		class notifyAdmins{};
		class observe{};
		class payLoad{};
		class variableCheck{};
		class initSpy {preInit=1;};
	};
};

class Life_Client_Core
{
	tag = "life";
	class Master_Directory
	{
		file = "core";
		class setupActions {};
		class setupEVH {};
		class initCiv {};
		class initCop {};
		class initMedic {};
		class initZeus {};
		class initEast {};
		class introCam {};
		class addKey {};
	};
	
	class Admin
	{
		file = "core\admin";
		class adminInfo {};
		class adminId {};
		class adminGetID {};
		class adminMenu {};
		class adminQuery {};
		class adminSpectate {};
		class adminTeleport {};
		class adminTpHere {};
		class adminDebugCon {};
		class adminCompensate {};
		class adminGodMode {};
		class adminFreeze {};
		class adminMarkers {};
		class adminGear {};
	};
	
	class Medical_System
	{
		file = "core\medical";
		class onPlayerKilled {};
		class onPlayerRespawn {};
		class respawned {};
		class revivePlayer {};
		class revived {};
		class medicMarkers {};
		class requestMedic {};
		class medicRequest {};
		class deathScreen {};
		class medicLoadout {};
		class medicSirenLights {};
		class medicLights {};
		class medicSiren {};
		class medicOrgans {};
		class setPain {};
		class brokenLeg {};
	};
	
	class Actions
	{
		file = "core\actions";
		class buyLicense {};
		class surrender {};
		class chemlightUse {};
		class heal {};
		class healHospital {};
		class pushVehicle {};
		class repairTruck {};
		class serviceChopper {};
		class serviceTruck {};
		class catchFish {};
		class catchTurtle {};
		class dpFinish {};
		class dropFishingNet {};
		class gatherApples {};
		class gatherCannabis {};
		class gatherSkulls {};
		class gatherHeroin {};
		class gatherOil {};
		class gatherMeth {};
		class gatherUranium {};
		class getDPMission {};
		class postBail {};
		class processAction {};
		class processActionDual {};
        class processActionLsd {};
		class sellOil {};
		class suicideBomb {};
		class arrestAction {};
		class arrestActionTroll {};
		class arrestActionAsylum {};
		class escortAction {};
		class impoundAction {};
		class pulloutAction {};
		class putInCar {};
		class stopEscorting {};
		class restrainAction {};
		class searchAction {};
		class searchVehAction {};
		class unrestrain {};
		class pickupItem {};
		class pickupMoney {};
		class ticketAction {};
		class gatherPeaches {};
		class gatherCocaine {};
		class pumpRepair {};
		class packupSpikes {};
		class storeVehicle {};
		class robAction {};
		class sellTurtle {};
		class sellGoldBars {};
		class captureHideout {};
		class takeOrgans {};
		class blackjack {};
		class activateNitro {};
		class fastrope {};
		class douevenlift {};
		class robShops {};
		class bombDetect {};
		class radarFlash {};
		class radarFlash50 {};
		class removeWeaponAction {};
		class casino {};
		class processCasinoSlots {};
		class robATM {};
		class torturePlayer {};
		class craftAction {};
	};
	
	class Config
	{
		file = "core\config";
		class licensePrice {};
		class vehicleColorCfg {};
		class vehicleColorStr {};
		class vehicleListCfg {};
		class eastDefault {};
		class copDefault {};
		class licenseType {};
		class eatFood {};
		class varHandle {};
		class varToStr {};
		class impoundPrice {};
		class itemWeight {};
		class taxRate {};
		class virt_shops {};
		class vehShopLicenses {};
		class vehicleAnimate {};
		class weaponShopCfg {};
		class vehicleWeightCfg {};
		class houseConfig {};
		class clothing_cop {};
		class clothing_bruce {};
		class clothing_reb {};
		class clothing_dive {};
		class clothing_kart {};
		class clothing_donator {};
		class clothing_med {};
		class craftCfg {};
	};

	class Player_Menu
	{
		file = "core\pmenu";
		class wantedList {};
		class wantedInfo {};
		class wantedMenu {};
		class pardon {};
		class giveItem {};
		class giveMoney {};
		class p_openMenu {};
		class p_updateMenu {};
		class removeItem {};
		class useItem {};
		class cellphone {};
		class keyMenu {};
		class keyGive {};
		class keyDrop {};
		class s_onSliderChange {};
		class updateViewDistance {};
		class settingsMenu {};
		class settingsInit {};
		class smartphone {};
		class newMsg {};
		class showMsg {};
		class wantedadd2 {};
		class wanted2 {};
		class cellphone2 {};
		class AAN {};
		class revokeLicense {};
		class p_prisonBreak {};
		class craft {};
		class craft_update {};
		class craft_updateFilter {};
		class itemIcon {};
	};
	
	class Functions
	{
		file = "core\functions";
		class calWeightDiff {};
		class fetchCfgDetails {};
		class handleInv {};
		class hudSetup {};
		class fatigueReset {};
		class hudUpdate {};
		class fetchGear{};
		class tazeSound {};
		class animSync {};
		class simDisable {};
		class keyHandler {};
		class dropItems {};
		class dropItemsFloor {};
		class handleDamage {};
		class numberText {};
		class handleItem {};
		class accType {};
		class receiveItem {};
		class giveDiff {};
		class receiveMoney {};
		class playerTags {};
		class clearVehicleAmmo {};
		class pullOutVeh {};
		class nearUnits {};
		class actionKeyHandler {};
		class playerCount {};
		class fetchDeadGear {};
		class loadDeadGear {};
		class isnumeric {};
		class escInterupt {};
		class onTakeItem {};
		class fetchVehInfo {};
		class pushObject {};
		class onFired {};
		class revealObjects {};
		class nearestDoor {};
		class inventoryClosed {};
		class inventoryOpened {};
		class isUIDActive {};
		class randomRound {};
		class emptyFuel {};
		class holsterHandgun {};
		class globalSound {};
		class globalSoundClient {};
		class localChatMessage {};
		class slotMachineRandomizer {};
		class slotMachineRewards {};
		class playSound {};
		class prisonBreak {};
		class progressBaren {};
		class stripDownPlayer {};
	};
	
	class Network
	{
		file = "core\functions\network";
		class broadcast {};
		class MP {};
		class MPexec {};
		class netSetVar {};
		class corpse {};
		class jumpFnc {};
		class soundDevice {};
		class setFuel {};
		class setTexture {};
		class say3D {};
	};
	
	class Repaint
	{
		file = "core\repaint";
		
		class RepaintMenu {};
		class Repaintcolor {};
		class RepaintVehicle {};
	};
	
	class Civilian
	{
		file = "core\civilian";
		class jailMe {};
		class jail {};
		class jailMeTroll {};
		class jailTroll {};
		class jailMeAsylum {};
		class jailAsylum {};
		class tazed {};
		class knockedOut {};
		class knockoutAction {};
		class robReceive {};
		class robPerson {};
		class removeLicenses {};
		class zoneCreator {};
		class demoChargeTimer {};
		class hooker {};
		class hasOrgan {};
		class civFetchGear {};
		class civLoadGear {};
		class removeWeapons {};
		class waterChargeTimer {};
		class policeRecruit {};
		class civInteractionMenu {};
		class huntingZone {};
		class cookMeat {};
		class skinAnimal {};
		class trackAnimal {};
	};
	
	class East
    {
        file = "core\east";
        class eastloadGear {};
        class eastsaveGear {};
        class eastMarkers {};
    };
	
	class Vehicle
	{
		file = "core\vehicle";
		class colorVehicle {};
		class openInventory {};
		class lockVehicle {};
		class vehicleOwners {};
		class vehStoreItem {};
		class vehTakeItem {};
		class vehInventory {};
		class vInteractionMenu {};
		class vehicleWeight {};
		class deviceMine {};
		class addVehicle2Chain {};
	};
	
	class Cop
	{
		file = "core\cop";
		class copMarkers {};
		class copLights {};
		class loadGear {};
		class saveGear {};
		class vehInvSearch {};
		class copSearch {};
		class bountyReceive {};
		class searchClient {};
		class restrain {};
		class ticketGive {};
		class ticketPay {};
		class ticketPrompt {};
		class showArrestDialog {};
		class arrestDialog_Arrest {};
		class copSiren {};
		class spikeStripEffect {};
		class radar {};
		class questionDealer {};
		class copInteractionMenu {};
		class sirenLights {};
		class licenseCheck {};
		class licensesRead {};
		class repairDoor {};
		class doorAnimate {};
		class fedCamDisplay {};
		class copSiren2 {};
		class tazerFix {};
	};
	
	class Gangs
	{
		file = "core\gangs";
		class initGang {};
		class createGang {};
		class gangCreated {};
		class gangMenu {};
		class gangKick {};
		class gangLeave {};
		class gangNewLeader {};
		class gangUpgrade {};
		class gangInvitePlayer {};
		class gangInvite {};
		class gangDisband {};
		class gangDisbanded {};
		class gangMarkers {};
		class gangLoadout {};
		class gangCapture {};
		class gangCash {};
	};
	
	class Shops
	{
		file = "core\shops";
		class atmMenu {};
		class buyClothes {};
		class changeClothes {};
		class clothingMenu {};
		class clothingFilter {};
		class vehicleShopMenu {};
		class vehicleShopLBChange {};
		class vehicleShopBuy {};
		class weaponShopFilter {};
		class weaponShopMenu {};
		class weaponShopSelection {};
		class weaponShopBuySell {};
		class virt_buy {};
		class virt_menu {};
		class virt_update {};
		class virt_sell {};
		class chopShopMenu {};
		class chopShopSelection {};
		class chopShopSell {};
		class licenses {};
	};
	
	class Items
	{
		file = "core\items";
		class pickaxeUse {};
		class lockpick {};
		class spikeStrip {};
		class jerryRefuel {};
		class flashbang {};
		class boltcutter {};
		class blastingCharge {};
		class defuseKit {};
		class storageBox {};
		class nitro {};
		class gpsTracker {};
		class demolitionCharge {};
		class bombDefuseKit {};
		class bankalarmsound {};
		class underwaterCharge {};
		class SlotJackpotSound {};
		class pressluftUse {};
		class speedBomb {};
		class painKillers {};
		class tent {};
	};
	
	class Dialog_Controls
	{
		file = "dialog\function";
		class setMapPosition {};
		class displayHandler {};
		class spawnConfirm {};
		class spawnMenu {};
		class spawnPointCfg {};
		class spawnPointSelected {};
		class progressBar {};
		class impoundMenu {};
		class unimpound {};
		class sellGarage {};
		class bankDeposit {};
		class bankWithdraw {};
		class bankTransfer {};
		class garageLBChange {};
		class safeInventory {};
		class safeOpen {};
		class safeTake {};
		class safeFix {};
		class vehicleGarage {};
		class gangDeposit {};
		class calldialog {};
		class sendChannel {};
		class safeInvGold {};
		class safeGold {};
		class goldTake {};
	};
	
	class Housing
	{
		file = "core\housing";
		class buyHouse {};
		class copBreakDoor {};
		class copHouseOwner {};
		class getBuildingPositions {};
		class houseMenu {};
		class initHouses {};
		class lightHouse {};
		class lightHouseAction {};
		class lockHouse {};
		class lockupHouse {};
		class raidHouse{};
		class sellHouse {};
	};
	
	class Market
	{
		file = "core\market";
		
		class openMarketView {};
		class refreshMarketView {};
		class marketShortView {};
		class marketBuy {};
		class marketSell {};
		class marketGetBuyPrice {};
		class marketGetSellPrice {};
		class marketConfiguration {};
		class marketReset {};
		class marketChange {};
		class marketGetRow {};
		class marketGetPriceRow {};
		class marketSetPriceRow {};
	};
	
	class SlotMachine 
	{
		file = "core\casino";
		class slotInit {};
		class slotPlay {};
		class slotReceive {};
	};
	
	class Drugs
	{
		file = "core\drugs";
		class marijuana {};
		class cocaine {};
		class heroin {};
		class meth {};
		class overdose {};
		class drugUsed {};
		class attachSmoke {};
	};
	
	class TaxiShopFunctions 
	{
		file = "core\taxi";
		class taxiService {};
		class taxiPurchaseFare {};
		class taxiPurchaseSpeedyFare {};
		class requestTaxi {};
	};
};