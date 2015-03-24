life_dynMarket_Serveruptime = 05;
life_dynMarket_UseExternalDatabase = true;
life_dynMarket_PriceUpdateInterval = 01;
life_dynMarket_CreateBackups = true;
life_dynMarket_CreateBackupInterval = 03;
life_dynMarket_UserNotification = true;

life_dynMarket_UserNotification_Text = 
[
	"Les prix ont été mis à jour",
	"Les nouveaux prix sont en cours d'actualisation..."
];

life_dynMarket_Items_Groups =
[
	["Legal",
		[
			["apple",-1,10,50],
			["peach",-1,30,100]
		],
		0.5
	],
	["Illegal", 
		[
			/*["peach",1,30,100]*/
		],
		0.5
	]
];

life_dynMarket_Items_ToTrack = 
[
	["apple",25],
	["peach",50],
	["salema",45],
	["ornate",40],
	["mackerel",175],
	["tuna",700],
	["mullet",250],
	["catshark",300],
	["rabbit",65],
	["turtle",30077],
	["water",5],
	["coffee",5],
	["turtlesoup",1000],
	["donuts",60],
	["tbacon",25],
	["lockpick",75],
	["handcuffkey",75],
	["pickaxe",750],
	["redgull",200],
	["fuelF",100],
	["spikeStrip",1200],
	["tracker",2500],
	["goldbar",125000],
	["cocainep",5348],
	["heroinp",4527],
	["marijuana",4365],
	["iron_r",3017],
	["copper_r",3746],
	["salt_r",4759],
	["glass",3368],
	["oilp",2571],
	["cement",3342],
	["diamondc",3566],
	["eisenp",3153],
	["getreidep",3210],
	["holzp",3248],
	["hopfenp",3540],
	["schwefelp",3222],
	["silberp",3966],
	["tabakp",4577],
	["traubenp",4006],
	["zinnp",3274],
	["zuckerp",4565],
	["schmuck",14825],
	["bronze",13375],
	["getreideip",4244],
	["zuckerip",4922],
	["tabakip",3977],
	["kkugel",13987],
	["spulver",11408],
	["pbrau",24701],
	["pkugel",62727],
	["uranip",9448],
	["uranp",18108],
	["muschelp",1],
	["korallep",1],
	["aquarium",1],
	["goldfisch",1],
	["goldfischglas",1],
	["pschmuck",1],
	["algenp",1],
	["reisp",1],
	["reisip",1],
	["seidep",1],
	["baumwollep",1],
	["psegel",1],
	["sushi",1],
	["halbl",1],
	["nanop",1],
	["pmuenze",1],
	["rlachs",1],
	["rmakrele",1],
	["tfsteak",1],
	["resche",1],
	["display",1],
	["szellen",1],
	["htrans",1],
	["prothese",1],
	["kunststoff",1],
	["titanp",1],
	["notebook",1],
	["kaffeep",1],
	["statue",1],
	["scanner",10000],
	["uwsl",5000]
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