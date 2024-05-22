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
    if math.random(0,1) == 1 then subraces[i] = Subrace.Human i = i + 1 end
    if math.random(0,1) == 1 then subraces[i] = Subrace.Elf i = i + 1 end
    if math.random(0,1) == 1 then subraces[i] = Subrace.Dwarf i = i + 1 end
    if math.random(0,1) == 1 then subraces[i] = Subrace.Undead i = i + 1 end
    if math.random(0,1) == 1 then subraces[i] = Subrace.Heretic i = i + 1 end

    return subraces
end

function getStack(tier, stackCount, subraceTypes)

    local t1Items = { 
        { id = 'g000ig7001', min = stackCount * 0.8, max = stackCount * 1 },
        { id = 'g001ig0431', min = stackCount * 0.5, max = stackCount * 0.7 },
        { id = 'g000ig0005', min = stackCount * 0.5, max = stackCount * 0.75 },
        { id = 'g001ig0180', min = stackCount * 1, max = stackCount * 2 },
        { id = 'g000ig0008', min = 1, max = 2 },
        { id = 'g000ig0014', min = 1, max = 2 },
    }
    local t2Items = { 
        { id = 'g000ig7002', min = stackCount * 0.6, max = stackCount * 0.9 },
        { id = 'g001ig0431', min = stackCount * 0.5, max = stackCount * 0.7 },
        { id = 'g000ig0005', min = stackCount * 1, max = stackCount * 1.5 },
        { id = 'g001ig0378', min = stackCount * 1, max = stackCount * 1 },
        { id = 'g000ig0008', min = 1, max = 2 },
        { id = 'g000ig0002', min = 1, max = 2 },
    }
    local t3Items = { 
        { id = 'g000ig7003', min = stackCount * 0.8, max = stackCount * 1 },
        { id = 'g001ig0432', min = stackCount * 0.5, max = stackCount * 0.7 },
        { id = 'g001ig0378', min = stackCount * 0.5, max = stackCount * 0.75 },
        { id = 'g000ig0006', min = stackCount * 0.5, max = stackCount * 0.75 },
        { id = 'g000ig0001', min = stackCount * 0.5, max = stackCount * 1 },
        { id = 'g000ig0009', min = 1, max = 2 },
        { id = 'g000ig0011', min = 1, max = 2 },
    }
    local t4Items = { 
        { id = 'g000ig7005', min = stackCount * 1, max = stackCount * 1 },
        { id = 'g001ig0151', min = stackCount * 1, max = stackCount * 1 },
        { id = 'g000ig0001', min = stackCount * 1, max = stackCount * 1 },
        { id = 'g000ig0006', min = stackCount * 1, max = stackCount * 1 },
        { id = 'g000ig0009', min = 1, max = 2 },
        { id = 'g000ig0015', min = 1, max = 2 },
    }
    local t5Items = { 
        { id = 'g000ig9042', min = stackCount * 1, max = stackCount * 1 },
        { id = 'g000ig7009', min = stackCount * 1, max = stackCount * 1 },
        { id = 'g001ig0282', min = stackCount * 1, max = stackCount * 1 },
        { id = 'g000ig0018', min = stackCount * 2, max = stackCount * 2 },
        { id = 'g000ig0001', min = stackCount * 2, max = stackCount * 2 },
        { id = 'g000ig0003', min = 1, max = 1 },
        { id = 'g000ig0012', min = 2, max = 2 },
    }

    local stackItems = { }
    if (tier == 1) then
        stackItems = t1Items
    elseif (tier == 2) then
        stackItems = t2Items
    elseif (tier == 3) then
        stackItems = t3Items
    elseif (tier == 4) then
        stackItems = t4Items
    elseif (tier == 5) then
        stackItems = t5Items
    end
    
    local experienceValue = { }    
    if (tier == 1) then
        experienceValue.min = 160 * stackCount
        experienceValue.max = 190 * stackCount
    elseif (tier == 2) then
        experienceValue.min = 140 * stackCount * tier * 0.9
        experienceValue.max = 170 * stackCount * tier * 0.9
    elseif (tier == 3) then
        experienceValue.min = 140 * stackCount * tier * 0.8
        experienceValue.max = 170 * stackCount * tier * 0.8
    elseif (tier == 4) then
        experienceValue.min = 190 * stackCount * tier * 0.8
        experienceValue.max = 210 * stackCount * tier * 0.8
    elseif (tier == 5) then
        experienceValue.min = 260 * stackCount * tier
        experienceValue.max = 350 * stackCount * tier
    end

    local stackItemsValue = { }
    if (tier == 1) then
        stackItemsValue.min = 300
        stackItemsValue.max = 400
    elseif (tier == 2) then
        stackItemsValue.min = 450
        stackItemsValue.max = 550
    elseif (tier == 3) then
        stackItemsValue.min = 600
        stackItemsValue.max = 700
    elseif (tier == 4) then
        stackItemsValue.min = 750
        stackItemsValue.max = 800
    elseif (tier == 5) then
        stackItemsValue.min = 900
        stackItemsValue.max = 1200
    end

    return {
        count = stackCount,
        value = experienceValue,
        subraceTypes = subraceTypes,
        loot = {
            items = stackItems,
            value = stackItemsValue,
            itemTypes = { Item.PotionBoost, Item.Scroll, Item.Orb, Item.Talisman, Item.Valuable },
            itemValue = { min = 50, max = 425 }
        }
    }
end

function getNativeMercenary(race)
    local mercenaryUnits = { }
    --empire
    if race == Race.Human then
        table.insert(mercenaryUnits, { id = 'g003uu5001', level = 1, unique = false }) --боец ополчения
        table.insert(mercenaryUnits, { id = 'g000uu0006', level = 1, unique = false }) --лучник
        table.insert(mercenaryUnits, { id = 'g000uu0011', level = 1, unique = false }) --послушница
        table.insert(mercenaryUnits, { id = 'g000uu0001', level = 1, unique = false }) --сквайр
        table.insert(mercenaryUnits, { id = 'g000uu0008', level = 1, unique = false }) --ученик
        table.insert(mercenaryUnits, { id = 'g000uu0002', level = 2, unique = false }) --рыцарь
        table.insert(mercenaryUnits, { id = 'g000uu0012', level = 2, unique = false }) --жрец
        table.insert(mercenaryUnits, { id = 'g000uu2029', level = 2, unique = false }) --поборник
        table.insert(mercenaryUnits, { id = 'g000uu7561', level = 2, unique = false }) --егерь
        table.insert(mercenaryUnits, { id = 'g000uu0009', level = 2, unique = false }) --волшебник
    end
    --clans
    if race == Race.Dwarf then
        table.insert(mercenaryUnits, { id = 'g000uu0036', level = 1, unique = false }) --гном
        table.insert(mercenaryUnits, { id = 'g000uu0026', level = 1, unique = false }) --метатель топоров
        table.insert(mercenaryUnits, { id = 'g004uu5039', level = 1, unique = false }) --снежный волк
        table.insert(mercenaryUnits, { id = 'g000uu0033', level = 1, unique = false }) --травница
        table.insert(mercenaryUnits, { id = 'g000uu0029', level = 1, unique = false }) --холмовой великан
        table.insert(mercenaryUnits, { id = 'g000uu0027', level = 2, unique = false }) --арбалетчик
        table.insert(mercenaryUnits, { id = 'g000uu0037', level = 2, unique = false }) --воин
        table.insert(mercenaryUnits, { id = 'g004uu8005', level = 2, unique = false }) --гарм
        table.insert(mercenaryUnits, { id = 'g000uu0030', level = 2, unique = false }) --горный великан
        table.insert(mercenaryUnits, { id = 'g000uu0034', level = 2, unique = false }) --посвященная
    end
    --elves
    if race == Race.Elf then
        table.insert(mercenaryUnits, { id = 'g000uu8031', level = 1, unique = false }) --дух
        table.insert(mercenaryUnits, { id = 'g000uu8014', level = 1, unique = false }) --кентавр-копейщик
        table.insert(mercenaryUnits, { id = 'g000uu8025', level = 1, unique = false }) --послушник леса
        table.insert(mercenaryUnits, { id = 'g000uu8018', level = 1, unique = false }) --разведчик
        table.insert(mercenaryUnits, { id = 'g003uu8037', level = 1, unique = false }) --священное древо
        table.insert(mercenaryUnits, { id = 'g000uu8016', level = 2, unique = false }) --кентавр странник
        table.insert(mercenaryUnits, { id = 'g000uu8032', level = 2, unique = false }) --оракул
        table.insert(mercenaryUnits, { id = 'g000uu8022', level = 2, unique = false }) --сторож
        table.insert(mercenaryUnits, { id = 'g000uu8026', level = 2, unique = false }) --чанелер
        table.insert(mercenaryUnits, { id = 'g003uu8038', level = 2, unique = false }) --энт-целитель
    end
    --undead
    if race == Race.Undead then
        table.insert(mercenaryUnits, { id = 'g000uu0080', level = 1, unique = false }) --адепт
        table.insert(mercenaryUnits, { id = 'g000uu0093', level = 1, unique = false }) --виверна
        table.insert(mercenaryUnits, { id = 'g000uu0086', level = 1, unique = false }) --воин
        table.insert(mercenaryUnits, { id = 'g001uu7539', level = 1, unique = false }) --колотун
        table.insert(mercenaryUnits, { id = 'g000uu0078', level = 1, unique = false }) --привидение
        table.insert(mercenaryUnits, { id = 'g000uu0094', level = 2, unique = false }) --дракон рока
        table.insert(mercenaryUnits, { id = 'g000uu0090', level = 2, unique = false }) --тамплиер
        table.insert(mercenaryUnits, { id = 'g000uu7542', level = 2, unique = false }) --чумотворец
        table.insert(mercenaryUnits, { id = 'g000uu0079', level = 2, unique = false }) --призрак
        table.insert(mercenaryUnits, { id = 'g003uu5013', level = 2, unique = false }) --череполом
    end
    --legions
    if race == Race.Heretic then
        table.insert(mercenaryUnits, { id = 'g004uu6120', level = 1, unique = false }) --ведьмино отродье
        table.insert(mercenaryUnits, { id = 'g000uu0055', level = 1, unique = false }) --горгулья
        table.insert(mercenaryUnits, { id = 'g000uu0052', level = 1, unique = false }) --одержимый
        table.insert(mercenaryUnits, { id = 'g000uu0062', level = 1, unique = false }) --сектант
        table.insert(mercenaryUnits, { id = 'g000uu0057', level = 1, unique = false }) --черт
        table.insert(mercenaryUnits, { id = 'g000uu7572', level = 2, unique = false }) --апатитовая горгулья
        table.insert(mercenaryUnits, { id = 'g000uu0053', level = 2, unique = false }) --берсеркер
        table.insert(mercenaryUnits, { id = 'g000uu0067', level = 2, unique = false }) --ведьма
        table.insert(mercenaryUnits, { id = 'g000uu0058', level = 2, unique = false }) --демон
        table.insert(mercenaryUnits, { id = 'g004uu6101', level = 2, unique = false }) --дьяволенок
    end

    return {
        units = mercenaryUnits,
    }
end

function getNeutralMercenary()
    local mercenaryUnits = { }

    table.insert(mercenaryUnits, { id = 'g000uu5013', level = 1, unique = false }) --орк
    table.insert(mercenaryUnits, { id = 'g001uu7547', level = 1, unique = false }) --бутуз
    table.insert(mercenaryUnits, { id = 'g000uu2006', level = 1, unique = false }) --наяда
    table.insert(mercenaryUnits, { id = 'g000uu5028', level = 1, unique = false }) --тритон
    table.insert(mercenaryUnits, { id = 'g000uu5039', level = 1, unique = false }) --волк
    table.insert(mercenaryUnits, { id = 'g001uu7553', level = 1, unique = false }) --ведунья
    table.insert(mercenaryUnits, { id = 'g000uu5040', level = 1, unique = false }) --варвар
    table.insert(mercenaryUnits, { id = 'g001uu7550', level = 1, unique = false }) --айтвар
    table.insert(mercenaryUnits, { id = 'g001uu8308', level = 1, unique = false }) --молодой триббог
    table.insert(mercenaryUnits, { id = 'g000uu5030', level = 1, unique = false }) --разбойник
    table.insert(mercenaryUnits, { id = 'g000uu5003', level = 1, unique = false }) --копейщик

    return {
        units = mercenaryUnits,
    }
end

function getRandomMercenary()
    local mercenaryUnits = { }
    local randomSource = {'air', 'water', 'earth', 'fire', 'mind', 'might'}

    local source = randomSource[math.random(#randomSource)]

    if source == 'air' then
        table.insert(mercenaryUnits, { id = 'g000uu6103', level = 1, unique = true }) --элементаль воздуха
        table.insert(mercenaryUnits, { id = 'g000uu8027', level = 3, unique = true }) --архонт
        table.insert(mercenaryUnits, { id = 'g000uu7562', level = 3, unique = true }) --бореалис
        table.insert(mercenaryUnits, { id = 'g000uu2012', level = 3, unique = true }) --кентавр стрелок
        table.insert(mercenaryUnits, { id = 'g000uu0031', level = 3, unique = true }) --повелитель бурь
        table.insert(mercenaryUnits, { id = 'g000uu8151', level = 1, unique = true }) --фурия
        table.insert(mercenaryUnits, { id = 'g000uu2011', level = 4, unique = true }) --хранитель рун
        table.insert(mercenaryUnits, { id = 'g000uu8263', level = 1, unique = true }) --чернокнижница
    end

    if source == 'water' then
        table.insert(mercenaryUnits, { id = 'g002uu5026', level = 1, unique = true }) --элементаль воды
        table.insert(mercenaryUnits, { id = 'g000uu8218', level = 1, unique = true }) --волхв
        table.insert(mercenaryUnits, { id = 'g001uu7581', level = 3, unique = true }) --заклинатель
        table.insert(mercenaryUnits, { id = 'g001uu7594', level = 1, unique = true }) --инеит
        table.insert(mercenaryUnits, { id = 'g000uu7610', level = 1, unique = true }) --ледяной ходок
        table.insert(mercenaryUnits, { id = 'g000uu8137', level = 1, unique = true }) --никса
        table.insert(mercenaryUnits, { id = 'g000uu0163', level = 4, unique = true }) --отшельник
        table.insert(mercenaryUnits, { id = 'g000uu8264', level = 1, unique = true }) --иерарх
    end
    
    if source == 'earth' then
        table.insert(mercenaryUnits, { id = 'g002uu0025', level = 1, unique = true }) --элементаль земли
        table.insert(mercenaryUnits, { id = 'g000uu8227', level = 3, unique = true }) --дентрофонт
        table.insert(mercenaryUnits, { id = 'g000uu7608', level = 1, unique = true }) --каменщик
        table.insert(mercenaryUnits, { id = 'g000uu6106', level = 1, unique = true }) --принцесса гномов
        table.insert(mercenaryUnits, { id = 'g001uu7574', level = 3, unique = true }) --цитриновая горгулья
        table.insert(mercenaryUnits, { id = 'g000uu8046', level = 1, unique = true }) --шаманка
        table.insert(mercenaryUnits, { id = 'g000uu0065', level = 4, unique = true }) --инкуб
        table.insert(mercenaryUnits, { id = 'g000uu8266', level = 1, unique = true }) --дроттар
    end

    if source == 'fire' then
        table.insert(mercenaryUnits, { id = 'g002uu0105', level = 1, unique = true }) --элементаль огня
        table.insert(mercenaryUnits, { id = 'g001uu8312', level = 4, unique = true }) --игнар
        table.insert(mercenaryUnits, { id = 'g000uu0064', level = 3, unique = true }) --демонолог
        table.insert(mercenaryUnits, { id = 'g006uu1128', level = 3, unique = true }) --мастер печи
        table.insert(mercenaryUnits, { id = 'g000uu7588', level = 1, unique = true }) --отлученный
        table.insert(mercenaryUnits, { id = 'g000uu8306', level = 1, unique = true }) --экзекутор
        table.insert(mercenaryUnits, { id = 'g001uu7560', level = 1, unique = true }) --каратель
        table.insert(mercenaryUnits, { id = 'g000uu8265', level = 1, unique = true }) --дева пламени
    end

    if source == 'mind' then
        table.insert(mercenaryUnits, { id = 'g000uu2004', level = 4, unique = true }) --истязатель душ
        table.insert(mercenaryUnits, { id = 'g001uu8267', level = 3, unique = true }) --эльф призрак
        table.insert(mercenaryUnits, { id = 'g000uu0173', level = 4, unique = true }) --суккуб
        table.insert(mercenaryUnits, { id = 'g001uu7587', level = 1, unique = true }) --ведьмак
        table.insert(mercenaryUnits, { id = 'g000uu8175', level = 1, unique = true }) --вестник ужаса
        table.insert(mercenaryUnits, { id = 'g000uu8277', level = 1, unique = true }) --уста богов
        table.insert(mercenaryUnits, { id = 'g001uu8260', level = 1, unique = true }) --искуситель
        table.insert(mercenaryUnits, { id = 'g001uu8262', level = 1, unique = true }) --знахарка
    end

    if source == 'might' then
        table.insert(mercenaryUnits, { id = 'g000uu2009', level = 3, unique = true }) --клинок в тени
        table.insert(mercenaryUnits, { id = 'g000uu7540', level = 4, unique = true }) --каган каменной пасти
        table.insert(mercenaryUnits, { id = 'g000uu7577', level = 2, unique = true }) --сатир
        table.insert(mercenaryUnits, { id = 'g000uu0040', level = 4, unique = true }) --старый ветеран
        table.insert(mercenaryUnits, { id = 'g000uu7578', level = 4, unique = true }) --кераст
        table.insert(mercenaryUnits, { id = 'g000uu5032', level = 1, unique = true }) --вождь варваров
        table.insert(mercenaryUnits, { id = 'g000uu5012', level = 1, unique = true }) --орк багатур
        table.insert(mercenaryUnits, { id = 'g000uu5024', level = 1, unique = true }) --ящер воин
    end

    return {
        units = mercenaryUnits,
    }
end

function getStartingMines(race)
    local zoneMines = { }

    zoneMines.gold = 2

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

function getPlayerSubRace(race) -- субраса игрока
	if race == Race.Human then return Subrace.Human
	elseif race == Race.Dwarf then return Subrace.Dwarf
	elseif race == Race.Undead then return Subrace.Undead
	elseif race == Race.Heretic then return Subrace.Heretic
	elseif race == Race.Elf then return Subrace.Elf
	end
end

function getStartingZone(zoneId, playerRace)
    return {
        id = zoneId,
        type = Zone.PlayerStart,
        race = playerRace,
        size = 225,
        border = Border.SemiOpen,
        gapChance = 29,

        capital = {
            garrison = {
                subraceTypes = { getPlayerSubRace(playerRace) },
                value = { min = 55, max = 55 },
                loot = {
                    items = {
                        { id = 'g000ig0001', min = 2, max = 2 },
                        { id = 'g000ig0005', min = 2, max = 2 },
                        { id = 'g001ig0378', min = 2, max = 2 },
                        { id = 'g000ig0006', min = 2, max = 2 },
                        { id = 'g001ig0113', min = 1, max = 1 },
                        { id = 'g000ig0009', min = 2, max = 2 },
                        { id = 'g000ig0011', min = 1, max = 1 },
                        { id = 'g000ig0014', min = 1, max = 1 },
                        { id = 'g001ig0529', min = 2, max = 2 },
                    }
                }
            }
        },
        mines = getStartingMines(playerRace),
        
        bags = {
            count = 6,
            loot = {
                itemTypes = { Item.Valuable, Item.PotionBoost },
                value = { min = 3000, max = 3500 },
                itemValue = { min = 50, max = 425 },
                items = {
                    { id = 'g000ig5022', min = 1, max = 1 },
                    { id = 'g000ig5027', min = 1, max = 1 },
                    { id = 'g000ig5100', min = 1, max = 1 },
                    { id = 'g001ig0194', min = 1, max = 1 },
                }
            }
        },
        stacks = {
            getStack(1, 5, { Subrace.NeutralGreenSkin, Subrace.NeutralWolf }),
            getStack(1, 4, { Subrace.NeutralHuman, Subrace.Human, Subrace.NeutralElf, Subrace.Elf }),
            getStack(2, 3, subraceRandomizer()),
            getStack(2, 3, subraceRandomizer()),
        },
        ruins = {
            {
                gold = { min = 570, max = 650 },
                loot = {
                    itemTypes = { Item.PotionPermanent },
                    itemValue = { min = 400, max = 700 },
                    value = { min = 700, max = 800 }
                },
                guard = {
                    subraceTypes = { Subrace.NeutralHuman, Subrace.Human, Subrace.NeutralWolf, Subrace.NeutralGreenSkin },
                    value = { min = 340, max = 380 }
                }
            },
            {
                gold = { min = 570, max = 650 },
                loot = {
                    items = {{ id = 'g000ig3022', min = 1, max = 1 }}
                },
                guard = {
                    subraceTypes = { Subrace.NeutralBarbarian, Subrace.NeutralWolf, Subrace.NeutralMarsh },
                    value = { min = 370, max = 420 }
                }
            },
            {
                gold = { min = 450, max = 520 },
                loot = {
                    items = {{ id = 'g000ig5030', min = 1, max = 1 }}
                },
                guard = {
                    subraceTypes = { Subrace.NeutralBarbarian, Subrace.NeutralGreenSkin },
                    value = { min = 350, max = 450 }
                }
            },
        },
        towns = {
            {
                tier = 1,
                garrison = {
                    subraceTypes = subraceRandomizer(),
                    value = { min = 250, max = 300 },
                    loot = {
                        items = {
                            { id = 'g001ig0151', min = 1, max = 1 },
                            { id = 'g000ig7006', min = 1, max = 1 },
                            { id = 'g000ig0008', min = 1, max = 1 },
                            { id = 'g000ig0002', min = 1, max = 1 },
                        },
                        itemTypes = { Item.Scroll, Item.Orb },
                        itemValue = { min = 50, max = 250 },
                        value = { min = 800, max = 1000 }
                    }
                },
                stack = {
                    subraceTypes = subraceRandomizer(),
                    value = { min = 380, max = 440 },
                    loot = {
                        items = {
                            { id = 'g000ig0001', min = 1, max = 1 },
                            { id = 'g000ig0006', min = 1, max = 1 },
                        },
                        itemTypes = { Item.Weapon, Item.Armor },
                        itemValue = { min = 300, max = 1000 },
                        value = { min = 1500, max = 2000 }
                    }
                }
            },
        },
        merchants = {
            {
                goods = {
                    items = {
                        { id = 'g000ig0001', min = 8, max = 8 },
                        { id = 'g000ig0005', min = 8, max = 8 },
                        { id = 'g000ig0006', min = 5, max = 5 },
                        { id = 'g001ig0378', min = 8, max = 8 },
                        { id = 'g000ig0002', min = 3, max = 3 },
                        { id = 'g000ig0011', min = 3, max = 3 },
                        { id = 'g000ig0008', min = 3, max = 3 },
                        { id = 'g000ig0014', min = 3, max = 3 },
                        { id = 'g001ig0110', min = 1, max = 1 },
                        { id = 'g001ig0108', min = 1, max = 1 },
                        { id = 'g001ig0105', min = 1, max = 1 },
                        { id = 'g001ig0107', min = 1, max = 1 },
                        { id = 'g001ig0109', min = 1, max = 1 },
                        { id = 'g001ig0106', min = 1, max = 1 },
                    },
                    itemTypes = { Item.Weapon, Item.Armor, Item.Banner, Item.Jewel },
                    itemValue = { min = 300, max = 1000 },
                    value = { min = 7000, max = 9000 }
                },
            }
        },
        mages = {},
        mercenaries = {
            getNativeMercenary(playerRace),
            getNeutralMercenary()
        }
    }
end

function getNeutralZone(zoneId)
    return {
        id = zoneId,
        type = Zone.Treasure,
        size = 200,
        border = Border.Water,

        mines = {
            gold = 1,
            lifeMana = 1,
            runicMana = 1,
            groveMana = 1,
            infernalMana = 1,
            deathMana = 1
        },

        bags = {
            count = 4,
            loot = {
                items = {
                    { id = 'g001ig0486', min = 2, max = 2 },
                    { id = 'g000ig0014', min = 1, max = 1 },
                    { id = 'g000ig0009', min = 2, max = 2 },
                    { id = 'g000ig0011', min = 1, max = 1 },
                    { id = 'g000ig0002', min = 1, max = 1 },
                    { id = 'g000ig0001', min = 2, max = 2 },
                    { id = 'g000ig5088', min = 1, max = 1 },
                }
            }
        },
        stacks = {
            getStack(2, 3, subraceRandomizer()),
            getStack(3, 4, subraceRandomizer()),
            getStack(4, 2, subraceRandomizer()),
        },
        ruins = {
            {
                gold = { min = 1000, max = 1200 },
                loot = {
                    items = {
                        { id = 'g001ig0288', min = 1, max = 1 }
                    }
                },
                guard = {
                    subraceTypes = { Subrace.NeutralDragon, Subrace.Neutral },
                    value = { min = 1300, max = 1750 }
                }
            },
            {
                gold = { min = 700, max = 900 },
                loot = {
                    items = {
                        { id = 'g001ig0606', min = 1, max = 1 }
                    }
                },
                guard = {
                    subraceTypes = { Subrace.NeutralHuman, Subrace.Human, Subrace.NeutralBarbarian, Subrace.Neutral },
                    value = { min = 650, max = 750 }
                }
            },
            {
                gold = { min = 600, max = 800 },
                loot = {
                    itemTypes = { Item.PotionPermanent },
                    itemValue = { min = 400, max = 700 },
                    value = { min = 700, max = 800 }
                },
                guard = {
                    subraceTypes = { Subrace.Dwarf, Subrace.Elf, Subrace.NeutralElf, Subrace.Neutral },
                    value = { min = 540, max = 620 }
                }
            },
        },
        towns = {
            {
                tier = 3,
                garrison = {
                    subraceTypes = subraceRandomizer(),
                    value = { min = 500, max = 600 },
                    loot = {
                        items = {
                            { id = 'g001ig0151', min = 1, max = 1 },
                            { id = 'g000ig7006', min = 1, max = 1 },
                            { id = 'g000ig0014', min = 1, max = 1 },
                            { id = 'g000ig0011', min = 1, max = 1 },
                        },
                        itemTypes = { Item.Scroll, Item.Orb, Item.Talisman },
                        itemValue = { min = 50, max = 250 },
                        value = { min = 1000, max = 1200 }
                    }
                },
                stack = {
                    subraceTypes = subraceRandomizer(),
                    value = { min = 570, max = 640 },
                    loot = {
                        items = {
                            { id = 'g000ig0001', min = 1, max = 1 },
                            { id = 'g000ig0006', min = 1, max = 1 },
                        },
                        itemTypes = { Item.Weapon, Item.Armor },
                        itemValue = { min = 600, max = 1400 },
                        value = { min = 2000, max = 2600 }
                    }
                }
            },
        },
        merchants = {
            {
                goods = {
                    items = {
                        { id = 'g000ig0001', min = 8, max = 8 },
                        { id = 'g000ig0005', min = 8, max = 8 },
                        { id = 'g000ig0006', min = 5, max = 5 },
                        { id = 'g001ig0378', min = 8, max = 8 },
                        { id = 'g000ig0002', min = 3, max = 3 },
                        { id = 'g000ig0011', min = 3, max = 3 },
                        { id = 'g000ig0008', min = 3, max = 3 },
                        { id = 'g000ig0014', min = 3, max = 3 },
                        { id = 'g000ig8003', min = 1, max = 1 },
                        { id = 'g001ig0111', min = 1, max = 1 },
                        { id = 'g001ig0114', min = 1, max = 1 },
                    },
                    itemTypes = { Item.Weapon, Item.Armor, Item.Banner, Item.Jewel },
                    itemValue = { min = 500, max = 1200 },
                    value = { min = 8000, max = 10000 }
                },
            },
        },
        mages = {},
        mercenaries = {getRandomMercenary()},
        trainers = {}
    }
end

function getIslandZone(zoneId)
    local islandMines = { }
    if zoneId == 1 then
        islandMines.gold = 1
        islandMines.lifeMana = 1
        islandMines.deathMana = 1
    elseif zoneId == 4 then
        islandMines.groveMana = 1
        islandMines.runicMana = 1
        islandMines.infernalMana = 1
    end

    local zoneMages = { }
    if zoneId == 1 then zoneMages = {{value = { min = 3500, max = 4500 },spellLevel = { min = 1, max = 3},spells = { 'g000ss0022', 'g000ss0100', 'g000ss0027' }}} end

    local zoneMerchants = { }
    if zoneId == 4 then 
        zoneMerchants = {
        {
            goods = {
                items = {
                    { id = 'g000ig0001', min = 8, max = 8 },
                    { id = 'g000ig0005', min = 8, max = 8 },
                    { id = 'g000ig0006', min = 5, max = 5 },
                    { id = 'g001ig0378', min = 8, max = 8 },
                    { id = 'g000ig0002', min = 3, max = 3 },
                    { id = 'g000ig0011', min = 3, max = 3 },
                    { id = 'g000ig0008', min = 3, max = 3 },
                    { id = 'g000ig0014', min = 3, max = 3 },
                    { id = 'g001ig0110', min = 1, max = 1 },
                    { id = 'g001ig0108', min = 1, max = 1 },
                    { id = 'g001ig0105', min = 1, max = 1 },
                    { id = 'g001ig0107', min = 1, max = 1 },
                    { id = 'g001ig0109', min = 1, max = 1 },
                    { id = 'g001ig0106', min = 1, max = 1 },
                },
                itemTypes = { Item.Weapon, Item.Armor, Item.Banner, Item.Jewel },
                itemValue = { min = 300, max = 1000 },
                value = { min = 7000, max = 9000 }
            },
        }
    }
    end

    return {
        id = zoneId,
        type = Zone.Treasure,
        size = 75,
        border = Border.Water,

        mines = islandMines,

        bags = {
            count = 4,
            loot = {
                itemTypes = { Item.Scroll, Item.Orb },
                value = { min = 1200, max = 1400 },
                itemValue = { min = 50, max = 250 },
                items = {
                    { id = 'g000ig0002', min = 2, max = 2 },
                    { id = 'g000ig0014', min = 1, max = 1 },
                    { id = 'g000ig0008', min = 2, max = 2 },
                    { id = 'g000ig0011', min = 1, max = 1 },
                }
            }
        },
        stacks = {
            getStack(5, 1, { Subrace.NeutralDragon }),
            getStack(4, 1, subraceRandomizer()),
            getStack(3, 2, subraceRandomizer()),
            getStack(2, 2, subraceRandomizer()),
        },
        ruins = {
            {
                gold = { min = 700, max = 900 },
                loot = {
                    itemTypes = { Item.Banner },
                    itemValue = { min = 1500, max = 1500 },
                    value = { min = 1500, max = 1500 }
                },
                guard = {
                    subraceTypes = { Subrace.NeutralBarbarian, Subrace.NeutralWolf, Subrace.Neutral },
                    value = { min = 600, max = 700 }
                }
            },
            {
                gold = { min = 600, max = 800 },
                loot = {
                    itemTypes = { Item.Jewel },
                    itemValue = { min = 750, max = 1200 },
                    value = { min = 1200, max = 1200 }
                },
                guard = {
                    subraceTypes = { Subrace.NeutralMarsh, Subrace.NeutralElf, Subrace.Elf },
                    value = { min = 560, max = 620 }
                }
            },

        },
        towns = {},
        merchants = zoneMerchants,
        mages = zoneMages,
        mercenaries = {},
        trainers = {}
    }
end

function getZones(races)
    local zones = {}
    zones[1] = getStartingZone(0, races[1])
    zones[2] = getIslandZone(1)
    zones[3] = getNeutralZone(2) 
    zones[4] = getStartingZone(3, races[2])    
    zones[5] = getIslandZone(4)
    zones[6] = getNeutralZone(5)
    return zones
end    

function getConnections()
    --[[
        0 1 2
        5 4 3
    ]]--

    local connections = {
        { from = 0, to = 1 },
        { from = 0, to = 1 },
        { from = 0, to = 1 },
        { from = 0, to = 4 },
        { from = 0, to = 4 },
        { from = 0, to = 4 },

        { from = 3, to = 1 },
        { from = 3, to = 1 },
        { from = 3, to = 1 },
        { from = 3, to = 4 },
        { from = 3, to = 4 },
        { from = 3, to = 4 },

        { from = 0, to = 2 },
        { from = 0, to = 2 },
        { from = 0, to = 2 },

        { from = 3, to = 5 },
        { from = 3, to = 5 },
        { from = 3, to = 5 },
    }

    return connections
end

function getTemplateContents(races)
	return {
		zones = getZones(races),
		connections = getConnections()
	}
end

template = {
    forbiddenItems = {
        'g000ig5030', --свиток сивиллы
        'g000ig5009', --свиток истинного зрения
        'g000ig5085', --свиток искусный торговец
        --useless potions
        'g001ig0129',
        'g001ig0333',
        'g001ig0126',
        'g001ig0349',
        'g001ig0345',
        'g001ig0347',
        'g001ig0339',
        'g001ig0341',
        'g001ig0351',
        'g001ig0353',
        --some premanents
        'g001ig0525',
        'g001ig0350',
        'g001ig0344',
        'g001ig0336',
        'g001ig0342',
        'g001ig0346',
        'g001ig0340',
        'g001ig0338',
        'g001ig0330',
        'g001ig0348',
        'g001ig0328',
        'g001ig0352',
        'g001ig0334',
        'g001ig0528',
        'g001ig0316',
        'g001ig0503',
        'g001ig0529',
        'g001ig0321',
        'g001ig0322',
        'g001ig0531',
        'g001ig0323',
        'g001ig0083',
        'g001ig0536',
        'g001ig0527',
        'g001ig0530',
        'g001ig0526',
        'g001ig0326',
        'g001ig0332',
        'g001ig0325',
        'g001ig0324',
        'g001ig0524',
        'g001ig0532',
        'g001ig0320',
        'g001ig0354',
        'g001ig0501',
        'g001ig0519',
    },
    forbiddenSpells = {
        'g000ss0009',
        'g000ss0030',
        'g000ss0006',
        'g000ss0195',
        'g000ss0150',
        'g000ss0032',
        'g000ss0031',
        'g000ss0140',
        'g000ss0071',
        'g000ss0139',
        'g000ss0138',
        'g000ss0141',
        'g000ss0108',
        'g000ss0085',
        'g000ss0053',
        'g000ss0051',
        'g000ss0176',
        'g000ss0146',
        'g000ss0134',
        'g000ss0135',
        'g000ss0132',
        'g000ss0173',
    },

    name = 'diligence 0.2.0',
    description = 'diligence 0.2.0 by obscure, SMNS2, 48x48, 2 players, almost open, timer 9+6',
    minSize = 48,
    maxSize = 48,
    maxPlayers = 2,
    roads = 42,
    forest = 32,
    startingGold = 1200,
    startingNativeMana = 150,
    getContents = getTemplateContents
}