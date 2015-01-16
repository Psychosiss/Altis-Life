private["_ressourcesZones"];
_ressourcesZones = 
[
	"apple_1","apple_4","apple_9",
	"peaches_2","peaches_3","peaches_9",
	"heroin_1",
	"cocaine_1",
	"weed_1",
	"meth_1",
	"tabac_1",
	"warm_marker",
	"lead_1",
	"iron_1",
	"salt_1",
	"sand_1",
	"diamond_1",
	"oil_1","oil_2",
	"rock_1",
	"silver_1"
];

{
	player addAction "Appuyez sur windows gauche pour récolter";
} foreach _ressourcesZones;