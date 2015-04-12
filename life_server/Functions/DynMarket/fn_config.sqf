life_dynMarket_Serveruptime = 05;
life_dynMarket_UseExternalDatabase = true;
life_dynMarket_PriceUpdateInterval = 01;
life_dynMarket_CreateBackups = true;
life_dynMarket_CreateBackupInterval = 03;
life_dynMarket_UserNotification = true;
life_dynMarket_createRandomEvents = true;

life_dynMarket_UserNotification_Text = 
[
	"Les prix ont été mis à jour",
	"Les nouveaux prix sont en cours d'actualisation..."
];

life_dynMarket_Items_Groups =
[
	["Legal",
		[
			["apple",-1,40,60],
			["salema",-1,36,54],
			["ornate",-1,32,48],
			["mackerel",-1,140,210],
			["tuna",-1,560,840],
			["mullet",-1,200,300],
			["catshark",-1,240,360],
			["oilp",-1,2560,3840],
			["diamond",-1,600,900],
			["diamondc",-1,3200,4800],
			["iron_r",-1,2620,3930],
			["copper_r",-1,2000,3000],
			["salt_r",-1,1320,1980],
			["glass",-1,1160,1740],
			["cement",-1,1560,2340],
			["uranium",-1,28000,42000],
			["skull",-1,600,900],
			["skullp",-1,1200,1800],
			["silver_r",-1,1680,2520],
			["goat",-1,1600,2400],
			["chicken",-1,2000,3000],
			["sheep",-1,1600,2400],
			["snake",-1,680,1020],
			["rabbit",-1,640,960],
			["goatp",-1,6400,9600],
			["chickenp",-1,7200,10800],
			["sheepp",-1,6400,9600],
			["snakep",-1,1520,2280],
			["rabbitp",-1,1440,2160]
		],
		0.5
	],
	["Illegal", 
		[
			["heroinu",1,1110,2590],
			["heroinp",1,2190,5110],
			["turtle",1,1800,4200],
			["marijuana",1,3210,7490],
			["cocaine",1,1800,4200],
			["cocainep",1,5250,12250],
			["goldbar",1,57000,133000],
			["methu",1,240,560],
			["methp",1,2400,5600],
			["tabac",1,3000,7000],
			["cigare",1,4560,10640],
			["kidney",1,30000,70000],
			["dog",1,1800,4200],
			["dogp",1,8400,19600]
		],
		0.5
	]
];

life_dynMarket_Items_ToTrack = 
[
	["apple",50],
	["heroinu",1850],
	["heroinp",3650],
	["salema",45],
	["ornate",40],
	["mackerel",175],
	["tuna",700],
	["mullet",250],
	["catshark",300],
	["oilp",3200],
	["turtle",3000],
	["water",5],
	["burgers",175],
	["frites",150],
	["pizza",200],
	["coffee",5],
	["turtlesoup",1000],
	["donuts",60],
	["marijuana",5350],
	["tbacon",25],
	["lockpick",75],
	["pickaxe",750],
	["redgull",200],
	["peach",55],
	["cocaine",3000],
	["cocainep",8750],
	["diamond",750],
	["diamondc",4000],
	["iron_r",3275],
	["copper_r",2500],
	["salt_r",1650],
	["glass",1450],
	["fuelF",500],
	["spikeStrip",1200],
	["cement",1950],
	["goldbar",95000],
	["methu",400],
	["methp",4000],
	["tabac",5000],
	["cigare",7600],
	["uranium",35000],
	["skull",750],
	["skullp",1500],
	["nitro",5000],
	["kidney",50000],
	["gpstracker",500],
	["scalpel",100],
	["silver_r",2100],
	["pressluft",5000],
	["speedbomb",500000],
	["campfire",3000],
	["painkillers",50],
	["tent1",9000],
	["tent2",10000],
	["skinningknife",1000],
	["dog",3000],
	["goat",2000],
	["chicken",2500],
	["sheep",2000],
	["snake",850],
	["rabbit",800],
	["dogp",14000],
	["goatp",8000],
	["chickenp",9000],
	["sheepp",8000],
	["snakep",1900],
	["rabbitp",1800],
	["vammo",10000],
	["adrenalineShot",5000],
	["debitcard",2500],
	["underwatercharge",5000],
	["handcuffs",200],
	["handcuffkeys",100]
];

life_dynMarket_Items_CurrentPriceArr = [];
life_dynMarket_sellarraycopy = life_dynMarket_Items_ToTrack;
life_dynMarket_Serveruptime = (life_dynMarket_Serveruptime * 3600) - 300;
{
	_currentArray = _x;
	life_dynMarket_Items_CurrentPriceArr pushBack [_currentArray select 0,_currentArray select 1,0];
} forEach life_dynMarket_Items_ToTrack;

publicVariable "life_dynMarket_UserNotification";
publicVariable "life_dynMarket_UserNotification_Text";

if (life_dynMarket_UseExternalDatabase) then {[1] call TON_fnc_HandleDB;};
life_dynMarket_UpdateCount = 0;
if (life_dynMarket_UseExternalDatabase) then 
{
	[] spawn 
	{
		sleep life_dynMarket_Serveruptime;
		diag_log "dynMarket : les prix actuels viennent d'être sauvegarder dans la base de donnée";
		diag_log "dynMarket : En attente des résultats";
		[0] call TON_fnc_HandleDB;
	};
};

sleep 5;
[] call TON_fnc_sleeper;