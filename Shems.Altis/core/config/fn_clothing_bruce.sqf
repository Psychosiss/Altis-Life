private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;

ctrlSetText[3103,"Bruce's Outback Outfits"];

switch (_filter) do
{
	case 0:
	{
		[
			["U_C_Poloshirt_blue",nil,250],
			["U_NikosAgedBody","Homme d'affaire",15000],
			["U_C_Scientist","Anti-Radiation",30000],
			["U_C_Poloshirt_burgundy","Poloshirt Burgundy",275],
			["U_C_Poloshirt_redwhite","Poloshirt Red/White",150],
			["U_C_Poloshirt_salmon","Poloshirt Salmon",175],
			["U_C_Poloshirt_stripped","Poloshirt stripped",125],
			["U_C_Poloshirt_tricolour","Poloshirt Tricolor",350],
			["U_C_Poor_2","Rag tagged clothes",250],
			["U_IG_Guerilla2_2","Green stripped shirt & Pants",650],
			["U_IG_Guerilla3_1","Brown Jacket & Pants",735],
			["U_IG_Guerilla2_3","The Outback Rangler",1200],
			["U_C_HunterBody_grn","The Hunters Look",1500],
			["U_C_WorkerCoveralls","Mechanic Coveralls",2500],
			["U_OrestesBody","Surfing On Land",1100],
			["U_C_HunterBody_grn","Panoplie Chasseur",3500],
			["U_C_WorkerCoveralls","Combinaison Dépanneur",3500],
			["U_OrestesBody","CheesePanda Style",3500],
			["U_C_Journalist","Journaliste",3500]
		];
	};

	case 1:
	{
		[
			["H_Bandanna_camo","Camo Bandanna",120],
			["H_Bandanna_surfer","Surfer Bandanna",130],
			["H_Bandanna_gry","Grey Bandanna",150],
			["H_Bandanna_cbr",nil,165],
			["H_Bandanna_surfer",nil,135],
			["H_Bandanna_khk","Khaki Bandanna",145],
			["H_Bandanna_sgg","Sage Bandanna",160],
			["H_StrawHat","Straw Fedora",225],
			["H_BandMask_blk","Hat & Bandanna",300],
			["H_Booniehat_tan",nil,425],
			["H_Hat_blue",nil,310],
			["H_Hat_brown",nil,276],
			["H_Hat_checker",nil,340],
			["H_Hat_grey",nil,280],
			["H_Hat_tan",nil,265],
			["H_Cap_blu",nil,150],
			["H_Cap_grn",nil,150],
			["H_Cap_grn_BI",nil,150],
			["H_Cap_oli",nil,150],
			["H_Cap_red",nil,150],
			["H_Cap_tan",nil,150],
			["H_Cap_press","Casquette Journaliste",2500]
		];
	};

	case 2:
	{
		_ret pushBack ["G_Sport_BlackWhite",nil,20];
		_ret pushBack ["G_Sport_Blackyellow",nil,20];
		_ret pushBack ["G_Shades_Blue",nil,20];
		_ret pushBack ["G_Shades_Black",nil,25];
		_ret pushBack ["G_Shades_Red",nil,25];
		_ret pushBack ["G_Shades_Green",nil,25];
		_ret pushBack ["G_Squares_Tinted",nil,50];
		_ret pushBack ["G_Sport_Red",nil,20];
		_ret pushBack ["G_Sport_Checkered",nil,20];
		_ret pushBack ["G_Sport_Greenblack",nil,20];
		_ret pushBack ["G_Sport_Blackred",nil,20];
		_ret pushBack ["G_Lady_Mirror",nil,150];
		_ret pushBack ["G_Lady_Dark",nil,150];
		_ret pushBack ["G_Lady_Blue",nil,150];
		_ret pushBack ["G_Lowprofile",nil,30];
		_ret pushBack ["G_Squares",nil,10];
		_ret pushBack ["G_Spectacles",nil,100];
		_ret pushBack ["G_Aviator",nil,100];
		_ret pushBack ["G_Spectacles_Tinted",nil,100];
		_ret pushBack ["G_Goggles_VR",nil,500];
		_ret pushBack ["G_Combat",nil,55];
	};

	case 3:
	{
		if(talent_civ_vest1)then
		{
			_ret pushBack ["V_Press_F","Journaliste",400];
			_ret pushBack ["V_Rangemaster_belt",nil,1200];
			_ret pushBack ["V_HarnessOSpec_brn",nil,1500];
			_ret pushBack ["V_HarnessOSpec_gry",nil,1500];
		};
		if(talent_civ_vest2)then
		{
			_ret pushBack ["V_TacVestIR_blk",nil,2000];
			_ret pushBack ["V_TacVest_khk",nil,20500];
		};
	};

	case 4:
	{
		[
			["B_AssaultPack_cbr",nil,2500],
			["B_Kitbag_mcamo",nil,4500],
			["B_TacticalPack_oli",nil,3500],
			["B_FieldPack_ocamo",nil,3000],
			["B_FieldPack_ocamo",nil,3000],
			["B_Bergen_sgg",nil,4500],
			["B_Kitbag_cbr",nil,4500],
			["B_Carryall_oli",nil,5000],
			["B_Carryall_khk",nil,5000]
		];
	};
};