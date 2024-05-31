-- visitor is a stack that entered resource market
-- market is a resource market object
-- serverSide - true, if script is executed by game server
function getExchangeRates(visitor, market, serverSide)
  return {
    {
      -- Player can exchange gold
	  Resource.Gold,
	  {
        -- for life mana. 1 gold for 1 life mana
	    { Resource.LifeMana, 1, 1 },
        -- for death mana. 10 gold for 1 death mana
	    { Resource.DeathMana, 10, 1 },
	    { Resource.RunicMana, 1, 1 },
	    { Resource.InfernalMana, 1, 1 },
	    { Resource.GroveMana, 1, 1 }
	  }
	},
	{
      -- Player can exchange life mana
	  Resource.LifeMana,
	  {
        -- for gold. 1 life mana for 1 gold
	    { Resource.Gold, 1, 1 },
        -- for death mana. 2 life mana for 1 death mana
	    { Resource.DeathMana, 2, 1 },
	    { Resource.RunicMana, 1, 1 },
	    { Resource.InfernalMana, 1, 1 },
	    { Resource.GroveMana, 1, 1 }
	  }
	},
	{
	  Resource.DeathMana,
	  {
	    { Resource.Gold, 1, 1 },
	    { Resource.LifeMana, 1, 1 },
	    { Resource.RunicMana, 1, 1 },
	    { Resource.InfernalMana, 1, 1 },
	    { Resource.GroveMana, 1, 1 }
	  }
	},
	{
	  Resource.RunicMana,
	  {
	    { Resource.Gold, 1, 1 },
	    { Resource.LifeMana, 1, 1 },
	    { Resource.DeathMana, 1, 1 },
	    { Resource.InfernalMana, 1, 1 },
	    { Resource.GroveMana, 1, 1 }
	  }
	},
	{
	  Resource.InfernalMana,
	  {
	    { Resource.Gold, 1, 1 },
	    { Resource.LifeMana, 1, 1 },
	    { Resource.DeathMana, 1, 1 },
	    { Resource.RunicMana, 1, 1 },
	    { Resource.GroveMana, 1, 1 }
	  }
	},
	{
	  Resource.GroveMana,
	  {
	    { Resource.Gold, 1, 1 },
	    { Resource.LifeMana, 1, 1 },
	    { Resource.DeathMana, 1, 1 },
	    { Resource.RunicMana, 1, 1 },
	    { Resource.InfernalMana, 1, 1 }
	  }
	},
  }
end