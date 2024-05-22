function getStack(tier, stackCount, subraceTypes, itemsTypes, itemsValues)
    local t1Items = {
        { id = 'g000ig0005', min = 0, max = 1 },
        { id = 'g001ig0378', min = 0, max = 1 },
        { id = 'g001ig0180', min = 0, max = 2 },
    }
    local t2Items = {
        { id = 'g000ig0005', min = 0, max = 2 },
        { id = 'g000ig0006', min = 0, max = 1 },
        { id = 'g000ig0001', min = 0, max = 1 },
        { id = 'g000ig0008', min = 0, max = 1 },
        { id = 'g000ig0014', min = 0, max = 1 },
    }
    local t3Items = {
        { id = 'g001ig0378', min = 1, max = 2 },
        { id = 'g000ig0006', min = 0, max = 1 },
        { id = 'g000ig0001', min = 0, max = 1 },
        { id = 'g000ig0002', min = 0, max = 1 },
        { id = 'g000ig0011', min = 0, max = 1 },
    }

    local stackItems = { }
    if (tier == 1) then
        stackItems = t1Items
    elseif (tier == 2) then
        stackItems = t2Items
    elseif (tier == 3) then
        stackItems = t3Items
    end 

    local experienceValue = { }
    if (tier == 0) then
        experienceValue.min = 120 * stackCount
        experienceValue.max = 160 * stackCount 
    elseif (tier == 1) then
        experienceValue.min = 180 * stackCount
        experienceValue.max = 220 * stackCount
    elseif (tier == 2) then
        experienceValue.min = 260 * stackCount
        experienceValue.max = 310 * stackCount
    elseif (tier == 3) then
        experienceValue.min = 340 * stackCount
        experienceValue.max = 420 * stackCount
    end

    local stackItemsValue = { }
    if (tier == 1) then
        stackItemsValue.min = 400
        stackItemsValue.max = 400
    elseif (tier == 2) then
        stackItemsValue.min = 650
        stackItemsValue.max = 650
    elseif (tier == 3) then
        stackItemsValue.min = 800
        stackItemsValue.max = 800
    end

    return {
        count = stackCount,
        value = experienceValue,
        subraceTypes = subraceTypes,
        loot = {
            items = stackItems,
            value = stackItemsValue,
            itemTypes = itemsTypes,
            itemValue = itemsValues
        }
    }
end

local talismans_2_01 = { 'g000ig9130', 'g001ig0185', 'g001ig0063'}
local armor_2_01 = { 'g001ig0048', 'g001ig0582', 'g001ig0042', 'g001ig0612', 'g001ig0045', 'g000ig2003', 'g001ig0040', 'g001ig0558', 'g001ig0557', 'g001ig0559', 'g001ig0047', 'g001ig0416', 'g001ig0041', 'g001ig0589', 'g001ig0591', 'g001ig0594', 'g001ig0071' }
local weapon_2_01 = { 'g000ig3002', 'g000ig3017', 'g000ig3003', 'g001ig0487', 'g001ig0173', 'g001ig0197', 'g001ig0417', 'g001ig0196', 'g000ig9137', 'g001ig0182' }
local jewel_2_01 = { 'g001ig0421', 'g001ig0420', 'g001ig0424', 'g001ig0104', 'g001ig0605', 'g001ig0422', 'g001ig0423', 'g001ig0427', 'g001ig0429', 'g001ig0430', 'g001ig0539', 'g001ig0037' }

local talismans_2_02 = { 'g000ig9128', 'g000ig9123', 'g000ig9116'}
local banner_2_02 = { 'g001ig0293', 'g000ig1004', 'g001ig0362', 'g001ig0364', 'g001ig0361', 'g001ig0289', 'g001ig0370', 'g001ig0357', 'g000ig1002', 'g001ig0363', 'g001ig0358', 'g000ig1006', 'g001ig0369', 'g001ig0374', 'g001ig0588', 'g000ig1008', 'g001ig0292' }
local travel_2_02 = { 'g001ig0112', 'g001ig0111', 'g000ig8003', 'g001ig0114', 'g000ig1010' }

local banner_3 = { 'g000ig1016', 'g000ig1017', 'g001ig0052', 'g000ig1015', 'g001ig0290', 'g001ig0291' }
local jewel_3 = { 'g001ig0156', 'g001ig0419', 'g001ig0038', 'g001ig0116', 'g000ig3005' }
local permanent_3 = { 'g001ig0308', 'g001ig0518', 'g001ig0521', 'g001ig0506', 'g001ig0314', 'g001ig0376', 'g001ig0310', 'g001ig0312', 'g001ig0316' }

local t1Orbs = {'g001ig0133', 'g000ig9017', 'g001ig0189', 'g001ig0178', 'g001ig0472', 'g000ig9031', 'g001ig0471', 'g001ig0470', 'g001ig0192', 'g001ig0464', 'g001ig0473', 'g000ig9022', 'g001ig0450', 'g000ig9033', 'g001ig0302', 'g001ig0458'}
local t2Orbs = {'g001ig0443', 'g001ig0176', 'g001ig0187', 'g001ig0304', 'g001ig0467', 'g001ig0191', 'g000ig9024', 'g001ig0461', 'g001ig0300', 'g001ig0496', 'g000ig9042', 'g001ig0475', 'g001ig0468', 'g001ig0478', 'g001ig0469', 'g001ig0454', 'g001ig0456', 'g000ig9018', 'g001ig0479', 'g001ig0453', 'g001ig0474', 'g001ig0134', 'g000ig9020'}
local t3Orbs = {'g000ig9028', 'g001ig0462', 'g000ig9025', 'g001ig0136', 'g000ig9021', 'g000ig9016', 'g001ig0480', 'g001ig0303', 'g001ig0459', 'g000ig9014', 'g001ig0203', 'g001ig0466', 'g001ig0183', 'g001ig0455', 'g001ig0489', 'g000ig9027', 'g001ig0131', 'g000ig9032'}


function getReward(tier)
    local reward = { }

    if tier == 2.01 then
        reward = {
            { id = 'g000ig0001', min = 1, max = 1 },
            { id = 'g000ig0018', min = 1, max = 1 },
            { id = talismans_2_01[math.random(#talismans_2_01)], min = 1, max = 1 },
            { id = armor_2_01[math.random(#armor_2_01)], min = 1, max = 1 },
            { id = weapon_2_01[math.random(#weapon_2_01)], min = 1, max = 1 },
            { id = jewel_2_01[math.random(#jewel_2_01)], min = 1, max = 1 },
            { id = t2Orbs[math.random(#t2Orbs)], min = 1, max = 1 },
        }
    elseif tier == 2.02 then
        reward = {
            { id = 'g000ig0001', min = 1, max = 1 },
            { id = 'g000ig0018', min = 1, max = 1 },
            { id = talismans_2_02[math.random(#talismans_2_02)], min = 1, max = 1 },
            { id = banner_2_02[math.random(#banner_2_02)], min = 1, max = 1 },
            { id = travel_2_02[math.random(#travel_2_02)], min = 1, max = 1 },
            { id = 'g000ig5027', min = 1, max = 1 },
            { id = t2Orbs[math.random(#t2Orbs)], min = 1, max = 1 },
        }
    elseif tier == 3 then
        reward = {
            { id = 'g001ig0152', min = 1, max = 1 },
            { id = 'g000ig0001', min = 1, max = 1 },
            { id = banner_3[math.random(#banner_3)], min = 1, max = 1 },
            { id = jewel_3[math.random(#jewel_3)], min = 1, max = 1 },
            { id = permanent_3[math.random(#permanent_3)], min = 1, max = 1 },
            { id = t2Orbs[math.random(#t2Orbs)], min = 1, max = 1 },
            { id = 'g001ig0606', min = 1, max = 1 },
        }
    end

    return reward
        
end

function getGuard(tier, subR)
    local rewardType = {{ Item.PotionPermanent }, { Item.Armor, Item.Weapon }, { Item.Banner }, { Item.Jewel }}

    local experienceValue = { }

    experienceValue.min = 270 * tier
    experienceValue.max = 310 * tier

    if tier >= 2 then
        experienceValue.min = experienceValue.min * 0.8
        experienceValue.max = experienceValue.max * 0.8
    end

    local lootType = { }

    if tier == 1.01 then
        lootType = {
            itemTypes = rewardType[math.random(#rewardType)],
            value = { min = 700, max = 700 },
            itemValue = { min = 400, max = 700 },
            items = {
                { id = 'g000ig7004', min = 1, max = 1 },
                { id = 'g001ig0486', min = 1, max = 1 },
                { id = 'g000ig0006', min = 1, max = 1 }
            }
        }
    elseif tier == 1.02 then
        lootType = {
            itemTypes = { Item.Scroll },
            value = { min = 700, max = 750 },
            itemValue = { min = 200, max = 550 },
            items = {
                { id = 'g000ig7004', min = 1, max = 1 },
                { id = 'g001ig0486', min = 1, max = 1 },
                { id = 'g000ig0006', min = 1, max = 1 }
            }
        }
    elseif tier == 1.5 then
        lootType = {
            itemTypes = { Item.PotionBoost },
            value = { min = 750, max = 800 },
            itemValue = { min = 250, max = 550 },
            items = {
                { id = 'g000ig0006', min = 1, max = 1 }
            }
        }       
    elseif tier == 2.01 then
        lootType = {
            itemTypes = { Item.Valuable },
            value = { min = 2000, max = 2500 },
            itemValue = { min = 1000, max = 2500 },
            items = getReward(tier)
        }
    elseif tier == 2.02 then
        lootType = {
            itemTypes = { Item.Valuable },
            value = { min = 2000, max = 2500 },
            itemValue = { min = 1000, max = 2500 },
            items = getReward(tier)
        }
    elseif tier == 3 then
        lootType = {
            itemTypes = { Item.Scroll, Item.Valuable },
            value = { min = 1200, max = 2000 },
            itemValue = { min = 400, max = 550 },
            items = getReward(tier)
        }
    elseif tier == 4 then
        lootType = {
            itemTypes = rewardType[math.random(#rewardType)],
            value = { min = 1400, max = 1800 },
            itemValue = { min = 1000, max = 1800 },
            items = {
                { id = 'g001ig0152', min = 1, max = 1 },
            }
        }
    end

    return {
        subraceTypes = subR,
        value = experienceValue,
        loot = lootType
    }

end

function getBags(zoneType)
    local zoneBags = { }
    if zoneType == Zone.PlayerStart then
        zoneBags = {
            count = 3,
            loot = {
                itemTypes = { Item.Valuable, Item.Scroll, Item.Orb },
                value = { min = 800, max = 1000 },
                itemValue = { min = 100, max = 250 },
                items = {
                    { id = 'g000ig0005', min = 1, max = 1 },
                    { id = 'g001ig0378', min = 1, max = 1 },
                    { id = 'g000ig0001', min = 1, max = 1 },
                    { id = 'g000ig5027', min = 1, max = 1 },
                }
            }
        }
    end

    if zoneType == Zone.Treasure then
        zoneBags = {
            count = 3,
            loot = {
                itemTypes = { Item.Valuable, Item.Scroll, Item.PotionBoost },
                value = { min = 1000, max = 1200 },
                itemValue = { min = 150, max = 450 },
                items = {
                    { id = 'g000ig0005', min = 1, max = 1 },
                    { id = 'g000ig0006', min = 1, max = 1 },
                    { id = 'g000ig0001', min = 1, max = 1 },
                    { id = 'g001ig0407', min = 1, max = 1 },
                }
            }
        }
    end

    return zoneBags

end

function subraceRandomizer()
    local subraces = { }
    local i = 1

    if math.random(0,1) == 1 then subraces[i] = Subrace.Neutral i = i + 1 end
    if math.random(0,1) == 1 then subraces[i] = Subrace.NeutralGreenSkin i = i + 1 end
    if math.random(0,1) == 1 then subraces[i] = Subrace.NeutralMarsh i = i + 1 end
    if math.random(0,1) == 1 then subraces[i] = Subrace.NeutralWolf i = i + 1 end
    if math.random(0,1) == 1 then subraces[i] = Subrace.NeutralBarbarian i = i + 1 end
    if math.random(0,1) == 1 then subraces[i] = Subrace.NeutralElf i = i + 1 end
    if math.random(0,1) == 1 then subraces[i] = Subrace.NeutralHuman i = i + 1 end
    if math.random(0,1) == 1 then subraces[i] = Subrace.NeutralDragon i = i + 1 end
    if math.random(0,1) == 1 then subraces[i] = Subrace.Human i = i + 1 end
    if math.random(0,1) == 1 then subraces[i] = Subrace.Elf i = i + 1 end
    if math.random(0,1) == 1 then subraces[i] = Subrace.Dwarf i = i + 1 end
    if math.random(0,1) == 1 then subraces[i] = Subrace.Undead i = i + 1 end
    if math.random(0,1) == 1 then subraces[i] = Subrace.Heretic i = i + 1 end

    return subraces
end

function getMercenary()
    local mercenaryUnits = { }
    local i = 1

    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu0161', level = 3, unique = true } i = i + 1 end --alchemist
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu8311', level = 3, unique = true } i = i + 1 end --ardet
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu8027', level = 3, unique = true } i = i + 1 end --archont
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu0154', level = 3, unique = true } i = i + 1 end --assasin
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu7562', level = 3, unique = true } i = i + 1 end --borealis
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu5040', level = 1, unique = true } i = i + 1 end --barbarian
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g001uu7571', level = 2, unique = true } i = i + 1 end --white wolf
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g001uu7563', level = 2, unique = true } i = i + 1 end --volkolak
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu0041', level = 3, unique = true } i = i + 1 end --mountaineer
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu0064', level = 3, unique = true } i = i + 1 end --demonologist
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu8227', level = 3, unique = true } i = i + 1 end --dendrophont
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu0038', level = 3, unique = true } i = i + 1 end --veteran
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu2030', level = 3, unique = true } i = i + 1 end --detective
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu0035', level = 3, unique = true } i = i + 1 end --druid
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu6121', level = 1, unique = true } i = i + 1 end --dhampir
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g001uu7581', level = 3, unique = true } i = i + 1 end --sorcerer ice
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu0162', level = 3, unique = true } i = i + 1 end --forge defender
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu0085', level = 3, unique = true } i = i + 1 end --evil spirit
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu7569', level = 3, unique = true } i = i + 1 end --hierey
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu0005', level = 3, unique = true } i = i + 1 end --inquisitor
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu7558', level = 3, unique = true } i = i + 1 end --issa
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g001uu8283', level = 1, unique = true } i = i + 1 end --stone spider
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu7609', level = 1, unique = true } i = i + 1 end --quartermaster
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu2012', level = 3, unique = true } i = i + 1 end --centaur archer
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g001uu7579', level = 3, unique = true } i = i + 1 end --centaur quardian
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu0068', level = 3, unique = true } i = i + 1 end --sorceress
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu7610', level = 1, unique = true } i = i + 1 end --ice walker
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu8033', level = 3, unique = true } i = i + 1 end --forest maiden
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu0091', level = 3, unique = true } i = i + 1 end --dark lord
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu0010', level = 3, unique = true } i = i + 1 end --mage
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g006uu1128', level = 3, unique = true } i = i + 1 end --master of oven
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu2007', level = 3, unique = true } i = i + 1 end --mumificator
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu2003', level = 3, unique = true } i = i + 1 end --tormentor
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu0082', level = 3, unique = true } i = i + 1 end --necromancer
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu5012', level = 1, unique = true } i = i + 1 end --bagatur
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g003uu5003', level = 3, unique = true } i = i + 1 end --zealot
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu0013', level = 3, unique = true } i = i + 1 end --priest
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu0088', level = 3, unique = true } i = i + 1 end --skeleton warrior
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu7619', level = 1, unique = true } i = i + 1 end --adept of cult
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu7568', level = 3, unique = true } i = i + 1 end --shaker
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu8020', level = 3, unique = true } i = i + 1 end --stinger
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu2015', level = 3, unique = true } i = i + 1 end --holy guard
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu8023', level = 3, unique = true } i = i + 1 end --fire guardian
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g001uu7564', level = 2, unique = true } i = i + 1 end --hort
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu8024', level = 3, unique = true } i = i + 1 end --ice watcher
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu0054', level = 3, unique = true } i = i + 1 end --black paladin
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g001uu7565', level = 2, unique = true } i = i + 1 end --plague werewolf
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g001uu8267', level = 3, unique = true } i = i + 1 end --ghost elf
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu7590', level = 1, unique = true } i = i + 1 end --lizzard archer

    return {
        units = mercenaryUnits,
    }

end

function getStartingMines(race)
    local zoneMines = { }

    zoneMines.gold = 1

    if race == Race.Human then
        zoneMines.lifeMana = 1
    elseif race == Race.Dwarf then
        zoneMines.runicMana = 1
    elseif race == Race.Undead then
        zoneMines.deathMana = 1
    elseif race == Race.Heretic then
        zoneMines.infernalMana = 1
    elseif race == Race.Elf then
        zoneMines.groveMana = 1
    end
    
    return zoneMines
end

function getNeutralMines(race1, race2)
    local zoneMines = { }

    zoneMines.gold = 1
    zoneMines.lifeMana = 1
    zoneMines.runicMana = 1
    zoneMines.deathMana = 1
    zoneMines.infernalMana = 1
    zoneMines.groveMana = 1

    if race1 == Race.Human or race2 == Race.Human then
        zoneMines.lifeMana = 0
    end

    if race1 == Race.Dwarf or race2 == Race.Dwarf then
        zoneMines.runicMana = 0
    end

    if race1 == Race.Undead or race2 == Race.Undead then
        zoneMines.deathMana = 0
    end

    if race1 == Race.Heretic or race2 == Race.Heretic then
        zoneMines.infernalMana = 0
    end

    if race1 == Race.Elf or race2 == Race.Elf then
        zoneMines.groveMana = 0
    end

    return zoneMines
end

function getPlayerSubRace(race)
	if race == Race.Human then return Subrace.Human
	elseif race == Race.Dwarf then return Subrace.Dwarf
	elseif race == Race.Undead then return Subrace.Undead
	elseif race == Race.Heretic then return Subrace.Heretic
	elseif race == Race.Elf then return Subrace.Elf
	end
end

function getStartingZone(zoneId, playerRace, zoneSize)
    local randomItems = {{ Item.Armor, Item.Weapon }, { Item.Banner }, { Item.Jewel }}

    return {
		id = zoneId,
		type = Zone.PlayerStart,
		race = playerRace,
		size = zoneSize,
        border = Border.SemiOpen,
        gapChance = 75,

        capital = {
            garrison = {
                subraceTypes = { getPlayerSubRace(playerRace) },
                value = { min = 50, max = 50 },
                loot = {
                    items = {
                        { id = 'g000ig0001', min = 2, max = 2 },
                        { id = 'g000ig0005', min = 2, max = 2 },
                        { id = 'g001ig0378', min = 2, max = 2 },
                        { id = 'g000ig0006', min = 2, max = 2 },
                        { id = 'g000ig0008', min = 2, max = 2 },
                        { id = 'g000ig0014', min = 1, max = 1 },
                        { id = 'g000ig0002', min = 1, max = 1 },
                        { id = t1Orbs[math.random(#t1Orbs)], min = 1, max = 1 },
                        { id = t1Orbs[math.random(#t1Orbs)], min = 1, max = 1 },
                        { id = t1Orbs[math.random(#t1Orbs)], min = 1, max = 1 },
                        { id = 'g000ig5021', min = 1, max = 1 },
                        { id = 'g001ig0407', min = 1, max = 1 },
                    }
                }
            }
        },

        bags = getBags(Zone.PlayerStart),

        merchants = {
            {
                goods = {
                    items = {
                        { id = 'g000ig0005', min = 5, max = 5 },
                        { id = 'g001ig0378', min = 5, max = 5 },
                        { id = 'g000ig0001', min = 3, max = 3 },
                        { id = 'g000ig0014', min = 2, max = 2 },
                        { id = 'g000ig0002', min = 2, max = 2 },
                        { id = 'g000ig0011', min = 2, max = 2 },
                        { id = 'g000ig0008', min = 2, max = 2 },
                        { id = 'g000ig0022', min = 2, max = 2 },
                        { id = 'g000ig0021', min = 2, max = 2 },
                        { id = 'g000ig0023', min = 2, max = 2 },
                        { id = 'g000ig0024', min = 2, max = 2 },
                        { id = 'g001ig0125', min = 2, max = 2 },
                        { id = 'g001ig0036', min = 2, max = 2 },
                        { id = 'g001ig0006', min = 1, max = 1 },
                    },
                    itemTypes = { Item.Armor, Item.Weapon, Item.Banner, Item.Jewel, Item.TravelItem },
                    itemValue = { min = 300, max = 500 },
                    value = { min = 3000, max = 4000 }
                }
            }
        },

        stacks = {
            getStack(0, 3, subraceRandomizer(), {  }, {  }),
            getStack(1, 1, subraceRandomizer(), { Item.Scroll }, { min = 150, max = 400 }),
            getStack(1, 1, subraceRandomizer(), { Item.Orb, Item.PotionBoost }, { min = 200, max = 250 }),
            getStack(1, 1, subraceRandomizer(), { Item.PotionBoost }, { min = 100, max = 525 }),
            getStack(1, 1, subraceRandomizer(), { Item.PotionBoost }, { min = 100, max = 525 }),
            getStack(1, 1, subraceRandomizer(), { Item.PotionBoost }, { min = 100, max = 525 }),
            getStack(2, 1, subraceRandomizer(), { Item.Scroll, Item.Valuable }, { min = 150, max = 500 }),
        },

        mines = getStartingMines(playerRace),

        ruins = {
            {
                gold = {min = 200, max = 250},
                loot = {
                    itemTypes = randomItems[math.random(#randomItems)],
                    value = { min = 600, max = 600 },
                    itemValue = { min = 300, max = 600 },
                },
                guard = {
                    subraceTypes = subraceRandomizer(),
                    value = {min = 220, max = 250}
                },
            },
        },
    }
end

function getMageZone(zoneId, zoneSize, race)
    return {
		id = zoneId,
		type = Zone.Treasure,
		size = zoneSize,
        border = Border.Water,

        bags = getBags(Zone.Treasure),

        stacks = {
            getStack(2, 1, subraceRandomizer(), { Item.TravelItem }, { min = 300, max = 500 }),
            getStack(1, 1, subraceRandomizer(), { Item.Orb, Item.PotionHeal }, { min = 50, max = 400 }),
            getStack(1, 1, subraceRandomizer(), { Item.Scroll, Item.Valuable }, { min = 200, max = 400 }),
            getStack(2, 1, subraceRandomizer(), { Item.PotionBoost }, { min = 150, max = 500 }),
            getStack(2, 1, subraceRandomizer(), { Item.Scroll }, { min = 400, max = 400 }),
            getStack(2, 1, subraceRandomizer(), { Item.Valuable }, { min = 500, max = 750 }),
            getStack(2, 1, subraceRandomizer(), { Item.PotionBoost }, { min = 250, max = 550 }),
        },

        mines = getStartingMines(race),

        towns = {
            {
                tier = 1,
                stack = getGuard(2.02, subraceRandomizer())
            }
        },

        ruins = {
            {
                gold = {min = 250, max = 320},
                loot = {
                    items = {{id = 'g001ig0151', min = 1, max = 1}}
                },
                guard = {
                    subraceTypes = subraceRandomizer(),
                    value = {min = 280, max = 330}
                },
            },
        },

        mages = {
            {
                value = { min = 3500, max = 4500 },
                spellLevel = { min = 1, max = 3}
            }
        },
    }
end

function getRuinZone(zoneId, zoneSize, race)
    return {
		id = zoneId,
		type = Zone.Treasure,
		size = zoneSize,
        border = Border.SemiOpen,
        gapChance = 70,

        bags = getBags(Zone.Treasure),

        stacks = {
            getStack(1, 1, subraceRandomizer(), { Item.PotionBoost }, { min = 150, max = 450 }),
            getStack(1, 1, subraceRandomizer(), { Item.Valuable }, { min = 250, max = 400 }),
            getStack(1, 1, subraceRandomizer(), { Item.Scroll }, { min = 200, max = 400 }),
            getStack(2, 1, subraceRandomizer(), { Item.Scroll, Item.Valuable }, { min = 150, max = 500 }),
            getStack(2, 1, subraceRandomizer(), { Item.PotionBoost, Item.PotionHeal }, { min = 150, max = 525 }),
            getStack(2, 1, subraceRandomizer(), { Item.Scroll }, { min = 200, max = 400 }),
            getStack(3, 1, subraceRandomizer(), { Item.Wand }, { min = 400, max = 700 }),
        },

        mines = getStartingMines(race),

        towns = {
            {
                tier = 1,
                stack = getGuard(2.01, subraceRandomizer())
            }
        },

        ruins = {
            {
                gold = {min = 300, max = 400},
                loot = {
                    items = {{ id = 'g000ig5006', min = 1, max = 1 }}
                },
                guard = {
                    subraceTypes = subraceRandomizer(),
                    value = {min = 370, max = 420}
                },
            },
            {
                gold = {min = 250, max = 330},
                loot = {
                    items = {{ id = t3Orbs[math.random(#t3Orbs)], min = 1, max = 1 }}
                },
                guard = {
                    subraceTypes = subraceRandomizer(),
                    value = {min = 380, max = 450}
                },
            },
        },
    }
end

function getTownZone(zoneId, zoneSize, race1, race2)
    local zoneOthers = { }

    if zoneId == 2 then
        zoneOthers[1] = { getMercenary() }
        zoneOthers[2] = { }
    elseif zoneId == 6 then
        zoneOthers[1] = { }
        zoneOthers[2] = { {  } }
    end

    return {
		id = zoneId,
		type = Zone.Treasure,
		size = zoneSize,
        border = Border.Water,

        bags = getBags(Zone.Treasure),

        stacks = {
            getStack(2, 1, subraceRandomizer(), { Item.Scroll, Item.Valuable }, { min = 150, max = 500 }),
            getStack(2, 1, subraceRandomizer(), { Item.Valuable }, { min = 250, max = 500 }),
            getStack(2, 1, subraceRandomizer(), { Item.PotionBoost, Item.Orb }, { min = 150, max = 500 }),
            getStack(3, 1, subraceRandomizer(), { Item.PotionPermanent, Item.Valuable }, { min = 400, max = 700 }),
            getStack(3, 1, subraceRandomizer(), { Item.Scroll }, { min = 400, max = 550 }),
            getStack(2, 1, subraceRandomizer(), { Item.PotionBoost }, { min = 150, max = 500 }),
        },

        mines = getNeutralMines(race1, race2),

        towns = {
            {
                tier = 2,
                stack = getGuard(3, subraceRandomizer())
            }
        },

        --mercenaries = zoneOthers[1],

        --trainers = zoneOthers[2],

        merchants = {
            {
                goods = {
                    itemTypes = { Item.Scroll, Item.PotionBoost },
                    value = { min = 4000, max = 4800 },
                    itemValue = { min = 150, max = 550 },
                    items = {
                        { id = 'g001ig0534', min = 1, max = 1 },
                    }
                }
            }
        },

        ruins = {
            {
                gold = {min = 300, max = 400},
                loot = {
                    items = {{ id = 'g001ig0282', min = 1, max = 1 }}
                },
                guard = {
                    subraceTypes = subraceRandomizer(),
                    value = {min = 420, max = 470}
                },
            },
        }
    }
end

function getSkirmishZone(zoneId, zoneSize, race1, race2)
    local randomOrbTalisman = { 'g000ig9136', 'g001ig0185', 'g001ig0202', 'g000ig9103', 'g001ig0136', 'g000ig9021', 'g001ig0480', 'g000ig9028', 'g001ig0303', 'g001ig0462', 'g001ig0489', 'g001ig0131', 'g001ig0466', 'g001ig0457' }
    local randomScroll = { 'g000ig5105', 'g000ig5075', 'g000ig5035', 'g000ig5115', 'g000ig5017', 'g000ig5077', 'g000ig5076', 'g000ig5037', 'g000ig5082', 'g000ig5036', 'g000ig5055', 'g000ig5056',  }

    return {
		id = zoneId,
		type = Zone.Treasure,
		size = zoneSize,
        border = Border.SemiOpen,
        gapChance = 40,

        bags = getBags(Zone.Treasure),

        stacks = {
            getStack(3, 1, subraceRandomizer(), { Item.PotionBoost }, { min = 150, max = 525 }),
            getStack(2, 1, subraceRandomizer(), { Item.Valuable }, { min = 250, max = 500 }),
            getStack(3, 1, subraceRandomizer(), { Item.PotionBoost }, { min = 150, max = 525 }),
            getStack(3, 1, subraceRandomizer(), { Item.PotionBoost }, { min = 150, max = 525 }),
            getStack(2, 1, subraceRandomizer(), { Item.Scroll, Item.Orb }, { min = 200, max = 400 }),
            getStack(3, 1, subraceRandomizer(), { Item.PotionBoost, Item.Valuable }, { min = 150, max = 500 }),
            getStack(3, 1, subraceRandomizer(), { Item.Scroll }, { min = 400, max = 550 }),
        },

        mines = getNeutralMines(race1, race2),

        ruins = {
            {
                gold = {min = 350, max = 450},
                loot = {
                    items = {{ id = randomOrbTalisman[math.random(#randomOrbTalisman)], min = 1, max = 1 }}
                },
                guard = {
                    subraceTypes = subraceRandomizer(),
                    value = {min = 580, max = 630}
                },
            },
            {
                gold = {min = 400, max = 500},
                loot = {
                    items = {{ id = randomScroll[math.random(#randomScroll)], min = 1, max = 1 }}
                },
                guard = {
                    subraceTypes = subraceRandomizer(),
                    value = {min = 600, max = 700}
                },
            },
        },

        merchants = {
            {
                goods = {
                    items = {
                        { id = 'g000ig0005', min = 5, max = 5 },
                        { id = 'g001ig0378', min = 5, max = 5 },
                        { id = 'g000ig0006', min = 3, max = 3 },
                        { id = 'g000ig0001', min = 3, max = 3 },
                        { id = 'g000ig0014', min = 2, max = 2 },
                        { id = 'g000ig0002', min = 2, max = 2 },
                        { id = 'g000ig0011', min = 2, max = 2 },
                        { id = 'g000ig0008', min = 2, max = 2 },
                        { id = 'g000ig0022', min = 2, max = 2 },
                        { id = 'g000ig0021', min = 2, max = 2 },
                        { id = 'g000ig0023', min = 2, max = 2 },
                        { id = 'g000ig0024', min = 2, max = 2 },
                        { id = 'g001ig0125', min = 2, max = 2 },
                        { id = 'g001ig0036', min = 2, max = 2 },
                    },
                    itemTypes = { Item.Scroll, Item.Orb, Item.Wand },
                    itemValue = { min = 100, max = 550 },
                    value = { min = 2200, max = 3000 }
                }
            }
        },

    }
end


function getZones(races)

	local zones = {}

    zones[1] = getStartingZone(0, races[1], 269)

    zones[2] = getMageZone(1, 256, races[1])

    zones[3] = getTownZone(2, 256, races[1], races[2])

    zones[4] = getRuinZone(3, 256, races[2])

    zones[5] = getStartingZone(4, races[2], 269)

    zones[6] = getMageZone(5, 256, races[2])

    zones[7] = getTownZone(6, 256, races[1], races[2])

    zones[8] = getRuinZone(7, 256, races[1])

    zones[9] = getSkirmishZone(8, 230, races[1], races[2])

	return zones
end

function getConnections()

    local connections = { }

    for i = 1,2 do
        connections[i] = { from = 0, to = 1, guard = getGuard(1.01, subraceRandomizer()) }
    end

    for i = 3,4 do
        connections[i] = { from = 0, to = 7, guard = getGuard(1.01, subraceRandomizer()) }
    end

    for i = 5,6 do
        connections[i] = { from = 0, to = 8 }
    end

    for i = 7,8 do
        connections[i] = { from = 4, to = 3, guard = getGuard(1.01, subraceRandomizer()) }
    end

    for i = 9,10 do
        connections[i] = { from = 4, to = 5, guard = getGuard(1.01, subraceRandomizer()) }
    end

    for i = 11,12 do
        connections[i] = { from = 4, to = 8 }
    end

    for i = 13,14 do
        connections[i] = { from = 1, to = 2, guard = getGuard(1.5, subraceRandomizer()) }
    end

    for i = 15,16 do
        connections[i] = { from = 3, to = 2, guard = getGuard(1.5, subraceRandomizer()) }
    end

    for i = 17,18 do
        connections[i] = { from = 5, to = 6, guard = getGuard(1.5, subraceRandomizer()) }
    end

    for i = 19,20 do
        connections[i] = { from = 7, to = 6, guard = getGuard(1.5, subraceRandomizer()) }
    end

    connections[21] = { from = 2, to = 8, guard = getGuard(4, subraceRandomizer()) }
    connections[22] = { from = 6, to = 8, guard = getGuard(4, subraceRandomizer()) }
    
    connections[23] = { from = 1, to = 8 }
    connections[24] = { from = 3, to = 8 }
    connections[25] = { from = 5, to = 8 }
    connections[26] = { from = 7, to = 8 }

	return connections
end

function getTemplateContents(races)
	return {
		zones = getZones(races),
		connections = getConnections()
	}
end

template = {
    name = 'ascension 1.3.3',
    description = 'ascension 1.3.3S by obscure, SMNS2, 48x48, 2 players',
    minSize = 48,
    maxSize = 48,
    maxPlayers = 2,
    roads = 45,
    forest = 15,
    startingGold = 1250,
    startingNativeMana = 150,
    getContents = getTemplateContents,
    forbiddenSpells = {
        'g000ss0027', --мореплавание
        'g000ss0095', --сумерки
        'g000ss0083', --свет дня
        'g000ss0092', --terra illudere
        'g000ss0087', --ветер путешествий
        'g000ss0100', --скорость,
        'g000ss0006', --ускорение
        'g000ss0085', --искусный торговец
        'g000ss0176', --лисья хитрость
        'g000ss0031',
        'g000ss0140',
        'g000ss0071',
        'g000ss0139',
        'g000ss0138',
        'g000ss0141',
        'g000ss0108',
        'g000ss0195',
        'g000ss0189',
        'g000ss0174',
        'g000ss0175',
        'g000ss0149',
        'g000ss0132',
        'g000ss0173',
        'g000ss0156',
        'g000ss0130',
        'g000ss0154',
        'g000ss0200',
        'g000ss0123',
        'g000ss0144',
        'g000ss0121',
        'g000ss0110',
        'g000ss0151',
        'g000ss0131',
        'g000ss0177',
        'g000ss0124',
        'g000ss0129',
        'g000ss0153',
        'g000ss0192',
        'g000ss0133',
        'g000ss0157',
        'g000ss0150',
        'g000ss0191',
        'g000ss0190',
        'g000ss0063',
        'g000ss0135',
        'g000ss0146',
        'g000ss0155',
        'g000ss0159',
        'g000ss0128',
        'g000ss0122',
    },
    forbiddenItems = {
        'g001ig0349', --защита от вампиризма
        'g001ig0339', --защита от превращения
        'g001ig0333', --иммунитет к имитации
        'g001ig0078',
        'g001ig0077',
        'g001ig0074',
        'g001ig0075',
        'g001ig0076',
        'g000ig5031',
        'g000ig5015',
        'g000ig5038',
        'g000ig5071',
        'g000ig5108',
        'g000ig5117',
        'g000ig5078',
        'g001ig0080',
        'g001ig0081',
        'g001ig0079',
        'g001ig0085',
        'g001ig0095',
        'g001ig0103',
        'g000ig5084',
        'g000ig5119',
        'g000ig5030',
        'g001ig0195',
        'g001ig0193',
        'g000ig5100',
        'g001ig0573',
        'g001ig0574',
        'g000ig5006',
        'g000ig5027',
        'g000ig5094',
        'g000ig5053',
        'g001ig0492',
        'g000ig5009',
        'g000ig5085',
        'g001ig0084',
        'g001ig0386',
        'g001ig0606', --homelanders
        'g001ig0406',
        'g000ig6007',
        'g001ig0389',
        'g000ig6005',
        --scrolls damage t3 and higher
        'g000ig5060',
        'g000ig5054',
        'g000ig5090',
        'g000ig5019',
        'g000ig5109',
        'g000ig5033',
        'g000ig5037',
        'g000ig5014',
        'g000ig5072',
        'g000ig5086',
        'g000ig5080',
        'g000ig5112',
        'g000ig5077',
        'g000ig5093',
        'g000ig5105',
        'g000ig5081',

    },
    forbiddenUnits = {
        --summons that can spawn in capital
        'g001uu0101',
        'g001uu0049',
        'g000uu8036',
    }
}