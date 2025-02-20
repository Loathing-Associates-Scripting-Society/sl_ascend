static int ZOOPART_HEAD       = 1;
static int ZOOPART_L_SHOULDER = 2;
static int ZOOPART_R_SHOULDER = 3;
static int ZOOPART_L_HAND     = 4;
static int ZOOPART_R_HAND     = 5;
static int ZOOPART_L_NIPPLE   = 6;
static int ZOOPART_R_NIPPLE   = 7;
static int ZOOPART_L_BUTTOCK  = 8;
static int ZOOPART_R_BUTTOCK  = 9;
static int ZOOPART_L_FOOT     = 10;
static int ZOOPART_R_FOOT     = 11;

boolean in_zootomist()
{
	return my_path()==$path[z is for zootomist];
}

void zoo_initializeSettings()
{
	set_property("auto_lastGraft", 3);
	set_property("auto_grafts", "");
}

void zootomist_pulls()
{
	if (!in_zootomist() || pulls_remaining()==0) { return; }
	if (!have_skill($skill[just the facts]) && auto_is_valid($skill[just the facts])) {
		pullXWhenHaveY($item[book of facts (dog-eared)], 1, 0);
		if (available_amount($item[book of facts (dog-eared)])>0) {use($item[book of facts (dog-eared)]);}
	}
}

void zoo_useFam()
{
	//Identifies the 11 familiars we want based on what we have and stores them in prefs so we only go through the list of fams once
	//Goes through fam attributes of all familiars and filters from there
	string[int, familiar] famAttributes;
	//familiar, pos in map, priority
	int[int,familiar] intrinsicFams;
	int[int,familiar] dcombatFams;
	int[int,familiar] lbuffFams;
	int[int,familiar] rbuffFams;
	int[int,familiar] combatFams;
	//Weights for familiar priority. These are based off of our default maximizer statement
	float[string] intrinsicWeights = { 
		"technological": 100, //20% item drop
		"haseyes": 75, //15% item drop
		"object": 25, //5% item drop
		"hashands": 20, //20% meat drop
		"hasclaws": 20, //20% meat drop
		"bite": 15, //15% meat drop
		"animal": 10, //10% meat drop
		"haswings": 25, //50% initiative
		"haslegs": 25, //50% initiative
		"fast": 25, //50% initiative
		"animatedart": 25, //50% initiative
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
		"hasbeak": 15, //10 weapon dmg
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
		"evil": 15, //10 weapon dmg
		"fast": 150, //30% item drop
		"flies": 25, //50% initiative
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
		"hovers": 1000, //-5% combat
		"insect": 12.5, //25% init
		"isclothes": 2, //4 cold res
		"object": 40, //100 maxhp
		"organic": 5, //+1 fam exp
		"person": 1, //2 stench res
		"phallic": 10, //10 moxie
		"polygonal": 2, //4 sleaze res
		"reallyevil": 1000, //-5 combat
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
		"bite": 30, //weapon dmg
		"cantalk": 20, //100% max mp
		"cold": 2, //4 hot res
		"cute": 37.5, //25% moxie
		"edible": 150, //30% booze drops
		"evil": 30, //20 spooky dmg
		"fast": 50, //100% initiative
		"flies": 20, //20 moxie
		"food": 250, //50% food drops
		"good": 20, //10 fam weight
		"hard": 75, //50% muscle
		"hasbones": 5, //50% dmg to skeletons
		"hasclaws": 10, //50% weapon drop
		"haseyes": 1000, //+5% combat
		"hashands": 75, //15% item drop
		"haslegs": 5, //25% gear drop
		"hasshell": 20, //20 DR
		"hasstinger": 2, //2x crit hit chance
		"haswings": 25, //50% init
		"hot": 1, //2 cold res
		"insect": 5, //1 fam exp
		"isclothes": 5, //25% pant drop
		"mineral": 20, //20 DR
		"object": 2, //4 stench res
		"orb": 10, //10 myst
		"organic": 1, //10 fam dmg
		"person": 30, //30% meat drop
		"phallic": 5, //5 pool skill
		"polygonal": 15, //10 sleaze dmg
		"reallyevil": 30, //20 weapon dmg
		"robot": 30, //20 hot dmg
		"sentient": 75, //50% myst
		"software": 75, //20-30 mp regen
		"spooky": 5, //50 ghost dmg
		"stench": 1000, //+5% combat
		"swims": 15, //10 cold dmg
		"technological": 15, //10-20 hp regen
		"undead": 3, //30 dmg to undead
		"vegetable": 1, //2 sleaze res
		"wearsclothes": 50, //50% max hp
	};
	//foreach counters
	int f = 0; //familiars
	int i = 0; //instrinsic
	int d = 0; //damage in combat
	int l = 0; //left nipple
	int r = 0; //right nipple
	int c = 0; //combat skills
	foreach fam in $familiars[]
	{
		if(have_familiar(fam))
		{
			famAttributes[f] = {fam:fam.attributes};
			f++;
		}
	}
	foreach j, fam, attr in famAttributes
	{
		string[int] attrs = split_string(attr,";");
		foreach k, a in attrs
		{
			if(a == "technological")
			{
				intrinsicFams[i][fam] += 40;
			}
			if(a == "haseyes")
			{
				intrinsicFams[i][fam] += 30;
			}
			if(a == "object")
			{
				intrinsicFams[i][fam] += 10;
			}
			auto_log_info(fam + ":" + intrinsicFams[i][fam]);
			i++;
		}
	}
}

boolean zooGraftFam()
{
	/*Body parts are identified by number
	1 = head
	2 = left shoulder
	3 = right shoulder
	4 = left hand
	5 = right hand
	6 = left nipple
	7 = right nipple
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
	//Ideally, we get the attributes of all familiars we have and rank them by what is best in each slot and level them from there
	//We need access to familiar tags. There is this information already in familiars.txt in KoLMafia, we just need to parse it
	string[familiar] graftFam = {
		$familiar[oily woim]: "rbuff",
		$familiar[killer bee]: "rbuff",
		$familiar[mosquito]: "rbuff",
		$familiar[helix fossil]: "rbuff",
		$familiar[stab bat]: "lbuff",
		$familiar[mechanical songbird]: "intrinsic",
		$familiar[autonomous disco ball]: "intrinsic",
		$familiar[scary death orb]: "intrinsic",
		$familiar[smiling rat]: "intrinsic",
		$familiar[jumpsuited hound dog]: "intrinsic",
		$familiar[baby z-rex]: "intrinsic",
		$familiar[exotic parrot]: "intrinsic",
		$familiar[quantum entangler]: "combat",
		$familiar[magimechtech micromechamech]: "combat"
	};
	foreach fam, bodypart in graftFam
	{
		if(familiar_weight(fam) < get_property("auto_lastGraft").to_int()) //Use Mafia pref once that's a thing
		{
			//can only graft if the fam is higher than the level at the last graft
			continue;
		}
		string auto_grafts = get_property("auto_grafts"); //Use Mafia pref once that's a thing
		int famnumber = to_int(fam);
		int bodyPartNum;
		foreach i, bp in bodyPartType
		{
			if(contains_text(auto_grafts,i))
			{
				continue;
			}
			else if(bp == bodypart)
			{
				bodyPartNum = i;
				break;
			}
		}
		string temp = visit_url("choice.php?pwd=&whichchoice=1553&option=1&slot=" + bodyPartNum + "&fam=" + famnumber, true);
		auto_log_info("Grafting a " + fam.to_string() + " to you", "blue");
		handleTracker(fam,"Grafted to " + bodyPartName[bodyPartNum],"auto_otherstuff");
		return true;
	}

	return false;
}

boolean zooBoostWeight(familiar f, int target_weight)
{
	return false;
}

skill getZooKickYR()
{
	// Optimise countdowns here once Mafia has that info
	if (leftKickHasYellowRay()) {
		return $skill[left \ kick];
	}
	if (rightKickHasYellowRay()) {
		return $skill[right \ kick];
	}
	return $skill[none];
}

skill getZooKickSniff()
{
	if (leftKickHasSniff()) {
		return $skill[left \ kick];
	}
	if (rightKickHasSniff()) {
		return $skill[right \ kick];
	}
	return $skill[none];
}

skill getZooKickBanish()
{
	if (leftKickHasBanish()) {
		return $skill[left \ kick];
	}
	if (rightKickHasBanish()) {
		return $skill[right \ kick];
	}
	return $skill[none];
}

skill getZooKickPickpocket()
{
	if (leftKickHasPickpocket()) {
		return $skill[left \ kick];
	}
	if (rightKickHasPickpocket()) {
		return $skill[right \ kick];
	}
	return $skill[none];
}

skill getZooKickFreeKill()
{
	if (leftKickHasFreeKill()) {
		return $skill[left \ kick];
	}
	if (rightKickHasFreeKill()) {
		return $skill[right \ kick];
	}
	return $skill[none];
}

skill getZooBestPunch(monster m)
{
	return $skill[left \ punch];
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

boolean leftKickHasYellowRay()
{
	return true;
}

boolean leftKickHasBanish()
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

boolean rightKickHasYellowRay()
{
	return false;
}

boolean rightKickHasBanish()
{
	return have_effect($effect[Everything Looks Blue]) <= 0;
}

boolean rightKickHasPickpocket()
{
	return false;
}

boolean rightKickHasFreeKill()
{
	return false;
}
