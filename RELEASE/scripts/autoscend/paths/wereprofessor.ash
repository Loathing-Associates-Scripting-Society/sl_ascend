boolean in_wereprof()
{
	return my_path() == $path[WereProfessor];
}

void wereprof_initializeSettings()
{
	if(!in_wereprof())
	{
		return;
	}
	set_property("auto_wandOfNagamar", false);		//wand not used in this path
	set_property("auto_wereprof_smashedequip", ""); //string used for when we find smashed equipment so we know we don't need to look there
}

boolean is_werewolf()
{
	if(!in_wereprof())
	{
		return false;
	}
	if(have_effect($effect[Savage Beast]) > 0)
	{
		return true;
	}
	return false;
}

void wereprof_buySkills()
{
	if(!in_wereprof())
	{
		return;
	}
	int rp = get_property("wereProfessorResearchPoints").to_int();
	if(is_werewolf() || rp == 0)
	{
		return;
	}
	boolean do_skills = true;
	if((!is_werewolf() && get_property("wereProfessorTransformTurns") > 1))
	{
		do_skills = false; //Want as many RP as possible before looping through the skills
	}
	if(!is_werewolf() && organsFull() && my_adventures() <= auto_advToReserve() && (!contains_text(get_property("beastSkillsKnown").to_string(), "stomach3") || !contains_text(get_property("beastSkillsKnown").to_string(), "liver3")))
	{
		do_skills = true; //If organs are full, should do skills if we need more organ space and don't have all organ expanding skills and limited adventures left
	}
	/* Taken from wereprofessor.txt in Mafia src
	# Muscle Skill Tree
	mus1	10	none	Osteocalcin injection	Mus +20%
	mus2	20	mus1	Somatostatin catalyst	Mus +30%
	mus3	30	mus2	Endothelin suspension	Mus +50%
	rend1	20	mus3	Ultraprogesterone potion	Rend (Phys)
	rend2	30	rend1	Lactide blocker	Increase damage
	rend3	40	rend2	Haemostatic membrane treatment	Restores HP
	slaughter	100	rend3	Norepinephrine transfusion	Slaughter (Instant)
	hp1	20	mus3	Synthetic prostaglandin	Max HP +20%
	hp2	30	hp1	Leukotriene elixir	Max HP +30%
	hp3	40	hp2	Thromboxane inhibitor	Max HP +50%
	skin1	40	hp3	Calcitonin powder	DR 5
	skin2	50	skin1	Enkephalin activator	DR 10
	skin3	60	skin2	Oxytocin inversion	DR 15
	skinheal	100	skin3	Hemostatic accelerant	Regen 8-10 HP
	stomach1	40	hp3	Triiodothyronine accelerator	Stomach +3
	stomach2	50	stomach1	Thyroxine supplements	Stomach +3
	stomach3	60	stomach2	Amyloid polypeptide mixture	Stomach +3
	feed	100	stomach3	Cholecystokinin antagonist	(Unimplemented)

	# Mysticality Skill Tree
	myst1	10	none	Galanin precipitate	Myst +20%
	myst2	20	myst1	Cortistatin blocker	Myst +30%
	myst3	30	myst2	Prolactin inhibitor	Myst +50%
	bite1	20	myst3	Fluoride rinse	Bite (Stench)
	bite2	30	bite1	Proton pump eliminator	Add (Sleaze)
	bite3	40	bite2	Bisphosphonate drip	Increase damage
	howl	100	bite3	Albuterol innundation	Howl (Stun)
	res1	20	myst3	Omega-3 megadose	Resist All +20%
	res2	30	res1	Omega-6 hyperdose	Resist All +20%
	res3	40	res2	Omega-9 omegadose	Resist All +20%
	items1	40	res3	Diphenhydramine eyedrops	Item Drop 25%
	items2	50	items1	Carbinoxamine eye wash	Item Drop +25%
	items3	60	items2	Intraocular cyproheptadine injections	Item Drop +25%
	hunt	100	items3	Phantosmic tincture	Hunt (Olfaction)
	ml1	40	res3	Anabolic megatestosterone	ML +10
	ml2	50	ml1	Hyperadrenal Pheremones	ML +15
	ml3	60	ml2	Synthetic Rhabdovirus	ML +25
	feasting	100	ml3	Peptide catalyst	Regain more HP

	# Moxie Skill Tree
	mox1	10	none	Dopamine slurry	Mox +20% 
	mox2	20	mox1	Relaxin balm	Mox +30%
	mox3	30	mox2	Melatonin suppositories	Mox +50%
	kick1	20	mox3	Hamstring-tightening solution	Kick (Delevel)
	kick2	30	kick1	Gluteal 4-Androstenediol inection	Improve Kick
	kick3	40	kick2	Subcutaneous dimethandrolone implant	Kick (Stun)
	punt	100	kick3	Novel catecholamine synthesis	Punt (Banish)
	init1	20	mox3	Adrenal decoction	Init +50%
	init2	30	init1	Adrenal distillate	Init +50%
	init3	40	init2	Concentrated adrenaline extract	Init +100%
	meat1	40	init3	Leptin modulator	Meat Drop +25%
	meat2	50	meat1	Carnal dehydrogenase infusion	Meat Drop +50%
	meat3	60	meat2	Dihydrobenzophenanthridine injection	Meat Drop +75%
	perfecthair	100	meat3	Janus kinase blockers	+5 Stats/Fight
	liver1	40	init3	Glucagon condensate	Liver +3
	liver2	50	liver1	Secretin agonist	Liver +3
	liver3	60	liver2	Synthetic aldosterone	Liver +3
	pureblood	100	liver3	Synthroid-parathormone cocktail	Shorten ELR
	*/
	int[string] rpcost = {"stomach3": 60, "liver3": 60, "stomach2": 50, "liver2":50, "stomach1": 40, "liver1": 40, "hp3": 40, "init3": 40, "hp2": 30, "init2": 30,
	"hp1": 20, "init1": 20, "mus3": 30, "mox3": 30, "mus2": 20, "mox2": 20, "mus1": 10, "mox1": 10, "punt": 100, "slaughter": 100, "hunt": 100, "kick3": 40, "kick2": 30,
	"kick1": 20, "rend3": 40, "rend2": 30, "rend1": 20, "items3": 60, "items2": 50, "items1": 40, "res3": 40, "res2": 30, "res1": 20, "myst3": 30, "myst2": 20, "myst1": 10,
	"bite3": 40, "bite2": 30, "bite1": 20, "perfecthair": 100, "meat3": 60, "meat2": 50, "meat1": 40, "ml3": 60, "ml2": 50, "ml1": 40, "skin3": 60, "skin2": 50, "skin1": 40,
	"pureblood": 100, "feasting": 100, "skinheal": 100, "howl": 100, "feed": 100};
	if(do_skills)
	{
		while(rp > 0)
		{
			foreach sk, cost in rpcost
			{
				if(contains_text(get_property("beastSkillsAvailable").to_string(), sk) && cost < rp)
				{
					cli_execute('wereprofessor research ' + sk);
					break;
				}
			}
			return;
		}
	}
}

boolean wereprof_haveEquip()
{
	//Only care about the final equipment
	if(!possessEquipment($item[triphasic molecular oculus]) || !possessEquipment($item[irresponsible-tension exoskeleton]))
	{
		return false;
	}
	return true;
}

void wereprof_buyEquip()
{
	if(is_werewolf() || wereprof_haveEquip())
	{
		return;
	}
	
	//There's probably a better way to do this
	while(item_amount($item[smashed scientific equipment]) > 0 && !possessEquipment($item[triphasic molecular oculus]) && !possessEquipment($item[irresponsible-tension exoskeleton]))
	{
		if(!possessEquipment($item[biphasic molecular oculus]) && !possessEquipment($item[triphasic molecular oculus]))
		{
			cli_execute('tinker biphasic molecular oculus');
		}
		if(possessEquipment($item[biphasic molecular oculus]) && !possessEquipment($item[triphasic molecular oculus]))
		{
			cli_execute('tinker triphasic molecular oculus');
		}
		if(!possessEquipment($item[high-tension exoskeleton]) && !possessEquipment($item[ultra-high-tension exoskeleton]) && !possessEquipment($item[irresponsible-tension exoskeleton]))
		{
			cli_execute('tinker high-tension exoskeleton');
		}
		if(possessEquipment($item[high-tension exoskeleton]) && !possessEquipment($item[ultra-high-tension exoskeleton]) && !possessEquipment($item[irresponsible-tension exoskeleton]))
		{
			cli_execute('tinker ultra-high-tension exoskeleton');
		}
		if(!possessEquipment($item[high-tension exoskeleton]) && possessEquipment($item[ultra-high-tension exoskeleton]) && !possessEquipment($item[irresponsible-tension exoskeleton]))
		{
			cli_execute('tinker irresponsible-tension exoskeleton');
		}
	}
}

boolean wereprof_oculus()
{
	if(!in_wereprof())
	{
		return false;
	}
	if(have_equipped($item[biphasic molecular oculus]) || have_equipped($item[triphasic molecular oculus]))
	{
		return true;
	}
	return false;
}

boolean LM_wereprof()
{
	if(!in_wereprof())
	{
		return false;
	}
	if(is_werewolf())
	{
		return false;
	}
	if(get_property("auto_wereprof_init").to_boolean())
	{
		return false;
	}

	auto_log_info("Getting skills", "blue");
	wereprof_buySkills();
	auto_log_info("Buying an oven", "blue");
	if(ovenHandle()) //buy an oven ASAP
	{
		set_property("auto_wereprof_init", true);
		return true;
	}
	return false;
}

boolean LX_wereprof_getSmashedEquip()
{
	if(!in_wereprof())
	{
		return false;
	}
	if(!is_werewolf() || wereprof_haveEquip())
	{
		return false;
	}

	location[int] smashedLocs;
	string alreadySmashedLocs = get_property("antiScientificMethod").to_string();
	//There's a couple other locations, but we shouldn't EVER visit them
	foreach sl in $locations[The Hidden Hospital, The Castle in the Clouds in the Sky (Top Floor), Noob Cave, The Haunted Pantry, The Thinknerd Warehouse, Vanya's Castle]
	{
		if(!contains_text(alreadySmashedLocs,sl.to_string()) && zone_available(sl))
		{
			auto_log_info("Going for Smashed Scientific Equipment in " + sl.to_string(), "blue");
			return autoAdv(1, sl);
		}
	}
	return false;
}