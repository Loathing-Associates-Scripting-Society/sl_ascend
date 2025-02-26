static int ZOOPART_HEAD       = 1;
static int ZOOPART_L_SHOULDER = 2;
static int ZOOPART_R_SHOULDER = 3;
static int ZOOPART_L_HAND     = 4;
static int ZOOPART_R_HAND     = 5;
static int ZOOPART_R_NIPPLE   = 6;
static int ZOOPART_L_NIPPLE   = 7;
static int ZOOPART_L_BUTTOCK  = 8;
static int ZOOPART_R_BUTTOCK  = 9;
static int ZOOPART_L_FOOT     = 10;
static int ZOOPART_R_FOOT     = 11;
/*static int[int] bodyPartPriority = {
		ZOOPART_L_NIPPLE,
		ZOOPART_R_NIPPLE,
		ZOOPART_L_FOOT,
		ZOOPART_HEAD,
		ZOOPART_L_HAND,
		ZOOPART_L_SHOULDER,
		ZOOPART_R_SHOULDER,
		ZOOPART_L_BUTTOCK,
		ZOOPART_R_BUTTOCK,
		ZOOPART_R_FOOT,
		ZOOPART_R_HAND};*/

boolean in_zootomist()
{
	return my_path()==$path[z is for zootomist];
}

void zootomist_start_pulls()
{
	if (!in_zootomist() || pulls_remaining()==0) { return; }
	if (!have_skill($skill[just the facts]) && auto_is_valid($skill[just the facts])) {
		pullXWhenHaveY($item[book of facts (dog-eared)], 1, 0);
		if (available_amount($item[book of facts (dog-eared)])>0) {use($item[book of facts (dog-eared)]);}
	}
	if (!have_skill($skill[perpetrate mild evil]) && auto_is_valid($skill[perpetrate mild evil])) {
		pullXWhenHaveY($item[Pocket Guide to Mild Evil (used)], 1, 0);
		if (available_amount($item[Pocket Guide to Mild Evil (used)])>0) {use($item[Pocket Guide to Mild Evil (used)]);}
	}
	if (available_amount($item[iflail])==0 && auto_is_valid($item[iflail])) {
		pullXWhenHaveY($item[iflail], 1, 0);
	}
}

int auto_grafted(int bodyPart)
{
	switch(bodyPart)
	{
		case ZOOPART_HEAD:
			return get_property("zootGraftedHeadFamiliar").to_int();
		case ZOOPART_L_SHOULDER:
			return get_property("zootGraftedShoulderLeftFamiliar").to_int();
		case ZOOPART_R_SHOULDER:
			return get_property("zootGraftedShoulderRightFamiliar").to_int();
		case ZOOPART_L_HAND:
			return get_property("zootGraftedHandLeftFamiliar").to_int();
		case ZOOPART_R_HAND:
			return get_property("zootGraftedHandRightFamiliar").to_int();
		case ZOOPART_R_NIPPLE:
			return get_property("zootGraftedNippleRightFamiliar").to_int();
		case ZOOPART_L_NIPPLE:
			return get_property("zootGraftedNippleLeftFamiliar").to_int();
		case ZOOPART_L_BUTTOCK:
			return get_property("zootGraftedButtCheekLeftFamiliar").to_int();
		case ZOOPART_R_BUTTOCK:
			return get_property("zootGraftedButtCheekRightFamiliar").to_int();
		case ZOOPART_L_FOOT:
			return get_property("zootGraftedFootLeftFamiliar").to_int();
		case ZOOPART_R_FOOT:
			return get_property("zootGraftedFootRightFamiliar").to_int();
		default:
			return 0;
	}
}

int [int] bodyPartPriority()
{
	int [int] priority;
	if(auto_have_familiar($familiar[burly bodyguard]))
	{
		priority = {ZOOPART_L_NIPPLE,
		ZOOPART_R_NIPPLE,
		ZOOPART_L_FOOT,
		ZOOPART_HEAD,
		ZOOPART_L_HAND,
		ZOOPART_L_SHOULDER,
		ZOOPART_R_SHOULDER,
		ZOOPART_L_BUTTOCK,
		ZOOPART_R_HAND,
		ZOOPART_R_BUTTOCK,
		ZOOPART_R_FOOT};
	}
	else
	{
		priority = {ZOOPART_L_NIPPLE,
		ZOOPART_R_NIPPLE,
		ZOOPART_L_FOOT,
		ZOOPART_HEAD,
		ZOOPART_L_HAND,
		ZOOPART_L_SHOULDER,
		ZOOPART_R_SHOULDER,
		ZOOPART_L_BUTTOCK,
		ZOOPART_R_BUTTOCK,
		ZOOPART_R_FOOT,
		ZOOPART_R_HAND};
	}
	return priority;
}

familiar zoo_getBestFam(int bodyPart)
{
	return zoo_getBestFam(bodyPart, false);
}

familiar zoo_getBestFam(int bodyPart, boolean verbose)
{
	//Identifies the 11 familiars we want based on what we have and stores them in prefs so we only go through the list of fams once
	//Goes through fam attributes of all familiars and filters from there
	string[familiar] famAttributes;
	//priority, familiar
	float[familiar] intrinsicFams;
	float[familiar] dcombatFams;
	float[familiar] lbuffFams;
	float[familiar] rbuffFams;
	float[familiar] combatFams;
	//Weights for familiar priority. These are based off of our default maximizer statement
	float[string] intrinsicWeights = { 
		"technological": 100, //20% item drop
		"haseyes": 75, //15% item drop
		"object": 25, //5% item drop
		"hashands": 20, //20% meat drop
		"hasclaws": 20, //20% meat drop
		"bite": 15, //15% meat drop
		"animal": 10, //10% meat drop
		"haswings": 12.5, //50% initiative
		"haslegs": 12.5, //50% initiative
		"fast": 12.5, //50% initiative
		"animatedart": 12.5, //50% initiative
		"robot": 10, //10 DR
		"polygonal": 10, //10 DR
		"hasshell": 10, //10 DR
		"hasbones": 5, //5 DR
		"food": 0.5, //1 stench res
		"hasstinger": 0.5, //1 stench res
		"good": 0.5, //1 spooky res
		"evil": 0.5, //1 spooky res
		"reallyevil": 0.5, //1 spooky res
		"hard": 0.5, //1 sleaze res
		"phallic": 0.5, //1 sleaze res
		"edible": 0.5, //1 sleaze res
		"cute": 0.5, //1 sleaze res
		"mineral": 0.5, //1 hot res
		"swims": 0.5, //1 hot res
		"aquatic": 0.5, //1 hot res
		"vegetable": 0.5, //1 cold res
		"wearsclothes": 0.5, //1 cold res
		"isclothes": 0.5, //1 cold res
		"flies": 1, //never fumble
		"insect": 10, //25 max hp
		"software": 10, //25 max hp
		"person": 8, //20 max hp
		"undead": 8, //20 max hp
		"humanoid": 6, //15 max hp
		"organic": 4, //10 max hp
		"sentient": 2, //5 max hp
		"orb": 5, //25 max mp
		"cold": 15, //10 cold dmg
		"hasbeak": 0, //10 weapon dmg. Won't use in zootomist
		"hot": 15, //10 hot dmg
		"sleaze": 15, //10 sleaze dmg
		"spooky": 15, //10 spooky dmg
		"stench": 15, //10 stench dmg
		"cantalk": 1, //-1mp for skills
	};
	float[string] lNipWeights = { 
		"animal": 2.5, //25 hp regen
		"animatedart": 0.5, //50% moxie
		"aquatic": 1, //2 hot res
		"bite": 30, //sleaze dmg
		"cantalk": 37.5, //25% myst
		"cold": 30, //20 cold dmg
		"edible": 20, //20 muscle
		"evil": 0, //10 weapon dmg. Won't use in zootomist
		"fast": 150, //30% item drop
		"flies": 12.5, //50% initiative
		"food": 30, //20 stench dmg
		"good": 5, //50% dmg to skeletons
		"hard": 5, //25% weapon drop
		"hasbeak": 150, //30% food drop
		"hasbones": 2.5, //25% dmg to skeletons
		"hasclaws": 4, //20% crit rate
		"haseyes": 2, //4 spooky res
		"hashands": 15, //15 meat drop
		"haslegs": 10, //50% pant drop
		"hasshell": 20, //20 DR
		"hasstinger": 15, //10 spooky dmg
		"haswings": 20, //20 myst
		"hot": 15, //10 hot dmg
		"hovers": 250, //-5% combat
		"insect": 6.25, //25% init
		"isclothes": 2, //4 cold res
		"object": 40, //100 maxhp
		"organic": 500, //+1 fam exp
		"person": 1, //2 stench res
		"phallic": 10, //10 moxie
		"polygonal": 2, //4 sleaze res
		"reallyevil": 250, //-5 combat
		"robot": 37.5, //25% muscle
		"sentient": 10, //5 fam weight
		"sleaze": 50, //50% booze drop
		"software": 10, //50% max mp
		"stench": 5, //50% dmg to zombies
		"technological": 45, //10-20mp per turn
		"undead": 3, //30 dmg to undead
		"vegetable": 2, //20 familiar dmg
		"wearsclothes": 10, //50% gear drop
	};
	float[string] rNipWeights = { 
		"animal": 15, //10 stench dmg
		"animatedart": 1, //2 spooky res
		"aquatic": 10, //10 muscle
		"bite": 0, //weapon dmg. Won't use in zootomist
		"cantalk": 20, //100% max mp
		"cold": 2, //4 hot res
		"cute": 37.5, //25% moxie
		"edible": 150, //30% booze drops
		"evil": 30, //20 spooky dmg
		"fast": 25, //100% initiative
		"flies": 20, //20 moxie
		"food": 250, //50% food drops
		"good": 20, //10 fam weight
		"hard": 75, //50% muscle
		"hasbones": 5, //50% dmg to skeletons
		"hasclaws": 10, //50% weapon drop
		"haseyes": 25, //+5% combat
		"hashands": 75, //15% item drop
		"haslegs": 5, //25% gear drop
		"hasshell": 20, //20 DR
		"hasstinger": 2, //2x crit hit chance
		"haswings": 12.5, //50% init
		"hot": 1, //2 cold res
		"insect": 500, //1 fam exp
		"isclothes": 5, //25% pant drop
		"mineral": 20, //20 DR
		"object": 2, //4 stench res
		"orb": 10, //10 myst
		"organic": 1, //10 fam dmg
		"person": 30, //30% meat drop
		"phallic": 5, //5 pool skill
		"polygonal": 15, //10 sleaze dmg
		"reallyevil": 0, //20 weapon dmg. Won't use in zootomist
		"robot": 30, //20 hot dmg
		"sentient": 75, //50% myst
		"software": 75, //20-30 mp regen
		"spooky": 5, //50 ghost dmg
		"stench": 25, //+5% combat
		"swims": 15, //10 cold dmg
		"technological": 15, //10-20 hp regen
		"undead": 3, //30 dmg to undead
		"vegetable": 1, //2 sleaze res
		"wearsclothes": 50, //50% max hp
	};
	string[string] footParam = {
		"bite": "instakill",
		"cute": "instakill",
		"evil": "instakill",
		"food": "instakill",
		"hasstinger": "instakill",
		"object": "instakill",
		"reallyevil": "instakill",
		"stench": "instakill",
		"animatedart": "banish",
		"hard": "banish",
		"hasbones": "banish",
		"haslegs": "banish",
		"haswings": "banish",
		"spooky": "banish",
		"swims": "banish",
		"vegetable": "banish",
		"hasbeak": "pp",
		"hasclaws": "pp",
		"hashands": "pp",
		"isclothes": "pp",
		"polygonal": "pp",
		"sleaze": "pp",
		"technological": "pp",
		"wearsclothes": "pp",
		"aquatic": "heal",
		"cold": "heal",
		"edible": "heal",
		"good": "heal",
		"organic": "heal",
		"person": "heal",
		"phallic": "heal",
		"undead": "heal",
		"animal": "sniff",
		"haseyes": "sniff",
		"hot": "sniff",
		"humanoid": "sniff",
		"mineral": "sniff",
		"orb": "sniff",
		"sentient": "sniff",
		"software": "sniff"
	};
	int[string] footWeights = {
		"instakill": 10,
		"banish": 10,
		"pp": 5,
		"heal": 5,
		"sniff": 5
	};
	boolean[familiar] blacklistFams = $familiars[reassembled blackbird, reconstituted crow];
	foreach fam in $familiars[]
	{
		//comment out below line and uncomment second below line to see all unrestricted fams
		if(auto_have_familiar(fam) && !(blacklistFams contains fam))
		//if(is_unrestricted(fam))
		{
			famAttributes[fam] = fam.attributes;
		}
	}
	foreach fam, attr in famAttributes
	{
		string[int] attrs = split_string(attr,"; ");
		//buffs
		foreach k, a in attrs
		{
			intrinsicFams[fam] += intrinsicWeights[a];
			lbuffFams[fam] += lNipWeights[a];
			rbuffFams[fam] += rNipWeights[a];
			combatFams[fam] += footWeights[footParam[a]];
		}
	}
	familiar[5] intrinsicFam;
	familiar lbuffFam;
	familiar rbuffFam;
	familiar lcombatFam;
	familiar rcombatFam;
	foreach fam, m in rbuffFams
	{
		if(m > rbuffFams[rbuffFam])
		{
			rbuffFam = fam;
		}
	}
	foreach fam, m in lbuffFams
	{
		if(m > lbuffFams[lbuffFam] && rbuffFam != fam)
		{
			lbuffFam = fam;
		}
	}
	foreach fam, m in combatFams
	{
		if(rbuffFam == fam || lbuffFam == fam)
		{
			continue;
		}
		if(m > combatFams[lcombatFam])
		{
			lcombatFam = fam;
		}
	}
	foreach fam in $familiars[quantum entangler, foul ball]
	{
		if(auto_have_familiar(fam))
		{
			lcombatFam = fam;
			break;
		}
	}
	foreach fam, m in intrinsicFams
	{
		if(rbuffFam == fam || lbuffFam == fam || lcombatFam == fam)
		{
			continue;
		}
		foreach i in intrinsicFam
		{
			if(m > intrinsicFams[intrinsicFam[i]])
			{
				if(i < 4)
				{
					intrinsicFam[i+1] = intrinsicFam[i];
				}
				intrinsicFam[i] = fam;
				break;
			}
		}
	}
	foreach fam, m in combatFams
	{
		if(rbuffFam == fam || lbuffFam == fam || lcombatFam == fam || intrinsicFams contains fam)
		{
			continue;
		}
		if(m > combatFams[rcombatFam])
		{
			rcombatFam = fam;
		}
	}
	foreach fam in $familiars[dire cassava, phantom limb, MagiMechTech MicroMechaMech]
	{
		if(auto_have_familiar(fam))
		{
			rcombatFam = fam;
			break;
		}
	}
	if(verbose)
	{
		auto_log_info("Best Right nipple fams", "purple");
		auto_log_info(rbuffFam + ":" + rbuffFams[rbuffFam], "purple");
		auto_log_info("Best Left nipple fams", "blue");
		auto_log_info(lbuffFam + ":" + lbuffFams[lbuffFam], "blue");
		auto_log_info("Best Left Foot Fam", "green");
		auto_log_info(lcombatFam + ":" + combatFams[lcombatFam], "green");
		auto_log_info("Best Head, Shoulder, and Butt Fam", "orange");
		foreach i, fam in intrinsicFam
		{
			auto_log_info(fam + ":" + intrinsicFams[fam], "orange");
		}
		auto_log_info("Best Right Foot Fam", "red");
		auto_log_info(rcombatFam + ":" + combatFams[rcombatFam], "red");
	}
	
	familiar bestIntrinsicFam = intrinsicFam[0];
	switch(bodyPart)
	{
		case ZOOPART_HEAD:
		case ZOOPART_L_SHOULDER:
		case ZOOPART_R_SHOULDER:
		case ZOOPART_L_BUTTOCK:
		case ZOOPART_R_BUTTOCK:
			return bestIntrinsicFam;
		case ZOOPART_L_HAND:
			return $familiar[Barrrnacle]; //Need to programmatically figure this out yet because what if this is optimal in an earlier slot?
		case ZOOPART_R_HAND:
			if(auto_have_familiar($familiar[burly bodyguard])) //Need to programmatically figure this out yet because what if this is optimal in an earlier slot?
			{
				return $familiar[burly bodyguard];
			}
			else
			{
				return $familiar[Blood-Faced Volleyball]; //Need to programmatically figure this out yet because what if this is optimal in an earlier slot?
			}
		case ZOOPART_L_NIPPLE:
			return lbuffFam;
		case ZOOPART_R_NIPPLE:
			return rbuffFam;
		case ZOOPART_L_FOOT:
			return lcombatFam;
		case ZOOPART_L_FOOT:
			return rcombatFam;
	}
	return $familiar[none];
}

boolean zooGraftFam()
{
	boolean doZooto = get_property("auto_doZooto").to_boolean();
	if (!in_zootomist() || my_level()>=13 || !doZooto)
	{
		return false;
	}
	/*Body parts are identified by number
	1 = head
	2 = left shoulder
	3 = right shoulder
	4 = left hand
	5 = right hand
	6 = right nipple
	7 = left nipple
	8 = left butt cheek
	9 = right butt cheek
	10 = left foot
	11 = right foot
	Each body part is categorized by what it gives when a familiar is grafted to it.
	intrinsic provides the intrinsic buff and adds to it.
	dcombat is a combat damage skill
	lbuff is left nipple buff
	rbuff is right nipple buff
	combat is a useful combat skill (yr, olfact, banish)
	*/
	string[int] bodyPartType = {
		ZOOPART_HEAD       : "intrinsic",
		ZOOPART_L_SHOULDER : "intrinsic",
		ZOOPART_R_SHOULDER : "intrinsic",
		ZOOPART_L_HAND     : "dcombat",
		ZOOPART_R_HAND     : "dcombat",
		ZOOPART_L_NIPPLE   : "lbuff",
		ZOOPART_R_NIPPLE   : "rbuff",
		ZOOPART_L_BUTTOCK  : "intrinsic",
		ZOOPART_R_BUTTOCK  : "intrinsic",
		ZOOPART_L_FOOT     : "combat",
		ZOOPART_R_FOOT     : "combat"
	};
	string[int] bodyPartName = {
		ZOOPART_HEAD       : "head",
		ZOOPART_L_SHOULDER : "left shoulder",
		ZOOPART_R_SHOULDER : "right shoulder",
		ZOOPART_L_HAND     : "left hand",
		ZOOPART_R_HAND     : "right hand",
		ZOOPART_L_NIPPLE   : "left nipple",
		ZOOPART_R_NIPPLE   : "right nipple",
		ZOOPART_L_BUTTOCK  : "left butt cheek",
		ZOOPART_R_BUTTOCK  : "right butt cheek",
		ZOOPART_L_FOOT     : "left foot",
		ZOOPART_R_FOOT     : "right foot"
	};
	int[int] bodyPartPriority = bodyPartPriority();
	foreach i, p in bodyPartPriority
	{
		int auto_grafts = auto_grafted(p);
		if(auto_grafts > 0) continue;
		auto_log_info(p);
		familiar fam = zoo_getBestFam(p, false);
		handleFamiliar(fam);
		int next_graft_weight = zoo_nextGraftWeight();
		if(familiar_weight(fam) < next_graft_weight)
		{
			//can only graft if the fam is higher than the level at the last graft
			zooBoostWeight(fam,next_graft_weight);
			return false;
		}
		equip(fam,$item[none]); //unequip fam equipment to not lose it, just in case
		visit_url("place.php?whichplace=graftinglab&action=graftinglab_chamber");
		visit_url("choice.php?pwd=&whichchoice=1553&option=1&slot=" + p + "&fam=" + to_int(fam));
		auto_log_info("Grafting a " + fam + " to you", "blue");
		handleTracker(fam,"Grafted to " + bodyPartName[p],"auto_tracker_path");
		refresh_status();
		council();
		if (my_level() < 13)
		{
			familiar nextfam = zoo_getBestFam(bodyPartPriority[my_level()], false);
			if (nextfam==$familiar[none]) { abort("Got none familiar in zooGraftFam()"); }
			use_familiar(nextfam);
			handleFamiliar(nextfam);
		}
		return true;
	}
	
	auto_log_info("No more to graft");
	return false;
}

int zoo_nextGraftWeight()
{
	return min(my_level()+2,13);
}

boolean zooBoostWeight(familiar f)
{
	return zooBoostWeight(f,zoo_nextGraftWeight());
}

boolean zooBoostWeight(familiar f, int target_weight)
{
	//Once this is proven to output as expected, actually do the operations, not just output stuff
	if(my_familiar() != f)
	{
		use_familiar(f);
	}
	float experience_needed = target_weight*target_weight - familiar_weight(f)*familiar_weight(f);
	float mayam = 0;
	boolean mayamavailable;
	boolean piccoloavailable;
	boolean specimenavailable;
	boolean doZooto = get_property("auto_doZooto").to_boolean();
	if(auto_monkeyPawWishesLeft() > 2 && !(have_effect($effect[Blue Swayed]) > 0))
	{
		//do it twice
		auto_makeMonkeyPawWish($effect[Blue Swayed]);
		auto_makeMonkeyPawWish($effect[Blue Swayed]);
	}
	if(auto_haveMayamCalendar() && !(auto_MayamIsUsed("fur")) && !(auto_MayamAllUsed()))
	{
		mayam = 100;
		mayamavailable = true;
	}
	float piccolo = 0;
	if(auto_haveAprilingBandHelmet() && possessEquipment($item[Apriling band piccolo]) && get_property("_aprilBandPiccoloUses").to_int() < 3)
	{
		piccolo = 40;
		piccoloavailable = true;
	}
	float specimen = 0;
	if(get_property("zootSpecimensPrepared").to_int() <= get_property("zootomistPoints").to_int())
	{
		specimen = 20;
		specimenavailable = true;
	}
	maximize("familiar experience", false);
	float fight = numeric_modifier("familiar experience");
	auto_log_info(f + " needs " + experience_needed + " experience");
	auto_log_info("To level up your familiar, you should:");
	float amt = 0;
	float diff = experience_needed - amt;
	while(diff >= 1)
	{
		if(diff > 100 && mayam > 0 && mayamavailable)
		{
			auto_log_info("Use the Mayam calendar and get fur on the outer ring");
			amt += mayam;
			if(doZooto)
			{
				auto_MayamClaim("fur wood yam clock");
			}
			mayamavailable = false;
		}
		else if(diff > 40 && piccolo > 0 && piccoloavailable)
		{
			auto_log_info("Play the Apriling Band Piccolo");
			amt += piccolo;
			if(doZooto)
			{
				auto_playAprilPiccolo();
			}
			piccoloavailable = false;
		}
		else if(diff > 20 && specimen > 0 && specimenavailable)
		{
			auto_log_info("Use the Specimen Preparation Bench");
			amt += specimen;
			if(doZooto)
			{
				visit_url("place.php?whichplace=graftinglab&action=graftinglab_prep");
				visit_url("choice.php?pwd=&whichchoice=1555&option=1", true);
				int new_exp = f.experience;
				int new_weight = familiar_weight(f);
				handleTracker(f,"Specimen prepared to "+f.experience+" XP {"+new_weight+" lb}","auto_tracker_path");
			}
			specimenavailable = false;
		}
		else
		{
			int fights_needed = ceil(diff / fight);
			auto_log_info("Do " + fights_needed + " (preferably free) fights");
			if(doZooto)
			{
				LX_zootoFight();
			}
			amt += fight * fights_needed;
		}
		diff = experience_needed - amt;
		auto_log_info("Diff = " + diff);
	}
	return false;
}

skill getZooKickYR()
{
	boolean isYR(int fam_id) {
		familiar fam = to_familiar(fam_id);
		return $familiars[quantum entangler, foul ball, Defective Childrens' Stapler] contains fam;
	}
	if (isYR(to_int(get_property("zootGraftedFootLeftFamiliar")))) {
		return $skill[left %n kick];
	}
	if (isYR(to_int(get_property("zootGraftedFootRightFamiliar")))) {
		return $skill[right %n kick];
	}
	return $skill[none];
}

skill getZooKickSniff()
{
	if (leftKickHasSniff()) {
		return $skill[left %n kick];
	}
	if (rightKickHasSniff()) {
		return $skill[right %n kick];
	}
	return $skill[none];
}

skill getZooKickBanish()
{
	if (have_effect($effect[Everything Looks Blue])>0) { return $skill[none]; }
	boolean isBanish(int fam_id) {
		familiar fam = to_familiar(fam_id);
		return $familiars[Dire Cassava, Phantom Limb,MagiMechTech MicroMechaMech] contains fam;
	}
	if (isBanish(to_int(get_property("zootGraftedFootLeftFamiliar")))) {
		return $skill[left %n kick];
	}
	if (isBanish(to_int(get_property("zootGraftedFootRightFamiliar")))) {
		return $skill[right %n kick];
	}
	return $skill[none];
}

skill getZooKickPickpocket()
{
	if (leftKickHasPickpocket()) {
		return $skill[left %n kick];
	}
	if (rightKickHasPickpocket()) {
		return $skill[right %n kick];
	}
	return $skill[none];
}

skill getZooKickFreeKill()
{
	if (leftKickHasFreeKill()) {
		return $skill[left %n kick];
	}
	if (rightKickHasFreeKill()) {
		return $skill[right %n kick];
	}
	return $skill[none];
}

skill getZooBestPunch()
{
	return getZooBestPunch($monster[fluffy bunny]);
}

skill getZooBestPunch(monster m)
{
	if(have_skill($skill[left %n punch]))
	{
		return $skill[left %n punch];
	}
	else
	{
		return $skill[none];
	}
}

// These will be done intelligently once Mafia can tell us.
// For now, hardcode them to fit what you grafted.
// Repo versions are designed for Quantum Entangler on left foot (optimal), MicroMech on right (not optimal).
// Cooldowns on eg banish can be handled like:
//~ boolean rightKickHasBanish()
//~ {
//~ 	return have_effect($effect[Everything Looks Blue]) <= 0;
//~ }

boolean leftKickHasSniff()
{
	return false;
}

boolean leftKickHasPickpocket()
{
	return false;
}

boolean leftKickHasFreeKill()
{
	return false;
}

boolean rightKickHasSniff()
{
	return false;
}

boolean rightKickHasPickpocket()
{
	return false;
}

boolean rightKickHasFreeKill()
{
	return false;
}

boolean LX_zootoFight()
{
	if(!in_zootomist())
	{
		return false;
	}
	if(my_level() >= 7)
	{
		if(auto_doPhoneQuest())
		{
			return true;
		}
		//should get wishes in Shadow Rift. If not can't do this
		if(!(have_outfit("Frat Warrior Fatigues")))
		{
			return summonMonster($monster[War Frat Mobile Grill Unit]);
		}
		if(candyBlock())
		{
			return true;
		}
		if(auto_have_familiar($familiar[Jill-of-All-Trades]) && !(get_property("_mapToACandyRichBlockUsed").to_boolean()))
		{
			abort("Get a map to a candy rich block yourself and trick or treat with the frat outfit, ideally");
		}
	}
	if(my_level() >= 5)
	{
		if(speakeasyCombat())
		{
			return true;
		}
	}
	if(!(can_adventure($location[Cobb\'s Knob Harem])))
	{
		//Haven't opened the Knob yet
		if(autoAdv($location[The Outskirts of Cobb'\s Knob]))
		{
			return true;
		}
	}
	else if(!(can_adventure($location[The Haunted Billiards Room])))
	{
		if(autoAdv($location[The Haunted Kitchen]))
		{
			return true;
		}
	}
	else if(autoAdv($location[The Spooky Forest]))
	{
		return true;
	}
	else
	{
		return false;
	}
	return false;
}
