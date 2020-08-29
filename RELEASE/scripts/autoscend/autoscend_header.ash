//	This is the primary (or will be) header file for autoscend.
//	All potentially cross-dependent functions should be defined here such that we can use them from
//	other scripts without the circular dependency issue. Thanks Ultibot for the advice regarding this.
//	Documentation can go here too, I suppose.
//	All functions that are defined outside of autoscend must include a note regarding where they come from
//		Seriously, it\'s rude not to.

//	Question Functions
//	Denoted as L<classification>[<path>]_<name>:
//		<classification>: Level to be used (Numeric, X for any). A for entire ascension.
//		<classification>: M for most of ascension, "sc" for Seal Clubber only
//		<path>: [optional] indicates path to be used in. "ed" for ed, "cs" for community service
//			Usually separated with _
//******************************************************************************************************

//Defined in autoscend.ash
void initializeSettings();
void initializeSession();
int auto_advToReserve();
boolean auto_unreservedAdvRemaining();
boolean LX_burnDelay();
boolean LX_universeFrat();
boolean LX_faxing();
int pullsNeeded(string data);
boolean tophatMaker();
int handlePulls(int day);
boolean LX_doVacation();
boolean fortuneCookieEvent();
void initializeDay(int day);
boolean dailyEvents();
boolean doBedtime();
boolean isAboutToPowerlevel();
boolean LX_attemptPowerLevel();
boolean disregardInstantKarma();
int auto_freeCombatsRemaining();
int auto_freeCombatsRemaining(boolean print_remaining_fights);
boolean LX_freeCombats();
boolean LX_freeCombats(boolean powerlevel);
boolean Lsc_flyerSeals();
boolean LX_hardcoreFoodFarm();
boolean LX_craftAcquireItems();
boolean councilMaintenance();
boolean adventureFailureHandler();
boolean beatenUpResolution();
int speculative_pool_skill();
boolean autosellCrap();
void print_header();
void resetState();
boolean doTasks();
void auto_begin();
void print_help_text();
void sad_times();
void safe_preference_reset_wrapper(int level);

//needs sorting
boolean LA_cs_communityService();							//Defined in autoscend/auto_community_service.ash
boolean LM_edTheUndying();									//Defined in autoscend/auto_edTheUndying.ash
boolean LX_fcle();
boolean LX_nastyBooty();
boolean LX_attemptFlyering();
boolean witchessFights();
//tosort ending

//Defined in autoscend/quests/level_02.ash
boolean L2_mosquito();

//Defined in autoscend/quests/level_03.ash
boolean auto_tavern();
boolean L3_tavern();

//Defined in autoscend/quests/level_04.ash
boolean L4_batCave();

//Defined in autoscend/quests/level_05.ash
boolean L5_getEncryptionKey();
boolean L5_findKnob();
boolean L5_haremOutfit();
boolean L5_goblinKing();
boolean L5_slayTheGoblinKing();

//Defined in autoscend/quests/level_06.ash
boolean L6_friarsGetParts();
boolean L6_dakotaFanning();

//Defined in autoscend/quests/level_07.ash
boolean L7_crypt();

//Defined in autoscend/quests/level_08.ash
boolean L8_trapperStart();
int getCellToMine(item oreGoal);
boolean L8_trapperAdvance();
boolean L8_getGoatCheese();
boolean L8_getMineOres();
void itznotyerzitzMineChoiceHandler(int choice);
boolean L8_trapperGround();
boolean L8_trapperExtreme();
void theeXtremeSlopeChoiceHandler(int choice);
boolean L8_trapperNinjaLair();
boolean L8_trapperGroar();
boolean L8_trapperQuest();

//Defined in autoscend/quests/level_09.ash
boolean LX_loggingHatchet();
boolean L9_leafletQuest();
void L9_chasmMaximizeForNoncombat();
boolean L9_chasmBuild();
boolean L9_aBooPeak();
boolean L9_twinPeak();
boolean L9_oilPeak();
boolean L9_highLandlord();

//Defined in autoscend/quests/level_10.ash
boolean L10_plantThatBean();
boolean L10_airship();
boolean L10_basement();
boolean L10_ground();
boolean L10_topFloor();
boolean L10_holeInTheSkyUnlock();

//Defined in autoscend/quests/level_11.ash
int shenItemsReturned();
boolean[location] shenSnakeLocations(int day, int n_items_returned);
boolean[location] shenZonesToAvoidBecauseMaybeSnake();
boolean shenShouldDelayZone(location loc);

boolean LX_unlockHiddenTemple();
boolean LX_unlockManorSecondFloor();
boolean LX_unlockHauntedLibrary();
boolean LX_unlockHauntedBilliardsRoom(boolean forceDelay);
boolean LX_unlockHauntedBilliardsRoom();
boolean LX_spookyravenManorFirstFloor();
boolean LX_danceWithLadySpookyraven();
boolean LX_getLadySpookyravensFinestGown();
boolean LX_getLadySpookyravensDancingShoes();
boolean LX_getLadySpookyravensPowderPuff();
boolean LX_spookyravenManorSecondFloor();
boolean L11_palindome();
boolean L11_hiddenCity();
boolean L11_hiddenTavernUnlock();
boolean L11_hiddenTavernUnlock(boolean force);
boolean L11_blackMarket();
boolean L11_forgedDocuments();
boolean L11_getUVCompass();										//Defined in autoscend/quests/level_11.ash
boolean L11_aridDesert();
boolean L11_mcmuffinDiary();
boolean L11_unlockHiddenCity();
boolean L11_hiddenCityZones();
boolean L11_talismanOfNam();
boolean L11_shenStartQuest();
boolean L11_shenCopperhead();
boolean L11_ronCopperhead();
boolean L11_redZeppelin();
boolean L11_mauriceSpookyraven();
boolean L11_unlockPyramid();
boolean L11_unlockEd();
boolean L11_defeatEd();
boolean L11_getBeehive();

// Used in autoscend/quests/level_12.ash
record WarPlan
{
	boolean do_arena;
	boolean do_junkyard;
	boolean do_lighthouse;
	boolean do_orchard;
	boolean do_nuns;
	boolean do_farm;
};

WarPlan warplan_from_bitmask(int mask);						//Defined in autoscend/quests/level_12.ash
int bitmask_from_warplan(WarPlan plan);						//Defined in autoscend/quests/level_12.ash

string auto_warSide();										//Defined in autoscend/quests/level_12.ash
int auto_warSideQuestsDone();								//Defined in autoscend/quests/level_12.ash
WarPlan auto_warSideQuestsState();							//Defined in autoscend/quests/level_12.ash
int auto_warEnemiesRemaining();								//Defined in autoscend/quests/level_12.ash
int auto_warKillsPerBattle();								//Defined in autoscend/quests/level_12.ash
int auto_warKillsPerBattle(int sidequests);					//Defined in autoscend/quests/level_12.ash
int auto_estimatedAdventuresForChaosButterfly();			//Defined in autoscend/quests/level_12.ash
int auto_estimatedAdventuresForDooks();						//Defined in autoscend/quests/level_12.ash
WarPlan auto_bestWarPlan();									//Defined in autoscend/quests/level_12.ash
int auto_warTotalBattles(WarPlan plan, int remaining);		//Defined in autoscend/quests/level_12.ash
int auto_warTotalBattles(WarPlan plan);						//Defined in autoscend/quests/level_12.ash
boolean warAdventure();										//Defined in autoscend/quests/level_12.ash
boolean haveWarOutfit();									//Defined in autoscend/quests/level_12.ash
boolean warOutfit(boolean immediate);
boolean warOutfit();										//Defined in autoscend/quests/level_12.ash
boolean L12_sonofaPrefix();									//Defined in autoscend/quests/level_12.ash
boolean L12_themtharHills();								//Defined in autoscend/quests/level_12.ash
boolean LX_obtainChaosButterfly();							//Defined in autoscend/quests/level_12.ash
boolean L12_farm();											//Defined in autoscend/quests/level_12.ash
boolean L12_lastDitchFlyer();								//Defined in autoscend/quests/level_12.ash
boolean L12_flyerBackup();									//Defined in autoscend/quests/level_12.ash
boolean L12_flyerFinish();									//Defined in autoscend/quests/level_12.ash
boolean L12_preOutfit();									//Defined in autoscend/quests/level_12.ash
boolean L12_getOutfit();									//Defined in autoscend/quests/level_12.ash
boolean L12_startWar();										//Defined in autoscend/quests/level_12.ash
boolean L12_filthworms();									//Defined in autoscend/quests/level_12.ash
boolean L12_sonofaBeach();									//Defined in autoscend/quests/level_12.ash
boolean L12_sonofaFinish();									//Defined in autoscend/quests/level_12.ash
boolean L12_gremlins();										//Defined in autoscend/quests/level_12.ash
boolean L12_orchardFinalize();								//Defined in autoscend/quests/level_12.ash
boolean L12_finalizeWar();									//Defined in autoscend/quests/level_12.ash
boolean L12_clearBattlefield();

//Defined in autoscend/quests/level_13.ash
boolean LX_getDigitalKey();
boolean LX_getStarKey();
boolean L13_sorceressDoor();
boolean L13_towerNSContests();
boolean L13_towerNSHedge();
boolean L13_towerNSTower();
boolean L13_towerNSNagamar();
boolean L13_towerNSFinal();
boolean L13_ed_councilWarehouse();
boolean L13_ed_towerHandler();

//Defined in autoscend/quests/level_any.ash
boolean LX_bitchinMeatcar();
boolean LX_unlockDesert();
boolean LX_desertAlternate();
boolean LX_islandAccess();
boolean startHippyBoatmanSubQuest();
boolean LX_hippyBoatman();
boolean LX_lockPicking();
float estimateDailyDungeonAdvNeeded();
boolean LX_fatLootToken();
boolean LX_dailyDungeonToken();
boolean LX_dolphinKingMap();
boolean LX_meatMaid();
boolean dependenceDayClovers();

//Defined in autoscend/quests/optional.ash
boolean LX_artistQuest();
boolean LX_unlockThinknerdWarehouse(boolean spend_resources);
boolean LX_melvignShirt();
boolean LX_steelOrgan();
boolean LX_guildUnlock();
boolean startArmorySubQuest();
boolean startGalaktikSubQuest();
boolean finishGalaktikSubQuest();
boolean startMeatsmithSubQuest();
boolean finishMeatsmithSubQuest();
boolean LX_pirateOutfit();
string beerPong(string page);
string tryBeerPong();
int numPirateInsults();
boolean LX_joinPirateCrew();
boolean LX_fledglingPirateIsYou();
boolean LX_unlockBelowdecks();
boolean LX_pirateQuest();
boolean LX_acquireEpicWeapon();
boolean LX_NemesisQuest();

//Defined in autoscend/iotms/clan.ash
int[item] auto_get_clan_lounge();
boolean handleFaxMonster(monster enemy);
boolean handleFaxMonster(monster enemy, string option);
boolean handleFaxMonster(monster enemy, boolean fightIt);
boolean handleFaxMonster(monster enemy, boolean fightIt, string option);
boolean [location] get_floundry_locations();
int changeClan(string clanName);
int changeClan(int toClan);
int changeClan();
int hotTubSoaksRemaining();
boolean isHotTubAvailable();
int doHottub();
boolean isSpeakeasyDrink(item drink);
boolean canDrinkSpeakeasyDrink(item drink);
boolean drinkSpeakeasyDrink(item drink);
boolean drinkSpeakeasyDrink(string drink);
boolean zataraAvailable();
boolean zataraSeaside(string who);
boolean zataraClanmate(string who);
boolean eatFancyDog(string dog);
boolean auto_floundryUse();
boolean auto_floundryAction();
boolean auto_floundryAction(item it);

//Defined in autoscend/iotms/auto_elementalPlanes.ash
item[element] getCharterIndexable();
boolean elementalPlanes_initializeSettings();
boolean elementalPlanes_access(element ele);
boolean elementalPlanes_takeJob(element ele);
boolean dinseylandfill_garbageMoney();
boolean getDiscoStyle(int choice);
boolean getDiscoStyle();
boolean volcano_lavaDogs();
boolean volcano_bunkerJob();

//Defined in autoscend/iotms/auto_eudora.ash
boolean eudora_available();
boolean[item] eudora_initializeSettings();
item eudora_current();
int[item] eudora_xiblaxian();

//Defined in autoscend/iotms/auto_floristfriar.ash
boolean didWePlantHere(location loc);
void trickMafiaAboutFlorist();
void oldPeoplePlantStuff();

//Defined in autoscend/iotms/auto_mr2011.ash
boolean isClipartItem(item it);

//Defined in autoscend/iotms/auto_mr2012.ash
boolean auto_reagnimatedGetPart();
boolean handleRainDoh();

//Defined in autoscend/iotms/auto_mr2013.ash
void handleJar();
void makeStartingSmiths();

//Defined in autoscend/iotms/auto_mr2014.ash
boolean handleBjornify(familiar fam);
boolean considerGrimstoneGolem(boolean bjornCrown);
boolean dna_startAcquire();
boolean dna_generic();
boolean dna_sorceressTest();
boolean dna_bedtime();
boolean xiblaxian_makeStuff();
boolean LX_ornateDowsingRod(boolean doing_desert_now);
boolean fancyOilPainting();

//Defined in autoscend/iotms/auto_mr2015.ash
boolean mayo_acquireMayo(item it);
boolean auto_barrelPrayers();
boolean auto_mayoItems();
boolean chateaumantegna_available();
void chateaumantegna_useDesk();
boolean chateaumantegna_havePainting();
boolean chateaumantegna_usePainting(string option);
boolean chateaumantegna_usePainting();
boolean[item] chateaumantegna_decorations();
void chateaumantegna_buyStuff(item toBuy);
boolean chateaumantegna_nightstandSet();
boolean chateauPainting();
boolean deck_available();
int deck_draws_left();
boolean deck_draw();
boolean deck_cheat(string cheat);
boolean deck_useScheme(string action);
boolean adjustEdHat(string goal);
boolean resolveSixthDMT();
boolean LX_dinseylandfillFunbucks();

//Defined in autoscend/autoscend_migration.ash
string autoscend_current_version();
string autoscend_previous_version();
boolean autoscend_needs_update();
boolean autoscend_migrate();

// Defined in autoscend/auto_adventure.ash
boolean autoAdv(int num, location loc, string option);		//num is ignored
boolean autoAdv(int num, location loc);						//num is ignored
boolean autoAdv(location loc);
boolean autoAdv(location loc, string option);
boolean autoAdvBypass(int urlGetFlags, string[int] url, location loc, string option);//Defined in autoscend/auto_adventure.ash
boolean autoAdvBypass(string url, location loc);
boolean autoAdvBypass(string url, location loc, string option);
boolean autoAdvBypass(int snarfblat, location loc);
boolean autoAdvBypass(int snarfblat, location loc, string option);
boolean autoAdvBypass(int snarfblat);
boolean autoAdvBypass(string url);
boolean autoAdvBypass(int snarfblat, string option);
boolean autoAdvBypass(string url, string option);

//Defined in autoscend/auto_consume.ash
boolean autoDrink(int howMany, item toDrink);
boolean autoOverdrink(int howMany, item toOverdrink);
boolean autoChew(int howMany, item toChew);
boolean autoEat(int howMany, item toEat);
boolean autoEat(int howMany, item toEat, boolean silent);
boolean acquireMilkOfMagnesiumIfUnused(boolean useAdv);
boolean consumeMilkOfMagnesiumIfUnused();
boolean canDrink(item toDrink);
boolean canEat(item toEat);
boolean canChew(item toChew);
void consumeStuff();
boolean consumeFortune();
boolean loadConsumables(item[int] item_backmap, int[int] cafe_backmap, float[int] adv, int[int] inebriety);
void auto_autoDrinkNightcap(boolean simulate);
boolean auto_autoConsumeOne(string type, boolean simulate);
boolean auto_knapsackAutoConsume(string type, boolean simulate);

// Defined in autoscend/auto_equipment.ash
string getMaximizeSlotPref(slot s);
boolean autoEquip(slot s, item it);
boolean autoEquip(item it);
boolean autoForceEquip(slot s, item it);
boolean autoForceEquip(item it);
boolean autoOutfit(string toWear);
boolean autoStripOutfit(string toRemove);
boolean tryAddItemToMaximize(slot s, item it);
void resetMaximize();
void addToMaximize(string add);
void removeFromMaximize(string rem);
boolean maximizeContains(string check);
boolean simMaximize();
boolean simMaximizeWith(string add);
float simValue(string modifier);
void equipMaximizedGear();
void equipOverrides();
int equipmentAmount(item equipment);
boolean possessEquipment(item equipment);
boolean possessOutfit(string outfit, boolean checkCanEquip);
boolean possessOutfit(string outfit);
void equipBaseline();
void ensureSealClubs();
void equipRollover();

// Defined in autoscend/auto_familiar.ash
boolean is100FamRun();
boolean pathAllowsFamiliar();
boolean auto_have_familiar(familiar fam);
boolean canChangeFamiliar();
boolean canChangeToFamiliar(familiar target);
familiar lookupFamiliarDatafile(string type);
boolean handleFamiliar(string type);
boolean handleFamiliar(familiar fam);
boolean autoChooseFamiliar(location place);
boolean haveSpleenFamiliar();
boolean wantCubeling();
void preAdvUpdateFamiliar(location place);

// Defined in autoscend/auto_providers.ash
float providePlusCombat(int amt, boolean doEquips, boolean speculative);
boolean providePlusCombat(int amt, boolean doEquips);
boolean providePlusCombat(int amt);
float providePlusNonCombat(int amt, boolean doEquips, boolean speculative);
boolean providePlusNonCombat(int amt, boolean doEquips);
boolean providePlusNonCombat(int amt);
float provideInitiative(int amt, boolean doEquips, boolean speculative);
boolean provideInitiative(int amt, boolean doEquips);
int [element] provideResistances(int [element] amt, boolean doEquips, boolean speculative);
boolean provideResistances(int [element] amt, boolean doEquips);
float [stat] provideStats(int [stat] amt, boolean doEquips, boolean speculative);
boolean provideStats(int [stat] amt, boolean doEquips);
float provideMuscle(int amt, boolean doEquips, boolean speculative);
boolean provideMuscle(int amt, boolean doEquips);
float provideMysticality(int amt, boolean doEquips, boolean speculative);
boolean provideMysticality(int amt, boolean doEquips);
float provideMoxie(int amt, boolean doEquips, boolean speculative);
boolean provideMoxie(int amt, boolean doEquips);

//Wrapper for get_campground(), primarily deals with the oven issue in Ed.
//Also uses Garden item as identifier for the garden in addition to what get_campground() does
int[item] auto_get_campground();					//Defined in autoscend/auto_util.ash


//Returns how many Hero Keys and Fat Loot tokens we have.
//effective count (with malware) vs true count.
int towerKeyCount(boolean effective);			//Defined in autoscend/auto_util.ash
int towerKeyCount();							//Defined in autoscend/auto_util.ash

//Determines if we need ore for the trapper or not.
boolean needOre();								//Defined in autoscend/auto_util.ash

//Wrapper for my_path(), in case there are delays in Mafia translating path values
string auto_my_path();							//Defined in autoscend/auto_util.ash

//Visits gnasir, can change based on path
void auto_visit_gnasir();

//Item disambiguation functions
boolean hasSpookyravenLibraryKey();				//Defined in autoscend/auto_util.ash
boolean hasILoveMeVolI();						//Defined in autoscend/auto_util.ash
boolean useILoveMeVolI();						//Defined in autoscend/auto_util.ash

//Are we expecting a Protonic Accelerator Pack ghost report?
boolean expectGhostReport();					//Defined in autoscend/iotms/auto_mr2016.ash

// Restoration (hp/mp) functions
// Defined in autoscend/auto_restore.ash
void invalidateRestoreOptionCache();
boolean acquireMP();
boolean acquireMP(int goal);
boolean acquireMP(int goal, int meat_reserve);
boolean acquireMP(int goal, int meat_reserve, boolean freeRest);
boolean acquireMP(float goalPercent);
boolean acquireMP(float goalPercent, int meat_reserve);
boolean acquireMP(float goalPercent, int meat_reserve, boolean freeRest);
boolean acquireHP();
boolean acquireHP(int goal);
boolean acquireHP(int goal, int meat_reserve);
boolean acquireHP(int goal, int meat_reserve, boolean freeRest);
boolean acquireHP(float goalPercent);
boolean acquireHP(float goalPercent, int meat_reserve);
boolean acquireHP(float goalPercent, int meat_reserve, boolean freeRest);
float mp_regen();
float hp_regen();
int doRest();
boolean haveAnyIotmAlternativeRestSiteAvailable();
boolean doFreeRest();
boolean haveFreeRestAvailable();
int freeRestsRemaining();
boolean uneffect(effect toRemove);
boolean useCocoon();


//Large pile dump.
boolean L9_ed_chasmBuildClover(int need);					//Defined in autoscend/auto_edTheUndying.ash
boolean L9_ed_chasmStart();									//Defined in autoscend/auto_edTheUndying.ash
boolean LM_boris();											//Defined in autoscend/auto_boris.ash
boolean LM_fallout();										//Defined in autoscend/auto_fallout.ash
boolean LM_jello();											//Defined in autoscend/auto_jellonewbie.ash
boolean LM_pete();											//Defined in autoscend/auto_sneakypete.ash
boolean LX_ghostBusting();									//Defined in autoscend/iotms/auto_mr2016.ash
boolean LX_theSource();										//Defined in autoscend/auto_theSource.ash
familiar[int] List();										//Defined in autoscend/auto_list.ash
effect[int] List(boolean[effect] data);						//Defined in autoscend/auto_list.ash
familiar[int] List(boolean[familiar] data);					//Defined in autoscend/auto_list.ash
int[int] List(boolean[int] data);							//Defined in autoscend/auto_list.ash
item[int] List(boolean[item] data);							//Defined in autoscend/auto_list.ash
effect[int] List(effect[int] data);							//Defined in autoscend/auto_list.ash
familiar[int] List(familiar[int] data);						//Defined in autoscend/auto_list.ash
int[int] List(int[int] data);								//Defined in autoscend/auto_list.ash
item[int] List(item[int] data);								//Defined in autoscend/auto_list.ash
effect[int] ListErase(effect[int] list, int index);			//Defined in autoscend/auto_list.ash
familiar[int] ListErase(familiar[int] list, int index);		//Defined in autoscend/auto_list.ash
int[int] ListErase(int[int] list, int index);				//Defined in autoscend/auto_list.ash
item[int] ListErase(item[int] list, int index);				//Defined in autoscend/auto_list.ash
int ListFind(effect[int] list, effect what);				//Defined in autoscend/auto_list.ash
int ListFind(effect[int] list, effect what, int idx);		//Defined in autoscend/auto_list.ash
int ListFind(familiar[int] list, familiar what);			//Defined in autoscend/auto_list.ash
int ListFind(familiar[int] list, familiar what, int idx);	//Defined in autoscend/auto_list.ash
int ListFind(int[int] list, int what);						//Defined in autoscend/auto_list.ash
int ListFind(int[int] list, int what, int idx);				//Defined in autoscend/auto_list.ash
int ListFind(item[int] list, item what);					//Defined in autoscend/auto_list.ash
int ListFind(item[int] list, item what, int idx);			//Defined in autoscend/auto_list.ash
effect[int] ListInsert(effect[int] list, effect what);		//Defined in autoscend/auto_list.ash
familiar[int] ListInsert(familiar[int] list, familiar what);//Defined in autoscend/auto_list.ash
int[int] ListInsert(int[int] list, int what);				//Defined in autoscend/auto_list.ash
item[int] ListInsert(item[int] list, item what);			//Defined in autoscend/auto_list.ash
effect[int] ListInsertAt(effect[int] list, effect what, int idx);//Defined in autoscend/auto_list.ash
familiar[int] ListInsertAt(familiar[int] list, familiar what, int idx);//Defined in autoscend/auto_list.ash
int[int] ListInsertAt(int[int] list, int what, int idx);	//Defined in autoscend/auto_list.ash
item[int] ListInsertAt(item[int] list, item what, int idx);	//Defined in autoscend/auto_list.ash
effect[int] ListInsertFront(effect[int] list, effect what);	//Defined in autoscend/auto_list.ash
familiar[int] ListInsertFront(familiar[int] list, familiar what);//Defined in autoscend/auto_list.ash
int[int] ListInsertFront(int[int] list, int what);			//Defined in autoscend/auto_list.ash
item[int] ListInsertFront(item[int] list, item what);		//Defined in autoscend/auto_list.ash
effect[int] ListInsertInorder(effect[int] list, effect what);//Defined in autoscend/auto_list.ash
familiar[int] ListInsertInorder(familiar[int] list, familiar what);//Defined in autoscend/auto_list.ash
int[int] ListInsertInorder(int[int] list, int what);		//Defined in autoscend/auto_list.ash
item[int] ListInsertInorder(item[int] list, item what);		//Defined in autoscend/auto_list.ash
string ListOutput(effect[int] list);						//Defined in autoscend/auto_list.ash
string ListOutput(familiar[int] list);						//Defined in autoscend/auto_list.ash
string ListOutput(int[int] list);							//Defined in autoscend/auto_list.ash
string ListOutput(item[int] list);							//Defined in autoscend/auto_list.ash
effect[int] ListRemove(effect[int] list, effect what);		//Defined in autoscend/auto_list.ash
effect[int] ListRemove(effect[int] list, effect what, int idx);//Defined in autoscend/auto_list.ash
familiar[int] ListRemove(familiar[int] list, familiar what);//Defined in autoscend/auto_list.ash
familiar[int] ListRemove(familiar[int] list, familiar what, int idx);//Defined in autoscend/auto_list.ash
int[int] ListRemove(int[int] list, int what);				//Defined in autoscend/auto_list.ash
int[int] ListRemove(int[int] list, int what, int idx);		//Defined in autoscend/auto_list.ash
item[int] ListRemove(item[int] list, item what);			//Defined in autoscend/auto_list.ash
item[int] ListRemove(item[int] list, item what, int idx);	//Defined in autoscend/auto_list.ash
location ListOutput(location[int] list);					//Defined in autoscend/auto_list.ash
location[int] locationList();								//Defined in autoscend/auto_list.ash
location[int] List(boolean[location] data);					//Defined in autoscend/auto_list.ash
location[int] List(location[int] data);						//Defined in autoscend/auto_list.ash
location[int] ListRemove(location[int] list, location what);//Defined in autoscend/auto_list.ash
location[int] ListRemove(location[int] list, location what, int idx);//Defined in autoscend/auto_list.ash
location[int] ListErase(location[int] list, int index);		//Defined in autoscend/auto_list.ash
location[int] ListInsertFront(location[int] list, location what);//Defined in autoscend/auto_list.ash
location[int] ListInsert(location[int] list, location what);//Defined in autoscend/auto_list.ash
location[int] ListInsertAt(location[int] list, location what, int idx);//Defined in autoscend/auto_list.ash
location[int] ListInsertInorder(location[int] list, location what);//Defined in autoscend/auto_list.ash
int ListFind(location[int] list, location what);			//Defined in autoscend/auto_list.ash
int ListFind(location[int] list, location what, int idx);	//Defined in autoscend/auto_list.ash
location ListOutput(location[int] list);					//Defined in autoscend/auto_list.ash
int [item] auto_get_campground();								//Defined in autoscend/auto_util.ash
boolean basicAdjustML();									//Defined in autoscend/auto_util.ash
boolean acquireGumItem(item it);							//Defined in autoscend/auto_util.ash
boolean acquireTotem();										//Defined in autoscend/auto_util.ash
boolean acquireHermitItem(item it);							//Defined in autoscend/auto_util.ash
int cloversAvailable();									//Defined in autoscend/auto_util.ash
boolean cloverUsageInit();									//Defined in autoscend/auto_util.ash
boolean cloverUsageFinish();								//Defined in autoscend/auto_util.ash
int amountTurkeyBooze();									//Defined in autoscend/auto_util.ash
boolean awol_buySkills();									//Defined in autoscend/auto_awol.ash
boolean awol_initializeSettings();							//Defined in autoscend/auto_awol.ash
void awol_useStuff();										//Defined in autoscend/auto_awol.ash
effect awol_walkBuff();										//Defined in autoscend/auto_awol.ash
boolean backupSetting(string setting, string newValue);		//Defined in autoscend/auto_util.ash
int[monster] banishedMonsters();							//Defined in autoscend/auto_util.ash
boolean beehiveConsider();									//Defined in autoscend/auto_util.ash
int estimatedTurnsLeft();									//Defined in autoscend/auto_util.ash
boolean summonMonster();									//Defined in autoscend/auto_util.ash
boolean summonMonster(string option);						//Defined in autoscend/auto_util.ash
boolean in_tcrs();											//Defined in autoscend/auto_tcrs.ash
float tcrs_expectedAdvPerFill(string quality);				//Defined in autoscend/auto_tcrs.ash
boolean tcrs_loadCafeDrinks(int[int] cafe_backmap, float[int] adv, int[int] inebriety);	//Defined in autoscend/auto_tcrs.ash
boolean tcrs_maximize_with_items(string maximizerString);	//Defined in autoscend/auto_tcrs.ash
boolean in_koe();											//Defined in autoscend/auto_koe.ash
boolean in_zelda();											//Defined in autoscend/auto_zelda.ash
boolean in_boris();											//Defined in autoscend/auto_boris.ash
boolean borisAdjustML();									//Defined in autoscend/auto_boris.ash
void boris_buySkills();										//Defined in autoscend/auto_boris.ash
boolean borisDemandSandwich(boolean immediately);			//Defined in autoscend/auto_boris.ash
void borisWastedMP();										//Defined in autoscend/auto_boris.ash
void boris_initializeDay(int day);							//Defined in autoscend/auto_boris.ash
void boris_initializeSettings();							//Defined in autoscend/auto_boris.ash
boolean buffMaintain(effect buff, int mp_min, int casts, int turns, boolean speculative);//Defined in autoscend/auto_util.ash
boolean buffMaintain(effect buff, int mp_min, int casts, int turns);//Defined in autoscend/auto_util.ash
boolean buffMaintain(item source, effect buff, int uses, int turns, boolean speculative);//Defined in autoscend/auto_util.ash
boolean buffMaintain(skill source, effect buff, int mp_min, int casts, int turns, boolean speculative);//Defined in autoscend/auto_util.ash
boolean buyUpTo(int num, item it);							//Defined in autoscend/auto_util.ash
boolean buyUpTo(int num, item it, int maxprice);			//Defined in autoscend/auto_util.ash
boolean buy_item(item it, int quantity, int maxprice);		//Defined in autoscend/auto_util.ash
boolean buyableMaintain(item toMaintain, int howMany);		//Defined in autoscend/auto_util.ash
boolean buyableMaintain(item toMaintain, int howMany, int meatMin);//Defined in autoscend/auto_util.ash
boolean buyableMaintain(item toMaintain, int howMany, int meatMin, boolean condition);//Defined in autoscend/auto_util.ash
boolean canYellowRay(monster target); //Defined in autoscend/auto_util.ash
boolean canYellowRay();										//Defined in autoscend/auto_util.ash
boolean canReplace(monster target);	//Defined in autoscend/auto_util.ash
boolean canReplace();				//Defined in autoscend/auto_util.ash
int autoCraft(string mode, int count, item item1, item item2);//Defined in autoscend/auto_util.ash
boolean canSimultaneouslyAcquire(int[item] needed);			//Defined in autoscend/auto_util.ash
boolean clear_property_if(string setting, string cond);		//Defined in autoscend/auto_util.ash
boolean autoMaximize(string req, boolean simulate);			//Defined in autoscend/auto_util.ash
boolean autoMaximize(string req, int maxPrice, int priceLevel, boolean simulate);//Defined in autoscend/auto_util.ash
aggregate autoMaximize(string req, int maxPrice, int priceLevel, boolean simulate, boolean includeEquip);//Defined in autoscend/auto_util.ash
boolean auto_advWitchess(string target);						//Defined in autoscend/iotms/auto_mr2016.ash
boolean auto_advWitchess(string target, string option);		//Defined in autoscend/iotms/auto_mr2016.ash
int auto_advWitchessTargets(string target);					//Defined in autoscend/iotms/auto_mr2016.ash
boolean auto_autosell(int quantity, item toSell);				//Defined in autoscend/auto_util.ash
item auto_bestBadge();										//Defined in autoscend/iotms/auto_mr2016.ash
boolean auto_change_mcd(int mcd);								//Defined in autoscend/auto_util.ash
boolean auto_change_mcd(int mcd, boolean immediately);			//Defined in autoscend/auto_util.ash
boolean auto_doPrecinct();									//Defined in autoscend/iotms/auto_mr2016.ash
boolean auto_haveSourceTerminal();							//Defined in autoscend/iotms/auto_mr2016.ash
boolean auto_haveWitchess();									//Defined in autoscend/iotms/auto_mr2016.ash
void auto_process_kmail(string functionname);					//Defined in autoscend/auto_zlib.ash
boolean auto_sourceTerminalEducate(skill first);				//Defined in autoscend/iotms/auto_mr2016.ash
boolean auto_sourceTerminalEducate(skill first, skill second);//Defined in autoscend/iotms/auto_mr2016.ash
boolean auto_sourceTerminalEnhance(string request);			//Defined in autoscend/iotms/auto_mr2016.ash
int auto_sourceTerminalEnhanceLeft();							//Defined in autoscend/iotms/auto_mr2016.ash
boolean auto_sourceTerminalExtrude(string request);			//Defined in autoscend/iotms/auto_mr2016.ash
int auto_sourceTerminalExtrudeLeft();							//Defined in autoscend/iotms/auto_mr2016.ash
int[string] auto_sourceTerminalMissing();						//Defined in autoscend/iotms/auto_mr2016.ash
boolean auto_sourceTerminalRequest(string request);			//Defined in autoscend/iotms/auto_mr2016.ash
int[string] auto_sourceTerminalStatus();						//Defined in autoscend/iotms/auto_mr2016.ash
boolean clear_property_if(string setting, string cond);		//Defined in autoscend/auto_util.ash
boolean acquireTransfunctioner();							//Defined in autoscend/auto_util.ash

boolean inCasual();											//Defined in autoscend/paths/casual.ash
boolean inAftercore();										//Defined in autoscend/paths/casual.ash
boolean inPostRonin();										//Defined in autoscend/paths/casual.ash
boolean LM_canInteract();								//Defined in autoscend/paths/casual.ash

void cs_dnaPotions();										//Defined in autoscend/auto_community_service.ash
boolean cs_eat_spleen();									//Defined in autoscend/auto_community_service.ash
boolean cs_eat_stuff(int quest);							//Defined in autoscend/auto_community_service.ash
boolean cs_giant_growth();									//Defined in autoscend/auto_community_service.ash
void cs_initializeDay(int day);								//Defined in autoscend/auto_community_service.ash
void cs_make_stuff(int curQuest);							//Defined in autoscend/auto_community_service.ash
boolean cs_spendRests();									//Defined in autoscend/auto_community_service.ash
boolean cs_witchess();										//Defined in autoscend/auto_community_service.ash
int estimate_cs_questCost(int quest);						//Defined in autoscend/auto_community_service.ash
int [int] get_cs_questList();								//Defined in autoscend/auto_community_service.ash
boolean auto_csHandleGrapes();								//Defined in autoscend/auto_community_service.ash
string what_cs_quest(int quest);							//Defined in autoscend/auto_community_service.ash
int get_cs_questCost(int quest);							//Defined in autoscend/auto_community_service.ash
int get_cs_questCost(string input);							//Defined in autoscend/auto_community_service.ash
int get_cs_questNum(string input);							//Defined in autoscend/auto_community_service.ash
int expected_next_cs_quest();								//Defined in autoscend/auto_community_service.ash
int expected_next_cs_quest_internal();						//Defined in autoscend/auto_community_service.ash
boolean do_chateauGoat();									//Defined in autoscend/auto_community_service.ash
boolean do_cs_quest(int quest);								//Defined in autoscend/auto_community_service.ash
boolean do_cs_quest(string quest);							//Defined in autoscend/auto_community_service.ash
boolean cs_preTurnStuff(int curQuest);						//Defined in autoscend/auto_community_service.ash
void set_cs_questListFast(int[int] fast);					//Defined in autoscend/auto_community_service.ash
boolean cs_healthMaintain();											//Defined in autoscend/auto_community_service.ash
boolean cs_healthMaintain(int target);						//Defined in autoscend/auto_community_service.ash
boolean cs_mpMaintain();													//Defined in autoscend/auto_community_service.ash
boolean cs_mpMaintain(int target);								//Defined in autoscend/auto_community_service.ash
boolean canTrySaberTrickMeteorShower();           //Defined in autoscend/auto_community_service.ash
boolean trySaberTrickMeteorShower();              //Defined in autoscend/auto_community_service.ash
int beachHeadTurnSavings(int quest);							//Defined in autoscend/auto_community_service.ash
boolean tryBeachHeadBuff(int quest);							//Defined in autoscend/auto_community_service.ash
void debugMaximize(string req, int meat);					//Defined in autoscend/auto_util.ash
boolean doHRSkills();										//Defined in autoscend/auto_heavyrains.ash
int doNumberology(string goal);								//Defined in autoscend/auto_util.ash
int doNumberology(string goal, boolean doIt);				//Defined in autoscend/auto_util.ash
int doNumberology(string goal, boolean doIt, string option);//Defined in autoscend/auto_util.ash
int doNumberology(string goal, string option);				//Defined in autoscend/auto_util.ash
boolean isActuallyEd();										//Defined in auto_ascend/auto_edTheUndying.ash
boolean ed_doResting();										//Defined in autoscend/auto_edTheUndying.ash
boolean ed_eatStuff();										//Defined in autoscend/auto_edTheUndying.ash
void ed_initializeDay(int day);								//Defined in autoscend/auto_edTheUndying.ash
void ed_initializeSession();								//Defined in autoscend/auto_edTheUndying.ash
void ed_initializeSettings();								//Defined in autoscend/auto_edTheUndying.ash
boolean ed_needShop();										//Defined in autoscend/auto_edTheUndying.ash
void ed_handleAdventureServant(location loc);	//Defined in autoscend/auto_edTheUndying.ash
void ed_terminateSession();									//Defined in autoscend/auto_edTheUndying.ash
effect[int] effectList();									//Defined in autoscend/auto_list.ash
int elemental_resist(element goal);							//Defined in autoscend/auto_util.ash
float elemental_resist_value(int resistance);				//Defined in autoscend/auto_util.ash
boolean evokeEldritchHorror();								//Defined in autoscend/auto_util.ash
boolean evokeEldritchHorror(string option);					//Defined in autoscend/auto_util.ash
boolean fallout_buySkills();								//Defined in autoscend/auto_fallout.ash
void fallout_initializeDay(int day);						//Defined in autoscend/auto_fallout.ash
void fallout_initializeSettings();							//Defined in autoscend/auto_fallout.ash
int fastenerCount();										//Defined in autoscend/auto_util.ash
boolean fightScienceTentacle();								//Defined in autoscend/auto_util.ash
boolean fightScienceTentacle(string option);				//Defined in autoscend/auto_util.ash
boolean forceEquip(slot sl, item it);						//Defined in autoscend/auto_util.ash
int fullness_left();										//Defined in autoscend/auto_util.ash
location solveDelayZone();									//Defined in autoscend/auto_util.ash
boolean mummifyFamiliar(familiar fam, string bonus);		//Defined in autoscend/iotms/auto_mr2017.ash
boolean isjanuaryToteAvailable();							//Defined in autoscend/iotms/auto_mr2018.ash
int januaryToteTurnsLeft(item it);							//Defined in autoscend/iotms/auto_mr2018.ash
boolean januaryToteAcquire(item it);						//Defined in autoscend/iotms/auto_mr2018.ash
boolean godLobsterCombat();									//Defined in autoscend/iotms/auto_mr2018.ash
boolean godLobsterCombat(item it);							//Defined in autoscend/iotms/auto_mr2018.ash
boolean godLobsterCombat(item it, int goal);				//Defined in autoscend/iotms/auto_mr2018.ash
boolean godLobsterCombat(item it, int goal, string option);	//Defined in autoscend/iotms/auto_mr2018.ash
boolean fantasyRealmToken();								//Defined in autoscend/iotms/auto_mr2018.ash
boolean fantasyRealmAvailable();							//Defined in autoscend/iotms/auto_mr2018.ash
boolean songboomSetting(string goal);						//Defined in autoscend/iotms/auto_mr2018.ash
boolean songboomSetting(int choice);						//Defined in autoscend/iotms/auto_mr2018.ash
void auto_setSongboom();						//Defined in autoscend/iotms/auto_mr2018.ash
int catBurglarHeistsLeft();									//Defined in autoscend/iotms/auto_mr2018.ash
boolean catBurglarHeist(item it);							//Defined in autoscend/iotms/auto_mr2018.ash
boolean fightClubNap();										//Defined in autoscend/iotms/auto_mr2018.ash
boolean fightClubStats();									//Defined in autoscend/iotms/auto_mr2018.ash
boolean fightClubSpa();										//Defined in autoscend/iotms/auto_mr2018.ash
boolean fightClubSpa(int option);							//Defined in autoscend/iotms/auto_mr2018.ash
boolean fightClubSpa(effect eff);							//Defined in autoscend/iotms/auto_mr2018.ash
boolean cheeseWarMachine(int stats, int it, int buff, int potion);//Defined in autoscend/iotms/auto_mr2018.ash
boolean neverendingPartyCombat(stat st, boolean hardmode, string option, boolean powerlevelling);//Defined in autoscend/iotms/auto_mr2018.ash
boolean neverendingPartyCombat(effect eff, boolean hardmode, string option, boolean powerlevelling);//Defined in autoscend/iotms/auto_mr2018.ash
boolean neverendingPartyCombat(stat st, boolean hardmode);	//Defined in autoscend/iotms/auto_mr2018.ash
boolean neverendingPartyCombat(effect eff, boolean hardmode);//Defined in autoscend/iotms/auto_mr2018.ash
boolean neverendingPartyCombat(stat st);					//Defined in autoscend/iotms/auto_mr2018.ash
boolean neverendingPartyCombat(effect eff);					//Defined in autoscend/iotms/auto_mr2018.ash
boolean neverendingPartyCombat();							//Defined in autoscend/iotms/auto_mr2018.ash
boolean neverendingPartyPowerlevel();					//Defined in autoscend/iotms/auto_mr2018.ash
int neverendingPartyRemainingFreeFights();					//Defined in autoscend/iotms/auto_mr2018.ash
boolean neverendingPartyAvailable();						//Defined in autoscend/iotms/auto_mr2018.ash
string auto_latteDropName(location l); // Defined in autoscend/auto_mr2018.ash
boolean auto_latteDropAvailable(location l); // Defined in autoscend/auto_mr2018.ash
boolean auto_latteDropWanted(location l); // Defined in autoscend/auto_mr2018.ash
string auto_latteTranslate(string ingredient); // Defined in autoscend/auto_mr2018.ash
boolean auto_latteRefill(string want1, string want2, string want3, boolean force); // Defined in autoscend/auto_mr2018.ash
boolean auto_latteRefill(string want1, string want2, string want3); // Defined in autoscend/auto_mr2018.ash
boolean auto_latteRefill(string want1, string want2, boolean force); // Defined in autoscend/auto_mr2018.ash
boolean auto_latteRefill(string want1, string want2); // Defined in autoscend/auto_mr2018.ash
boolean auto_latteRefill(string want1, boolean force); // Defined in autoscend/auto_mr2018.ash
boolean auto_latteRefill(string want1); // Defined in autoscend/auto_mr2018.ash
boolean auto_latteRefill(); // Defined in autoscend/auto_mr2018.ash
boolean auto_haveVotingBooth();
boolean auto_voteSetup();										//Defined in autoscend/iotms/auto_mr2018.ash
boolean auto_voteSetup(int candidate);						//Defined in autoscend/iotms/auto_mr2018.ash
boolean auto_voteSetup(int candidate, int first, int second);	//Defined in autoscend/iotms/auto_mr2018.ash
boolean auto_voteMonster();									//Defined in autoscend/iotms/auto_mr2018.ash
boolean auto_voteMonster(boolean freeMon);					//Defined in autoscend/iotms/auto_mr2018.ash
boolean auto_voteMonster(boolean freeMon, location loc);		//Defined in autoscend/iotms/auto_mr2018.ash
boolean auto_voteMonster(boolean freeMon, location loc, string option);//Defined in autoscend/iotms/auto_mr2018.ash
item[monster] catBurglarHeistDesires();							// Defined in autoscend/auto_mr2018.ash
int auto_sausageEaten(); // Defined in autoscend/auto_mr2019.ash
int auto_sausageLeftToday(); // Defined in autoscend/auto_mr2019.ash
int auto_sausageUnitsNeededForSausage(int numSaus); // Defined in autoscend/auto_mr2019.ash
int auto_sausageMeatPasteNeededForSausage(int numSaus); // Defined in autoscend/auto_mr2019.ash
int auto_sausageFightsToday(); // Defined in autoscend/auto_mr2019.ash
boolean auto_sausageGrind(int numSaus); // Defined in autoscend/auto_mr2019.ash
boolean auto_sausageGrind(int numSaus, boolean failIfCantMakeAll); // Defined in autoscend/auto_mr2019.ash
boolean auto_sausageEatEmUp(int maximumToEat); // Defined in autoscend/auto_mr2019.ash
boolean auto_sausageEatEmUp(); // Defined in autoscend/auto_mr2019.ash
boolean auto_haveKramcoSausageOMatic();
boolean auto_sausageGoblin(); // Defined in autoscend/auto_mr2019.ash
boolean auto_sausageGoblin(location loc); // Defined in autoscend/auto_mr2019.ash
boolean auto_sausageGoblin(location loc, string option); // Defined in autoscend/auto_mr2019.ash
boolean pirateRealmAvailable(); // Defined in autoscend/auto_mr2019.ash
boolean LX_unlockPirateRealm(); // Defined in autoscend/auto_mr2019.ash
boolean auto_saberChoice(string choice);	// Defined in autoscend/auto_mr2019.ash
boolean auto_saberDailyUpgrade(int day);	// Defined in autoscend/auto_mr2019.ash
monster auto_saberCurrentMonster();	// Defined in autoscend/auto_mr2019.ash
int auto_saberChargesAvailable();	// Defined in autoscend/auto_mr2019.ash
string auto_combatSaberBanish();	// Defined in autoscend/auto_mr2019.ash
string auto_combatSaberCopy();	// Defined in autoscend/auto_mr2019.ash
string auto_combatSaberYR();	// Defined in autoscend/auto_mr2019.ash
string auto_spoonGetDesiredSign();	// Defined in autoscend/auto_mr2019.ash
void auto_spoonTuneConfirm();	// Defined in autoscend/auto_mr2019.ash
boolean auto_spoonReadyToTuneMoon();	// Defined in autoscend/auto_mr2019.ash
boolean auto_spoonTuneMoon();	// Defined in autoscend/auto_mr2019.ash
boolean auto_beachCombAvailable();	// Defined in autoscend/auto_mr2019.ash
boolean auto_canBeachCombHead(string name);	// Defined in autoscend/auto_mr2019.ash
boolean auto_beachCombHead(string name);	// Defined in autoscend/auto_mr2019.ash
int auto_beachCombFreeUsesLeft();	// Defined in autoscend/auto_mr2019.ash
boolean auto_beachUseFreeCombs();	// Defined in autoscend/auto_mr2019.ash
effect auto_beachCombHeadEffect(string name); // Defined in autoscend/auto_mr2019.ash
boolean auto_campawayAvailable();	// Defined in autoscend/auto_mr2019.ash
boolean auto_campawayGrabBuffs();	// Defined in autoscend/auto_mr2019.ash
boolean auto_havePillKeeper();
int auto_pillKeeperUses();						//Defined in autoscend/iotms/auto_mr2019.ash
boolean auto_pillKeeperFreeUseAvailable();	//Defined in autoscend/iotms/auto_mr2019.ash
boolean auto_pillKeeperAvailable();			//Defined in autoscend/iotms/auto_mr2019.ash
boolean auto_pillKeeper(int pill);			//Defined in autoscend/iotms/auto_mr2019.ash
boolean auto_pillKeeper(string pill);		//Defined in autoscend/iotms/auto_mr2019.ash
boolean auto_changeSnapperPhylum(phylum toChange);
boolean auto_snapperPreAdventure(location loc);

boolean auto_haveBirdADayCalendar();
boolean auto_birdOfTheDay();
boolean auto_birdIsValid();					//Defined in autoscend/iotms/auto_mr2020.ash
float auto_birdModifier(string mod);		//Defined in autoscend/iotms/auto_mr2020.ash
float auto_favoriteBirdModifier(string mod);//Defined in autoscend/iotms/auto_mr2020.ash
int auto_birdsSought();						//Defined in autoscend/iotms/auto_mr2020.ash
int auto_birdsLeftToday();					//Defined in autoscend/iotms/auto_mr2020.ash
boolean auto_birdCanSeek();					//Defined in autoscend/iotms/auto_mr2020.ash
boolean auto_favoriteBirdCanSeek();			//Defined in autoscend/iotms/auto_mr2020.ash
boolean auto_hasPowerfulGlove();			//Defined in autoscend/iotms/auto_mr2020.ash
int auto_powerfulGloveCharges();			//Defined in autoscend/iotms/auto_mr2020.ash
boolean auto_powerfulGloveNoncombat();		//Defined in autoscend/iotms/auto_mr2020.ash
boolean auto_powerfulGloveStats();		//Defined in autoscend/iotms/auto_mr2020.ash
int auto_powerfulGloveReplacesAvailable(boolean inCombat);	//Defined in autoscend/iotms/auto_mr2020.ash
boolean auto_wantToEquipPowerfulGlove();	//Defined in autoscend/iotms/auto_mr2020.ash
boolean auto_willEquipPowerfulGlove();		//Defined in autoscend/iotms/auto_mr2020.ash
boolean auto_forceEquipPowerfulGlove();		//Defined in autoscend/iotms/auto_mr2020.ash
boolean auto_canFightPiranhaPlant();
boolean auto_canTendMushroomGarden();
boolean auto_latheHardwood(item toLathe); // Defined in autoscend/iotms/auto_mr2020.ash
boolean auto_latheAppropriateWeapon(); // Defined in autoscend/iotms/auto_mr2020.ash

boolean getSpaceJelly();					//Defined in autoscend/iotms/auto_mr2017.ash
boolean isHorseryAvailable();
int horseCost();											//Defined in autoscend/iotms/auto_mr2017.ash
string horseNormalize(string horseText); // Defined in autoscend/auto_mr2017.ash
boolean getHorse(string type);								//Defined in autoscend/iotms/auto_mr2017.ash
void horseDefault(); // Defined in autoscend/auto_mr2017.ash
void horseMaintain(); // Defined in autoscend/auto_mr2017.ash
void horseNone(); // Defined in autoscend/auto_mr2017.ash
void horseNormal(); // Defined in autoscend/auto_mr2017.ash
void horseDark(); // Defined in autoscend/auto_mr2017.ash
void horseCrazy(); // Defined in autoscend/auto_mr2017.ash
void horsePale(); // Defined in autoscend/auto_mr2017.ash
boolean horsePreAdventure(); // Defined in autoscend/auto_mr2017.ash
boolean[int] knapsack(int maxw, int n, int[int] weight, float[int] val); // Defined in autoscend/auto_util.ash

boolean kgbDiscovery();										//Defined in autoscend/iotms/auto_mr2017.ash
boolean kgbWasteClicks();									//Defined in autoscend/iotms/auto_mr2017.ash
boolean kgbTryEffect(effect ef);							//Defined in autoscend/iotms/auto_mr2017.ash
string kgbKnownEffects();									//Defined in autoscend/iotms/auto_mr2017.ash
boolean solveKGBMastermind();								//Defined in autoscend/iotms/auto_mr2017.ash
boolean kgbDial(int dial, int curVal, int target);			//Defined in autoscend/iotms/auto_mr2017.ash
boolean kgbSetup();											//Defined in autoscend/iotms/auto_mr2017.ash
int kgb_tabHeight(string page);								//Defined in autoscend/iotms/auto_mr2017.ash
int kgb_tabCount(string page);								//Defined in autoscend/iotms/auto_mr2017.ash
boolean kgb_getMartini();									//Defined in autoscend/iotms/auto_mr2017.ash
boolean kgb_getMartini(string page);						//Defined in autoscend/iotms/auto_mr2017.ash
boolean kgb_getMartini(string page, boolean dontCare);		//Defined in autoscend/iotms/auto_mr2017.ash
boolean kgbModifiers(string mod);							//Defined in autoscend/iotms/auto_mr2017.ash
boolean haveAsdonBuff();											//Defined in autoscend/iotms/auto_mr2017.ash
boolean canAsdonBuff(effect goal);						//Defined in autoscend/iotms/auto_mr2017.ash
boolean asdonBuff(effect goal);								//Defined in autoscend/iotms/auto_mr2017.ash
boolean asdonBuff(string goal);								//Defined in autoscend/iotms/auto_mr2017.ash
boolean asdonFeed(item it, int qty);						//Defined in autoscend/iotms/auto_mr2017.ash
boolean asdonFeed(item it);									//Defined in autoscend/iotms/auto_mr2017.ash
boolean asdonAutoFeed();									//Defined in autoscend/iotms/auto_mr2017.ash
boolean asdonAutoFeed(int goal);							//Defined in autoscend/iotms/auto_mr2017.ash
boolean asdonCanMissile();										//Defined in autoscend/iotms/auto_mr2017.ash
boolean shouldUseWishes();										//Defined in autoscend/iotms/auto_mr2017.ash
int wishesAvailable();										//Defined in autoscend/iotms/auto_mr2017.ash
boolean makeGenieWish(string wish);							//Defined in autoscend/iotms/auto_mr2017.ash
boolean makeGenieWish(effect eff);							//Defined in autoscend/iotms/auto_mr2017.ash
boolean canGenieCombat();									//Defined in autoscend/iotms/auto_mr2017.ash
boolean makeGenieCombat(monster mon, string option);		//Defined in autoscend/iotms/auto_mr2017.ash
boolean makeGenieCombat(monster mon);						//Defined in autoscend/iotms/auto_mr2017.ash
boolean makeGeniePocket();									//Defined in autoscend/iotms/auto_mr2017.ash
boolean spacegateVaccineAvailable();						//Defined in autoscend/iotms/auto_mr2017.ash
boolean spacegateVaccineAvailable(effect ef);				//Defined in autoscend/iotms/auto_mr2017.ash
boolean spacegateVaccine(effect ef);						//Defined in autoscend/iotms/auto_mr2017.ash
boolean auto_hasMeteorLore();								//Defined in autoscend/iotms/auto_mr2017.ash
int auto_meteorShowersUsed();								//Defined in autoscend/iotms/auto_mr2017.ash
int auto_meteorShowersAvailable();							//Defined in autoscend/iotms/auto_mr2017.ash
int auto_macroMeteoritesUsed();								//Defined in autoscend/iotms/auto_mr2017.ash
int auto_macrometeoritesAvailable();						//Defined in autoscend/iotms/auto_mr2017.ash
int auto_meteoriteAdesUsed();								//Defined in autoscend/iotms/auto_mr2017.ash
boolean handleBarrelFullOfBarrels(boolean daily);			//Defined in autoscend/auto_util.ash
boolean handleCopiedMonster(item itm);						//Defined in autoscend/auto_util.ash
boolean handleCopiedMonster(item itm, string option);		//Defined in autoscend/auto_util.ash
boolean handleSealAncient();								//Defined in autoscend/auto_util.ash
boolean handleSealAncient(string option);					//Defined in autoscend/auto_util.ash
boolean handleSealNormal(item it);							//Defined in autoscend/auto_util.ash
boolean handleSealNormal(item it, string option);			//Defined in autoscend/auto_util.ash
boolean handleSealElement(element flavor);					//Defined in autoscend/auto_util.ash
boolean handleSealElement(element flavor, string option);	//Defined in autoscend/auto_util.ash
boolean handleServant(servant who);							//Defined in autoscend/auto_edTheUndying.ash
boolean handleServant(string name);							//Defined in autoscend/auto_edTheUndying.ash
void handleTracker(string used, string tracker);			//Defined in autoscend/auto_util.ash
void handleTracker(string used, string detail, string tracker);	//Defined in autoscend/auto_util.ash
boolean hasArm(monster enemy);								//Defined in autoscend/auto_monsterparts.ash
boolean hasHead(monster enemy);								//Defined in autoscend/auto_monsterparts.ash
boolean hasLeg(monster enemy);								//Defined in autoscend/auto_monsterparts.ash
boolean hasShieldEquipped();								//Defined in autoscend/auto_util.ash
boolean hasTail(monster enemy);								//Defined in autoscend/auto_monsterparts.ash
boolean hasTorso(monster enemy);							//Defined in autoscend/auto_monsterparts.ash
boolean haveAny(boolean[item] array);						//Defined in autoscend/auto_util.ash
boolean acquireOrPull(item it);								//Defined in autoscend/auto_util.ash
boolean have_skills(boolean[skill] array);					//Defined in autoscend/auto_util.ash
boolean auto_have_skill(skill sk);							//Defined in autoscend/auto_util.ash
boolean haveGhostReport();									//Defined in autoscend/iotms/auto_mr2016.ash
int howLongBeforeHoloWristDrop();							//Defined in autoscend/auto_util.ash
void hr_doBedtime();										//Defined in autoscend/auto_heavyrains.ash
boolean hr_handleFamiliar(familiar fam);					//Defined in autoscend/auto_heavyrains.ash
void hr_initializeDay(int day);								//Defined in autoscend/auto_heavyrains.ash
void hr_initializeSettings();								//Defined in autoscend/auto_heavyrains.ash
boolean L13_towerFinalHeavyRains();							//Defined in autoscend/auto_heavyrains.ash
boolean in_ronin();											//Defined in autoscend/auto_util.ash
int inebriety_left();										//Defined in autoscend/auto_util.ash
boolean stunnable(monster mon);								//Defined in autoscend/auto_util.ash
boolean instakillable(monster mon);							//Defined in autoscend/auto_util.ash
int[int] intList();											//Defined in autoscend/auto_list.ash
int internalQuestStatus(string prop);						//Defined in autoscend/auto_util.ash
int freeCrafts();											//Defined in autoscend/auto_util.ash
boolean isBanished(monster enemy);							//Defined in autoscend/auto_util.ash
boolean isExpectingArrow();									//Defined in autoscend/auto_util.ash
boolean isFreeMonster(monster mon);							//Defined in autoscend/auto_util.ash
boolean isGalaktikAvailable();								//Defined in autoscend/auto_util.ash
boolean isGeneralStoreAvailable();							//Defined in autoscend/auto_util.ash
boolean isMusGuildStoreAvailable();							//Defined in autoscend/auto_util.ash
boolean isMystGuildStoreAvailable(); 						//Defined in autoscend/auto_util.ash
boolean isArmoryAvailable();								//Defined in autoscend/auto_util.ash
boolean isGhost(monster mon);								//Defined in autoscend/auto_util.ash
boolean isGuildClass();										//Defined in autoscend/auto_util.ash
boolean hasTorso();											//Defined in autoscend/auto_util.ash
boolean isHermitAvailable();								//Defined in autoscend/auto_util.ash
boolean isOverdueArrow();									//Defined in autoscend/auto_util.ash
boolean isOverdueDigitize();								//Defined in autoscend/auto_util.ash
boolean isProtonGhost(monster mon);							//Defined in autoscend/auto_util.ash
boolean isUnclePAvailable();								//Defined in autoscend/auto_util.ash
boolean isDesertAvailable();								//Defined in autoscend/auto_util.ash
boolean inKnollSign();										//Defined in autoscend/auto_util.ash
boolean inCanadiaSign();									//Defined in autoscend/auto_util.ash
boolean inGnomeSign();										//Defined in autoscend/auto_util.ash
boolean allowSoftblockShen();								//Defined in autoscend/auto_util.ash
boolean is_avatar_potion(item it);							//Defined in autoscend/auto_util.ash
int auto_mall_price(item it);									//Defined in autoscend/auto_util.ash
item[int] itemList();										//Defined in autoscend/auto_list.ash
int jello_absorbsLeft();									//Defined in autoscend/auto_jellonewbie.ash
int gnoobAbsorbCost(item it);								//Defined in autoscend/auto_jellonewbie.ash
void jello_buySkills();										//Defined in autoscend/auto_jellonewbie.ash
boolean in_gnoob();											//Defined in autoscend/auto_jellonewbie.ash
string[item] jello_lister();								//Defined in autoscend/auto_jellonewbie.ash
string[item] jello_lister(string goal);						//Defined in autoscend/auto_jellonewbie.ash
void jello_startAscension(string page);						//Defined in autoscend/auto_jellonewbie.ash
boolean lastAdventureSpecialNC();							//Defined in autoscend/auto_util.ash
boolean loopHandler(string turnSetting, string counterSetting, int threshold);//Defined in autoscend/auto_util.ash
boolean loopHandler(string turnSetting, string counterSetting, string abortMessage, int threshold);//Defined in autoscend/auto_util.ash
boolean loopHandlerDelay(string counterSetting);			//Defined in autoscend/auto_util.ash
boolean loopHandlerDelay(string counterSetting, int threshold);//Defined in autoscend/auto_util.ash
boolean loopHandlerDelayAll();								// Defined in autoscend/auto_util.ash
string reverse(string s);									// Defined in autoscend/auto_util.ash
boolean loveTunnelAcquire(boolean enforcer, stat statItem, boolean engineer, int loveEffect, boolean equivocator, int giftItem);//Defined in autoscend/iotms/auto_mr2017.ash
boolean loveTunnelAcquire(boolean enforcer, stat statItem, boolean engineer, int loveEffect, boolean equivocator, int giftItem, string option);//Defined in autoscend/iotms/auto_mr2017.ash
boolean pantogramPants();									//Defined in autoscend/iotms/auto_mr2017.ash
boolean pantogramPants(stat st, element el, int hpmp, int meatItemStats, int misc);//Defined in autoscend/iotms/auto_mr2017.ash
int lumberCount();											//Defined in autoscend/auto_util.ash
int maxSealSummons();										//Defined in autoscend/auto_util.ash
int ns_crowd1();											//Defined in autoscend/auto_util.ash
stat ns_crowd2();											//Defined in autoscend/auto_util.ash
element ns_crowd3();										//Defined in autoscend/auto_util.ash
element ns_hedge1();										//Defined in autoscend/auto_util.ash
element ns_hedge2();										//Defined in autoscend/auto_util.ash
element ns_hedge3();										//Defined in autoscend/auto_util.ash
boolean ocrs_postCombatResolve();							//Defined in autoscend/auto_summerfun.ash
boolean ocrs_postHelper();									//Defined in autoscend/auto_summerfun.ash
boolean organsFull();										//Defined in autoscend/auto_util.ash
boolean ovenHandle();										//Defined in autoscend/auto_util.ash
void pete_buySkills();										//Defined in autoscend/auto_sneakypete.ash
void pete_initializeDay(int day);							//Defined in autoscend/auto_sneakypete.ash
void pete_initializeSettings();								//Defined in autoscend/auto_sneakypete.ash
boolean picky_buyskills();									//Defined in autoscend/auto_picky.ash
void picky_pulls();											//Defined in autoscend/auto_picky.ash
void picky_startAscension();								//Defined in autoscend/auto_picky.ash
skill preferredLibram();									//Defined in autoscend/auto_util.ash
location provideAdvPHPZone();								//Defined in autoscend/auto_util.ash
boolean acquireCombatMods(int amt);
boolean acquireCombatMods(int amt, boolean doEquips);
boolean canPull(item it);									//Defined in autoscend/auto_util.ash
void pullAll(item it);										//Defined in autoscend/auto_util.ash
void pullAndUse(item it, int uses);							//Defined in autoscend/auto_util.ash
boolean pullXWhenHaveY(item it, int howMany, int whenHave);	//Defined in autoscend/auto_util.ash
boolean pulverizeThing(item it);							//Defined in autoscend/auto_util.ash
boolean rainManSummon(string monsterName, boolean copy, boolean wink);//Defined in autoscend/auto_heavyrains.ash
boolean rainManSummon(string monsterName, boolean copy, boolean wink, string option);//Defined in autoscend/auto_heavyrains.ash
boolean restoreAllSettings();								//Defined in autoscend/auto_util.ash
boolean restoreSetting(string setting);						//Defined in autoscend/auto_util.ash
boolean restore_property(string setting, string source);	//Defined in autoscend/auto_util.ash
boolean rethinkingCandy(effect acquire);					//Defined in autoscend/iotms/auto_mr2016.ash
boolean rethinkingCandy(effect acquire, boolean simulate);	//Defined in autoscend/iotms/auto_mr2016.ash
boolean rethinkingCandyList();								//Defined in autoscend/iotms/auto_mr2016.ash
boolean routineRainManHandler();							//Defined in autoscend/auto_heavyrains.ash
string runChoice(string page_text);							//Defined in autoscend/auto_util.ash
string safeString(item input);								//Defined in autoscend/auto_util.ash
string safeString(monster input);							//Defined in autoscend/auto_util.ash
string safeString(skill input);								//Defined in autoscend/auto_util.ash
string safeString(string input);							//Defined in autoscend/auto_util.ash
boolean setAdvPHPFlag();									//Defined in autoscend/auto_util.ash
boolean set_property_ifempty(string setting, string change);//Defined in autoscend/auto_util.ash
boolean settingFixer();										//Defined in autoscend/auto_deprecation.ash
void shrugAT();												//Defined in autoscend/auto_util.ash
void shrugAT(effect anticipated);							//Defined in autoscend/auto_util.ash
boolean snojoFightAvailable();								//Defined in autoscend/iotms/auto_mr2016.ash
int solveCookie();											//Defined in autoscend/auto_util.ash
int spleen_left();											//Defined in autoscend/auto_util.ash
string statCard();											//Defined in autoscend/auto_util.ash
int stomach_left();											//Defined in autoscend/auto_util.ash
boolean theSource_buySkills();								//Defined in autoscend/auto_theSource.ash
boolean theSource_initializeSettings();						//Defined in autoscend/auto_theSource.ash
boolean theSource_oracle();									//Defined in autoscend/auto_theSource.ash
boolean LX_attemptPowerLevelTheSource();					//Defined in autoscend/auto_theSource.ash
boolean timeSpinnerAdventure();								//Defined in autoscend/iotms/auto_mr2016.ash
boolean timeSpinnerAdventure(string option);				//Defined in autoscend/iotms/auto_mr2016.ash
boolean timeSpinnerCombat(monster goal);					//Defined in autoscend/iotms/auto_mr2016.ash
boolean timeSpinnerCombat(monster goal, string option);		//Defined in autoscend/iotms/auto_mr2016.ash
boolean timeSpinnerConsume(item goal);						//Defined in autoscend/iotms/auto_mr2016.ash
boolean timeSpinnerGet(string goal);						//Defined in autoscend/iotms/auto_mr2016.ash
void tootGetMeat();											//Defined in autoscend/auto_util.ash
boolean trackingSplitterFixer(string oldSetting, int day, string newSetting);//Defined in autoscend/auto_deprecation.ash
string trim(string input);									//Defined in autoscend/auto_util.ash
int turkeyBooze();											//Defined in autoscend/auto_util.ash
boolean use_barrels();										//Defined in autoscend/auto_util.ash
boolean needStarKey();										//Defined in autoscend/quests/level_13.ash
boolean needDigitalKey();									//Defined in autoscend/quests/level_13.ash
int whitePixelCount();										//Defined in autoscend/quests/level_13.ash
boolean careAboutDrops(monster mon);						//Defined in autoscend/auto_util.ash
item whatHiMein();											//Defined in autoscend/auto_util.ash
effect whatStatSmile();										//Defined in autoscend/auto_util.ash
void woods_questStart();									//Defined in autoscend/auto_util.ash
string yellowRayCombatString(monster target, boolean inCombat); //Defined in autoscend/auto_util.ash
string yellowRayCombatString(monster target);					//Defined in autoscend/auto_util.ash
string yellowRayCombatString();									//Defined in autoscend/auto_util.ash
boolean adjustForYellowRay(string combat_string); 				//Defined in autoscend/auto_util.ash
boolean adjustForYellowRayIfPossible(monster target);			//Defined in autoscend/auto_util.ash
boolean adjustForYellowRayIfPossible();							//Defined in autoscend/auto_util.ash
string replaceMonsterCombatString(monster target, boolean inCombat);	//Defined in autoscend/auto_util.ash
string replaceMonsterCombatString(monster target);						//Defined in autoscend/auto_util.ash
string replaceMonsterCombatString();									//Defined in autoscend/auto_util.ash
boolean adjustForReplace(string combat_string);					//Defined in autoscend/auto_util.ash
boolean adjustForReplaceIfPossible(monster target);				//Defined in autoscend/auto_util.ash
boolean adjustForReplaceIfPossible();							//Defined in autoscend/auto_util.ash
string banisherCombatString(monster enemy, location loc, boolean inCombat); //Defined in autoscend/auto_util.ash
string banisherCombatString(monster enemy, location loc);	//Defined in autoscend/auto_util.ash
boolean[string] auto_banishesUsedAt(location loc); // Defined in autoscend/auto_util.ash
boolean auto_wantToBanish(monster enemy, location loc); // Defined in autoscend/auto_util.ash
boolean auto_wantToSniff(monster enemy, location loc); // Defined in autoscend/auto_util.ash
boolean auto_wantToYellowRay(monster enemy, location loc); // Defined in autoscend/auto_util.ash
boolean auto_wantToReplace(monster enemy, location loc); // Defined in autoscend/auto_util.ash
int total_items(boolean [item] items); // Defined in autoscend/auto_util.ash
boolean zoneCombat(location loc);							//Defined in autoscend/auto_util.ash
boolean zoneItem(location loc);								//Defined in autoscend/auto_util.ash
boolean zoneMeat(location loc);								//Defined in autoscend/auto_util.ash
boolean zoneNonCombat(location loc);						//Defined in autoscend/auto_util.ash
boolean declineTrades();									//Defined in autoscend/auto_util.ash
void auto_interruptCheck(); //Defined in autoscend/auto_util.ash

//From Zlib Stuff
record kmailObject {
	int id;                   // message id
	string type;              // possible values observed thus far: normal, giftshop
	int fromid;               // sender\'s playerid (0 for npcs)
	int azunixtime;           // KoL server\'s unix timestamp
	string message;           // message (not including items/meat)
	int[item] items;          // items included in the message
	int meat;                 // meat included in the message
	string fromname;          // sender\'s playername
	string localtime;         // your local time according to your KoL account, human-readable string
};
boolean auto_deleteMail(kmailObject msg);						//Defined in autoscend/auto_util.ash

boolean auto_is_valid(item it); //Defined in autoscend/auto_util.ash
boolean auto_is_valid(familiar fam); //Defined in autoscend/auto_util.ash
boolean auto_is_valid(skill sk); //Defined in autoscend/auto_util.ash

// Logging
// Defined in autoscend/auto_util.ash
string auto_log_level_threshold();
int auto_log_level(string level);
boolean auto_log(string s, string color, string log_level);
boolean auto_log_critical(string s, string color);
boolean auto_log_critical(string s);
boolean auto_log_error(string s, string color);
boolean auto_log_error(string s);
boolean auto_log_warning(string s, string color);
boolean auto_log_warning(string s);
boolean auto_log_info(string s, string color);
boolean auto_log_info(string s);
boolean auto_log_debug(string s, string color);
boolean auto_log_debug(string s);
boolean auto_log_trace(string s, string color);
boolean auto_log_trace(string s);

boolean auto_can_equip(item it); //Defined in autoscend/auto_util.ash
boolean auto_can_equip(item it, slot s); //Defined in autoscend/auto_util.ash

boolean auto_check_conditions(string conds); //Defined in autoscend/auto_util.ash

boolean [monster] auto_getMonsters(string category); //Defined in autoscend/auto_util.ash

boolean auto_badassBelt(); //Defined in autoscend/auto_util.ash

//Dump from accessory scripts.
void handlePreAdventure();									//Defined in auto_pre_adv.ash
void handlePreAdventure(location place);					//Defined in auto_pre_adv.ash

void handlePostAdventure();									//Defined in auto_post_adv.ash

void handleKingLiberation();								//Defined in auto_king.ash
boolean pullPVPJunk();										//Defined in auto_king.ash

boolean auto_acquireKeycards();								//Defined in autoscend/auto_aftercore.ash
boolean auto_aftercore();										//Defined in autoscend/auto_aftercore.ash
boolean auto_aftercore(int leave);							//Defined in autoscend/auto_aftercore.ash
boolean autoscendIntoCS();									//Defined in autoscend/auto_aftercore.ash
boolean autoscendIntoBond();								//Defined in autoscend/auto_aftercore.ash
boolean auto_cheeseAftercore(int leave);						//Defined in autoscend/auto_aftercore.ash
boolean auto_cheesePostCS();									//Defined in autoscend/auto_aftercore.ash
boolean auto_cheesePostCS(int leave);							//Defined in autoscend/auto_aftercore.ash
void auto_combatTest();										//Defined in autoscend/auto_aftercore.ash
boolean auto_dailyDungeon();									//Defined in autoscend/auto_aftercore.ash
boolean auto_doCS();											//Defined in autoscend/auto_aftercore.ash
boolean auto_doWalford();										//Defined in autoscend/auto_aftercore.ash
boolean auto_fingernail();									//Defined in autoscend/auto_aftercore.ash
boolean auto_goreBucket();									//Defined in autoscend/auto_aftercore.ash
boolean auto_guildClown();									//Defined in autoscend/auto_aftercore.ash
item auto_guildEpicWeapon();									//Defined in autoscend/auto_aftercore.ash
boolean auto_guildUnlock();									//Defined in autoscend/auto_aftercore.ash
boolean auto_junglePuns();									//Defined in autoscend/auto_aftercore.ash
boolean auto_jungleSandwich();								//Defined in autoscend/auto_aftercore.ash
boolean auto_lubeBarfMountain();								//Defined in autoscend/auto_aftercore.ash
boolean auto_mtMolehill();									//Defined in autoscend/auto_aftercore.ash
boolean auto_nastyBears();									//Defined in autoscend/auto_aftercore.ash
boolean auto_nemesisCave();									//Defined in autoscend/auto_aftercore.ash
boolean auto_nemesisIsland();									//Defined in autoscend/auto_aftercore.ash
boolean auto_packOfSmokes();									//Defined in autoscend/auto_aftercore.ash
boolean auto_racismReduction();								//Defined in autoscend/auto_aftercore.ash
boolean auto_sexismReduction();								//Defined in autoscend/auto_aftercore.ash
boolean auto_sloppySecondsDiner();							//Defined in autoscend/auto_aftercore.ash
boolean auto_toxicGlobules();									//Defined in autoscend/auto_aftercore.ash
boolean auto_toxicMascot();									//Defined in autoscend/auto_aftercore.ash
boolean auto_trashNet();										//Defined in autoscend/auto_aftercore.ash
string simpleCombatFilter(int round, string opp, string text);//Defined in autoscend/auto_aftercore.ash

boolean in_bhy();											//Defined in autoscend/paths/bees_hate_you.ash
void bhy_initializeSettings();								//Defined in autoscend/paths/bees_hate_you.ash
boolean bees_hate_usable(string it);						//Defined in autoscend/paths/bees_hate_you.ash
boolean LM_bhy();											//Defined in autoscend/paths/bees_hate_you.ash
boolean L13_bhy_towerFinal();								//Defined in autoscend/paths/bees_hate_you.ash

boolean LM_bond();											//Defined in autoscend/auto_bondmember.ash
boolean bond_buySkills();									//Defined in autoscend/auto_bondmember.ash
boolean bond_initializeSettings();							//Defined in autoscend/auto_bondmember.ash
item[int] bondDrinks();										//Defined in autoscend/auto_bondmember.ash
void bond_initializeDay(int day);							//Defined in autoscend/auto_bondmember.ash


void majora_initializeSettings();							//Defined in autoscend/auto_majora.ash
void majora_initializeDay(int day);							//Defined in autoscend/auto_majora.ash
boolean LM_majora();										//Defined in autoscend/auto_majora.ash

void digimon_initializeSettings();							//Defined in autoscend/auto_digimon.ash
void digimon_initializeDay(int day);						//Defined in autoscend/auto_digimon.ash
boolean digimon_makeTeam();									//Defined in autoscend/auto_digimon.ash
boolean LM_digimon();										//Defined in autoscend/auto_digimon.ash
boolean digimon_autoAdv(int num, location loc, string option);//Defined in autoscend/auto_digimon.ash

void glover_initializeSettings();							//Defined in autoscend/auto_glover.ash
void glover_initializeDay(int day);							//Defined in autoscend/auto_glover.ash
boolean glover_usable(string it);							//Defined in autoscend/auto_glover.ash
boolean LM_glover();										//Defined in autoscend/auto_glover.ash

boolean groundhogSafeguard();								//Defined in autoscend/auto_groundhog.ash
boolean canGroundhog(location loc);							//Defined in autoscend/auto_groundhog.ash
boolean groundhogAbort(location loc);						//Defined in autoscend/auto_groundhog.ash
boolean LM_groundhog();										//Defined in autoscend/auto_groundhog.ash

void grey_goo_initializeSettings();							//Defined in autoscend/grey_goo.ash
void grey_goo_initializeDay(int day);						//Defined in autoscend/grey_goo.ash
boolean LA_grey_goo_tasks();								//Defined in autoscend/grey_goo.ash

void bat_startAscension(); // Defined in autoscend/auto_batpath.ash
void bat_initializeSession(); // Defined in autoscend/auto_batpath.ash
void bat_terminateSession(); // Defined in autoscend/auto_batpath.ash
void bat_initializeDay(int day); // Defined in autoscend/auto_batpath.ash
int bat_maxHPCost(skill sk); // Defined in autoscend/auto_batpath.ash
int bat_baseHP(); // Defined in autoscend/auto_batpath.ash
int bat_remainingBaseHP(); // Defined in autoscend/auto_batpath.ash
boolean[skill] bat_desiredSkills(int hpLeft); // Defined in autoscend/auto_batpath.ash
boolean[skill] bat_desiredSkills(int hpLeft, boolean[skill] requiredSkills); // Defined in autoscend/auto_batpath.ash
void bat_reallyPickSkills(int hpLeft); // Defined in autoscend/auto_batpath.ash
void bat_reallyPickSkills(int hpLeft, boolean[skill] requiredSkills); // Defined in autoscend/auto_batpath.ash
boolean bat_shouldPickSkills(int hpLeft); // Defined in autoscend/auto_batpath.ash
boolean bat_shouldEnsorcel(monster m); // Defined in autoscend/auto_batpath.ash
int bat_creatable_amount(item desired); // Defined in autoscend/auto_batpath.ash
boolean bat_multicraft(string mode, boolean [item] options); // Defined in autoscend/auto_batpath.ash
boolean bat_cook(item desired); // Defined in autoscend/auto_batpath.ash
boolean bat_consumption(); // Defined in autoscend/auto_batpath.ash
boolean bat_skillValid(skill sk); // Defined in autoscend/auto_batpath.ash
boolean bat_tryBloodBank(); // Defined in autoscend/auto_batpath.ash
boolean bat_wantHowl(location loc); // Defined in autoscend/auto_batpath.ash
boolean bat_formNone(); // Defined in autoscend/auto_batpath.ash
boolean bat_formWolf(boolean speculative); // Defined in autoscend/auto_batpath.ash
boolean bat_formWolf(); // Defined in autoscend/auto_batpath.ash
boolean bat_formMist(boolean speculative); // Defined in autoscend/auto_batpath.ash
boolean bat_formMist(); // Defined in autoscend/auto_batpath.ash
boolean bat_formBats(boolean speculative); // Defined in autoscend/auto_batpath.ash
boolean bat_formBats(); // Defined in autoscend/auto_batpath.ash
void bat_clearForms(); // Defined in autoscend/auto_batpath.ash
boolean bat_switchForm(effect form, boolean speculative); // Defined in autoscend/auto_batpath.ash
boolean bat_switchForm(effect form); // Defined in autoscend/auto_batpath.ash
boolean bat_formPreAdventure(); // Defined in autoscend/auto_batpath.ash
boolean LM_batpath(); // Defined in autoscend/auto_batpath.ash

boolean zelda_initializeSettings(); // Defined in autoscend/auto_zelda.ash
boolean zelda_haveHammer(); // Defined in autoscend/auto_zelda.ash
boolean zelda_haveFlower(); // Defined in autoscend/auto_zelda.ash
boolean zelda_equippedHammer(); // Defined in autoscend/auto_zelda.ash
boolean zelda_equippedFlower(); // Defined in autoscend/auto_zelda.ash
boolean zelda_equippedBoots(); // Defined in autoscend/auto_zelda.ash
int zelda_numBadgesBought(); // Defined in autoscend/auto_zelda.ash
boolean zelda_buySkill(skill sk); // Defined in autoscend/auto_zelda.ash
boolean zelda_buyEquipment(item it); // Defined in autoscend/auto_zelda.ash
boolean zelda_nothingToBuy(); // Defined in autoscend/auto_zelda.ash
boolean zelda_buyStuff(); // Defined in autoscend/auto_zelda.ash
int zelda_ppCost(skill sk); // Defined in autoscend/auto_zelda.ash
boolean zelda_canDealScalingDamage(); // Defined in autoscend/auto_zelda.ash
boolean zelda_skillValid(skill sk); // Defined in autoscend/auto_zelda.ash
boolean zelda_equipTool(stat st); // Defined in autoscend/auto_zelda.ash

boolean in_lowkeysummer(); // Defined in autoscend/paths/low_key_summer.ash
boolean lowkey_initializeSettings(); // Defined in autoscend/paths/low_key_summer.ash
int lowkey_keyDelayRemaining(location loc); // Defined in autoscend/paths/low_key_summer.ash
int lowkey_keysRemaining(); // Defined in autoscend/paths/low_key_summer.ash
location lowkey_nextKeyLocation(boolean checkAvailable); // Defined in autoscend/paths/low_key_summer.ash
location lowkey_nextKeyLocation(); // Defined in autoscend/paths/low_key_summer.ash
location lowkey_nextAvailableKeyLocation(); // Defined in autoscend/paths/low_key_summer.ash
location lowkey_nextAvailableKeyDelayLocation(); // Defined in autoscend/paths/low_key_summer.ash
boolean lowkey_keyAdv(item key); // Defined in autoscend/paths/low_key_summer.ash
boolean LX_findHelpfulLowKey();  // Defined in autoscend/paths/low_key_summer.ash
boolean L13_sorceressDoorLowKey(); // Defined in autoscend/paths/low_key_summer.ash
boolean LX_lowkeySummer(); // Defined in autoscend/paths/low_key_summer.ash

element currentFlavour(); // Defined in autoscend/auto_util.ash
boolean setFlavour(element ele); // Defined in autoscend/auto_util.ash
boolean executeFlavour(); // Defined in autoscend/auto_util.ash
boolean autoFlavour(location place); // Defined in autoscend/auto_util.ash
int auto_reserveAmount(item it); // Defined in autoscend/auto_util.ash
int auto_reserveCraftAmount(item it); // Defined in autoscend/auto_util.ash
boolean auto_canForceNextNoncombat();  // Defined in autoscend/auto_util.ash
boolean auto_forceNextNoncombat(); // Defined in autoscend/auto_util.ash
boolean auto_haveQueuedForcedNonCombat(); // Defined in autoscend/auto_util.ash
boolean is_superlikely(string encounterName); // Defined in autoscend/auto_util.ash
int auto_predictAccordionTurns();								//Defined in autoscend/auto_util.ash
boolean hasTTBlessing();									 // Defined in autoscend/auto_util.ash
void effectAblativeArmor(boolean passive_dmg_allowed);		 // Defined in autoscend/auto_util.ash
int currentPoolSkill(); 		 // Defined in autoscend/auto_util.ash
int poolSkillPracticeGains();								// Defined in autoscend/auto_util.ash

//Record from autoscend/auto_zone.ash
record generic_t
{
	boolean _error;
	boolean _boolean;
	int _int;
	float _float;
	string _string;
	item _item;
	location _location;
	class _class;
	stat _stat;
	skill _skill;
	effect _effect;
	familiar _familiar;
	slot _slot;
	monster _monster;
	element _element;
	phylum _phylum;
};
generic_t zone_needItem(location loc);						//Defined in autoscend/auto_zone.ash
generic_t zone_difficulty(location loc);					//Defined in autoscend/auto_zone.ash
generic_t zone_combatMod(location loc);						//Defined in autoscend/auto_zone.ash
generic_t zone_delay(location loc);							//Defined in autoscend/auto_zone.ash
generic_t zone_available(location loc);						//Defined in autoscend/auto_zone.ash
boolean zone_unlock(location loc);
location[int] zone_list();									//Defined in autoscend/auto_zone.ash
int[location] zone_delayable();								//Defined in autoscend/auto_zone.ash
boolean zone_isAvailable(location loc);						//Defined in autoscend/auto_zone.ash
boolean zone_isAvailable(location loc, boolean unlockIfPossible);
location[int] zones_available();							//Defined in autoscend/auto_zone.ash
monster[int] mobs_available();								//Defined in autoscend/auto_zone.ash
item[int] drops_available();								//Defined in autoscend/auto_zone.ash
item[int] hugpocket_available();							//Defined in autoscend/auto_zone.ash

// functions for handling choice adventures. Only ever called from auto_choice_adv.ash
void hiddenTempleChoiceHandler(int choice, string page);
void oldLandfillChoiceHandler(int choice);
void piratesCoveChoiceHandler(int choice);							//Defined in autoscend/quests/optional.ash
void barrrneysBarrrChoiceHandler(int choice, string page);
void fcleChoiceHandler(int choice);
void dailyDungeonChoiceHandler(int choice, string[int] options);	//Defined in autoscend/quests/level_any.ash
void edUnderworldChoiceHandler(int choice);
