local TemplateName = 'Ascension'
local Verison = '1.4.0'
local Timer = 'First turn: 720, next turns: 420'

function getName(name, version)
    return name .. ' ' .. version
end

function getDescription(name, version, timer)
    return name .. ' ' .. version .. 'S by obscure, SMNS2, 48x48, 2 players.\nPink zone center, Blue opposite Yellow, Red Opposite Black.\nTimer is: ' .. timer
end

function table_contains(tbl, x)
    found = false
    for _, v in pairs(tbl) do
        if v == x then 
            found = true 
        end
    end
    return found
end

function Shuffle(t)
    local s = {}
    for i = 1, #t do s[i] = t[i] end
    for i = #t, 2, -1 do
        local j = math.random(i)
        s[i], s[j] = s[j], s[i]
    end
    return s
end

function subraceRandomizer(tier)
    local tier0Subraces = {{Subrace.NeutralGreenSkin}, {Subrace.NeutralWolf}, {Subrace.NeutralHuman}}
    local tier1Subraces = {{Subrace.NeutralGreenSkin, Subrace.NeutralMarsh}, {Subrace.NeutralMarsh, Subrace.NeutralWolf}, {Subrace.NeutralHuman, Subrace.Human}, {Subrace.NeutralElf, Subrace.Elf}}
    local tier2Subraces = {{Subrace.NeutralMarsh, Subrace.NeutralWater}, {Subrace.NeutralBarbarian, Subrace.Dwarf}, {Subrace.NeutralElf, Subrace.Elf}, {Subrace.NeutralGreenSkin, Subrace.Undead}, {Subrace.Neutral, Subrace.Heretic}, {Subrace.NeutralHuman, Subrace.Human, Subrace.NeutralWolf}}

    if tier == 0 then
        return tier0Subraces[math.random(#tier0Subraces)]
    elseif tier == 1 then
        return tier1Subraces[math.random(#tier1Subraces)]
    else
        return tier2Subraces[math.random(#tier1Subraces)]
    end
end


function tier0stack(tier)
    return {
        count = 1,
        value = { min = 120, max = 160 },
        subraceTypes = subraceRandomizer(tier),
        loot = {},
    }
end

function tier1stackHeal(tier)
    return {
        count = 1,
        value = { min = 180, max = 220 },
        subraceTypes = subraceRandomizer(tier),
        loot = {
            itemTypes = { Item.PotionBoost },
            itemValue = { min = 150, max = 150 },
            value = { min = 150, max = 150 },
            items = {
                { id = 'g000ig0005', min = 1, max = 1 },
                { id = 'g000ig0006', min = 1, max = 1 },
            },
        },
    }
end

function tier1stackResurrection(tier)
    return {
        count = 1,
        value = { min = 170, max = 200 },
        subraceTypes = subraceRandomizer(tier),
        loot = {
            itemTypes = { Item.PotionHeal },
            value = { min = 100, max = 150 },
            items = {
                { id = 'g000ig0001', min = 1, max = 1 },
            },
        },
    }
end

function tier1stackScroll(tier)
    return {
        count = 1,
        value = { min = 180, max = 220 },
        subraceTypes = subraceRandomizer(tier),
        loot = {
            itemTypes = { Item.Scroll },
            itemValue = { min = 150, max = 200 },
            value = { min = 200, max = 200 },
            items = {
                { id = 'g001ig0378', min = 0, max = 1 },
                { id = 'g001ig0180', min = 0, max = 2 },
            },
        },
    }
end

function tier1stackPotion(tier)
    return {
        count = 1,
        value = { min = 180, max = 220 },
        subraceTypes = subraceRandomizer(tier),
        loot = {
            itemTypes = { Item.PotionBoost },
            itemValue = { min = 150, max = 250 },
            value = { min = 400, max = 400 },
            items = {
                { id = 'g000ig0005', min = 0, max = 2 },
                { id = 'g001ig0180', min = 0, max = 2 },
            },
        },
    }
end

function tier1stackValuable(tier)
    return {
        count = 1,
        value = { min = 180, max = 220 },
        subraceTypes = subraceRandomizer(tier),
        loot = {
            itemTypes = { Item.Valuable },
            itemValue = { min = 250, max = 500 },
            value = { min = 500, max = 500 },
            items = {
                { id = 'g000ig0005', min = 0, max = 2 },
                { id = 'g001ig0180', min = 0, max = 2 },
            },
        },
    }
end

function tier1stackOrb(tier)
    return {
        count = 1,
        value = { min = 200, max = 240 },
        subraceTypes = subraceRandomizer(tier),
        loot = {
            itemTypes = { Item.Orb },
            itemValue = { min = 100, max = 400 },
            value = { min = 400, max = 400 },
            items = {
                { id = 'g000ig0006', min = 1, max = 1 },
            },
        },
    }
end

function tier2stackHeal(tier)
    return {
        count = 1,
        value = { min = 260, max = 310 },
        subraceTypes = subraceRandomizer(tier),
        loot = {
            itemTypes = { Item.PotionBoost },
            itemValue = { min = 150, max = 150 },
            value = { min = 300, max = 300 },
            items = {
                { id = 'g000ig0018', min = 1, max = 1 },
                { id = 'g001ig0180', min = 0, max = 2 },
            },
        },
    }
end

function tier2stackResurrection(tier)
    return {
        count = 1,
        value = { min = 250, max = 280 },
        subraceTypes = subraceRandomizer(tier),
        loot = {
            itemTypes = { Item.Scroll },
            itemValue = { min = 150, max = 400 },
            value = { min = 400, max = 400 },
            items = {
                { id = 'g000ig0001', min = 1, max = 1 },
            },
        },
    }
end

function tier2stackScroll(tier)
    return {
        count = 1,
        value = { min = 260, max = 310 },
        subraceTypes = subraceRandomizer(tier),
        loot = {
            itemTypes = { Item.Scroll },
            itemValue = { min = 150, max = 200 },
            value = { min = 400, max = 400 },
            items = {
                { id = 'g001ig0378', min = 1, max = 1 },
                { id = 'g000ig0005', min = 1, max = 1 },
            },
        },
    }
end

function tier2stackPotion(tier)
    return {
        count = 1,
        value = { min = 260, max = 310 },
        subraceTypes = subraceRandomizer(tier),
        loot = {
            itemTypes = { Item.PotionBoost },
            itemValue = { min = 150, max = 450 },
            value = { min = 600, max = 600 },
            items = {
                { id = 'g000ig0001', min = 1, max = 1 },
            },
        },
    }
end

function tier2stackValuable(tier)
    return {
        count = 1,
        value = { min = 280, max = 340 },
        subraceTypes = subraceRandomizer(tier),
        loot = {
            itemTypes = { Item.Valuable },
            itemValue = { min = 250, max = 750 },
            value = { min = 1000, max = 1000 },
            items = {
                { id = 'g000ig0005', min = 0, max = 2 },
                { id = 'g001ig0180', min = 0, max = 2 },
            },
        },
    }
end

function tier2stackBoots(tier)
    return {
        count = 1,
        value = { min = 260, max = 310 },
        subraceTypes = subraceRandomizer(tier),
        loot = {
            itemTypes = { Item.TravelItem },
            itemValue = { min = 300, max = 500 },
            value = { min = 500, max = 500 },
            items = {
                { id = 'g000ig0001', min = 1, max = 1 },
                { id = 'g000ig0006', min = 1, max = 1 },
            },
        },
    }
end

function tier2stackOrb(tier)
    return {
        count = 1,
        value = { min = 260, max = 310 },
        subraceTypes = subraceRandomizer(tier),
        loot = {
            itemTypes = { Item.Orb },
            itemValue = { min = 400, max = 500 },
            value = { min = 500, max = 500 },
            items = {
                { id = 'g000ig0005', min = 2, max = 2 },
            },
        },
    }
end

function tier3stackHeal(tier)
    return {
        count = 1,
        value = { min = 340, max = 420 },
        subraceTypes = subraceRandomizer(tier),
        loot = {
            itemTypes = { Item.PotionBoost },
            itemValue = { min = 150, max = 600 },
            value = { min = 600, max = 600 },
            items = {
                { id = 'g000ig0018', min = 1, max = 1 },
                { id = 'g001ig0378', min = 1, max = 1 },
            },
        },
    }
end

function tier3stackPotion(tier)
    return {
        count = 1,
        value = { min = 340, max = 420 },
        subraceTypes = subraceRandomizer(tier),
        loot = {
            itemTypes = { Item.PotionBoost },
            itemValue = { min = 150, max = 600 },
            value = { min = 600, max = 600 },
            items = {
                { id = 'g000ig0001', min = 1, max = 1 },
            },
        },
    }
end

function tier3stackScroll(tier)
    return {
        count = 1,
        value = { min = 340, max = 420 },
        subraceTypes = subraceRandomizer(tier),
        loot = {
            itemTypes = { Item.Scroll },
            itemValue = { min = 400, max = 400 },
            value = { min = 800, max = 800 },
        },
    }
end

function tier3stackValuable(tier)
    return {
        count = 1,
        value = { min = 340, max = 420 },
        subraceTypes = subraceRandomizer(tier),
        loot = {
            itemTypes = { Item.Valuable },
            itemValue = { min = 500, max = 1500 },
            value = { min = 1500, max = 1500 },
        },
    }
end

function tier3stackPermanent(tier)
    return {
        count = 1,
        value = { min = 340, max = 420 },
        subraceTypes = subraceRandomizer(tier),
        loot = {
            itemTypes = { Item.PotionPermanent },
            itemValue = { min = 400, max = 700 },
            value = { min = 1000, max = 1100 },
            items = {
                { id = 'g000ig0006', min = 1, max = 1 },
            },
        },
    }
end

local talismans_2_01 = { 'g000ig9130', 'g001ig0185', 'g001ig0063'}
local armor_2_01 = { 'g001ig0048', 'g001ig0582', 'g001ig0042', 'g001ig0612', 'g001ig0045', 'g000ig2003', 'g001ig0040', 'g001ig0558', 'g001ig0557', 'g001ig0559', 'g001ig0047', 'g001ig0416', 'g001ig0041', 'g001ig0589', 'g001ig0591', 'g001ig0594', 'g001ig0071' }
local weapon_2_01 = { 'g000ig3002', 'g000ig3017', 'g000ig3003', 'g001ig0487', 'g001ig0173', 'g001ig0197', 'g001ig0417', 'g001ig0196', 'g000ig9137', 'g001ig0182' }
local jewel_2_01 = { 'g001ig0421', 'g001ig0420', 'g001ig0424', 'g001ig0104', 'g001ig0605', 'g001ig0422', 'g001ig0423', 'g001ig0427', 'g001ig0429', 'g001ig0430', 'g001ig0539', 'g001ig0037' }

local talismans_2_02 = { 'g000ig9128', 'g000ig9123', 'g000ig9116'}
--local banner_2_02 = { 'g001ig0293', 'g000ig1004', 'g001ig0362', 'g001ig0364', 'g001ig0361', 'g001ig0289', 'g001ig0370', 'g001ig0357', 'g000ig1002', 'g001ig0363', 'g001ig0358', 'g000ig1006', 'g001ig0369', 'g001ig0374', 'g001ig0588', 'g000ig1008', 'g001ig0292' }
local banner_2_02 = { 'g000ig1005', 'g001ig0051', 'g000ig1001', 'g001ig0370', 'g001ig0373', 'g001ig0587', 'g000ig1007', 'g001ig0369', 'g000ig1003' }
local travel_2_02 = { 'g001ig0112', 'g001ig0111', 'g000ig8003', 'g001ig0114', 'g000ig1010' }

--local banner_3 = { 'g000ig1016', 'g000ig1017', 'g001ig0052', 'g000ig1015', 'g001ig0290', 'g001ig0291' }
local banner_3 = { 'g001ig0293', 'g000ig1004', 'g001ig0362', 'g001ig0364', 'g001ig0361', 'g001ig0289', 'g001ig0357', 'g000ig1002', 'g001ig0363', 'g001ig0358', 'g000ig1006', 'g001ig0374', 'g000ig1008', 'g001ig0365', 'g001ig0292',  }
local jewel_3 = { 'g001ig0156', 'g001ig0419', 'g001ig0038', 'g001ig0116', 'g000ig3005' }
local permanent_3 = { 'g001ig0308', 'g001ig0518', 'g001ig0521', 'g001ig0506', 'g001ig0314', 'g001ig0376', 'g001ig0310', 'g001ig0312', 'g001ig0316' }

local top_banner = { 'g001ig0153', 'g000ig1016', 'g000ig1017', 'g001ig0052', 'g000ig1015', 'g001ig0290', 'g001ig0360', 'g001ig0291' }

local t1Orbs = {'g001ig0133', 'g000ig9017', 'g001ig0189', 'g001ig0178', 'g001ig0472', 'g000ig9031', 'g001ig0471', 'g001ig0470', 'g001ig0192', 'g001ig0464', 'g001ig0473', 'g000ig9022', 'g001ig0450', 'g000ig9033', 'g001ig0302', 'g001ig0458'}
local t2Orbs = {'g001ig0443', 'g001ig0176', 'g001ig0187', 'g001ig0304', 'g001ig0467', 'g001ig0191', 'g000ig9024', 'g001ig0461', 'g001ig0300', 'g001ig0496', 'g000ig9042', 'g001ig0475', 'g001ig0468', 'g001ig0478', 'g001ig0469', 'g001ig0454', 'g001ig0456', 'g000ig9018', 'g001ig0479', 'g001ig0453', 'g001ig0474', 'g001ig0134', 'g000ig9020'}
local t3Orbs = {'g000ig9028', 'g001ig0462', 'g000ig9025', 'g001ig0136', 'g000ig9021', 'g000ig9016', 'g001ig0480', 'g001ig0303', 'g001ig0459', 'g000ig9014', 'g001ig0203', 'g001ig0466', 'g001ig0183', 'g001ig0455', 'g001ig0489', 'g000ig9027', 'g001ig0131', 'g000ig9032'}

function townTier1_1Guard(tier)
    return {
        subraceTypes = subraceRandomizer(tier),
        value = { min = 380, max = 430 },
        loot = {
            itemTypes = { Item.Valuable },
            value = { min = 2000, max = 2500 },
            itemValue = { min = 1000, max = 2500 },
            items = {
                { id = 'g000ig0001', min = 1, max = 1 },
                { id = 'g000ig0018', min = 1, max = 1 },
                { id = talismans_2_01[math.random(#talismans_2_01)], min = 1, max = 1 },
                { id = armor_2_01[math.random(#armor_2_01)], min = 1, max = 1 },
                { id = weapon_2_01[math.random(#weapon_2_01)], min = 1, max = 1 },
                { id = jewel_2_01[math.random(#jewel_2_01)], min = 1, max = 1 },
                { id = t2Orbs[math.random(#t2Orbs)], min = 1, max = 1 },
            }
        }
    }
end

function townTier1_2Guard(tier)
    return {
        subraceTypes = subraceRandomizer(tier),
        value = { min = 380, max = 430 },
        loot = {
            itemTypes = { Item.Valuable },
            value = { min = 2000, max = 2500 },
            itemValue = { min = 1000, max = 2500 },
            items = {
                { id = 'g000ig0001', min = 1, max = 1 },
                { id = 'g000ig0018', min = 1, max = 1 },
                { id = talismans_2_02[math.random(#talismans_2_02)], min = 1, max = 1 },
                { id = banner_2_02[math.random(#banner_2_02)], min = 1, max = 1 },
                { id = travel_2_02[math.random(#travel_2_02)], min = 1, max = 1 },
                { id = 'g000ig5027', min = 1, max = 1 },
                { id = t2Orbs[math.random(#t2Orbs)], min = 1, max = 1 },
            }
        }
    }
end

function townTier2Guard(tier)
    return {
        subraceTypes = subraceRandomizer(tier),
        value = { min = 550, max = 650 },
        loot = {
            itemTypes = { Item.Scroll, Item.Valuable },
            value = { min = 1200, max = 2000 },
            itemValue = { min = 400, max = 550 },
            items = {
                { id = 'g001ig0152', min = 1, max = 1 },
                { id = 'g000ig0001', min = 1, max = 1 },
                { id = banner_3[math.random(#banner_3)], min = 1, max = 1 },
                { id = jewel_3[math.random(#jewel_3)], min = 1, max = 1 },
                { id = permanent_3[math.random(#permanent_3)], min = 1, max = 1 },
                { id = t2Orbs[math.random(#t2Orbs)], min = 1, max = 1 },
                { id = 'g001ig0606', min = 1, max = 1 },
            }
        }
    }
end

function zoneItemGuard(tier)
    local rewardType = {{ Item.Armor, Item.Weapon }, { Item.Banner }, { Item.Jewel }}

    return {
        subraceTypes = subraceRandomizer(tier),
        value = { min = 280, max = 330 },
        loot = {
            itemTypes = rewardType[math.random(#rewardType)],
            value = { min = 700, max = 700 },
            itemValue = { min = 400, max = 700 },
            items = {
                { id = 'g000ig7004', min = 1, max = 1 },
                { id = 'g001ig0486', min = 1, max = 1 },
                { id = 'g000ig0006', min = 2, max = 2 }
            }
        }

    }
end

function zonePotionGuard(tier)
    return {
        subraceTypes = subraceRandomizer(tier),
        value = { min = 280, max = 330 },
        loot = {
            itemTypes = { Item.PotionPermanent },
            value = { min = 700, max = 700 },
            itemValue = { min = 400, max = 700 },
            items = {
                { id = 'g000ig7004', min = 1, max = 1 },
                { id = 'g001ig0486', min = 1, max = 1 },
                { id = 'g000ig0006', min = 2, max = 2 }
            }
        }
    }
end

function zoneScrollGuard(tier)
    return {
        subraceTypes = subraceRandomizer(tier),
        value = { min = 280, max = 330 },
        loot = {
            itemTypes = { Item.Scroll },
            value = { min = 700, max = 750 },
            itemValue = { min = 200, max = 550 },
            items = {
                { id = 'g000ig7004', min = 1, max = 1 },
                { id = 'g001ig0486', min = 1, max = 1 },
                { id = 'g000ig0006', min = 2, max = 2 }
            }
        }
    }
end

function zoneHighPotionGuard(tier)
    return {
        subraceTypes = subraceRandomizer(tier),
        value = { min = 400, max = 490 },
        loot = {
            itemTypes = { Item.PotionBoost },
            value = { min = 750, max = 800 },
            itemValue = { min = 250, max = 550 },
            items = {
                { id = 'g000ig0001', min = 1, max = 1 }
            }
        }
    }
end

function zoneGreatGuard(tier)
    --local rewardType = {{ Item.Armor, Item.Weapon }, { Item.Banner }, { Item.Jewel }, { Item.PotionPermanent }}

    return {
        subraceTypes = subraceRandomizer(tier),
        value = { min = 650, max = 800 },
        loot = {
            -- itemTypes = rewardType[math.random(#rewardType)],
            -- value = { min = 1400, max = 1800 },
            -- itemValue = { min = 1000, max = 1800 },
            items = {
                { id = 'g001ig0152', min = 1, max = 1 },
                { id = top_banner[math.random(#top_banner)], min = 1, max = 1 }
            }
        }
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

function getNeutralMines(races, zoneId)
    local resultMines = { }
    if not table_contains(races, Race.Human) then
        table.insert(resultMines, 'lifeMana')
    end

    if not table_contains(races, Race.Undead) then
        table.insert(resultMines, 'deathMana')
    end

    if not table_contains(races, Race.Dwarf) then
        table.insert(resultMines, 'runicMana')
    end

    if not table_contains(races, Race.Heretic) then
        table.insert(resultMines, 'infernalMana')
    end

    if not table_contains(races, Race.Elf) then
        table.insert(resultMines, 'groveMana')
    end

    local result = {
        gold = 1
    }

    if zoneId == 2 then
        if resultMines[1] == 'lifeMana' then
            result.lifeMana = 1
        elseif resultMines[1] == 'deathMana' then
            result.deathMana = 1
        elseif resultMines[1] == 'runicMana' then
            result.runicMana = 1
        elseif resultMines[1] == 'infernalMana' then
            result.infernalMana = 1
        elseif resultMines[1] == 'groveMana' then
            result.groveMana = 1
        end
    elseif zoneId == 6 then
        if resultMines[2] == 'lifeMana' then
            result.lifeMana = 1
        elseif resultMines[2] == 'deathMana' then
            result.deathMana = 1
        elseif resultMines[2] == 'runicMana' then
            result.runicMana = 1
        elseif resultMines[2] == 'infernalMana' then
            result.infernalMana = 1
        elseif resultMines[2] == 'groveMana' then
            result.groveMana = 1
        end
    elseif zoneId == 8 then
        if resultMines[3] == 'lifeMana' then
            result.lifeMana = 1
        elseif resultMines[3] == 'deathMana' then
            result.deathMana = 1
        elseif resultMines[3] == 'runicMana' then
            result.runicMana = 1
        elseif resultMines[3] == 'infernalMana' then
            result.infernalMana = 1
        elseif resultMines[3] == 'groveMana' then
            result.groveMana = 1
        end
    end

    return result
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
                        { id = 'g000ig0001', min = 3, max = 3 },
                        { id = 'g000ig0005', min = 3, max = 3 },
                        { id = 'g001ig0378', min = 3, max = 3 },
                        { id = 'g000ig0006', min = 3, max = 3 },
                        { id = 'g000ig0008', min = 2, max = 2 },
                        { id = 'g000ig0014', min = 1, max = 1 },
                        { id = 'g000ig0002', min = 1, max = 1 },
                        { id = t1Orbs[math.random(#t1Orbs)], min = 1, max = 1 },
                        { id = t1Orbs[math.random(#t1Orbs)], min = 1, max = 1 },
                        { id = t1Orbs[math.random(#t1Orbs)], min = 1, max = 1 },
                        { id = 'g000ig5021', min = 1, max = 1 },
                        { id = 'g001ig0407', min = 1, max = 1 },
                        { id = 'g001ig0151', min = 1, max = 1 },
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
            tier0stack(0),
            tier0stack(0),
            tier0stack(0),
            tier1stackScroll(1),
            tier1stackPotion(1),
            tier1stackPotion(1),
            tier1stackResurrection(1),
            tier1stackHeal(1),
            tier1stackHeal(1),
            tier1stackResurrection(1),
            tier2stackValuable(2),
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
                    subraceTypes = subraceRandomizer(1),
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
            tier1stackHeal(1),
            tier1stackOrb(1),
            tier1stackScroll(1),
            tier1stackResurrection(1),
            tier2stackPotion(2),
            tier2stackHeal(2),
            tier2stackPotion(2),
            tier2stackValuable(2),
        },

        mines = getStartingMines(race),

        towns = {
            {
                tier = 1,
                stack = townTier1_2Guard(3),
            }
        },

        ruins = {
            {
                gold = {min = 250, max = 320},
                loot = {
                    items = {{id = 'g001ig0282', min = 1, max = 1}}
                },
                guard = {
                    subraceTypes = subraceRandomizer(2),
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
    local randomItems = {{ Item.Armor, Item.Weapon }, { Item.Banner }, { Item.Jewel }}

    return {
		id = zoneId,
		type = Zone.Treasure,
		size = zoneSize,
        border = Border.SemiOpen,
        gapChance = 70,

        bags = getBags(Zone.Treasure),

        stacks = {
            tier1stackScroll(1),
            tier1stackHeal(1),
            tier1stackValuable(1),
            tier1stackOrb(1),
            tier2stackScroll(2),
            tier2stackBoots(2),
            tier2stackPotion(2),
            tier3stackScroll(3),
        },

        mines = getStartingMines(race),

        towns = {
            {
                tier = 1,
                stack = townTier1_1Guard(3),
            }
        },

        ruins = {
            {
                gold = {min = 300, max = 400},
                loot = {
                    items = {{ id = 'g000ig5040', min = 1, max = 1 }}
                },
                guard = {
                    subraceTypes = subraceRandomizer(2),
                    value = {min = 370, max = 420}
                },
            },
            {
                gold = {min = 300, max = 350},
                loot = {
                    itemTypes = randomItems[math.random(#randomItems)],
                    value = { min = 1100, max = 1100 },
                    itemValue = { min = 700, max = 1100 },
                },
                guard = {
                    subraceTypes = subraceRandomizer(2),
                    value = {min = 380, max = 450}
                },
            },
        },
    }
end

function getTownZone(zoneId, zoneSize, races)
    return {
		id = zoneId,
		type = Zone.Treasure,
		size = zoneSize,
        border = Border.Water,

        bags = getBags(Zone.Treasure),

        stacks = {
            tier2stackValuable(2),
            tier2stackResurrection(2),
            tier2stackOrb(2),
            tier3stackScroll(3),
            tier2stackPotion(2),
            tier3stackPermanent(3),
            tier3stackHeal(3),
        },

        mines = getNeutralMines(races, zoneId),

        towns = {
            {
                tier = 2,
                stack = townTier2Guard(3),
            }
        },

        merchants = {
            {
                goods = {
                    itemTypes = { Item.Scroll, Item.PotionBoost },
                    value = { min = 4000, max = 4800 },
                    itemValue = { min = 150, max = 550 },
                    items = {
                        { id = 'g001ig0534', min = 1, max = 1 },
                        { id = 'g000ig0001', min = 5, max = 5 },
                        { id = 'g000ig0006', min = 5, max = 5 },
                    }
                }
            }
        },

        ruins = {
            {
                gold = {min = 300, max = 400},
                loot = {
                    items = {{ id = 'g001ig0288', min = 1, max = 1 }}
                },
                guard = {
                    subraceTypes = subraceRandomizer(2),
                    value = {min = 420, max = 470}
                },
            },
        }
    }
end

function getSkirmishZone(zoneId, zoneSize, races)
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
            tier3stackPotion(3),
            tier3stackValuable(3),
            tier2stackOrb(2),
            tier3stackPotion(3),
            tier3stackHeal(3),
            tier3stackScroll(3),
            tier3stackValuable(3),
        },

        mines = getNeutralMines(races, zoneId),

        ruins = {
            {
                gold = {min = 450, max = 550},
                loot = {
                    items = {{ id = randomOrbTalisman[math.random(#randomOrbTalisman)], min = 1, max = 1 }}
                },
                guard = {
                    subraceTypes = subraceRandomizer(3),
                    value = {min = 520, max = 580}
                },
            },
            {
                gold = {min = 450, max = 550},
                loot = {
                    items = {{ id = randomScroll[math.random(#randomScroll)], min = 1, max = 1 }}
                },
                guard = {
                    subraceTypes = subraceRandomizer(3),
                    value = {min = 520, max = 580}
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

    zones[3] = getTownZone(2, 256, races)

    zones[4] = getRuinZone(3, 256, races[2])

    zones[5] = getStartingZone(4, races[2], 269)

    zones[6] = getMageZone(5, 256, races[2])

    zones[7] = getTownZone(6, 256, races)

    zones[8] = getRuinZone(7, 256, races[1])

    zones[9] = getSkirmishZone(8, 230, races)

	return zones
end

function getConnections()

    local connections = { }

    table.insert(connections, { from = 0, to = 1, guard = zoneItemGuard() })
    table.insert(connections, { from = 0, to = 1, guard = zonePotionGuard() })

    table.insert(connections, { from = 0, to = 7, guard = zoneItemGuard() })
    table.insert(connections, { from = 0, to = 7, guard = zonePotionGuard() })

    table.insert(connections, { from = 0, to = 8 })
    table.insert(connections, { from = 0, to = 8 })

    table.insert(connections, { from = 4, to = 3, guard = zoneItemGuard() })
    table.insert(connections, { from = 4, to = 3, guard = zonePotionGuard() })

    table.insert(connections, { from = 4, to = 5, guard = zoneItemGuard() })
    table.insert(connections, { from = 4, to = 5, guard = zonePotionGuard() })

    table.insert(connections, { from = 4, to = 8 })
    table.insert(connections, { from = 4, to = 8 })

    table.insert(connections, { from = 1, to = 2, guard = zoneHighPotionGuard() })
    table.insert(connections, { from = 1, to = 2, guard = zoneHighPotionGuard() })

    table.insert(connections, { from = 3, to = 2, guard = zoneHighPotionGuard() })
    table.insert(connections, { from = 3, to = 2, guard = zoneHighPotionGuard() })

    table.insert(connections, { from = 5, to = 6, guard = zoneHighPotionGuard() })
    table.insert(connections, { from = 5, to = 6, guard = zoneHighPotionGuard() })

    table.insert(connections, { from = 7, to = 6, guard = zoneHighPotionGuard() })
    table.insert(connections, { from = 7, to = 6, guard = zoneHighPotionGuard() })

    table.insert(connections, { from = 2, to = 8, guard = zoneGreatGuard() })
    table.insert(connections, { from = 6, to = 8, guard = zoneGreatGuard() })

    table.insert(connections, { from = 1, to = 8 })
    table.insert(connections, { from = 3, to = 8 })
    table.insert(connections, { from = 5, to = 8 })
    table.insert(connections, { from = 7, to = 8 })

	return connections
end

function getTemplateContents(races)
	return {
		zones = getZones(races),
		connections = getConnections()
	}
end

template = {
    name = getName(TemplateName, Verison),
    description = getDescription(TemplateName, Verison, Timer),
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
        'g000ig6008', --Посох невидимости
        'g000ig6017', --Посох дневного света
        'g000ig6018', --Посох сумерек
        'g000ig5092', --Свиток "terra illudere"
        'g000ig0019', --Эликсир молниеносности
        'g000ig0020', --Эликсир могущества
        'g000ig0017', --Эликсир неуязвимости
        'g001ig0126', --Эликсир Всевышнего
        'g001ig0129', --Зелье вампиризма50
        'g001ig0020', --Великая аура вампиризма
        'g001ig0035', --Великая аура жизненной силы
        'g000ig5051', --Свиток "sanctuera"
        'g000ig5083', --Свиток "свет дня"
        'g000ig5095', --Свиток "сумерки"
        'g000ig8005', --Семимильные сапоги
        'g000ig9006', --Сфера окаменения
        'g000ig9039', --Сфера ужаса
        'g001ig0596', --Линарет

        -- ПРЕДМЕТЫ НА УСКОР/РЕЗ МУВОВ
        'g000ig5032', --Свиток "Песнь скорости"
        'g000ig5053', --Свиток "Paraseus"
        'g000ig5094', --Свиток "Псалом Смерти"
        'g000ig6004', --Посох парализации
        'g000ig6005', --Посох путника
        'g001ig0390', --Посох терна
        'g001ig0389', --Посох первооткрывателя
        'g001ig0513', --Зелье твердого шага
        --
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
        -- Фракционные герои-лидеры и их вторые формы
        'g000uu0021', --Архимаг
        'g000uu8248', --Архимаг
        'g000uu0020', --Следопыт
        'g000uu0019', --Рыцарь на Пегасе
        'g000uu0022', --Архангел
        'g000uu0023', --Вор
        'g000uu5300', --Вор
        'g000uu0044', --Королевский страж
        'g000uu0045', --Инженер
        'g000uu0046', --Ученый
        'g000uu8249', --Ученый
        'g000uu0047', --Старейшина
        'g000uu0048', --Вор
        'g000uu5301', --Вор
        'g000uu0070', --Герцог
        'g000uu0071', --Советник
        'g000uu0072', --Архидьявол
        'g000uu8250', --Архидьявол
        'g000uu0073', --Баронесса
        'g000uu0074', --Вор
        'g000uu5302', --Вор
        'g000uu0096', --Рыцарь Смерти
        'g000uu0097', --Носферату
        'g000uu8252', --Носферату
        'g000uu0098', --Королева личей
        'g000uu8253', --Королева личей
        'g000uu0099', --Баньши
        'g000uu0100', --Вор
        'g000uu5303', --Вор
        'g000uu8251', --Дриада
        'g000uu8010', --Дриада
        'g000uu8009', --Вассал леса
        'g000uu8011', --Страж леса
        'g000uu8012', --Мудрец
        'g000uu8013', --Вор
        'g000uu5304', --Вор

        -- Фракционные герои-солдаты
        'g001uu0021', --Архимаг
        'g001uu0020', --Следопыт
        'g001uu0019', --Рыцарь на Пегасе
        'g001uu0022', --Архангел
        'g001uu0023', --Вор
        'g001uu0045', --Инженер
        'g001uu0044', --Королевский страж
        'g001uu0046', --Ученый
        'g070uu0003', --Ученый
        'g001uu0047', --Старейшина
        'g001uu0048', --Вор
        'g001uu0072', --Архидьявол
        'g070uu0004', --Архидьявол
        'g001uu0071', --Советник
        'g001uu0070', --Герцог
        'g001uu0073', --Баронесса
        'g001uu0074', --Вор
        'g001uu0098', --Королева личей
        'g070uu0001', --Носферату
        'g001uu0097', --Носферату
        'g001uu0096', --Рыцарь Смерти
        'g001uu0099', --Баньши
        'g001uu0100', --Вор
        'g001uu8010', --Дриада
        'g070uu0002', --Дриада
        'g001uu8009', --Вассал леса
        'g001uu8011', --Страж леса
        'g001uu8012', --Мудрец
        'g001uu8013', --Вор

        -- Фракционные призыватели-солдаты с большим кол-вом опыта
        'g000uu8185', -- Магистр стихий
        'g001uu7598', -- Теневидец
        'g001uu8242', -- Xозяин масок
        'g000uu0164', -- Повелитель волков
        'g070uu9002', -- демиург
        'g000uu8238', -- демиург
        'g000uu8185', -- магистр стихий
        'g070uu9001', -- магистр стихий
        'g000uu8191', -- магистр стихий

        -- Фракционные хиллеры-солдаты с большим кол-вом опыта 
        'g000uu0017', -- Аббатиса
        'g000uu8035', -- Вильсида
        'g002uu8039', -- Вердант
        'g000uu7570', -- Епископ
        'g000uu7569', -- Иерей
        'g000uu8264', -- Иерарх
        'g000uu0151', -- Прорицательница
        'g000uu0013', -- Священник
        'g000uu8214', -- Дриолисса
        'g000uu8034', -- Солнечная Танцовщица
        'g000uu0150', -- Патриарх
        'g003uu8039', -- Древо жизни
        'g003uu8038', -- Энт целитель
        'g000uu8235', -- Сильфида
        'g000uu2002', -- Целитель
        'g003uu8037', -- Священное древо

        -- нейтральные лидеры с низкой неподкупностью 20%
        'g000uu5236', -- Гном
        'g000uu5117', -- Гоблин
        'g000uu5101', -- Крестьянин
        'g000uu8308', -- Молодой триббог
        'g000uu5130', -- Разбойник
        'g000uu7556', -- Гоблин-жгун
        'g000uu7533', -- Псина
        'g000uu7510', -- Птица рух лидер
        'g000uu7616', -- Гном упырь лидер
        'g000uu6004', -- Толстый бес л.
        'g000uu5201', -- Сквайр л.
        'g000uu7539', -- Колотун
        'g000uu7592', -- Торхот
        'g000uu7516', -- Энт Малый л.
        'g000uu5262', -- Сектант л.
        'g000uu7614', -- Искатель рун лидер
        'g000uu7553', -- Ведунья-лидер

        --Все нейтральные хиллеры с большим кол-вом опыта (лидеры и солдаты)
        'g000uu8287', -- Св.дерево л.
        'g000uu8288', -- Энт целитель л.
        'g000uu7519', -- Вердант л.
        'g000uu8215', -- Дриолисса л.
        'g000uu8262', -- Знахарка л.
        'g000uu8289', -- Древо жизни л
        'g000uu7521', -- Целитель л.
        'g000uu5006', -- Великий Оракул
        'g000uu8222', -- Волхв л. бафер
        'g000uu8218', -- Волхв
        'g000uu7544', -- Настоятельница
        'g000uu8213', -- Гоблин-шаман
        'g001uu8262', -- Знахарка
        'g000uu2021', -- Проповедник
        'g000uu6107', -- Темный эльф-жрец
        'g000uu7619', -- Слуга культа
    }
}