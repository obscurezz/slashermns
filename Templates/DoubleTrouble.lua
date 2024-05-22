local TemplateName = 'Double Trouble'
local Verison = '1.0.0'
local Timer = 'First turn: 420, next turns: 300'

function getName(name, version)
    return name .. ' ' .. version
end

function getDescription(name, version, timer)
    return name .. ' ' .. version .. 'S by obscure & Nexx, SMNS2, 72x72, 4 players, 2x2. \nTimer is: ' .. timer
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

function getPlayerZoneMines(race, races)
    local zoneMines = { }
    
    zoneMines.gold = 2
    if race == Race.Human then
        zoneMines.lifeMana = 2
    elseif race == Race.Dwarf then
        zoneMines.runicMana = 2
    elseif race == Race.Undead then
        zoneMines.deathMana = 2
    elseif race == Race.Heretic then
        zoneMines.infernalMana = 2
    elseif race == Race.Elf then
        zoneMines.groveMana = 2
    end

    if not table_contains(races, Race.Human) then
        zoneMines.lifeMana = 1
    elseif not table_contains(races, Race.Dwarf) then
        zoneMines.runicMana = 1
    elseif not table_contains(races, Race.Undead) then
        zoneMines.deathMana = 1
    elseif not table_contains(races, Race.Heretic) then
        zoneMines.infernalMana = 1
    elseif not table_contains(races, Race.Elf) then
        zoneMines.groveMana = 1
    end

    return zoneMines
end

function getNeutralMines(race1, race2)
    local zoneMines = { }
    zoneMines.gold = 2

    if race1 == Race.Human or race2 == Race.Human then
        zoneMines.lifeMana = 1
    end
    if race1 == Race.Dwarf or race2 == Race.Dwarf then
        zoneMines.runicMana = 1
    end
    if race1 == Race.Undead or race2 == Race.Undead then
        zoneMines.deathMana = 1
    end
    if race1 == Race.Heretic or race2 == Race.Heretic then
        zoneMines.infernalMana = 1
    end
    if race1 == Race.Elf or race2 == Race.Elf then
        zoneMines.groveMana = 1
    end

    return zoneMines
end

function getTier1StackValuable()
    local subraces = {{Subrace.NeutralGreenSkin, Subrace.NeutralWolf}, {Subrace.NeutralHuman, Subrace.Human}, {Subrace.NeutralMarsh, Subrace.NeutralWolf}}

    return {
        count = 1,
        value = { min = 150, max = 200 },
        subraceTypes = subraces[math.random(#subraces)],
        loot = {
            items = {
                { id = 'g000ig0005', min = 0, max = 2 },
                { id = 'g001ig0180', min = 0, max = 3 },
            },
            itemTypes = { Item.Valuable },
            itemValue = { min = 250, max = 500 },
            value = { min = 500, max = 500 },
        }
    }
end

function getTier1StackScroll()
    local subraces = {{Subrace.NeutralGreenSkin, Subrace.NeutralWolf}, {Subrace.NeutralHuman, Subrace.Human}, {Subrace.NeutralMarsh, Subrace.NeutralWolf}}

    return {
        count = 1,
        value = { min = 180, max = 220 },
        subraceTypes = subraces[math.random(#subraces)],
        loot = {
            items = {
                { id = 'g000ig0006', min = 0, max = 1 },
            },
            itemTypes = { Item.Scroll },
            itemValue = { min = 150, max = 200 },
            value = { min = 400, max = 400 },
        }
    }
end

function getTier2StackValuable()
    local subraces = {{Subrace.NeutralBarbarian, Subrace.NeutralWolf}, {Subrace.NeutralBarbarian, Subrace.Dwarf}, {Subrace.NeutralElf, Subrace.Elf}, {Subrace.NeutralMarsh, Subrace.NeutralWater}}

    return {
        count = 1,
        value = { min = 240, max = 280 },
        subraceTypes = subraces[math.random(#subraces)],
        loot = {
            items = {
                { id = 'g001ig0378', min = 0, max = 2 },
            },
            itemTypes = { Item.Valuable },
            itemValue = { min = 500, max = 750 },
            value = { min = 1500, max = 1500 },
        }
    }
end

function getTier2StackResurrection()
    local subraces = {{Subrace.NeutralBarbarian, Subrace.NeutralWolf}, {Subrace.NeutralBarbarian, Subrace.Dwarf}, {Subrace.NeutralElf, Subrace.Elf}, {Subrace.NeutralMarsh, Subrace.NeutralWater}}

    return {
        count = 1,
        value = { min = 240, max = 280 },
        subraceTypes = subraces[math.random(#subraces)],
        loot = {
            items = {
                { id = 'g000ig0001', min = 1, max = 1 },
            },
            itemTypes = { Item.Orb },
            itemValue = { min = 200, max = 400 },
            value = { min = 400, max = 400 },
        }
    }
end

function getTier3StackItem()
    local subraces = {{Subrace.NeutralHuman, Subrace.NeutralHuman, Subrace.NeutralWolf}, {Subrace.NeutralBarbarian, Subrace.Dwarf}, {Subrace.NeutralElf, Subrace.Elf}, {Subrace.NeutralGreenSkin, Subrace.Undead}}
    local items = {{Item.Armor, Item.Weapon}, {Item.Banner}, {Item.Jewel}, {Item.TravelItem}}

    return {
        count = 1,
        value = { min = 320, max = 370 },
        subraceTypes = subraces[math.random(#subraces)],
        loot = {
            items = {
                { id = 'g000ig0006', min = 1, max = 1 },
            },
            itemTypes = items[math.random(#items)],
            itemValue = { min = 300, max = 500 },
            value = { min = 500, max = 500 },
        }
    }
end

function getTier3StackPermanent()
    local subraces = {{Subrace.NeutralHuman, Subrace.NeutralHuman, Subrace.NeutralWolf}, {Subrace.NeutralBarbarian, Subrace.Dwarf}, {Subrace.NeutralElf, Subrace.Elf}, {Subrace.NeutralGreenSkin, Subrace.Undead}}

    return {
        count = 1,
        value = { min = 320, max = 370 },
        subraceTypes = subraces[math.random(#subraces)],
        loot = {
            items = {
                { id = 'g000ig0006', min = 1, max = 1 },
            },
            itemTypes = { Item.PotionPermanent },
            itemValue = { min = 400, max = 600 },
            value = { min = 600, max = 600 },
        }
    }
end


function getStartingZone(zoneId, playerRace, zoneSize, races)
    

    local mage_tower
    if zoneId == 0 or zoneId == 4 then
        mage_tower = {
            spellTypes = { Spell.Attack, Spell.Summon, Spell.Lower },
            spellLevel = { min = 1, max = 3 },
            value = { min = 6000, max = 6000 },
        }
    end

    local trainer
    if zoneId == 1 or zoneId == 5 then
        trainer = {}
    end

    local town_loot = {}
    if zoneId == 0 or zoneId == 4 then
        town_loot = {
            items = {
                { id = 'g000ig7009', min = 1, max = 1 },
                { id = 'g000ig0001', min = 2, max = 2 },
                { id = 'g000ig0006', min = 2, max = 2 },
            },
            itemTypes = { Item.Scroll },
            itemValue = { min = 200, max = 550 },
            value = { min = 800, max = 800 },
        }
    elseif zoneId == 1 or zoneId == 5 then
        town_loot = {
            items = {
                { id = 'g001ig0282', min = 1, max = 1 },
                { id = 'g000ig0001', min = 2, max = 2 },
                { id = 'g000ig0006', min = 2, max = 2 },
            },
            itemTypes = { Item.TravelItem },
            itemValue = { min = 500, max = 700 },
            value = { min = 700, max = 700 },
        }
    end

    return {
        id = zoneId,
        type = Zone.PlayerStart,
		race = playerRace,
		size = zoneSize,

        capital = {
            garrison = {
                loot = {
                    items = {
                        { id = 'g000ig0001', min = 3, max = 3 },
                        { id = 'g001ig0378', min = 3, max = 3 },
                        { id = 'g000ig0005', min = 3, max = 3 },
                        { id = 'g001ig0180', min = 7, max = 7 },
                        { id = 'g000ig7006', min = 1, max = 1 },
                        { id = 'g001ig0388', min = 1, max = 1 },
                        { id = 'g001ig0524', min = 1, max = 1 },
                    }
                }
            }
        },

        mines = getPlayerZoneMines(playerRace, races),

        towns = {
            {
                tier = 1,
            }
        },

        ruins = {
            {

            },
            {

            },
        },

        merchants = {
            {
                goods = {
                    itemTypes = { Item.PotionBoost },
                    itemValue = { min = 150, max = 525 },
                    value = { min = 6000, max = 6000 },
                    items = {
                        { id = 'g000ig0001', min = 3, max = 3 },
                        { id = 'g000ig0005', min = 3, max = 3 },
                        { id = 'g000ig0006', min = 3, max = 3 },
                        { id = 'g000ig0018', min = 3, max = 3 },
                    }
                }
            },
        },

        trainers = {
            trainer,
        },

        mages = {
            mage_tower,
        },

        stacks = {
            getTier1StackValuable(),
            getTier1StackValuable(),
            getTier1StackScroll(),
            getTier1StackScroll(),
            getTier2StackValuable(),
            getTier2StackValuable(),
            getTier2StackResurrection(),
            getTier2StackResurrection(),
            getTier2StackResurrection(),
            getTier3StackItem(),
            getTier3StackItem(),
            getTier3StackItem(),
            getTier3StackPermanent(),
            getTier3StackPermanent(),
        }
    }
end

function getSideZoneLeft(zoneId, zoneSize, race1, race2)
    return {
        id = zoneId,
        type = Zone.Treasure,
		size = zoneSize,

        towns = {
            {
                tier = 2,
            }
        },

        mines = getNeutralMines(race1, race2),

        ruins = {
            {

            },
            {

            },
        },

        mages = {
            {

            },
        },

        mercenaries = {
            {

            },
        },
    }
end

function getSideZoneRight(zoneId, zoneSize, race1, race2)
    return {
        id = zoneId,
        type = Zone.Treasure,
		size = zoneSize,

        towns = {
            {
                tier = 3,
            }
        },

        mines = getNeutralMines(race1, race2),

        ruins = {
            {

            },
            {

            },
        },

        merchants = {
            {

            },
        },

        trainers = {
            {},
        },
    }
end

function getCenterZone(zoneId, zoneSize)
    return {
        id = zoneId,
        type = Zone.Treasure,
		size = zoneSize,

        towns = {
            {
                tier = 4,
            }
        },

        mines = {
            gold = 1,
            lifeMana = 1,
            runicMana = 1,
            deathMana = 1,
            infernalMana = 1,
            groveMana = 1,
        },

        ruins = {
            {

            },
            {

            },
            {

            },
            {

            },
        },

        merchants = {
            {

            },
            {

            },
        },
    }
end

function getZones(races)
    local zones = { }

    table.insert(zones, getStartingZone(0, races[1], 576, races))
    table.insert(zones, getStartingZone(1, races[2], 576, races))

    table.insert(zones, getSideZoneRight(2, 576, races[1], races[2]))

    table.insert(zones, getSideZoneLeft(3, 576, races[3], races[4]))

    table.insert(zones, getStartingZone(4, races[3], 576, races))
    table.insert(zones, getStartingZone(5, races[4], 576, races))

    table.insert(zones, getSideZoneRight(6, 576, races[3], races[4]))

    table.insert(zones, getSideZoneLeft(7, 576, races[1], races[2]))

    table.insert(zones, getCenterZone(8, 576))

    return zones
end

function getConnections()
    local connections = { }

    --between players
    table.insert(connections, { from = 0, to = 1 })
    table.insert(connections, { from = 0, to = 1 })
    table.insert(connections, { from = 0, to = 1 })
    table.insert(connections, { from = 0, to = 1 })
    table.insert(connections, { from = 0, to = 1 })
    table.insert(connections, { from = 0, to = 1 })
    table.insert(connections, { from = 0, to = 1 })
    table.insert(connections, { from = 0, to = 1 })
    table.insert(connections, { from = 0, to = 1 })
    --from player 1 to their side
    table.insert(connections, { from = 1, to = 2 })
    table.insert(connections, { from = 1, to = 2 })
    table.insert(connections, { from = 1, to = 2 })
    --from side to side
    table.insert(connections, { from = 2, to = 3 })
    table.insert(connections, { from = 2, to = 3 })
    table.insert(connections, { from = 2, to = 3 })
    table.insert(connections, { from = 2, to = 3 })
    table.insert(connections, { from = 2, to = 3 })
    table.insert(connections, { from = 2, to = 3 })
    --from side to player 4
    table.insert(connections, { from = 3, to = 4 })
    table.insert(connections, { from = 3, to = 4 })
    table.insert(connections, { from = 3, to = 4 })

    --between players
    table.insert(connections, { from = 4, to = 5 })
    table.insert(connections, { from = 4, to = 5 })
    table.insert(connections, { from = 4, to = 5 })
    table.insert(connections, { from = 4, to = 5 })
    table.insert(connections, { from = 4, to = 5 })
    table.insert(connections, { from = 4, to = 5 })
    table.insert(connections, { from = 4, to = 5 })
    table.insert(connections, { from = 4, to = 5 })
    table.insert(connections, { from = 4, to = 5 })
    --from player 5 to their side
    table.insert(connections, { from = 5, to = 6 })
    table.insert(connections, { from = 5, to = 6 })
    table.insert(connections, { from = 5, to = 6 })
    --from side to side
    table.insert(connections, { from = 6, to = 7 })
    table.insert(connections, { from = 6, to = 7 })
    table.insert(connections, { from = 6, to = 7 })
    table.insert(connections, { from = 6, to = 7 })
    table.insert(connections, { from = 6, to = 7 })
    table.insert(connections, { from = 6, to = 7 })
    --from side to player 0
    table.insert(connections, { from = 7, to = 0 })
    table.insert(connections, { from = 7, to = 0 })
    table.insert(connections, { from = 7, to = 0 })

    --to center
    local player_races = { Subrace.Human, Subrace.Dwarf, Subrace.Undead, Subrace.Heretic, Subrace.Elf }

    table.insert(connections, { from = 0, to = 8, guard = {subraceTypes = { Subrace.NeutralDragon, player_races[math.random(#player_races)] }, value = { min = 1800, max = 2200 }, loot = { itemTypes = { Item.PotionBoost }, itemValue = { min = 150, max = 525 }, value = { min = 750, max = 1000 } }} })
    table.insert(connections, { from = 1, to = 8, guard = {subraceTypes = { Subrace.NeutralDragon, player_races[math.random(#player_races)] }, value = { min = 1800, max = 2200 }, loot = { itemTypes = { Item.PotionBoost }, itemValue = { min = 150, max = 525 }, value = { min = 750, max = 1000 } }}  })
    table.insert(connections, { from = 2, to = 8, guard = {subraceTypes = { Subrace.NeutralDragon, player_races[math.random(#player_races)] }, value = { min = 1800, max = 2200 }, loot = { itemTypes = { Item.PotionBoost }, itemValue = { min = 150, max = 525 }, value = { min = 750, max = 1000 } }}  })
    table.insert(connections, { from = 3, to = 8, guard = {subraceTypes = { Subrace.NeutralDragon, player_races[math.random(#player_races)] }, value = { min = 1800, max = 2200 }, loot = { itemTypes = { Item.PotionBoost }, itemValue = { min = 150, max = 525 }, value = { min = 750, max = 1000 } }}  })
    table.insert(connections, { from = 4, to = 8, guard = {subraceTypes = { Subrace.NeutralDragon, player_races[math.random(#player_races)] }, value = { min = 1800, max = 2200 }, loot = { itemTypes = { Item.PotionBoost }, itemValue = { min = 150, max = 525 }, value = { min = 750, max = 1000 } }}  })
    table.insert(connections, { from = 5, to = 8, guard = {subraceTypes = { Subrace.NeutralDragon, player_races[math.random(#player_races)] }, value = { min = 1800, max = 2200 }, loot = { itemTypes = { Item.PotionBoost }, itemValue = { min = 150, max = 525 }, value = { min = 750, max = 1000 } }}  })
    table.insert(connections, { from = 6, to = 8, guard = {subraceTypes = { Subrace.NeutralDragon, player_races[math.random(#player_races)] }, value = { min = 1800, max = 2200 }, loot = { itemTypes = { Item.PotionBoost }, itemValue = { min = 150, max = 525 }, value = { min = 750, max = 1000 } }}  })
    table.insert(connections, { from = 7, to = 8, guard = {subraceTypes = { Subrace.NeutralDragon, player_races[math.random(#player_races)] }, value = { min = 1800, max = 2200 }, loot = { itemTypes = { Item.PotionBoost }, itemValue = { min = 150, max = 525 }, value = { min = 750, max = 1000 } }}  })


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
    minSize = 72,
    maxSize = 72,
    maxPlayers = 4,
    roads = 75,
    forest = 30,
    startingGold = 1500,
    startingNativeMana = 300,
    getContents = getTemplateContents,
    forbiddenSpells = {
        'g000ss0173', --великий ужас
        'g000ss0177', --откровение
        'g000ss0192', --песнь мимира
        'g000ss0152', --подкуп
        'g000ss0191', --проведение всевышнего
        'g000ss0063', --снежная буря
        'g000ss0132', --взгляд пустоты
        'g000ss0123', --заживление ран
        'g000ss0121', --избавление от боли
        'g000ss0027', --мореплавание
        'g000ss0131', --ослепительная вспышка
        'g000ss0124', --отсрочка неизбежного
        'g000ss0133', --песнь слез
        'g000ss0135', --снежный занавес
        'g000ss0146', --гора
        'g000ss0122', --целительные ожоги
        'g000ss0031', --валькирия
        'g000ss0140', --каменная сущность
        'g000ss0071', --кошмар
        'g000ss0139', --ледяная сущность
        'g000ss0138', --сущность бури
        'g000ss0141', --сущность пламени
        'g000ss0108', --энт большой
        'g000ss0175', --божественная мудрость
        'g000ss0149', --вампиризм
        'g000ss0200', --жатва
        'g000ss0144', --затопление
        'g000ss0195', --знамение хресвельга
        'g000ss0110', --излечение
        'g000ss0150', --поспешность
        'g000ss0190', --проклятие безволия
        'g000ss0159', --увечье
    }
}