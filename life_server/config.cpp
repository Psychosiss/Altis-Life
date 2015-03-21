class DefaultEventhandlers;
class CfgPatches 
{
	class life_server
	{
		units[] = {"C_man_1"};
		weapons[] = {};
		requiredAddons[] = {"A3_Data_F","A3_Soft_F","A3_Soft_F_Offroad_01","A3_Characters_F"};
		fileName = "life_server.pbo";
		author[]= {"Tonic"}; 
	};
};

class CfgFunctions
{
	class BIS_Overwrite
	{
		tag = "BIS";
		class MP
		{
			file = "\life_server\Functions\MP";
			class initMultiplayer {};
			class call {};
			class spawn {};
			class execFSM {};
			class execVM {};
			class execRemote {};
			class addScore {};
			class setRespawnDelay {};
			class onPlayerConnected {};
			class initPlayable {};
			class missionTimeLeft {};
		};
	};

	class MySQL_Database
	{
		tag = "DB";
		class MySQL
		{
			file = "\life_server\Functions\MySQL";
			class numberSafe {};
			class mresArray {};
			class queryRequest {};
			class asyncCall {};
			class insertRequest {};
			class updateRequest {};
			class mresToArray {};
			class insertVehicle {};
			class bool {};
			class mresString {};
			class updatePartial {};
			class repaintVehicle {};
		};
	};
	
	class Shems_Developpement
	{
		tag = "SHEMS";
		class Shems
		{
			file = "\life_server\Functions\Shems";
			class antiHack {};
			class clientAntiHack {};
			class lxOPS {};
			class fixColorVehicle {};
			class antiMatter {};
			class searchVehicleUID {};
		};
	};

	class Life_System
	{
		tag = "life";
		class Wanted_Sys
		{
			file = "\life_server\Functions\WantedSystem";
			class wantedFetch {};
			class wantedPerson {};
			class wantedBounty {};
			class wantedTicket {};
			class wantedPardon {};
			class wantedRemove {};
			class wantedAdd {};
			class wantedPunish {};
		};

		class Jail_Sys
		{
			file = "\life_server\Functions\Jail";
			class jailSys {};
			class jailSysTroll {};
			class jailSysAsylum {};
			class jailTimer {};
			class jailPlayer {};
		};

		class Client_Code
		{
			file = "\life_server\Functions\Client";
			class safeInventory {};
			class safeOpen {};
			class safeStore {};
			class safeTake {};
			class updateMoney {};
		};
		
		class DBBAN
		{
			file = "\life_server\Functions\DBBan";
			class dbBanSet {};
			class dbBanGet {};
			class dbBanQuery {};
			class dbBanBan {};
		};
	};

	class TON_System
	{
		tag = "TON";
		class Systems
		{
			file = "\life_server\Functions\Systems";
			class managesc {};
			class cleanup {};
			class huntingZone {};
			class getID {};
			class vehicleCreate {};
			class vehicleDead {};
			class spawnVehicle {};
			class getVehicles {};
			class vehicleStore {};
			class vehicleDelete {};
			class spikeStrip {};
			class logIt {};
			class federalUpdate {};
			class chopShopSell {};
			class clientDisconnect {};
			class cleanupRequest {};
			class vehicleRepaint {};
			class goldUpdate {};
			class saveBounties {};
			class loadBounties {};
			class vehicleIsDead {};
			class keyManagement {};
			class setObjVar {};
			class insureCar {};
		};
		
		class Housing
		{
			file = "\life_server\Functions\Housing";
			class addHouse {};
			class fetchPlayerHouses {};
			class houseCleanup {};
			class initHouses {};
			class nearestDoor {};
			class sellHouse {};
			class updateHouseContainers {};
			class updateHouseTrunk {};
		};
		
		class Gangs
		{
			file = "\life_server\Functions\Gangs";
			class insertGang {};
			class queryPlayerGang {};
			class removeGang {};
			class updateGang {};
		};

		class DynMarket
		{
			file = "\life_server\Functions\DynMarket";
			class calculatePrices {};
			class config {};
			class getUpdate {};
			class HandleDB {};
			class playerLogged {};
			class sleeper {};
		};
	};
		
	class GHBSystem
	{
		tag = "GHB";
		class Smartphone
		{
			file = "\life_server\Functions\Smartphone";
			class handleMessages {};
			class msgRequest {};
		};
	};
	
	class ANTICHEAT_System
	{
		tag = "ANTICHEAT";
		class Launder
		{
			file = "\life_server\Functions\Anticheat";
			class configureAnticheat {};
			class commitMOT {};
			class commitMOTValid {};
			class setPlayTime {};
			class getPlayTime {};
		};
	};
};

class CfgVehicles
{
	class Car_F;
	class CAManBase;
	class Civilian;
	class Civilian_F : Civilian
	{
		class EventHandlers;
	};
	
	class C_man_1 : Civilian_F
	{
		class EventHandlers: EventHandlers
		{
			init = "(_this select 0) execVM ""\life_server\fix_headgear.sqf""";
		};
	};
};