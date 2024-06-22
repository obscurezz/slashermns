function getExchangeRates(visitor, market, serverSide)
  return {
    {
      -- 7 gold -> 1 mana
	  Resource.Gold,
	  {
	    { Resource.LifeMana, 7, 1 },
	    { Resource.DeathMana, 7, 1 },
	    { Resource.RunicMana, 7, 1 },
	    { Resource.InfernalMana, 7, 1 },
	    { Resource.GroveMana, 7, 1 }
	  }
	},
	{
	  Resource.LifeMana,
	  {
        -- 2 mana -> 1 gold
	    { Resource.Gold, 2, 1 },
        -- 4 mana -> 1 mana
	    { Resource.DeathMana, 4, 1 },
	    { Resource.RunicMana, 4, 1 },
	    { Resource.InfernalMana, 4, 1 },
	    { Resource.GroveMana, 4, 1 }
	  }
	},
	{
	  Resource.DeathMana,
	  {
	    { Resource.Gold, 2, 1 },
	    { Resource.LifeMana, 4, 1 },
	    { Resource.RunicMana, 4, 1 },
	    { Resource.InfernalMana, 4, 1 },
	    { Resource.GroveMana, 4, 1 }
	  }
	},
	{
	  Resource.RunicMana,
	  {
	    { Resource.Gold, 2, 1 },
	    { Resource.LifeMana, 4, 1 },
	    { Resource.DeathMana, 4, 1 },
	    { Resource.InfernalMana, 4, 1 },
	    { Resource.GroveMana, 4, 1 }
	  }
	},
	{
	  Resource.InfernalMana,
	  {
	    { Resource.Gold, 2, 1 },
	    { Resource.LifeMana, 4, 1 },
	    { Resource.DeathMana, 4, 1 },
	    { Resource.RunicMana, 4, 1 },
	    { Resource.GroveMana, 4, 1 }
	  }
	},
	{
	  Resource.GroveMana,
	  {
	    { Resource.Gold, 2, 1 },
	    { Resource.LifeMana, 4, 1 },
	    { Resource.DeathMana, 4, 1 },
	    { Resource.RunicMana, 4, 1 },
	    { Resource.InfernalMana, 4, 1 }
	  }
	}
  }
end