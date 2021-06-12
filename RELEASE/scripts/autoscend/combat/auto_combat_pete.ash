//Path specific combat handling for Avatar of Sneaky Pete

string auto_combatPeteStage1(int round, monster enemy, string text)
{
	##stage 1 = 1st round actions: puzzle boss, pickpocket, banish, escape, instakill, etc. things that need to be done before debuff

	//TODO rush to max love, then max hate, then max love again for the consumables
	if(my_class() == $class[Avatar of Sneaky Pete] && canSurvive(3.0))
	{
		int maxAudience = 30;
		if($items[Sneaky Pete\'s Leather Jacket, Sneaky Pete\'s Leather Jacket (Collar Popped)] contains equipped_item($slot[shirt]))
		{
			maxAudience = 50;
		}
		if(canUse($skill[Mug for the Audience]) && (my_audience() < maxAudience || disregardInstantKarma()))
		{
			return useSkill($skill[Mug for the Audience]);
		}
	}
	
	return "";
}
