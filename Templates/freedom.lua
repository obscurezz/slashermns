-- template: freedom 2
-- author: obscure

-- 0 1 2
-- 7 8 3
-- 6 5 4

local TemplateName = 'Freedom'
local Verison = '2.1.2'
local Timer = 'First turn: 600, second turn: 360, sixth and further turns: 420.'

function getName(name, version)
    return name .. ' ' .. version
end

function getDescription(name, version, timer)
    return name .. ' ' .. version .. 'S by obscure, SMNS2, 72x72, 2 players.\nPink zone center, Blue opposite Yellow, Red Opposite Black.\nTimer is: ' .. timer
end

function shuffleTable(t)
    local j
 
    for i = #t, 2, -1 do
        j = math.random( i )
        t[i], t[j] = t[j], t[i]
    end
    return t
end

----------
-- item arrays for exact rewards
local low_talisman = {'g001ig0267', 'g001ig0265', 'g001ig0266', 'g001ig0264', 'g000ig9101'}
local orbs_of_protection = {'g001ig0454', 'g001ig0056', 'g001ig0054', 'g001ig0055', 'g001ig0053', 'g001ig0058', 'g001ig0057'}
local low_level_potions = {'g000ig0014', 'g000ig0009', 'g000ig0008', 'g000ig0011', 'g000ig0002', 'g001ig0547', 'g001ig0560', 'g001ig0490'}
local resistance_potions = {'g002ig0007', 'g002ig0005', 'g000ig0022', 'g000ig0021', 'g000ig0023', 'g000ig0024', 'g001ig0125', 'g001ig0036', 'g002ig0006', 'g001ig0341', 'g001ig0329', 'g001ig0128', 'g001ig0351', 'g001ig0343'}
local high_level_potions = {'g002ig0008', 'g000ig0012', 'g000ig0015', 'g001ig0355', 'g001ig0491', 'g000ig0003'}
local low_level_buff_scrolls = {'g000ig5002', 'g000ig5007', 'g000ig5021', 'g000ig5023', 'g000ig5003', 'g001ig0250', 'g000ig5102'}
local low_level_debuff_scrolls = {'g001ig0248', 'g000ig5043', 'g000ig5044', 'g000ig5045', 'g000ig5024', 'g000ig5097', 'g000ig5004', 'g000ig5101', 'g000ig5062', 'g001ig0252', 'g001ig0247', 'g000ig5065', 'g000ig5064', 'g000ig5106', 'g000ig5063', }
local low_level_macro_scrolls = {'g000ig5119', 'g000ig5084', 'g000ig5009', 'g001ig0195', 'g001ig0492', 'g001ig0072', 'g000ig5022', 'g001ig0407', 'g000ig5042', 'g000ig5041', 'g000ig5025', 'g000ig5061', 'g000ig5098'}
local high_level_buff_scrolls = {'g001ig0249', 'g001ig0254', 'g001ig0193', 'g001ig0571', 'g000ig5034', 'g001ig0568', 'g000ig5005', 'g000ig5001', 'g000ig5010', 'g000ig5016', 'g001ig0256', 'g000ig5020', 'g000ig5029', 'g001ig0255', 'g001ig0251'}
local high_level_debuff_scrolls = {'g000ig5050', 'g000ig5049', 'g001ig0577', 'g001ig0580', 'g001ig0576', 'g001ig0578', 'g001ig0579', 'g000ig5048', 'g001ig0164', 'g000ig5070', 'g000ig5028', 'g000ig5104', 'g000ig5118', 'g001ig0253', 'g000ig5069', 'g000ig5067'}
local high_level_macro_scrolls = {'g000ig5008', 'g000ig5047', 'g000ig5046', 'g000ig5066', 'g000ig5103', 'g000ig5088', 'g001ig0569', 'g000ig5074', 'g000ig5068', 'g000ig5052', 'g001ig0570'}
local control = {'g000ig3018', 'g000ig3021', 'g000ig3015', 'g001ig0414', 'g000ig3016'}
-- end
----------

----------
-- high level mercenary
function getBigMercenary(guard)
    local Mercenary = {}

    local legions = {'g000uu0173', 'g000uu2004', 'g000uu8254', 'g000uu7605'} --суккуб--истязатель душ--искоренитель--скульптор лжи
    local undead = {'g000uu2008', 'g001uu8314', 'g003uu5014', 'g001uu7592'} --длань мортис--клеврет смерти--хан каменной пасти--торхот
    local empire = {'g000uu2010', 'g000uu7570', 'g001uu7582', 'g000uu7628'} --кара императора--епископ--криомант--имперский гвардеец
    local clans = {'g000uu7559', 'g000uu2020', 'g000uu2011', 'g000uu7628'} --хэйсса--метатель огня--хранитель рун--советник вотана
    local elves = {'g000uu8214', 'g001uu8240', 'g000uu8258', 'g000uu7629'} --дриолисса--штормовой кентавр--консул--благородный эльф

    local neutrals = {'g001uu7594', 'g000uu8275', 'g001uu7602', 'g000uu5008', 'g000uu7544', 'g000uu8218', 'g000uu8174', 'g000uu8175'} --инеит--медуза--соглядатай--повелитель эльфов--настоятельница--волхв--вестник распажа--вестник ужаса

    local units = {}

    table.insert(units, { id = legions[math.random(#legions)], level = 4, unique = true })
    table.insert(units, { id = undead[math.random(#undead)], level = 4, unique = true })
    table.insert(units, { id = empire[math.random(#empire)], level = 4, unique = true })
    table.insert(units, { id = clans[math.random(#clans)], level = 4, unique = true })
    table.insert(units, { id = elves[math.random(#elves)], level = 4, unique = true })

    for i = 1, 2 do
        x = math.random(1, #neutrals)
        table.insert(units, { id = neutrals[x], level = 1, unique = true })
        table.remove(neutrals, x)
    end
    
    Mercenary['units'] = units

    Mercenary['guard'] = guard

    return Mercenary
end
-- end
----------

----------
-- function returns exact rewards for guards
function getExacts(Type)
    if Type == 't1MerchantExacts' then
        return {
            { id = 'g000ig0006', min = 1, max = 1 },
            { id = 'g000ig0005', min = 1, max = 1 },
            { id = orbs_of_protection[math.random(#orbs_of_protection)], min = 1, max = 1 },
            { id = low_level_potions[math.random(#low_level_potions)], min = 1, max = 1 },
            { id = low_level_buff_scrolls[math.random(#low_level_buff_scrolls)], min = 1, max = 1 },
            { id = low_level_macro_scrolls[math.random(#low_level_macro_scrolls)], min = 1, max = 1 },
        }

    elseif Type == 't2MerchantExacts' then
        return {
            { id = 'g000ig0001', min = 1, max = 1 },
            { id = 'g000ig0006', min = 2, max = 2 },
            { id = orbs_of_protection[math.random(#orbs_of_protection)], min = 1, max = 1 },
            { id = low_level_potions[math.random(#low_level_potions)], min = 1, max = 1 },
            { id = low_level_macro_scrolls[math.random(#low_level_macro_scrolls)], min = 1, max = 1 },
            { id = resistance_potions[math.random(#resistance_potions)], min = 1, max = 1 },
        }

    elseif Type == 't3MerchantExacts' then
        return {
            { id = 'g000ig0001', min = 2, max = 2 },
            { id = 'g000ig0018', min = 2, max = 2 },
            { id = high_level_potions[math.random(#high_level_potions)], min = 1, max = 1 },
            { id = low_level_potions[math.random(#low_level_potions)], min = 1, max = 1 },            
            { id = high_level_macro_scrolls[math.random(#high_level_macro_scrolls)], min = 1, max = 1 },
            { id = resistance_potions[math.random(#resistance_potions)], min = 1, max = 1 },
        }

    elseif Type == 'startBufferExacts' then
        return {
            { id = 'g000ig0001', min = 1, max = 1 },
            { id = 'g000ig0006', min = 2, max = 2 },
            { id = 'g000ig5100', min = 1, max = 1 },
            { id = 'g001ig0486', min = 1, max = 1 },
            { id = low_level_potions[math.random(#low_level_potions)], min = 1, max = 1 },
            { id = low_level_potions[math.random(#low_level_potions)], min = 1, max = 1 },
            { id = low_level_buff_scrolls[math.random(#low_level_buff_scrolls)], min = 1, max = 1 },
        }

    elseif Type == 'startTreasureExacts' then
        return {
            { id = 'g000ig0001', min = 2, max = 2 },
            { id = 'g000ig0018', min = 2, max = 2 },
            { id = low_level_potions[math.random(#low_level_potions)], min = 1, max = 1 },
            { id = high_level_potions[math.random(#high_level_potions)], min = 1, max = 1 },
            
            { id = resistance_potions[math.random(#resistance_potions)], min = 1, max = 1 },            
        }

    elseif Type == 'bufferBigExacts' then
        return {
            { id = 'g000ig0001', min = 2, max = 2 },
            { id = 'g000ig0006', min = 2, max = 2 },
            { id = 'g000ig5100', min = 1, max = 1 },
            { id = low_level_potions[math.random(#low_level_potions)], min = 1, max = 1 },
            { id = low_level_potions[math.random(#low_level_potions)], min = 1, max = 1 },
            { id = low_level_macro_scrolls[math.random(#low_level_macro_scrolls)], min = 1, max = 1 },
            { id = high_level_buff_scrolls[math.random(#high_level_buff_scrolls)], min = 1, max = 1 },
        }

    elseif Type == 'bufferTreasureExacts' then
        return {
            { id = 'g000ig0001', min = 2, max = 2 },
            { id = 'g000ig0018', min = 2, max = 2 },
            { id = high_level_potions[math.random(#high_level_potions)], min = 1, max = 1 },
            { id = high_level_macro_scrolls[math.random(#high_level_macro_scrolls)], min = 1, max = 1 },
            { id = low_level_debuff_scrolls[math.random(#low_level_debuff_scrolls)], min = 1, max = 1 },
            { id = resistance_potions[math.random(#resistance_potions)], min = 1, max = 1 },
        }

    elseif Type == 'bigTreasureExacts' then
        return {
            { id = 'g000ig0001', min = 2, max = 2 },
            { id = 'g000ig0018', min = 2, max = 2 },
            { id = high_level_potions[math.random(#high_level_potions)], min = 1, max = 1 },
            { id = high_level_macro_scrolls[math.random(#high_level_macro_scrolls)], min = 1, max = 1 },
            { id = high_level_buff_scrolls[math.random(#high_level_buff_scrolls)], min = 1, max = 1 },
        }

    elseif Type == 't1TownExacts' then
        return {
            { id = 'g000ig0005', min = 2, max = 2 },
            { id = 'g000ig0001', min = 1, max = 1 },
            { id = low_level_potions[math.random(#low_level_potions)], min = 1, max = 1 },
            { id = low_level_potions[math.random(#low_level_potions)], min = 1, max = 1 },
            { id = low_talisman[math.random(#low_talisman)], min = 1, max = 1 }
        }

    elseif Type == 't1TownGuardExacts' then
        return {
            { id = 'g000ig0006', min = 1, max = 1 },
            { id = 'g000ig0005', min = 1, max = 1 },
            { id = 'g000ig0001', min = 1, max = 1 },
            { id = low_level_buff_scrolls[math.random(#low_level_buff_scrolls)], min = 1, max = 1 },
            { id = low_level_debuff_scrolls[math.random(#low_level_debuff_scrolls)], min = 1, max = 1 },
        }

    elseif Type == 't2TownExacts' then
        return {
            { id = 'g000ig0006', min = 2, max = 2 },
            { id = 'g000ig0001', min = 1, max = 1 },
            { id = 'g000ig5009', min = 1, max = 1 },
            { id = 'g001ig0194', min = 1, max = 1 },
            { id = 'g001ig0530', min = 1, max = 1 },
            { id = low_level_potions[math.random(#low_level_potions)], min = 1, max = 1 },
            { id = low_level_potions[math.random(#low_level_potions)], min = 1, max = 1 },
            
        }

    elseif Type == 't2TownGuardExacts' then
        return {
            { id = 'g000ig0001', min = 1, max = 1 },
            { id = 'g000ig0006', min = 2, max = 2 },
            { id = 'g000ig5100', min = 1, max = 1 },
            { id = low_level_potions[math.random(#low_level_potions)], min = 1, max = 1 },
            { id = resistance_potions[math.random(#resistance_potions)], min = 1, max = 1 },
            { id = low_level_macro_scrolls[math.random(#low_level_macro_scrolls)], min = 1, max = 1 },
        }

    elseif Type == 't3TownExacts' then
        return {
            { id = 'g000ig0001', min = 2, max = 2 },
            { id = 'g000ig0006', min = 2, max = 2 },
            { id = 'g000ig0005', min = 2, max = 2 },
            { id = 'g000ig5085', min = 1, max = 1 },
            { id = 'g000ig5030', min = 1, max = 1 },
            { id = low_level_potions[math.random(#low_level_potions)], min = 1, max = 1 },
            { id = resistance_potions[math.random(#resistance_potions)], min = 1, max = 1 },
            { id = high_level_potions[math.random(#high_level_potions)], min = 1, max = 1 },
        }

    elseif Type == 't3TownGuardExacts' then
        return {
            { id = 'g000ig0001', min = 1, max = 1 },
            { id = 'g000ig0018', min = 1, max = 1 },
            { id = 'g000ig0006', min = 1, max = 1 },
            { id = low_level_potions[math.random(#low_level_potions)], min = 1, max = 1 },
            { id = high_level_buff_scrolls[math.random(#high_level_buff_scrolls)], min = 1, max = 1 },
            { id = low_level_macro_scrolls[math.random(#low_level_macro_scrolls)], min = 1, max = 1 },
            { id = 'g001ig0151', min = 1, max = 1 },
        }

    elseif Type == 't4BigExacts' then
        return {
            { id = 'g000ig0018', min = 2, max = 2 },
            { id = 'g000ig0005', min = 2, max = 2 },
            { id = 'g000ig0001', min = 1, max = 1 },
            { id = 'g000ig9043', min = 1, max = 1 },
            { id = low_level_potions[math.random(#low_level_potions)], min = 1, max = 1 },
            { id = resistance_potions[math.random(#resistance_potions)], min = 1, max = 1 },
            { id = high_level_debuff_scrolls[math.random(#high_level_debuff_scrolls)], min = 1, max = 1 },
        }

    elseif Type == 't4BigGuardExacts' then
        return {
            { id = 'g001ig0152', min = 1, max = 1 },
            { id = 'g000ig0001', min = 2, max = 2 },
            { id = low_level_potions[math.random(#low_level_potions)], min = 1, max = 1 },
            { id = low_level_potions[math.random(#low_level_potions)], min = 1, max = 1 },
            { id = high_level_buff_scrolls[math.random(#high_level_buff_scrolls)], min = 1, max = 1 },
        }

    elseif Type == 't2BigExacts' then
        return {
            { id = 'g000ig0001', min = 1, max = 1 },
            { id = 'g000ig0018', min = 1, max = 1 },
            { id = 'g001ig0486', min = 1, max = 1 },
            { id = low_level_buff_scrolls[math.random(#low_level_buff_scrolls)], min = 1, max = 1 },
            { id = low_level_debuff_scrolls[math.random(#low_level_debuff_scrolls)], min = 1, max = 1 },
            { id = resistance_potions[math.random(#resistance_potions)], min = 1, max = 1 },
        }

    elseif Type == 't2BigGuardExacts' then
        return {
            { id = 'g000ig0001', min = 1, max = 1 },
            { id = 'g000ig0006', min = 2, max = 2 },
            { id = low_level_macro_scrolls[math.random(#low_level_macro_scrolls)], min = 1, max = 1 },
            { id = low_level_potions[math.random(#low_level_potions)], min = 1, max = 1 },
            { id = resistance_potions[math.random(#resistance_potions)], min = 1, max = 1 },
        }

    elseif Type == 't5CenterExacts' then
        return {
            { id = 'g000ig0018', min = 2, max = 2 },
            { id = 'g000ig0001', min = 2, max = 2 },
            { id = 'g000ig0006', min = 2, max = 2 },
            { id = low_level_potions[math.random(#low_level_potions)], min = 1, max = 1 },
            { id = high_level_potions[math.random(#high_level_potions)], min = 1, max = 1 },
            { id = high_level_debuff_scrolls[math.random(#high_level_debuff_scrolls)], min = 1, max = 1 },
            { id = high_level_macro_scrolls[math.random(#high_level_macro_scrolls)], min = 1, max = 1 },
        }

    elseif Type == 't5CenterGuardExacts' then
        return {
            { id = 'g001ig0152', min = 1, max = 1 },
            { id = 'g000ig0006', min = 2, max = 2 },
            { id = 'g000ig0001', min = 1, max = 1 },
            { id = high_level_potions[math.random(#high_level_potions)], min = 1, max = 1 },
            { id = low_level_potions[math.random(#low_level_potions)], min = 1, max = 1 },
            { id = resistance_potions[math.random(#resistance_potions)], min = 1, max = 1 },
            { id = high_level_buff_scrolls[math.random(#high_level_buff_scrolls)], min = 1, max = 1 },
        }

    elseif Type == 't3CenterExacts' then
        return {
            { id = 'g000ig0001', min = 1, max = 1 },
            { id = 'g001ig0152', min = 1, max = 1 },
            { id = 'g001ig0486', min = 1, max = 1 },
            { id = low_level_potions[math.random(#low_level_potions)], min = 1, max = 1 },
            { id = resistance_potions[math.random(#resistance_potions)], min = 1, max = 1 },
        }

    elseif Type == 't3CenterGuardExacts' then
        return {
            { id = 'g000ig0001', min = 1, max = 1 },
            { id = 'g000ig0018', min = 1, max = 1 },
            { id = low_level_buff_scrolls[math.random(#low_level_buff_scrolls)], min = 1, max = 1 },
            { id = high_level_macro_scrolls[math.random(#high_level_macro_scrolls)], min = 1, max = 1 },
            { id = resistance_potions[math.random(#resistance_potions)], min = 1, max = 1 },
        }
    end
end
-- end
----------

----------
-- function describes subrace types
function subraceRandomizer(flag)
    local subraces = { }

    if flag == GO then
        local randomFlag = math.random(0, 4)
        if randomFlag == 0 then
            subraces = { Subrace.NeutralDragon, Subrace.Dwarf }
        end

        if randomFlag == 1 then
            subraces = { Subrace.NeutralDragon, Subrace.Human }
        end

        if randomFlag == 2 then
            subraces = { Subrace.NeutralDragon, Subrace.Elf }
        end

        if randomFlag == 3 then
            subraces = { Subrace.NeutralDragon, Subrace.Heretic }
        end

        if randomFlag == 4 then
            subraces = { Subrace.NeutralDragon, Subrace.Undead }
        end
       
    elseif flag == 1 then
        local randomFlag = math.random(0, 4)

        if randomFlag == 0 then
            subraces = { Subrace.NeutralGreenSkin, Subrace.NeutralWolf }
        end

        if randomFlag == 1 then
            subraces = { Subrace.NeutralElf, Subrace.Elf, Subrace.NeutralWolf }
        end

        if randomFlag == 2 then
            subraces = { Subrace.NeutralHuman, Subrace.Human, Subrace.NeutralWolf }
        end

        if randomFlag == 3 then
            subraces = { Subrace.NeutralMarsh, Subrace.NeutralWater }
        end

        if randomFlag == 4 then
            subraces = { Subrace.NeutralBarbarian, Subrace.NeutralWolf }
        end

    elseif flag == 2 then
        local randomFlag = math.random(0, 7)

        if randomFlag == 0 then
            subraces = { Subrace.NeutralGreenSkin, Subrace.NeutralBarbarian, Subrace.NeutralWolf, Subrace.Neutral }
        end

        if randomFlag == 1 then
            subraces = { Subrace.NeutralElf, Subrace.Elf, Subrace.Neutral, Subrace.NeutralWolf }
        end

        if randomFlag == 2 then
            subraces = { Subrace.NeutralHuman, Subrace.Human, Subrace.Neutral,Subrace.NeutralWolf }
        end

        if randomFlag == 3 then
            subraces = { Subrace.NeutralMarsh, Subrace.NeutralWater, Subrace.Neutral }
        end

        if randomFlag == 4 then
            subraces = { Subrace.Neutral, Subrace.Dwarf, Subrace.NeutralWolf }
        end

        if randomFlag == 5 then
            subraces = { Subrace.Neutral, Subrace.Undead, Subrace.NeutralWolf }
        end

        if randomFlag == 6 then
            subraces = { Subrace.Neutral, Subrace.Heretic, Subrace.NeutralWolf }
        end

        if randomFlag == 7 then
            subraces = { Subrace.Neutral, Subrace.NeutralDragon }
        end
    end

    return subraces
end
-- end
----------

----------
-- player subrace
function getPlayerSubRace(race)
	if race == Race.Human then return Subrace.Human
	elseif race == Race.Dwarf then return Subrace.Dwarf
	elseif race == Race.Undead then return Subrace.Undead
	elseif race == Race.Heretic then return Subrace.Heretic
	elseif race == Race.Elf then return Subrace.Elf
	end
end
-- end
----------

----------
-- zones placement
local bigZone0Id = 0
local bigZone4Id = 4
local treasureZone8Id = 8

local startZone2Id = 2
local startZone6Id = 6

local bufferZone1Id = 1
local bufferZone3Id = 3
local bufferZone5Id = 5
local bufferZone7Id = 7

function getZones(races)

	local bigZoneSize = 14000
	local startingZoneSize = 13000
	local bufferZoneSize = 8000
    local treasureZoneSize = 14000

	local zones = {}


	zones[1] = getBigZone(bigZone0Id, bigZoneSize)

	zones[2] = getBufferZone(bufferZone1Id, races[1], bufferZoneSize)

	zones[3] = getStartingZone(startZone2Id, races[1], startingZoneSize)

	zones[4] = getBufferZone(bufferZone3Id, races[2], bufferZoneSize)	

	zones[5] = getBigZone(bigZone4Id, bigZoneSize)

	zones[6] = getBufferZone(bufferZone5Id, races[2], bufferZoneSize)

	zones[7] = getStartingZone(startZone6Id, races[2], startingZoneSize)

	zones[8] = getBufferZone(bufferZone7Id, races[1], bufferZoneSize)

    zones[9] = getTreasureZone(treasureZone8Id, treasureZoneSize)

	return zones
end
-- end
----------

----------
-- mines in starting zone
function getStartingMines(race)
    local zoneMines = { }
    local randomFlag
    
    zoneMines.gold = 2

    if race == Race.Human then
        zoneMines.lifeMana = 2
        randomFlag = math.random(0,3)
        if randomFlag == 0 then
	        zoneMines.runicMana = 1
        elseif randomFlag == 1 then
	        zoneMines.deathMana = 1
        elseif randomFlag == 2 then
	        zoneMines.groveMana = 1
        elseif randomFlag == 3 then
	        zoneMines.infernalMana = 1
        end
    elseif race == Race.Dwarf then
        zoneMines.runicMana = 2
        randomFlag = math.random(0,3)
        if randomFlag == 0 then
	        zoneMines.lifeMana = 1
        elseif randomFlag == 1 then
	        zoneMines.deathMana = 1
        elseif randomFlag == 2 then
	        zoneMines.groveMana = 1
        elseif randomFlag == 3 then
	        zoneMines.infernalMana = 1
        end
    elseif race == Race.Undead then
        zoneMines.deathMana = 2
        randomFlag = math.random(0,3)
        if randomFlag == 0 then
	        zoneMines.runicMana = 1
        elseif randomFlag == 1 then
	        zoneMines.lifeMana = 1
        elseif randomFlag == 2 then
	        zoneMines.groveMana = 1
        elseif randomFlag == 3 then
	        zoneMines.infernalMana = 1
        end
    elseif race == Race.Heretic then
        zoneMines.infernalMana = 2
        randomFlag = math.random(0,3)
        if randomFlag == 0 then
	        zoneMines.runicMana = 1
        elseif randomFlag == 1 then
	        zoneMines.deathMana = 1
        elseif randomFlag == 2 then
	        zoneMines.groveMana = 1
        elseif randomFlag == 3 then
	        zoneMines.lifeMana = 1
        end
    elseif race == Race.Elf then
        zoneMines.groveMana = 2
        randomFlag = math.random(0,3)
        if randomFlag == 0 then
	        zoneMines.runicMana = 1
        elseif randomFlag == 1 then
	        zoneMines.deathMana = 1
        elseif randomFlag == 2 then
	        zoneMines.lifeMana = 1
        elseif randomFlag == 3 then
	        zoneMines.infernalMana = 1
        end
    end
    
    return zoneMines
end
-- end
----------

----------
-- mines in the buffer zone
function getBufferZoneMinesLeft(race)
    local sizeCoef = 1
    local zoneMines = { }
    
    zoneMines.gold = sizeCoef
    
    if race == Race.Human then
        zoneMines.lifeMana = sizeCoef
        zoneMines.runicMana = 1
        zoneMines.infernalMana = 1
    elseif race == Race.Dwarf then
        zoneMines.runicMana = sizeCoef
        zoneMines.deathMana = 1
        zoneMines.groveMana = 1
    elseif race == Race.Undead then
        zoneMines.deathMana = sizeCoef
        zoneMines.lifeMana = 1
        zoneMines.groveMana = 1
    elseif race == Race.Heretic then
        zoneMines.infernalMana = sizeCoef
        zoneMines.lifeMana = 1
        zoneMines.runicMana = 1
    elseif race == Race.Elf then
        zoneMines.groveMana = sizeCoef
        zoneMines.lifeMana = 1
        zoneMines.infernalMana = 1
    end

    return zoneMines
end

function getBufferZoneMinesRight(race)
    local sizeCoef = 1
    local zoneMines = { }

    zoneMines.gold = sizeCoef
    
    if race == Race.Human then
        zoneMines.lifeMana = sizeCoef
        zoneMines.deathMana = 1
        zoneMines.groveMana = 1
    elseif race == Race.Dwarf then
        zoneMines.runicMana = sizeCoef
        zoneMines.lifeMana = 1
        zoneMines.infernalMana = 1
    elseif race == Race.Undead then
        zoneMines.deathMana = sizeCoef
        zoneMines.runicMana = 1
        zoneMines.infernalMana = 1
    elseif race == Race.Heretic then
        zoneMines.infernalMana = sizeCoef
        zoneMines.deathMana = 1
        zoneMines.groveMana = 1
    elseif race == Race.Elf then
        zoneMines.groveMana = sizeCoef
        zoneMines.runicMana = 1
        zoneMines.deathMana = 1
    end

    return zoneMines
end
-- end
----------

----------
-- getting a single stack
function getSingleStack(level, Types, minItemValue, maxItemValue, bonus)
    local singleStack = {}

    local baseExpTable = { min = 120, max = 160 }
    local stackItems = {}
    local stackRandomItems = {
        {id = 'g001ig0180', min = 3, max = 3},
        {id = 'g000ig0001', min = 1, max = 1},
        {id = 'g000ig0005', min = 2, max = 2},
        {id = 'g001ig0378', min = 1, max = 2},
        {id = 'g000ig0006', min = 1, max = 2},
        {id = 'g000ig0018', min = 1, max = 1},
        {id = 'g000ig0002', min = 1, max = 1},
        {id = 'g000ig0011', min = 1, max = 1},
        {id = 'g000ig0008', min = 1, max = 2},
        {id = 'g000ig0014', min = 1, max = 2},
        {id = 'g000ig0009', min = 1, max = 1},
    }

    for i = 1, math.min(3, level) do
        if math.random(0,2) > 0 then
            x = math.random(1, #stackRandomItems)
            table.insert(stackItems, stackRandomItems[x])
            table.remove(stackRandomItems, x)
        end
    end

    singleStack['count'] = 1
    singleStack['value'] = { min = baseExpTable['min'] + ((baseExpTable['min'] / (2 - level * 0.2)) * (level - 1)), max = baseExpTable['max'] + ((baseExpTable['max'] / (2 - level * 0.15)) * (level - 1)) }

    if level < 3 then
        stackSubraces = subraceRandomizer(1)
    else
        stackSubraces = subraceRandomizer(2)
    end

    singleStack['subraceTypes'] = stackSubraces
    singleStack['loot'] = {
        itemTypes = Types,
        itemValue = { min = minItemValue, max = maxItemValue },
        value = { min = maxItemValue * bonus, max = maxItemValue * bonus},
        items = stackItems,
    }

    return singleStack
end
-- end
----------

----------
-- getting ruins
function getRuins(level, goldAmount, Types, minItemValue, maxItemValue, bonus, exactItems)
    local Ruins = {}

    local subR
    if level < 3 then
        subR = subraceRandomizer(1)
    elseif level >= 3 and level < 6 then
        subR = subraceRandomizer(2)
    else
        subR = subraceRandomizer(GO)
    end

    Ruins['gold'] = goldAmount
    Ruins['loot'] = {
        items = exactItems,
        itemTypes = Types,
        itemValue = { min = minItemValue, max = maxItemValue },
        value = { min = maxItemValue * bonus, max = maxItemValue * bonus},
    }

    Ruins['guard'] = getGuard(level, subR, {}, 0, 0, 0, {})

    return Ruins
end
-- end
----------

----------
-- getting neutral town
function getGuard(level, subraces, Types, minItemValue, maxItemValue, bonus, exactItems)
    local Guard = {}

    Guard['subraceTypes'] = subraces
    Guard['value'] = {min = 185 * level * (1 + ((level - 1) * 0.1)), max = 210 * level * (1 + ((level - 1) * 0.1))}
    Guard['loot'] = {
        items = exactItems,
        itemTypes = Types,
        itemValue = { min = minItemValue, max = maxItemValue },
        value = { min = maxItemValue * bonus, max = maxItemValue * bonus},
    }

    return Guard
end
-- end
----------

----------
-- getting neutral town
function getNeutralTown(level, Types, minItemValue, maxItemValue, bonus, exactItems, guard)
    local Town = {}

    local townSubraces = { }

    if level < 3 then
        townSubraces = subraceRandomizer(1)
    else
        townSubraces = subraceRandomizer(2)
    end

    Town['tier'] = level
    Town['garrison'] = {
        subraceTypes = townSubraces,
        value = {min = 180 * level * (1 + (level - 1) * 0.1), max = 200 * level * (1 + (level - 1) * 0.1)},
        loot = {
            items = exactItems,
            itemTypes = Types,
            itemValue = { min = minItemValue, max = maxItemValue },
            value = { min = maxItemValue * bonus, max = maxItemValue * bonus},
            
        },
    }
    Town['gapMask'] = 9
    Town['stack'] = guard

    return Town
end
-- end
----------

----------
-- getting mage tower
function getMageTower(level, guard)
    local Mage = {}

    Mage['spellLevel'] = {min = 1, max = level}
    Mage['spellTypes'] = {Spell.Lower, Spell.Boost, Spell.Summon, Spell.Heal}
    Mage['value'] = {min = 1600 * level, max = 2000 * level}

    Mage['guard'] = guard

    return Mage
end
-- end
----------

----------
-- getting mage tower
function getMerchant(Types, minItemValue, maxItemValue, bonus, guard)
    local Merchant = {}

    Merchant['goods'] = {
        items = {
            { id = 'g000ig0006', min = 5, max = 5 },
            { id = 'g000ig0001', min = 3, max = 3 },
            { id = 'g000ig0005', min = 5, max = 5 },
            { id = 'g001ig0378', min = 5, max = 5 },
            { id = 'g000ig0002', min = 3, max = 3 },
            { id = 'g000ig0011', min = 3, max = 3 },
            { id = 'g000ig0008', min = 3, max = 3 },
            { id = 'g000ig0014', min = 3, max = 3 },
            { id = 'g000ig0009', min = 3, max = 3 },
            { id = 'g000ig0021', min = 1, max = 1 },
            { id = 'g000ig0022', min = 1, max = 1 },
            { id = 'g000ig0023', min = 1, max = 1 },
            { id = 'g000ig0024', min = 1, max = 1 },
            { id = 'g001ig0125', min = 1, max = 1 },
            { id = 'g001ig0036', min = 1, max = 1 },
            { id = 'g002ig0007', min = 3, max = 3 },
            { id = 'g002ig0005', min = 2, max = 2 },
            { id = 'g002ig0006', min = 1, max = 1 },
        },
        itemTypes = Types,
        itemValue = { min = minItemValue, max = maxItemValue },
        value = { min = maxItemValue * bonus, max = maxItemValue * bonus},
    }

    Merchant['guard'] = guard
    
    return Merchant
end
-- end
----------

----------
-- getting mercenary
function getMercenary(race, units, guard)
    local Mercenary = {}

    Mercenary['subraceTypes'] = {getPlayerSubRace(race)}
    Mercenary['units'] = units

    Mercenary['guard'] = guard

    return Mercenary
end
-- end
----------

----------
-- getting resource market
function getResourceMarket(goldAmount, manaAmount, guard)
    local Market = {}

    Market['stock'] = {
        {resource = Resource.Gold, value = { min = goldAmount, max = goldAmount }},
        {resource = Resource.LifeMana, value = { min = manaAmount, max = manaAmount }},
        {resource = Resource.DeathMana, value = { min = manaAmount, max = manaAmount }},
        {resource = Resource.InfernalMana, value = { min = manaAmount, max = manaAmount }},
        {resource = Resource.RunicMana, value = { min = manaAmount, max = manaAmount }},
        {resource = Resource.GroveMana, value = { min = manaAmount, max = manaAmount }}
    }

    Market['guard'] = guard
    
    return Market
end
-- end
----------

----------
-- starting zone
function getStartingZone(zoneId, playerRace, zoneSize)
    local zoneContent = {}

    local empire = {'g000ss0002', 'g000ss0004', 'g000ss0003'}
    local undead = {'g000ss0064', 'g000ss0065', 'g000ss0062'}
    local legions = {'g000ss0044', 'g000ss0043', 'g000ss0045'}
    local dwarves = {'g000ss0024', 'g000ss0023', 'g000ss0021'}
    local elves = {'g000ss0102', 'g000ss0101', 'g000ss0106'}

    local startingSpells = {}
    --'g000ss0177'

    if playerRace == Race.Human then
        table.insert(startingSpells, empire[math.random(1, #empire)])
    elseif playerRace == Race.Dwarf then
        table.insert(startingSpells, dwarves[math.random(1, #dwarves)])
    elseif playerRace == Race.Heretic then
        table.insert(startingSpells, legions[math.random(1, #legions)])
    elseif playerRace == Race.Undead then
        table.insert(startingSpells, undead[math.random(1, #undead)])
    elseif playerRace == Race.Elf then
        table.insert(startingSpells, elves[math.random(1, #elves)])
    end

    local startingItems = {
        {id = 'g001ig0180', min = 3, max = 3},
        {id = 'g000ig0005', min = 2, max = 2},
        {id = 'g001ig0378', min = 2, max = 2},
        {id = 'g000ig0006', min = 3, max = 3},
        {id = 'g000ig0001', min = 3, max = 3},
        {id = 'g001ig0072', min = 1, max = 1},
        {id = 'g001ig0454', min = 1, max = 1},
        {id = 'g001ig0532', min = 2, max = 2},
        {id = 'g000ig0002', min = 1, max = 1},
        {id = 'g000ig0008', min = 2, max = 2},
        {id = 'g000ig0011', min = 1, max = 1},
        {id = 'g000ig0021', min = 1, max = 1},
        {id = 'g000ig0022', min = 1, max = 1},
        {id = 'g000ig0023', min = 1, max = 1},
        {id = 'g000ig0024', min = 1, max = 1},
        {id = 'g001ig0036', min = 1, max = 1},
        {id = 'g001ig0407', min = 1, max = 1},
        {id = 'g001ig0486', min = 1, max = 1},
        {id = 'g000ig5084', min = 1, max = 1},
    }

    local randomDecider = math.random(0,3)
    if randomDecider == 0 then
        table.insert(startingItems, {id = 'g000ig0002', min = 1, max = 1})
        table.insert(startingItems, {id = 'g000ig0014', min = 1, max = 1})
    elseif randomDecider == 1 then
        table.insert(startingItems, {id = 'g000ig0014', min = 1, max = 1})
        table.insert(startingItems, {id = 'g000ig0008', min = 1, max = 1})
    elseif randomDecider == 2 then
        table.insert(startingItems, {id = 'g000ig0002', min = 1, max = 1})
        table.insert(startingItems, {id = 'g000ig0008', min = 1, max = 1})
    elseif randomDecider == 3 then
        table.insert(startingItems, {id = 'g000ig0014', min = 1, max = 1})
        table.insert(startingItems, {id = 'g000ig0011', min = 1, max = 1})
    end



    zoneContent['id'] = zoneId
    zoneContent['size'] = zoneSize
    zoneContent['type'] = Zone.PlayerStart
    zoneContent['race'] = playerRace
    zoneContent['mines'] = getStartingMines(playerRace)
    zoneContent['capital'] = {
        garrison = {
            subraceTypes = { getPlayerSubRace(playerRace) },
            value = { min = 50, max = 50 },
            loot = {
                items = startingItems
            },
        },
        gapMask = 9,
        spells = startingSpells,
    }

    zoneContent['bags'] = {
        count = 8,
        loot = {
            itemTypes = {Item.Valuable, Item.PotionBoost, Item.Orb},
            itemValue = {min = 50, max = 200},
            value = {min = 1200, max = 1200},
            items = {
                {id = 'g000ig5084', min = 1, max = 1},
                {id = 'g000ig0001', min = 1, max = 1},
                {id = 'g000ig0005', min = 2, max = 2},
                {id = 'g000ig0006', min = 1, max = 1},
                {id = 'g001ig0180', min = 5, max = 5},
                {id = 'g000ig7003', min = 2, max = 2},
                {id = 'g001ig0486', min = 1, max = 1},
                {id = 'g001ig0407', min = 1, max = 1},
            },
        }
    }
    zoneContent['stacks'] = {
        getSingleStack(1, {Item.PotionHeal}, 50, 150, 1),
        getSingleStack(1, {Item.PotionHeal}, 50, 150, 1),
        getSingleStack(1, {Item.PotionHeal}, 50, 150, 1),
        getSingleStack(1, {Item.Orb}, 200, 400, 1),
        getSingleStack(1, {Item.Orb}, 200, 400, 1),
        getSingleStack(2, {Item.Valuable}, 250, 1000, 1),
        getSingleStack(2, {Item.Valuable}, 150, 750, 1),
        getSingleStack(2, {Item.Valuable}, 150, 750, 1),
        getSingleStack(2, {Item.Scroll}, 200, 200, 2),
        getSingleStack(2, {Item.PotionHeal, Item.PotionRevive}, 150, 250, 2),
        getSingleStack(2, {Item.PotionBoost}, 50, 200, 2),
        getSingleStack(2, {Item.PotionBoost}, 50, 200, 2),
        getSingleStack(3, {Item.PotionBoost}, 150, 350, 2),
        getSingleStack(3, {Item.PotionRevive}, 250, 250, 1),
        getSingleStack(2, {Item.PotionHeal, Item.PotionRevive}, 150, 250, 2),
        getSingleStack(2, {Item.Orb, Item.Scroll}, 100, 200, 3),
        getSingleStack(3, {Item.Valuable}, 1000, 1500, 1),
        getSingleStack(3, {Item.Talisman, Item.Orb}, 200, 400, 2),
    }
    zoneContent['ruins'] = {
        getRuins(1, {min=300, max=350}, {Item.Jewel}, 300, 500, 1, {}),
        getRuins(1, {min=300, max=350}, {Item.PotionPermanent}, 300, 500, 1, {}),
        getRuins(2, {min=370, max=410}, {Item.Armor, Item.Weapon}, 600, 800, 1, {}),
    }

    zoneContent['merchants'] = {
        getMerchant({Item.Orb, Item.Scroll, Item.Wand, Item.Talisman}, 200, 400, 10, getGuard(2, subraceRandomizer(1), {Item.Valuable}, 100, 500, 2, getExacts('t1MerchantExacts'))),
        getMerchant({Item.Armor, Item.Weapon, Item.TravelItem, Item.Banner, Item.Jewel, Item.Talisman}, 200, 600, 9, getGuard(2, subraceRandomizer(1), {Item.Valuable}, 100, 500, 2, getExacts('t1MerchantExacts'))),
    }
    zoneContent['towns'] = {
        getNeutralTown(1, {Item.Armor, Item.Weapon}, 300, 675, 1, getExacts('t1TownExacts'), getGuard(1, subraceRandomizer(1), {Item.Orb}, 400, 500, 1, getExacts('t1TownGuardExacts'))),
        getNeutralTown(2, {Item.Banner, Item.Jewel}, 300, 500, 1, getExacts('t2TownExacts'), getGuard(2, subraceRandomizer(1), {Item.Valuable}, 750, 1000, 2, getExacts('t2TownGuardExacts'))),
    }
    zoneContent['mages'] = {
        getMageTower(1, getGuard(2, subraceRandomizer(1), {Item.Valuable}, 100, 500, 2, getExacts('t1MerchantExacts')))
    }

    return zoneContent
end
-- end
----------

----------
-- buffer zone
function getBufferZone(zoneId, playerRace, zoneSize)
    local zoneContent = {}

    zoneContent['id'] = zoneId
    zoneContent['size'] = zoneSize
    zoneContent['type'] = Zone.Treasure

    if zoneId == 1 or zoneId == 3 then
        zoneContent['mines'] = getBufferZoneMinesLeft(playerRace)
    elseif zoneId == 5 or zoneId == 7 then
        zoneContent['mines'] = getBufferZoneMinesRight(playerRace)
    end

    zoneContent['stacks'] = {
        getSingleStack(2, {Item.PotionHeal}, 50, 150, 2),
        getSingleStack(2, {Item.PotionHeal, Item.PotionRevive}, 50, 250, 1),
        getSingleStack(3, {Item.PotionBoost}, 150, 350, 2),
        getSingleStack(3, {Item.PotionBoost, Item.PotionRevive}, 150, 350, 2),
        getSingleStack(3, {Item.Scroll}, 200, 400, 1),
        getSingleStack(4, {Item.Talisman}, 500, 800, 1),
        getSingleStack(4, {Item.Valuable, Item.Orb}, 500, 900, 2),
        getSingleStack(4, {Item.PotionPermanent}, 400, 600, 2),
        {count=1, value={min=540,max=610}, subraceTypes=subraceRandomizer(3), loot={items={{id='g001ig0516',min=1,max=1},{id='g000ig0001',min=1,max=1}}}},
    }

    zoneContent['bags'] = {
        count = 5,
        loot = {
            itemTypes = {Item.Valuable, Item.Scroll, Item.PotionBoost},
            itemValue = {min = 50, max = 350},
            value = {min = 1200, max = 1200},
            items = {
                { id = 'g001ig0482', min = 1, max = 1 },
                { id = 'g001ig0481', min = 1, max = 1 },
                { id = 'g001ig0485', min = 1, max = 1 },
                { id = 'g001ig0148', min = 1, max = 1 },
                { id = 'g001ig0484', min = 1, max = 1 },
            },
        }
    }
    
    local bufferMerchant = getMerchant({Item.PotionPermanent}, 400, 700, 5, getGuard(3, subraceRandomizer(2), {Item.Valuable}, 250, 750, 2, getExacts('t2MerchantExacts')))
    for key, value in pairs({'g001ig0525', 'g001ig0528', 'g001ig0529', 'g001ig0527', 'g001ig0530', 'g001ig0526', 'g001ig0534', 'g001ig0523'}) do
        table.insert(bufferMerchant['goods']['items'], {id = value, min = 1, max = 1})
    end
    
    zoneContent['merchants'] = {
        bufferMerchant,
    }

    local zoneItemTypes = shuffleTable({Item.Banner, Item.TravelItem, Item.Jewel})

    zoneContent['towns'] = {
        getNeutralTown(3, {zoneItemTypes[1]}, 500, 800, 1, getExacts('t3TownExacts'), getGuard(3, subraceRandomizer(2), {Item.Valuable, Item.Orb}, 500, 1000, 2, getExacts('t3TownGuardExacts'))),
    }
    zoneContent['ruins'] = {
        getRuins(3, {min=460, max=510}, {zoneItemTypes[2]}, 500, 800, 1, {}),
        getRuins(3, {min=460, max=510}, {zoneItemTypes[3]}, 500, 800, 1, {}),
    }

    local raceUnits = {}
    if playerRace == Race.Human then
        raceUnits = {
            {id = 'g003uu5002', level = 2, unique = false},
            {id = 'g000uu0009', level = 2, unique = false},
            {id = 'g000uu7561', level = 2, unique = false},
            {id = 'g000uu0012', level = 2, unique = false},
            {id = 'g000uu0016', level = 2, unique = false},
            {id = 'g000uu2014', level = 2, unique = false},
            {id = 'g000uu0004', level = 2, unique = false},
            {id = 'g000uu2029', level = 2, unique = false},
            {id = 'g000uu0007', level = 2, unique = false},
            {id = 'g000uu0002', level = 2, unique = false},
            {id = 'g000uu8310', level = 2, unique = false},
        }
    elseif playerRace == Race.Dwarf then
        raceUnits = {
            {id = 'g000uu0027', level = 2, unique = false},
            {id = 'g001uu7571', level = 2, unique = false},
            {id = 'g000uu0037', level = 2, unique = false},
            {id = 'g004uu8005', level = 2, unique = false},
            {id = 'g000uu0030', level = 2, unique = false},
        }
    elseif playerRace == Race.Elf then
        raceUnits = {
            {id = 'g000uu8015', level = 2, unique = false},
            {id = 'g000uu8016', level = 2, unique = false},
            {id = 'g000uu8032', level = 2, unique = false},
            {id = 'g000uu8019', level = 2, unique = false},
            {id = 'g000uu8022', level = 2, unique = false},
            {id = 'g000uu8026', level = 2, unique = false},
        }
    elseif playerRace == Race.Undead then
        raceUnits = {
            {id = 'g001uu7563', level = 2, unique = false},
            {id = 'g000uu0094', level = 2, unique = false},
            {id = 'g000uu0087', level = 2, unique = false},
            {id = 'g000uu0081', level = 2, unique = false},
            {id = 'g000uu0079', level = 2, unique = false},
            {id = 'g000uu0090', level = 2, unique = false},
            {id = 'g001uu7564', level = 2, unique = false},
            {id = 'g003uu5013', level = 2, unique = false},
            {id = 'g001uu7565', level = 2, unique = false},
            {id = 'g000uu7542', level = 2, unique = false},
        }
    elseif playerRace == Race.Heretic then
        raceUnits = {
            {id = 'g000uu7572', level = 2, unique = false},
            {id = 'g000uu0053', level = 2, unique = false},
            {id = 'g000uu0067', level = 2, unique = false},
            {id = 'g000uu0058', level = 2, unique = false},
            {id = 'g000uu0056', level = 2, unique = false},
            {id = 'g000uu0063', level = 2, unique = false},
        }
    end

    if zoneId == 1 or zoneId == 5 then
        zoneContent['mercenaries'] = {
            getMercenary(playerRace, raceUnits, getGuard(3, subraceRandomizer(2), {Item.Valuable}, 500, 1000, 2, getExacts('t2MerchantExacts')))
        }
    elseif zoneId == 3 or zoneId == 7 then
        zoneContent['resourceMarkets'] = {
            getResourceMarket(3000, 1000, getGuard(3, subraceRandomizer(2), {Item.Valuable}, 500, 1000, 2, getExacts('t2MerchantExacts')))
        }
    end

    return zoneContent
end
-- end
----------

----------
-- corner zone
function getBigZone(zoneId, zoneSize)
    local zoneContent = {}

    zoneContent['id'] = zoneId
    zoneContent['size'] = zoneSize
    zoneContent['type'] = Zone.Treasure
    zoneContent['mines'] = {
        gold = 2,
        lifeMana = 1,
        runicMana = 1,
        deathMana = 1,
        infernalMana = 1,
        groveMana = 1
    }

    zoneContent['bags'] = {
        count = 7,
        loot = {
            itemTypes = { Item.Valuable, Item.PotionHeal, Item.PotionBoost, Item.Scroll },
            value = { min = 1000, max = 1000 },
            items = {
                { id = 'g000ig0001', min = 1, max = 1 },
                { id = 'g000ig0006', min = 2, max = 2 },
                { id = 'g000ig0022', min = 1, max = 1 },
                { id = 'g000ig0021', min = 1, max = 1 },
                { id = 'g000ig0023', min = 1, max = 1 },
                { id = 'g000ig0024', min = 1, max = 1 },
                { id = 'g001ig0125', min = 1, max = 1 },
                { id = 'g001ig0036', min = 1, max = 1 },
                { id = 'g001ig0128', min = 1, max = 1 },
                
            },
            itemValue = { min = 50, max = 350 }
        }
    }

    zoneContent['stacks'] = {
        getSingleStack(2, {Item.PotionHeal}, 50, 150, 2),
        getSingleStack(2, {Item.PotionHeal}, 50, 150, 2),
        getSingleStack(3, {Item.Orb}, 400, 600, 1),
        getSingleStack(3, {Item.Orb}, 400, 600, 1),
        getSingleStack(3, {Item.PotionBoost, Item.PotionRevive}, 150, 350, 2),
        getSingleStack(4, {Item.Scroll, Item.PotionHeal}, 200, 400, 2),
        getSingleStack(4, {Item.Scroll, Item.PotionHeal}, 200, 400, 2),
        getSingleStack(3, {Item.Valuable}, 500, 1250, 1),
        getSingleStack(3, {Item.Valuable}, 500, 1250, 1),
        getSingleStack(4, {Item.PotionHeal, Item.PotionRevive}, 150, 250, 3),
        getSingleStack(4, {Item.PotionHeal}, 50, 150, 1),
        getSingleStack(4, {Item.PotionBoost}, 150, 350, 2),
        getSingleStack(4, {Item.PotionBoost, Item.PotionRevive}, 150, 350, 2),
        getSingleStack(4, {Item.Valuable, Item.Orb}, 500, 900, 2),
        getSingleStack(4, {Item.Valuable, Item.Orb}, 500, 900, 2),
        getSingleStack(5, {Item.PotionPermanent}, 600, 750, 1),
        getSingleStack(5, {Item.Wand}, 550, 550, 1),
    }

    local itemMerchant = getMerchant({Item.Armor, Item.Weapon, Item.Jewel, Item.Banner, Item.Talisman}, 700, 900, 8, getGuard(3, subraceRandomizer(2), {Item.Valuable}, 250, 750, 2, getExacts('t3MerchantExacts')))
    -- for key, value in pairs({'g001ig0027', 'g001ig0028', 'g001ig0022', 'g001ig0029', 'g001ig0030'}) do
    --     table.insert(itemMerchant['goods']['items'], {id = value, min = 1, max = 1})
    -- end
    local bigPerma = {'g001ig0027', 'g001ig0028', 'g001ig0022', 'g001ig0029', 'g001ig0030'}
    for i = 1,3 do
        x = math.random(1, #bigPerma)
        table.insert(itemMerchant['goods']['items'], {id = bigPerma[x], min = 1, max = 1})
        table.remove(bigPerma, x)
    end

    zoneContent['merchants'] = {
        itemMerchant,
    }

    zoneContent['towns'] = {
        getNeutralTown(4, {Item.Banner}, 1300, 1500, 1, getExacts('t4BigExacts'), getGuard(4, subraceRandomizer(2), {Item.Valuable}, 1000, 2000, 1, getExacts('t4BigGuardExacts'))),
        getNeutralTown(2, {Item.PotionPermanent}, 600, 750, 1, getExacts('t2BigExacts'), getGuard(3, subraceRandomizer(2), {Item.Orb}, 500, 800, 1, getExacts('t2BigGuardExacts'))),
    }
    zoneContent['ruins'] = {
        getRuins(4, {min=300, max=350}, {Item.PotionPermanent}, 900, 1200, 1, {}),
        getRuins(4, {min=300, max=350}, {}, 0, 0, 0, {{id = 'g001ig0282', min = 1, max = 1}}),
        getRuins(5, {min=320, max=370}, {Item.Armor, Item.Weapon}, 950, 1250, 1, {}),
        getRuins(5, {min=320, max=370}, {Item.Jewel}, 1000, 1200, 1, {}),
    }
    zoneContent['trainers'] = {
        {guard = getGuard(4, subraceRandomizer(2), {Item.Valuable}, 100, 500, 2, getExacts('t3MerchantExacts'))}
    }
    zoneContent['mages'] = {
        getMageTower(2, getGuard(3, subraceRandomizer(2), {Item.Valuable}, 100, 500, 2, getExacts('t2MerchantExacts')))
    }
    zoneContent['mercenaries'] = {
        getBigMercenary(getGuard(3, subraceRandomizer(2), {Item.Orb}, 500, 800, 1, getExacts('t2MerchantExacts')))
    }

    return zoneContent
end
-- end
----------

----------
-- center zone
function getTreasureZone(zoneId, zoneSize)
    local zoneContent = {}

    zoneContent['id'] = zoneId
    zoneContent['size'] = zoneSize
    zoneContent['type'] = Zone.Treasure
    zoneContent['mines'] = {
        gold = 2,
        lifeMana = 1,
        runicMana = 1,
        deathMana = 1,
        infernalMana = 1,
        groveMana = 1
    }

    zoneContent['bags'] = {
        count = 8,
        loot = {
            itemTypes = { Item.Valuable, Item.PotionHeal, Item.PotionBoost },
            value = { min = 1400, max = 1800 },
            items = {
                { id = 'g000ig0001', min = 2, max = 2 },
                { id = 'g000ig0006', min = 2, max = 2 },
                { id = 'g000ig0022', min = 1, max = 1 },
                { id = 'g000ig0021', min = 1, max = 1 },
                { id = 'g000ig0023', min = 1, max = 1 },
                { id = 'g000ig0024', min = 1, max = 1 },
                { id = 'g001ig0125', min = 1, max = 1 },
                { id = 'g001ig0036', min = 1, max = 1 },
                { id = 'g001ig0128', min = 1, max = 1 },                   
            },
            itemValue = { min = 150, max = 350 }
        }
    }

    zoneContent['stacks'] = {
        getSingleStack(3, {Item.PotionHeal}, 50, 150, 1),
        getSingleStack(3, {Item.PotionHeal}, 50, 150, 1),
        getSingleStack(4, {Item.PotionBoost}, 150, 350, 2),
        getSingleStack(4, {Item.PotionBoost, Item.PotionRevive}, 150, 350, 2),
        getSingleStack(4, {Item.PotionBoost, Item.PotionRevive}, 150, 350, 2),
        getSingleStack(4, {Item.Scroll, Item.PotionHeal}, 200, 400, 2),
        getSingleStack(4, {Item.Orb}, 400, 800, 1),
        getSingleStack(4, {Item.Orb}, 400, 800, 1),
        getSingleStack(3, {Item.Valuable}, 500, 1250, 1),
        getSingleStack(3, {Item.Valuable}, 500, 1250, 1),
        getSingleStack(4, {Item.PotionHeal, Item.PotionRevive}, 150, 250, 3),
        getSingleStack(4, {Item.PotionHeal}, 50, 150, 1),
        getSingleStack(5, {Item.Orb}, 800, 900, 1),
        getSingleStack(4, {Item.PotionBoost}, 150, 350, 2),
        getSingleStack(4, {Item.PotionBoost, Item.PotionRevive}, 150, 350, 2),
        getSingleStack(5, {Item.PotionPermanent}, 600, 750, 1),
        getSingleStack(5, {Item.Wand}, 550, 550, 1),
    }

    local mageMerchant = getMerchant({Item.Scroll, Item.Wand}, 200, 550, 10, getGuard(4, subraceRandomizer(2), {Item.Valuable}, 250, 750, 2, getExacts('t3MerchantExacts')))
    for key, value in pairs({'g000ig5039', 'g000ig5120', 'g000ig5083', 'g000ig5095'}) do
        table.insert(mageMerchant['goods']['items'], {id = value, min = 1, max = 1})
    end

    local itemMerchant = getMerchant({Item.Armor, Item.Weapon, Item.Jewel, Item.Banner, Item.TravelItem}, 500, 900, 8, getGuard(4, subraceRandomizer(2), {Item.Valuable}, 250, 750, 2, getExacts('t3MerchantExacts')))
    for key, value in pairs({'g000ig9130', 'g000ig9123', 'g001ig0202', 'g000ig9040', 'g000ig9014'}) do
        table.insert(itemMerchant['goods']['items'], {id = value, min = 1, max = 1})
    end
    
    zoneContent['merchants'] = {
        mageMerchant,
        itemMerchant,
    }

    zoneContent['ruins'] = {
        getRuins(5, {min=150, max=200}, {}, 0, 0, 0, {{id = 'g001ig0522', min = 1, max = 1}}),
        getRuins(5, {min=320, max=370}, {Item.Armor, Item.Weapon}, 1100, 1400, 1, {}),
        getRuins(5, {min=320, max=370}, {Item.Banner}, 1500, 1500, 1, {}),
        getRuins(5, {min=320, max=370}, {Item.Jewel}, 1000, 1200, 1, {}),
        getRuins(6, {min=150, max=200}, {}, 0, 0, 0, {{id = control[math.random(#control)], min = 1, max = 1}}),
    }

    zoneContent['towns'] = {
        getNeutralTown(5, {Item.Armor, Item.Weapon}, 1750, 3000, 1, getExacts('t5CenterExacts'), getGuard(6, subraceRandomizer(GO), {Item.Scroll}, 550, 550, 2, getExacts('t5CenterGuardExacts'))),
        getNeutralTown(3, {Item.PotionPermanent}, 600, 750, 1, getExacts('t3CenterExacts'), getGuard(3, subraceRandomizer(2), {Item.Valuable}, 500, 1000, 1, getExacts('t3CenterGuardExacts'))),
        --getNeutralTown(1, {Item.PotionPermanent}, 600, 750, 1, t1TownExacts, getGuard(3, subraceRandomizer(2), {Item.Valuable}, 250, 750, 1, t1TownGuardExacts)),
    }
    zoneContent['mages'] = {
        getMageTower(3, getGuard(4, subraceRandomizer(2), {Item.Valuable}, 100, 500, 2, getExacts('t3MerchantExacts')))
    }

    return zoneContent
end
-- end
----------

----------
-- zone connections
function getConnections()

    local connections = {
            { from = startZone2Id, to = bufferZone1Id, guard = getGuard(3, {Subrace.NeutralGreenSkin, Subrace.NeutralMarsh}, {Item.PotionPermanent}, 450, 650, 1, getExacts('startBufferExacts')) },
            { from = startZone2Id, to = bufferZone3Id, guard = getGuard(3, {Subrace.NeutralBarbarian, Subrace.Dwarf}, {Item.PotionPermanent}, 450, 650, 1, getExacts('startBufferExacts')) },
            { from = startZone2Id, to = treasureZone8Id, guard = getGuard(5, subraceRandomizer(GO), {Item.Armor, Item.Weapon, Item.Talisman}, 700, 1000, 1, getExacts('startTreasureExacts')) },
            
            { from = startZone6Id, to = bufferZone5Id, guard = getGuard(3, {Subrace.NeutralGreenSkin, Subrace.NeutralMarsh}, {Item.PotionPermanent}, 450, 650, 1, getExacts('startBufferExacts')) },
            { from = startZone6Id, to = bufferZone7Id, guard = getGuard(3, {Subrace.NeutralBarbarian, Subrace.Dwarf}, {Item.PotionPermanent}, 450, 650, 1, getExacts('startBufferExacts')) },
            { from = startZone6Id, to = treasureZone8Id, guard = getGuard(5, subraceRandomizer(GO), {Item.Armor, Item.Weapon, Item.Talisman}, 700, 1000, 1, getExacts('startTreasureExacts')) },
    
            { from = bufferZone1Id, to = bigZone0Id, guard = getGuard(5, subraceRandomizer(GO), {Item.TravelItem}, 800, 1100, 1, getExacts('bufferBigExacts')) },
            { from = bufferZone7Id, to = bigZone0Id, guard = getGuard(5, subraceRandomizer(GO), {Item.TravelItem}, 800, 1100, 1, getExacts('bufferBigExacts')) },
    
            { from = bufferZone3Id, to = bigZone4Id, guard = getGuard(5, subraceRandomizer(GO), {Item.TravelItem}, 800, 1100, 1, getExacts('bufferBigExacts')) },
            { from = bufferZone5Id, to = bigZone4Id, guard = getGuard(5, subraceRandomizer(GO), {Item.TravelItem}, 800, 1100, 1, getExacts('bufferBigExacts')) },
    
            { from = bigZone0Id, to = treasureZone8Id, guard = getGuard(5, subraceRandomizer(GO), {Item.Jewel}, 700, 1000, 1, getExacts('bigTreasureExacts')) },
            { from = bigZone4Id, to = treasureZone8Id, guard = getGuard(5, subraceRandomizer(GO), {Item.Jewel}, 700, 1000, 1, getExacts('bigTreasureExacts')) },
    
            { from = bufferZone1Id, to = treasureZone8Id, guard = getGuard(6, subraceRandomizer(GO), {Item.Orb, Item.Talisman}, 700, 1000, 2, getExacts('bufferTreasureExacts')) },
            { from = bufferZone3Id, to = treasureZone8Id, guard = getGuard(6, subraceRandomizer(GO), {Item.Orb, Item.Talisman}, 700, 1000, 2, getExacts('bufferTreasureExacts')) },
            { from = bufferZone5Id, to = treasureZone8Id, guard = getGuard(6, subraceRandomizer(GO), {Item.Orb, Item.Talisman}, 700, 1000, 2, getExacts('bufferTreasureExacts')) },
            { from = bufferZone7Id, to = treasureZone8Id, guard = getGuard(6, subraceRandomizer(GO), {Item.Orb, Item.Talisman}, 700, 1000, 2, getExacts('bufferTreasureExacts')) },
            
        }

	return connections
end
-- end
----------

----------
-- template contents
function getTemplateContents(races)
	return {
		zones = getZones(races),
		connections = getConnections()
	}
end
-- end
----------

template = {
    --name = getName(TemplateName, Verison),
    name = 'Freedom 2.1.2',
    description = getDescription(TemplateName, Verison, Timer),
    minSize = 72,
    maxSize = 72,
    maxPlayers = 2,
    roads = 50,
    forest = 35,
    startingGold = 1250,
    startingNativeMana = 300,
    iterations = 10000,
    getContents = getTemplateContents,
    forbiddenSpells = {
        --summon spells
        'g000ss0058',
        'g000ss0059',
        'g000ss0031',
        'g000ss0015',
        'g000ss0140',
        'g000ss0038',
        'g000ss0071',
        'g000ss0139',
        'g000ss0138',
        'g000ss0141',
        'g000ss0108',
        'g000ss0117',
        'g000ss0142',
        'g000ss0078',
        'g000ss0137',
        'g000ss0143',
        'g000ss0136',
        --speed spells
        'g000ss0195',
        'g000ss0032',
        'g000ss0113',
        'g000ss0100',
        'g000ss0006',
        --unspeed spells
        'g000ss0053',
        'g000ss0173',
        'g000ss0196',
        'g000ss0159',
        'g000ss0094',
        --trash
        'g000ss0189',
        'g000ss0132',
        'g000ss0131',
        'g000ss0133',
        'g000ss0204',
        'g000ss0152',
        'g000ss0210',
        'g000ss0190',
        'g000ss0202',
        'g000ss0203',
        'g000ss0135',
        'g000ss0191',
        'g000ss0192',
        'g000ss0175',
        --hurrying
        'g000ss0150',
        --sea spells
        'g000ss0027',
        --merchant spells
        'g000ss0176',
        'g000ss0085',
    },
    forbiddenItems = {
        --mana valuables
        --200
        'g001ig0277',
        'g001ig0281',
        'g001ig0278',
        'g001ig0279',
        'g001ig0280',
        --300
        'g001ig0283',
        'g001ig0287',
        'g001ig0284',
        'g001ig0285',
        'g001ig0286',
        --rage
        'g000ig9043',
        --control
        'g000ig3018',
        'g000ig3021',
        'g000ig3015',
        'g001ig0414',
        'g000ig3016',
        --too valuable
        'g001ig0368',
        'g001ig0154', 
        'g001ig0013',
        'g001ig0015',
        'g001ig0014',
        'g001ig0009',
        'g001ig0011',
        'g001ig0012',
        'g001ig0016',
        --why is this shit exists
        'g001ig0006',
        'g002ig0017',
        'g001ig0596',
        --wands
        'g000ig6018',
        'g001ig0400',
        'g000ig6005',
        'g000ig6011',
        'g000ig6004',
        'g001ig0097',
        'g000ig6009',
        'g000ig6013',
        'g000ig6017',
        'g000ig6010',
        'g000ig6016',
        'g001ig0388',
        'g000ig6019',
        'g001ig0389',
        'g001ig0406',
        'g001ig0386',
        'g000ig6006',
        --scrolls
        'g000ig5009',
        'g001ig0439',
        'g001ig0193',
        'g000ig5030',
        'g001ig0092',
        'g001ig0091',
        'g001ig0084',
        'g001ig0194',
        'g000ig5027',
        'g001ig0095',
        'g001ig0575',
        'g001ig0440',
        'g001ig0123',
        'g001ig0573',
        'g001ig0574',
        'g000ig5107',
        'g000ig5054',
        'g000ig5109',
        'g000ig5033',
        'g000ig5014',
        'g000ig5072',
        'g000ig5085',
        'g001ig0085',
        'g000ig5031',
        'g001ig0076',
        'g000ig5071',
        'g001ig0075',
        'g001ig0074',
        'g001ig0077',
        'g000ig5108',
        'g001ig0078',
        'g000ig5100',
        --sea
        'g001ig0044',
        'g000ig1011',
        'g001ig0050',
        'g001ig0503',
        --boots
        'g000ig8004',
        'g000ig8005',
        --perks
        'g001ig0525',
        'g001ig0528',
        'g001ig0529',
        'g001ig0527',
        'g001ig0530',
        'g001ig0526',
        --another perma
        'g001ig0534',
        'g001ig0516',
        'g001ig0523',
    },
    forbiddenUnits = {
        --
        'g000uu8273',
        --water leaders
        'g000uu5127',
        'g000uu5129',
        'g000uu7522',
        'g000uu8138',
        'g000uu5126',
        'g000uu8230',
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
    },
}