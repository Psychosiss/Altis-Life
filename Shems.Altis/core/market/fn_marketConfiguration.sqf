life_market_resources = 
[
	["oilp",3200,1500,4500,4,2,[["diamondc",1],["iron_r",1],["copper_r",1],["salt_r",1],["cement",1],["glass",1]]],
	["iron_r",1200,600,1800,4,4,[["diamondc",1],["oilp",1],["copper_r",1],["salt_r",1],["cement",1],["glass",1]]],
	["diamondc",3500,1750,5250,4,2,[["oilp",1],["iron_r",1],["copper_r",1],["salt_r",1],["cement",1],["glass",1]]],
	["copper_r",1500,750,2250,4,4,[["diamondc",1],["oilp",1],["iron_r",1],["salt_r",1],["cement",1],["glass",1]]],
	["salt_r",2500,1250,3750,4,3,[["diamondc",1],["oilp",1],["iron_r",1],["copper_r",1],["cement",1],["glass",1]]],
	["glass",2300,1150,3450,4,3,[["diamondc",1],["oilp",1],["iron_r",1],["copper_r",1],["salt_r",1],["cement",1]]],
	["cement",1900,950,2850,4,3,[["diamondc",1],["oilp",1],["iron_r",1],["copper_r",1],["salt_r",1],["glass",1]]],
	["turtle",3000,1500,4500,4,4,[["marijuana",1],["cocainep",1],["heroinp",1],["kidney",1],["skullp",1],["puranium",1],["methp",1]]],
	["marijuana",5500,2750,8250,4,4,[["turtle",1],["cocainep",1],["heroinp",1],["kidney",1],["skullp",1],["puranium",1],["methp",1]]],
	["cocainep",8000,4000,12000,4,4,[["marijuana",1],["turtle",1],["heroinp",1],["kidney",1],["skullp",1],["puranium",1],["methp",1]]],
	["heroinp",7000,3500,11500,4,4,[["marijuana",1],["turtle",1],["cocainep",1],["kidney",1],["skullp",1],["puranium",1],["methp",1]]],
	["methp",4000,2000,19000,4,4,[["marijuana",1],["turtle",1],["cocainep",1],["kidney",1],["skullp",1],["puranium",1]]],
	["puranium",35000,20000,70000,4,4,[["marijuana",1],["turtle",1],["cocainep",1],["kidney",1],["skullp",1],["methp",1]]],
	["skullp",1500,500,10500,4,4,[["marijuana",1],["turtle",1],["cocainep",1],["kidney",1],["puranium",1],["methp",1]]],
	["kidney",50000,15000,150000,4,4,[["marijuana",1],["turtle",1],["cocainep",1],["skullp",1],["puranium",1],["methp",1]]],
	["goldbar",95000,15000,325000,4,4,[["marijuana",1],["turtle",1],["cocainep",1],["skullp",1],["puranium",1],["methp",1]]],
	["goldbarp",75000,60000,80000,4,4,[["marijuana",1],["turtle",1],["cocainep",1],["skullp",1],["puranium",1],["methp",1]]]
];
publicVariable "life_market_resources";

life_market_shortnames = [];
{
	life_market_shortnames set [count life_market_shortnames, _x select 0];
} foreach life_market_resources;

publicVariable "life_market_shortnames";

if(isNil("life_market_prices")) then
{
	life_market_prices = [];
	{
		life_market_prices set [count life_market_prices, [_x select 0, _x select 1, 0, 0]];
	} foreach life_market_resources;
	publicVariable "life_market_prices";
	systemChat "";
};