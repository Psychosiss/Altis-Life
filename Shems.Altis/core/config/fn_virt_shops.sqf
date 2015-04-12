private["_shop"];
_shop = _this select 0;

switch (_shop) do
{
	case "market": {["Altis Market",["campfire","tent1","tent2","skinningknife","water","rabbit","burgers","frites","pizza","apple","redgull","debitcard","chicken","chickenp","snake","snakep","rabbitp","goat","goatp","sheep","sheepp","tbacon","lockpick","pickaxe","fuelF","peach","storagesmall","storagebig","gpstracker","pressluft","underwatercharge"]]};
	case "rebel": {["Rebel Market",["water","apple","redgull","tbacon","lockpick","pickaxe","fuelF","peach","boltcutter","blastingcharge","debitcard","vammo","painkillers","ipuranium","frites","pizza","scalpel","pressluft","painkillers","handcuffs","handcuffkeys"]]};
	case "gang": {["Gang Market", ["water","apple","redgull","tbacon","lockpick","debitcard","pickaxe","fuelF","peach","blastingcharge","boltcutter"]]};
	case "wongs": {["Wong's Food Cart",["turtlesoup","turtle","dog","dogp"]]};
	case "coffee": {["Stratis Coffee Club",["coffee","donuts","gpstracker"]]};
	case "heroin": {["Drug Dealer",["cocainep","heroinp","methp","cigare","marijuana"]]};
	case "oil": {["Oil Trader",["oilp","pickaxe","fuelF"]]};
	case "fishmarket": {["Altis Fish Market",["salema","ornate","mackerel","mullet","tuna","catshark"]]};
	case "glass": {["Altis Glass Dealer",["glass"]]};
	case "iron": {["Altis Industrial Trader",["iron_r","copper_r","silver_r"]]};
	case "diamond": {["Diamond Dealer",["diamond","diamondc"]]};
	case "salt": {["Salt Dealer",["salt_r"]]};
	case "cop": {["Cop Item Shop",["campfire","tent1","tent2","donuts","coffee","debitcard","spikeStrip","water","apple","redgull","fuelF","defusekit","handcuffs","handcuffkeys"]]};
	case "cement": {["Cement Dealer",["cement"]]};
	case "organ": {["Organ Dealer",["kidney"]]};
	case "uranium": {["Marchand Uranium",["ipuranium","uranium","puranium"]]};
	case "skullp": {["Antiquaire",["skull","skullp"]]};
	case "medic": {["Marchand médicale",["water","apple","redgull","debitcard","tbacon","painkillers","pickaxe","kidney","fuelF","peach","boltcutter","gpstracker","scalpel"]]};
	case "tuning": {["tuning",["nitro"]]};
	case "explosif": {["explosif",["civdefusekit","demolitioncharge","bombdetect","speedbomb"]]};
	case "station": {["station essence",["campfire","water","burgers","frites","pizza","redgull","tbacon","fuelF"]]};
};