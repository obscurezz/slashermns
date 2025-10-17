--[[ Settings for Disciples 2 Rise of the Elves v3.01 mss32 proxy dll ]]--

settings = {
	-- Show troops banners
	showBanners = true,
	-- Show resources panel
	showResources = true,
	-- Show percentage of land coverted
	showLandConverted = false,

	-- Allow scenarios with prebuilt capital cities
	preserveCapitalBuildings = true,
	-- Start with pre built temple in capital for warrior lord
	buildTempleForWarriorLord = true,
	-- Maximum number of items the player is allowed to transfer
	-- between campaign scenarios [0 : INT_MAX]
	carryOverItemsMax = 5,

	-- Maximum unit damage per attack [300 : INT_MAX]
	unitMaxDamage = 1000,
	-- Maximum combined unit armor [70 : INT_MAX]
	-- minimum value could not be less than highest armor value
	-- of all units in GUnits.dbf
	-- For example: not less than 65 because of Onyx Gargoyle in original game
	unitMaxArmor = 90,

	-- Maximum allowed scout range for troops [7 : 100]
	stackMaxScoutRange = 99,

	-- Total armor shatter damage [0 : 100]
	shatteredArmorMax = 85,
	-- Maximum armor shatter damage per attack [0 : 100]
	shatterDamageMax = 30,
	-- Percentage of damage upgrade value that shatter attack receives when units level up [0 : 255]
	shatterDamageUpgradeRatio = 10,
	-- Allow shatter attacks to miss
	allowShatterAttackToMiss = true,

	-- Percentage damage of critical hit [0 : 255]
	criticalHitDamage = 10,
	-- Percentage chance of critical hit [0 : 100]
	criticalHitChance = 70,

	-- Multiplies total damage dealt by split damage (DAM_SPLIT) [1 : 6]
	-- Split damage is introduced by "custom attack damage ratio"
	-- This multiplier allows split damage to scale for late game as default maximum of 300 total damage is miserable
	-- For example, multiplier of 6 allows for 300 * 6 = 1800 total damage that corresponds to maximum damage of any mage
	splitDamageMultiplier = 1,
	
	-- Percentage of L_DRAIN attacks damage used as heal [INT_MIN : INT_MAX]
	drainAttackHeal = 50,
	-- Percentage of L_DRAIN_OVERFLOW attacks damage used as heal [INT_MIN : INT_MAX]
	drainOverflowHeal = 50,

	-- Change doppelganger attacks to compute level of a copy using 'doppelganger.lua' script
	leveledDoppelgangerAttack = true,
	-- Change transform self attacks to compute transformed unit level using 'transformSelf.lua' script
	leveledTransformSelfAttack = true,
	-- Change transform other attacks to compute transformed unit level using 'transformOther.lua' script
	leveledTransformOtherAttack = false,
	-- Change drain level attacks to compute transformed unit level using 'drainLevel.lua' script
	leveledDrainLevelAttack = true,
	-- Change summon attacks to compute summoned units levels using 'summon.lua' script
	leveledSummonAttack = true,

	-- Change doppelganger attacks to respect enemy/ally wards and immunities to the attack class and source
	doppelgangerRespectsEnemyImmunity = true,
	doppelgangerRespectsAllyImmunity = false,

	-- Increases total wards limit per caster from 8 to 48
	unrestrictedBestowWards = true,

	-- Allows transform-self attack to not consume a unit turn for transformation (once per turn)
	freeTransformSelfAttack = true,
	-- Allows free transform-self attack to be used infinite number of times per single turn
	freeTransformSelfAttackInfinite = false,

	-- Round in battle after which paralyze and petrify attacks
	-- starts missing targets constantly [1 : INT_MAX]
	disableAllowedRoundMax = 40,
	
	-- Change accuracy reduction for vanilla mage leaders per each additional target
	mageLeaderAccuracyReduction = 10,

	aiAccuracyBonus = {
		-- Treat AI accuracy bonus as absolute value or as percentage.
		-- Absolute: accuracy += bonus;
		-- Percentage: accuracy += accuracy * bonus / 100;
		absolute = false,
		-- AI accuracy bonus on easy difficulty [-127 : 127]
		easy = -15,
		-- AI accuracy bonus on average difficulty [-127 : 127]
		average = 0,
		-- AI accuracy bonus on hard difficulty [-127 : 127]
		hard = 5,
		-- AI accuracy bonus on very hard difficulty [-127 : 127]
		veryHard = 10
	},

	-- If true, switches attacks miss check to a single random value roll
	-- instead of check against arithmetic mean of two random numbers
	missChanceSingleRoll = false,

	-- Fix missing attack information in unit encyclopedia
	detailedAttackDescription = true,

	unitEncyclopedia = {
		-- Additional display of some stats bonuses, regeneration, xp reward for killing, etc.
		detailedUnitDescription = true,

		-- Additional display of some stats bonuses, drain, critical hit, custom attack ratios, etc.
		detailedAttackDescription = true,

		-- Additional display of dynamic upgrade values (only for unit type encyclopedia to avoid clutter)
                -- Enable detailedUnitDescription and/or detailedAttackDescription to show upgrade values for corresponding stats
                displayDynamicUpgradeValues = true,
           
                -- Additional display of bonus hit points
                -- Requires detailedUnitDescription
                displayBonusHp = true,
           
                -- Additional display of experience points reduction
                -- Requires detailedUnitDescription
                displayBonusXp = true,
	},
	
	-- Fix effective unit hp computation
	-- Original formula: (hp * armor / 100) + hp
	-- Fixed formula: hp / (1 - (armor / 100))
	fixEffectiveHpFormula = false,
	
	-- Allows transformed leaders (doppelganger, drain-level, transform-self/other attacks) to use battle items (potions, orbs and talismans)
	allowBattleItems = {
		-- If leader is transformed by TransformOther attack (Witch, orb/talisman, artifact effect, etc.)
		onTransformOther = false,
		-- If leader is transformed by TransformSelf attack (Wolf Lord, orb/talisman, artifact effect, etc.)
		onTransformSelf = true,
		-- If leader's level is drained by DrainLevel attack (Wight, orb/talisman, artifact effect, etc.)
		onDrainLevel = true,
		-- If leader transformed himself by Doppelganger attack
		onDoppelganger = true,
	},
	
	modifiers = {
		-- Allow unit regeneration modifiers to stack.
		-- By default, the game picks single highest value, then sums it with lord, terrain and city bonuses.
		cumulativeUnitRegeneration = true,
		
        	-- Enables 'modifiersChanged' notification for custom-modifiers scripts.
        	-- Keep it disabled if you don't need it to improve general performance.
        	notifyModifiersChanged = true,
        	
        	-- Enables 'onModifierAdded' / 'onModifierRemoved' notifications for custom-modifiers scripts.
	        -- Keep it disabled if you don't need it - to improve general performance.
	        notifyModifierAdded = true,
	        notifyModifierRemoved = true,
	        
		-- Validate current HP / XP of units when their group changes (units added, removed, rearranged, etc.)
		-- to resolve issues with custom HP / XP modifiers, that depend on other units (like auras in MNS mod).
		-- Keep it disabled if you don't need it to improve general performance.
		validateUnitsOnGroupChanged = true,
	},
	battle = {
		-- Allows retreated units to upgrade (the behavior is bugged in vanilla causing non-constant and opaque behaviour)
		allowRetreatedUnitsToUpgrade = true,
	},

	-- Create mss32 proxy dll log files with debug info
	-- debugHooks = true,
	movementCost = {
        -- Show stacks movement cost
        show = true,
        -- Color components are all in range [0 : 255]
        textColor = {
            red = 200, green = 200, blue = 200
        },
        outlineColor = {
            red = 0, green = 0, blue = 0
        },
        -- Movement cost on water tiles
        water = {
            -- Default movement cost
            default = 4,
            -- Movement cost for non water-only stacks with dead leader
            withDeadLeader = 8,
            -- Movement cost for stacks with water movement bonus
            withBonus = 2,
            -- Movement cost for water-only stacks
            waterOnly = 2,
    	},
    
        -- Movement cost on forest tiles
        forest = {
            -- Default movement cost
            default = 3,
            -- Movement cost for stacks with dead leader
            withDeadLeader = 6,
            -- Movement cost for stacks with forest movement bonus 
            withBonus = 2,
    	},
    
        -- Movement cost on plain tiles
        plain = {
            -- Default movement cost
            default = 2,
            -- Movement cost for stacks with dead leader
            withDeadLeader = 4,
            -- Movement cost for stacks without plain movement bonus on road tiles
            onRoad = 1,
    	},
	},
}

