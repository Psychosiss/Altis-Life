private "_filter";
_filter = [_this,0,0,[0]] call BIS_fnc_param;

ctrlSetText[3103,"Bruce's Outback Outfits"];

switch _filter do
{
	case 0:
	{
		[
			["U_C_Commoner1_1","1v1 me in jail m9",250],
			["U_C_Commoner1_2","Hobo Outfit (Black)",250],
			["U_C_Commoner1_3","Hobo Outfit (Blue)",250],
			["U_C_Commoner_shorts","Hobo Outfit (Green)",250],
			["U_C_Poloshirt_blue","Hobo Outfit (Maroon)",250],
			["U_C_Poloshirt_burgundy","Hobo Outfit (Yellow Claw)",250],
			["U_C_Poloshirt_redwhite","Pat",250],
			["U_C_Poloshirt_salmon","Phil",250],
			["U_C_Poloshirt_stripped","Manners",250],
			["U_C_Poloshirt_tricolour","Britannia",250],
			["U_C_ShirtSurfer_shorts","Squirtle",250],
			["U_C_TeeSurfer_shorts_1","DnA",250],
			["U_C_Poor_2","Rag tagged clothes",250],
			["U_IG_Guerilla2_2","Green stripped shirt & Pants",650],
			["U_IG_Guerilla3_1","Brown Jacket & Pants",735],
			["U_IG_Guerilla2_3","The Outback Rangler",1200],
			["U_C_HunterBody_grn","The Hunters Look",1500],
			["U_C_WorkerCoveralls","Mechanic Coveralls",2500],
			["U_OrestesBody","Surfing On Land",1100],
			["U_NikosBody","Russian Hobo",5000],
			["U_NikosAgedBody","Casual Wears",5000],
			["U_C_Scientist","Anti-Radiation",6000]
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
			["H_Cap_tan",nil,150]
		];
	};

	case 2:
	{
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Squares",nil,10],
			["G_Aviator",nil,100],
			["G_Lady_Mirror",nil,150],
			["G_Lady_Dark",nil,150],
			["G_Lady_Blue",nil,150],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55]
		];
	};

	case 3:
	{
		[
			["V_Rangemaster_belt",nil,5000],
			["V_BandollierB_khk",nil,8000],
			["V_BandollierB_cbr",nil,8000],
			["V_BandollierB_blk",nil,8000],
			["V_BandollierB_oli",nil,8000]
		];
	};

	case 4:
	{
		[
			["B_AssaultPack_cbr",nil,2500],
			["B_FieldPack_ocamo",nil,3000],
			["B_Kitbag_mcamo",nil,4500],
			["B_Kitbag_cbr",nil,4500],
			["B_TacticalPack_oli",nil,3500],
			["B_Bergen_sgg",nil,4500],
			["B_Carryall_oli",nil,5000],
			["B_Carryall_khk",nil,5000]
		];
	};
};