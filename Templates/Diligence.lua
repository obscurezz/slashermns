local TemplateName = 'Diligence'
local Verison = '1.2.1'
local Timer = 'First turn: 720, next turns: 420'

function getName(name, version)
    return name .. ' ' .. version
end

function getDescription(name, version, timer)
    return name .. ' ' .. version .. 'S by obscure, SMNS2, 48x48, 2 players.\n4 zones, Black diagonally agains Blue, White diagonally agains Green. No rules.\nTimer is: ' .. timer
end

function getZoneMana(race)
    local mines = {}
    if race == nil then
        mines = {
            gold=1,
            lifeMana=1,
            runicMana=1,
            deathMana=1,
            infernalMana=1,
            groveMana=1,
        }
    else
        if race == Race.Human then
            mines = {
                gold=3,
                lifeMana=2,
            }
        elseif race == Race.Dwarf then
            mines = {
                gold=3,
                runicMana=2,
            }
        elseif race == Race.Undead then
            mines = {
                gold=3,
                deathMana=2,
            }
        elseif race == Race.Heretic then
            mines = {
                gold=3,
                infernalMana=2,
            }
        elseif race == Race.Elf then
            mines = {
                gold=3,
                groveMana=2,
            }
        end
    end
    return mines
end

function getSingleZone(zoneId, zoneSize, playerRace, isPlayer)
    local firstRewardType = {Item.Armor, Item.Weapon, Item.Banner}
    local secondRewardType = {Item.Jewel, Item.TravelItem}
    local stackSubraces = {}


    local zoneContent = {}
    local zoneCoef = 1

    local startingWand
    local startingScroll

    if playerRace == Race.Human then
        startingWand = { id = 'g000ig6012', min = 1, max = 1 }
        startingScroll = { id = 'g000ig5098', min = 1, max = 1 }
        startingTalisman = { id = 'g000ig9101', min = 1, max = 1}
    elseif playerRace == Race.Dwarf then
        startingWand = { id = 'g001ig0394', min = 1, max = 1 }
        startingScroll = { id = 'g000ig5007', min = 1, max = 1 }
        startingTalisman = { id = 'g001ig0265', min = 1, max = 1}
    elseif playerRace == Race.Elf then
        startingWand = { id = 'g001ig0399', min = 1, max = 1 }
        startingScroll = { id = 'g001ig0250', min = 1, max = 1 }
        startingTalisman = { id = 'g001ig0266', min = 1, max = 1}
    elseif playerRace == Race.Undead then
        startingWand = { id = 'g001ig0405', min = 1, max = 1 }
        startingScroll = { id = 'g000ig5007', min = 1, max = 1 }
        startingTalisman = { id = 'g001ig0264', min = 1, max = 1}
    elseif playerRace == Race.Heretic then
        startingWand = { id = 'g001ig0396', min = 1, max = 1 }
        startingScroll = { id = 'g000ig5003', min = 1, max = 1 }
        startingTalisman = { id = 'g000ig9101', min = 1, max = 1}
    end

    local TalismanT4 = { 'g000ig9130', 'g000ig9123' }

    zoneContent['id'] = zoneId
    zoneContent['size'] = zoneSize
    zoneContent['border'] = Border.SemiOpen
    zoneContent['gapChance'] = 65
    zoneContent['mines'] = getZoneMana(playerRace)
    zoneContent['merchants'] = {
        {
            goods = {
                items = {
                    { id = 'g000ig0001', min = 5, max = 5 },
                    { id = 'g000ig0006', min = 5, max = 5 },
                    { id = 'g000ig0005', min = 5, max = 5 },
                    { id = 'g001ig0378', min = 5, max = 5 },
                    { id = 'g001ig0184', min = 1, max = 1 },
                    { id = 'g000ig9120', min = 1, max = 1 },
                    { id = 'g000ig5039', min = 1, max = 1 },
                },
                itemTypes = { Item.PotionBoost, Item.PotionPermanent },
                itemValue = { min = 150, max = 400 },
                value = { min = 6000, max = 6000 },
            }
        },
        {
            goods = {
                items = {
                    { id = 'g000ig0001', min = 5, max = 5 },
                    { id = 'g000ig0006', min = 5, max = 5 },
                    { id = 'g000ig0005', min = 5, max = 5 },
                    { id = 'g001ig0378', min = 5, max = 5 },
                    { id = 'g001ig0184', min = 1, max = 1 },
                    { id = 'g000ig9120', min = 1, max = 1 },
                },
                itemTypes = { Item.Scroll, Item.Orb, Item.Talisman, Item.Wand },
                itemValue = { min = 150, max = 400 },
                value = { min = 6000, max = 6000 },
            }
        },
    }

    if isPlayer then
        stackSubraces = {Subrace.NeutralGreenSkin, Subrace.NeutralWolf, Subrace.NeutralElf, Subrace.NeutralHuman}
        zoneContent['type'] = Zone.PlayerStart
        zoneContent['race'] = playerRace
        zoneContent['capital'] = {
            garrison = {
                loot = {
                    items = {
                        {id = 'g001ig0180', min = 5, max = 5},
                        {id = 'g000ig0005', min = 3, max = 3},
                        {id = 'g000ig0006', min = 4, max = 4},
                        {id = 'g000ig0001', min = 3, max = 3},
                        {id = 'g000ig0002', min = 2, max = 2},
                        {id = 'g000ig0008', min = 1, max = 1},
                        {id = 'g000ig0011', min = 1, max = 1},
                        {id = 'g000ig0014', min = 2, max = 2},
                        {id = 'g000ig0022', min = 1, max = 1},
                        {id = 'g000ig0021', min = 1, max = 1},
                        {id = 'g000ig0023', min = 1, max = 1},
                        {id = 'g000ig0024', min = 1, max = 1},
                        {id = 'g001ig0036', min = 1, max = 1},
                        {id = 'g001ig0125', min = 1, max = 1},
                        startingWand,
                        startingScroll,
                        startingTalisman,
                    },
                    itemTypes = {Item.Orb},
                    itemValue = { min = 100, max = 200 },
                    value = { min = 400, max = 400 },
                }
            }
        }
        zoneContent['towns'] = {
            {tier=1, garrison={loot={itemTypes={Item.Valuable}, itemValue={min=150, max=750}, value={min=1500, max=1500},items={{id='g001ig0180',min=2,max=2},{id='g000ig0005',min=2,max=2},{id='g000ig0006',min=1,max=1},{id='g002ig0005',min=1,max=1}}}}, stack={subraceTypes={stackSubraces[math.random(#stackSubraces)], stackSubraces[math.random(#stackSubraces)]}, value={min=270*zoneCoef, max=320*zoneCoef}, loot={itemTypes={Item.Armor, Item.Weapon},itemValue={min=600, max=800},value={min=1600, max=1600},items={{id='g000ig0001', min=1, max=1},{id='g000ig0018', min=1, max=1}}}}},
            {tier=2, garrison={loot={itemTypes={Item.PotionPermanent, Item.Talisman}, itemValue={min=400, max=800}, value={min=1200, max=1200},items={{id='g001ig0180',min=2,max=2},{id='g000ig0005',min=2,max=2},{id='g000ig0006',min=1,max=1},{id='g002ig0006',min=1,max=1}}}}, stack={subraceTypes={stackSubraces[math.random(#stackSubraces)], stackSubraces[math.random(#stackSubraces)]}, value={min=330*zoneCoef, max=380*zoneCoef}, loot={itemTypes={Item.Banner, Item.Jewel},itemValue={min=500, max=800},value={min=1300, max=1500},items={{id='g000ig0001', min=1, max=1},{id='g000ig0018', min=1, max=1}}}}},
        }
        zoneContent['trainers'] = {{}}
        
    else
        stackSubraces = {Subrace.NeutralGreenSkin, Subrace.NeutralWolf, Subrace.NeutralElf, Subrace.NeutralHuman, Subrace.NeutralMarsh, Subrace.NeutralBarbarian, Subrace.NeutralDragon, Subrace.Neutral}
        zoneCoef = 2
        zoneContent['type'] = Zone.Treasure
        zoneContent['towns'] = {
            {tier=4, garrison={loot={itemTypes={Item.PotionPermanent, Item.TravelItem}, itemValue={min=400, max=700}, value={min=1100, max=1100},items={{id='g000ig0005',min=2,max=2},{id='g000ig0006',min=2,max=2},{id='g002ig0006',min=1,max=1},{id='g002ig0007',min=2,max=2},{id='g000ig5039',min=1,max=1}}}}, stack={subraceTypes={stackSubraces[math.random(#stackSubraces)], stackSubraces[math.random(#stackSubraces)]}, value={min=300*zoneCoef, max=350*zoneCoef}, loot={itemTypes={Item.Jewel, Item.Armor, Item.Weapon},itemValue={min=1000, max=1500},value={min=1500, max=1500},items={{id='g000ig0001', min=1, max=1},{id='g001ig0152', min=1, max=1},{id='g000ig0018', min=1, max=1}}}}},
            {tier=2, garrison={loot={itemTypes={Item.PotionPermanent, Item.Orb}, itemValue={min=400, max=700}, value={min=1100, max=1100},items={{id='g000ig0005',min=2,max=2},{id='g000ig0006',min=2,max=2},{id='g002ig0006',min=1,max=1},{id='g002ig0007',min=2,max=2},{id=TalismanT4[math.random(#TalismanT4)],min=1,max=1}}}}, stack={subraceTypes={stackSubraces[math.random(#stackSubraces)], stackSubraces[math.random(#stackSubraces)]}, value={min=220*zoneCoef, max=250*zoneCoef}, loot={itemTypes={Item.Jewel, Item.Armor, Item.Weapon},itemValue={min=750, max=1000},value={min=1500, max=1500},items={{id='g000ig0001', min=1, max=1},{id='g001ig0152', min=1, max=1}}}}},
        }
        zoneContent['resourceMarkets'] = {
            {
                stock = {
                    {resource = Resource.Gold, value = { min = 3000, max = 3000 }},
                    {resource = Resource.LifeMana, value = { min = 1000, max = 1000 }},
                    {resource = Resource.DeathMana, value = { min = 1000, max = 1000 }},
                    {resource = Resource.InfernalMana, value = { min = 1000, max = 1000 }},
                    {resource = Resource.RunicMana, value = { min = 1000, max = 1000 }},
                    {resource = Resource.GroveMana, value = { min = 1000, max = 1000 }}
                }
            }
        }
        zoneContent['mages'] = {
            {
                spellTypes = { Spell.Heal, Spell.Lower, Spell.Boost, Spell.Summon, Spell.Fog, Spell.Unfog },
                spellLevel = { min = 1, max = 2 },
                value = { min = 4000, max = 4000 },
            }
        }
        
    end

    local ruinLoot
    if isPlayer then
        ruinLoot = {id = 'g000ig5039', min = 1, max = 1}
    else
        ruinLoot = {id = 'g001ig0151', min = 1, max = 1}
    end

    zoneContent['ruins'] = {
        {
            gold = { min = 320, max = 400 },
            loot = {
                itemTypes = {firstRewardType[math.random(1, 3)]},
                itemValue = { min = 300*zoneCoef, max = 500*zoneCoef},
                value = {min = 500*zoneCoef, max = 500*zoneCoef}
            },
            guard = {
                subraceTypes = {stackSubraces[math.random(#stackSubraces)], stackSubraces[math.random(#stackSubraces)]},
                value = { min = 200*zoneCoef, max = 250*zoneCoef }
            }
        },
        {
            gold = { min = 320, max = 400 },
            loot = {
                itemTypes = {secondRewardType[math.random(1, 2)]},
                itemValue = { min = 300*zoneCoef, max = 400*zoneCoef},
                value = {min = 400*zoneCoef, max = 400*zoneCoef}
            },
            guard = {
                subraceTypes = {stackSubraces[math.random(#stackSubraces)], stackSubraces[math.random(#stackSubraces)]},
                value = { min = 180*zoneCoef, max = 220*zoneCoef }
            }
        },
        {
            gold = { min = 300, max = 350 },
            loot = {
                items = { 
                    ruinLoot,
                }
            },
            guard = {
                subraceTypes = {stackSubraces[math.random(#stackSubraces)], stackSubraces[math.random(#stackSubraces)]},
                value = { min = 300, max = 360 }
            }
        },
    }
    zoneContent['bags'] = {
        count = 10,
        loot = {
            items = {
                {id = 'g000ig0001', min = 3, max = 3},
                {id = 'g001ig0180', min = 5, max = 5},
                {id = 'g000ig0005', min = 3, max = 3},
                {id = 'g000ig5084', min = 2, max = 2},
                {id = 'g000ig9017', min = 2, max = 2},
                {id = 'g001ig0157', min = 1, max = 1},
                {id = 'g001ig0454', min = 1, max = 1},
            },
            itemTypes = {Item.Scroll, Item.PotionBoost, Item.Orb},
            itemValue = {min = 150, max = 400},
            value = {min = 2000, max = 2500},
        }
    }
    zoneContent['stacks'] = {
        {count=1, subraceTypes={stackSubraces[math.random(#stackSubraces)], stackSubraces[math.random(#stackSubraces)]}, value={min=140*zoneCoef, max=180*zoneCoef}, loot={itemTypes={Item.PotionHeal},itemValue={min=50, max=200},value={min=200, max=200}}},
        {count=1, subraceTypes={stackSubraces[math.random(#stackSubraces)], stackSubraces[math.random(#stackSubraces)]}, value={min=140*zoneCoef, max=180*zoneCoef}, loot={itemTypes={Item.PotionHeal},itemValue={min=50, max=200},value={min=200, max=200}}},
        {count=1, subraceTypes={stackSubraces[math.random(#stackSubraces)], stackSubraces[math.random(#stackSubraces)]}, value={min=140*zoneCoef, max=180*zoneCoef}, loot={itemTypes={Item.PotionHeal},itemValue={min=50, max=200},value={min=200, max=200}}},
        {count=1, subraceTypes={stackSubraces[math.random(#stackSubraces)], stackSubraces[math.random(#stackSubraces)]}, value={min=160*zoneCoef, max=200*zoneCoef}, loot={itemTypes={Item.Scroll},itemValue={min=150, max=200*zoneCoef},value={min=200*zoneCoef, max=300*zoneCoef}}},
        {count=1, subraceTypes={stackSubraces[math.random(#stackSubraces)], stackSubraces[math.random(#stackSubraces)]}, value={min=160*zoneCoef, max=200*zoneCoef}, loot={itemTypes={Item.Scroll},itemValue={min=150, max=200*zoneCoef},value={min=200*zoneCoef, max=300*zoneCoef}}},
        {count=1, subraceTypes={stackSubraces[math.random(#stackSubraces)], stackSubraces[math.random(#stackSubraces)]}, value={min=160*zoneCoef, max=200*zoneCoef}, loot={itemTypes={Item.Scroll},itemValue={min=150, max=200*zoneCoef},value={min=200*zoneCoef, max=300*zoneCoef}}},
        {count=1, subraceTypes={stackSubraces[math.random(#stackSubraces)], stackSubraces[math.random(#stackSubraces)]}, value={min=160*zoneCoef, max=200*zoneCoef}, loot={itemTypes={Item.PotionHeal},itemValue={min=50, max=350},value={min=350*zoneCoef, max=350*zoneCoef}}},
        {count=1, subraceTypes={stackSubraces[math.random(#stackSubraces)], stackSubraces[math.random(#stackSubraces)]}, value={min=160*zoneCoef, max=200*zoneCoef}, loot={itemTypes={Item.PotionHeal},itemValue={min=50, max=350},value={min=350*zoneCoef, max=350*zoneCoef}}},
        {count=1, subraceTypes={stackSubraces[math.random(#stackSubraces)], stackSubraces[math.random(#stackSubraces)]}, value={min=160*zoneCoef, max=200*zoneCoef}, loot={itemTypes={Item.PotionHeal},itemValue={min=50, max=350},value={min=350*zoneCoef, max=350*zoneCoef}}},
        {count=1, subraceTypes={stackSubraces[math.random(#stackSubraces)], stackSubraces[math.random(#stackSubraces)]}, value={min=220*zoneCoef, max=260*zoneCoef}, loot={itemTypes={Item.PotionRevive, Item.Valuable},itemValue={min=250, max=400},value={min=500, max=1000}}},
        {count=1, subraceTypes={stackSubraces[math.random(#stackSubraces)], stackSubraces[math.random(#stackSubraces)]}, value={min=220*zoneCoef, max=260*zoneCoef}, loot={itemTypes={Item.PotionRevive, Item.Valuable},itemValue={min=250, max=400},value={min=500, max=1000}}},
        {count=1, subraceTypes={stackSubraces[math.random(#stackSubraces)], stackSubraces[math.random(#stackSubraces)]}, value={min=200*zoneCoef, max=240*zoneCoef}, loot={itemTypes={Item.PotionBoost},itemValue={min=150, max=200*zoneCoef},value={min=200*zoneCoef, max=300*zoneCoef}}},
        {count=1, subraceTypes={stackSubraces[math.random(#stackSubraces)], stackSubraces[math.random(#stackSubraces)]}, value={min=200*zoneCoef, max=240*zoneCoef}, loot={itemTypes={Item.PotionBoost},itemValue={min=150, max=200*zoneCoef},value={min=200*zoneCoef, max=300*zoneCoef}}},
        {count=1, subraceTypes={stackSubraces[math.random(#stackSubraces)], stackSubraces[math.random(#stackSubraces)]}, value={min=200*zoneCoef, max=240*zoneCoef}, loot={itemTypes={Item.PotionBoost},itemValue={min=150, max=200*zoneCoef},value={min=200*zoneCoef, max=300*zoneCoef}}},
        {count=1, subraceTypes={stackSubraces[math.random(#stackSubraces)], stackSubraces[math.random(#stackSubraces)]}, value={min=200*zoneCoef, max=240*zoneCoef}, loot={itemTypes={Item.PotionBoost},itemValue={min=150, max=200*zoneCoef},value={min=200*zoneCoef, max=300*zoneCoef}}},
        {count=1, subraceTypes={stackSubraces[math.random(#stackSubraces)], stackSubraces[math.random(#stackSubraces)]}, value={min=250*zoneCoef, max=300*zoneCoef}, loot={itemTypes={Item.Valuable},itemValue={min=250, max=750*zoneCoef},value={min=500*zoneCoef, max=1000*zoneCoef}}},
        {count=1, subraceTypes={stackSubraces[math.random(#stackSubraces)], stackSubraces[math.random(#stackSubraces)]}, value={min=250*zoneCoef, max=300*zoneCoef}, loot={itemTypes={Item.Valuable},itemValue={min=250, max=750*zoneCoef},value={min=500*zoneCoef, max=1000*zoneCoef}}},
        {count=1, subraceTypes={stackSubraces[math.random(#stackSubraces)], stackSubraces[math.random(#stackSubraces)]}, value={min=250*zoneCoef, max=300*zoneCoef}, loot={itemTypes={Item.Valuable},itemValue={min=250, max=750*zoneCoef},value={min=500*zoneCoef, max=1000*zoneCoef}}},
    }

    return zoneContent
end

function getZones(races)
    local zones = {}

    zones[1] = getSingleZone(1, 1296, races[1], true)
    zones[2] = getSingleZone(2, 1296, nil, false)
    zones[3] = getSingleZone(3, 1296, races[2], true)
    zones[4] = getSingleZone(4, 1296, nil, false)

    return zones
end

function getConnections()
    local connections = {}

    table.insert(connections, { from = 1, to = 2 })
    table.insert(connections, { from = 1, to = 2 })
    table.insert(connections, { from = 1, to = 2 })
    table.insert(connections, { from = 1, to = 2 })
    table.insert(connections, { from = 1, to = 2 })
    table.insert(connections, { from = 1, to = 4 })
    table.insert(connections, { from = 1, to = 4 })
    table.insert(connections, { from = 1, to = 4 })
    table.insert(connections, { from = 1, to = 4 })
    table.insert(connections, { from = 1, to = 4 })
    table.insert(connections, { from = 3, to = 2 })
    table.insert(connections, { from = 3, to = 2 })
    table.insert(connections, { from = 3, to = 2 })
    table.insert(connections, { from = 3, to = 2 })
    table.insert(connections, { from = 3, to = 2 })
    table.insert(connections, { from = 3, to = 4 })
    table.insert(connections, { from = 3, to = 4 })
    table.insert(connections, { from = 3, to = 4 })
    table.insert(connections, { from = 3, to = 4 })
    table.insert(connections, { from = 3, to = 4 })

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
    roads = 35,
    forest = 35,
    startingGold = 1200,
    startingNativeMana = 200,
    getContents = getTemplateContents,
    forbiddenSpells = {
        --spheres for custom mana
        'g000ss0191',
        'g000ss0192',
        --bribe
        'g000ss0152',
        --trash
        'g000ss0173',
        'g000ss0146',
        'g000ss0135',
        'g000ss0027',
        'g000ss0132',
        'g000ss0123',
        'g000ss0121',
        'g000ss0131',
        'g000ss0124',
        'g000ss0133',     
        --speed
        'g000ss0100',
        --fox trickery
        'g000ss0176',
    },
    forbiddenUnits = {
        --фракционные призыватели
        'g001uu8238',
        'g000uu8238',
        'g000uu8185',
        'g000uu8191',
        'g001uu7598',
        'g000uu7598',
        'g000uu0164',
        --повелительница стихий
        'g000uu8205',
        'g000uu8206',
        --summons that can spawn in capital
        'g001uu0101',
        'g001uu0049',
        'g000uu8036',
        --support leaders
        'g000uu8133',
        'g000uu7528',
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
        'g000uu8265', -- Дева пламени
        'g000uu8266', -- Дроттар

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
        --
        'g000uu6113',
        'g000uu6013',
    },
    forbiddenItems = {
        --trash summons
        'g000ig5031',
        'g001ig0076',
        'g000ig5071',
        'g001ig0075',
        'g001ig0074',
        'g001ig0077',
        'g000ig5108',
        'g001ig0078',
        --t2 summons
        'g000ig5066',
        'g000ig5103',
        'g000ig5046',
        'g000ig5008',
        --t2 damage
        'g000ig5048',
        'g000ig5028',
        'g000ig5104',
        'g000ig5067',
        --high damage
        'g000ig5054',
        'g000ig5109',
        'g000ig5033',
        'g000ig5014',
        'g000ig5072',
        --rusty
        'g000ig2007',
        --lynareth
        'g001ig0596',
        --speed
        'g000ig5100',
        'g000ig5006',
        'g001ig0389',
        --water
        'g001ig0386',
        'g000ig5027',
        --wisdom scroll
        'g001ig0193',
        --100% nobility
        'g000ig2006',
    },
}
