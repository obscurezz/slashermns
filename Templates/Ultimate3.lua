----------------
-- НАСТРОЙКИ
---------------

-- коэффициент сложности (<0.9 легко; 0.9-1.1 средне; >1.1 сложно) [страндарт = 1.0]
local kef = 1.0

-- коэффициент разброса силы нейтралов [страндарт = 1.05]
local kr = 1.05

-- границы зон (0 закрытые/угловые случайные; 1 закрытые; 2 открытые; 3 водные; 4 открытые/водные; 5 случайные) [страндарт = 0]
local brz = 3

---------------
-- КОД ШАБЛОНА
---------------

-- сила отрядов
local v01 = 140 -- 01
local v02 = 150 -- 02
local v03 = 160 -- 03
local v04 = 170 -- 04
local v05 = 180 -- 05
local v06 = 220 -- 06

local v11 = 200 -- 11+f.проход01
local v12 = 220 -- 12+f.проход01
local v13 = 240 -- 13+f.проход01+v.проход01
local v14 = 260 -- 14+f.проход01+v.руины1
local v15 = 280 -- 15+f.проход01
local v16 = 350 -- 16

local v21 = 300 -- 21+f.проход12
local v22 = 350 -- 22+f.проход12
local v23 = 400 -- 23+f.проход12+v.проход12
local v24 = 450 -- 24+f.проход12+v.руины2
local v25 = 500 -- 25+f.проход12+v.охрана2
local v26 = 620 -- 26

local v31 = 550 -- 31
local v32 = 600 -- 32
local v33 = 650 -- 33+v.проход23
local v34 = 700 -- 34+v.руины3
local v35 = 750 -- 35+v.охрана3
local v36 = 800 -- 36
local v37 = 920 -- 37

local vp03 = 960 -- проход03

--Башня магии в зоне 2
function zoneMageResp2()
	return {
		{
			spells = { 	
						yn('g000ss0002'), -- быстрота
						yn3('g000ss0007'), -- Исцеление
						yn('g000ss0178'), -- Неудача --мэ
		
						yn('g000ss0025'), -- Призыв I: Рух
						yn('g000ss0023'), -- сила витара

						yn('g000ss0045'), -- tormentio
						yn('g000ss0044'), -- Menta minoris

						yn('g000ss0134'), -- Порченная руна
						yn('g000ss0064'), -- слабость

						yn('g000ss0101'), -- стая
						yn('g000ss0098'), -- Призыв I: Энт Малый
						
						yn('g000ss0183'), -- сокрушение
						yn('g000ss0197'), -- Заступничество
						yn('g000ss0131'), -- Ослепительная вcпышка
						
						yn3('g000ss0029'), -- Ритуал исцеления
						yn('g000ss0184'), -- прокл.эмира
						yn('g000ss0034'), -- Заколдованное оружие --мэд
						
						yn('g000ss0050'), -- Chronos
						yn('g000ss0185'), -- terebrare corde
						yn3('g000ss0122'), -- Целительные ожоги

						yn('g000ss0186'), -- Спешащее время
						yn('g000ss0069'), -- Проклятие Ниграэля
						yn3('g000ss0124'), -- Отсрочка неизбежного

						yn('g000ss0187'), -- могущество
						yn('g000ss0133'), -- Песнь слез
						yn('g000ss0107'), -- Дикие саженцы --мж
					
			},			
			guard = guard2m(),
		},
	}
end

----------------------
----------------------

-- Лавка т1
function zoneMerch1()
return {
	{
		goods = {
			itemTypes = { Item.Orb },
			value = { min = 400, max = 400 },
			itemValue = { min = 400, max = 400 },
			items = {
				{ id = 'g000ig0001', min = 5, max = 5 },
				{ id = 'g000ig0006', min = 5, max = 5 },
				{ id = 'g001ig0378', min = 3, max = 3 }, -- хил75
				{ id = 'g000ig0005', min = 3, max = 3 }, -- хил50

				orr({ id = 'g000ig0011', min = 1, max = 1 }, { id = 'g000ig0002', min = 1, max = 1 }), --ини15/защита15
				orr({ id = 'g000ig0014', min = 1, max = 1 }, { id = 'g000ig0008', min = 1, max = 1 }), --атака15/точность15
				{ id = 'g000ig0008', min = 1, max = 1 }, --точность15
				orr({ id = 'g000ig0021', min = 1, max = 1 }, { id = 'g000ig0024', min = 1, max = 1 }), --возд/огня
				orr({ id = 'g000ig0022', min = 1, max = 1 }, { id = 'g000ig0023', min = 1, max = 1 }), --воды/земли
				{ id = 'g000ig0021', min = 1, max = 1 }, --возд
				
				orr({ id = 'g001ig0125', min = 1, max = 1 }, { id = 'g001ig0036', min = 1, max = 1 }), --разума/смерти
				orr({ id = 'g001ig0341', min = 1, max = 1 }, { id = 'g001ig0128', min = 1, max = 1 }), --Эликсир защиты от аффекта/вард оружия
				{ id = d15(), min = 1, max = 1 }, -- случ. дотвард
				{ id = e2(), min = 1, max = 1},
				{ id = e4(), min = 1, max = 1},
				
				orr({ id = 'g001ig0130', min = 1, max = 1 }, orr({ id = 'g001ig0561', min = 1, max = 1 }, { id = 'g000ig0010', min = 1, max = 1 })), -- Эликсир регенерации +20 реген | эликсир самопожертвования / Эликсир внимательности 10 точности 500
				orr3({ id = 'g001ig0530', min = 1, max = 1 }, { id = 'g001ig0530', min = 1, max = 1 }, { id = 'g001ig0524', min = 1, max = 1 }), -- Зелье посмертного зова (талисманы) 66% / Зелье завоевателя (жезлы) 33% 
				orr3({ id = 'g001ig0528', min = 1, max = 1 }, { id = 'g001ig0525', min = 1, max = 1 }, { id = 'g001ig0531', min = 1, max = 1 }), -- Честный труд (сапоги) / Эликсир учености (артефакты) / Зелье слова (свитки)				

				--талик
				orr(orr({ id = 'g001ig0184', min = 1, max = 1 }, { id = 'g000ig9120', min = 1, max = 1 }), { id = 'g000ig9109', min = 1, max = 1 }), -- Талисман Восстановления 400 / Талисман щита стихий 500 | Талисман призыва нейтралов II 450
				
				--свитки (свит.морепл / Свиток "Chronos"-ини, прокл.эмира-урон, спеш.время+ини, могущество+урон, рит.исцеления+40хп)
				watorr({ id = 'g000ig5027', min = 1, max = 1}, orr5({ id = 'g000ig5050', min = 1, max = 1}, { id = 'g001ig0253', min = 1, max = 1}, { id = 'g001ig0255', min = 1, max = 1}, { id = 'g001ig0256', min = 1, max = 1}, { id = 'g000ig5029', min = 1, max = 1})),

				--знамя= 400
				{ id = merch1b(), min = 1, max = 1 },

				--релик= 400-550
				{ id = merch1(), min = 1, max = 1 },

				--арт-сап-пос= арт500-650 / сап500-700 / посох 400
				{ id = ruin1(), min = 1, max = 1 },
				
				--посох200
				{ id = wand1(), min = 1, max = 1 },				
				
			}
		},
--класс			guard = guard1(),
	}
}
end

-- Лавка т2
function zoneMerch2()
return {
	{
		goods = {
			itemTypes = { Item.Orb },
			value = { min = 500, max = 600 },
			itemValue = { min = 500, max = 600 },
			items = {
				{ id = 'g000ig0001', min = 5, max = 5 },
				{ id = 'g000ig0006', min = 5, max = 5 },
				{ id = 'g001ig0378', min = 3, max = 3 }, -- хил75

				orr({ id = 'g000ig0011', min = 1, max = 1 }, { id = 'g000ig0002', min = 1, max = 1 }), --ини15/защита15
				orr({ id = 'g000ig0014', min = 1, max = 1 }, { id = 'g000ig0008', min = 1, max = 1 }), --атака15/точность15
				{ id = 'g000ig0008', min = 1, max = 1 }, --точность15
				orr({ id = 'g000ig0021', min = 1, max = 1 }, { id = 'g000ig0024', min = 1, max = 1 }), --возд/огня
				orr({ id = 'g000ig0022', min = 1, max = 1 }, { id = 'g000ig0023', min = 1, max = 1 }), --воды/земли
				{ id = 'g000ig0024', min = 1, max = 1 }, --огня

				orr({ id = 'g001ig0125', min = 1, max = 1 }, { id = 'g001ig0036', min = 1, max = 1 }), --разума/смерти
				orr({ id = e4(), min = 1, max = 1 }, { id = 'g001ig0128', min = 1, max = 1 }), --элексир400/вард оружия
				orr({ id = d15(), min = 1, max = 1 }, { id = 'g001ig0351', min = 1, max = 1 }), -- случ. дотвард/вард-поглащения
				{ id = e4(), min = 1, max = 1},
				{ id = pw5(), min = 1, max = 1},

				orr({ id = 'g001ig0026', min = 1, max = 1 }, orr3({ id = 'g001ig0519', min = 1, max = 1 }, { id = 'g001ig0083', min = 1, max = 1 }, { id = 'g001ig0501', min = 1, max = 1 })), -- Аура регенерации +10 реген аое | Война престолов (-10 воры) / Зелье рвения 5 ини 5 точности 500 / Дары Галлеана (хожд по слесу)
				orr({ id = 'g001ig0526', min = 1, max = 1 }, { id = 'g001ig0527', min = 1, max = 1 }), -- Зелье оруженосца (знамёна) / Зелье постижения (реликвии)	
				orr({ id = 'g001ig0531', min = 1, max = 1 }, { id = 'g001ig0529', min = 1, max = 1 }), -- Зелье слова (свитки) / Каталог магических сфер

				--талик
				orr5({ id = 'g000ig9128', min = 1, max = 1}, { id = 'g001ig0259', min = 1, max = 1}, { id = 'g001ig0259', min = 1, max = 1}, { id = 'g001ig0063', min = 1, max = 1}, { id = 'g000ig9116', min = 1, max = 1}), -- Талисман Молнии 800 / Талисман призыва нейтралов III 600 / Талисман призыва нейтралов III 600 / Талисман Прилива 800 / Талисман Святой земли 800

				--свитки
				orr5({ id = 'g000ig5089', min = 1, max = 1}, { id = 'g000ig5026', min = 1, max = 1}, { id = 'g000ig5013', min = 1, max = 1}, { id = 'g000ig5012', min = 1, max = 1}, { id = 'g000ig5111', min = 1, max = 1}), -- Свиток "Preces"-точн.урон / Свиток "Гимн кланов"+ини / Свиток "Святая сила"+точн.урон / Свиток "Святая броня"+броня / Свиток "Отвлечение"-точн.урон
			
				--арт 700-850
				{ id = merch2(), min = 1, max = 1 },
				
				--рел 600-800=
				{ id = ruin21(), min = 1, max = 1 },

				--знамя 500-700=
				{ id = ruin22(), min = 1, max = 1 },
				
				--посох550 Посох Возни|Посох защиты|Посох скальда
				orr3({id = 'g000ig6020', min = 1, max = 1}, {id = 'g000ig6014', min = 1, max = 1}, {id = 'g001ig0398', min = 1, max = 1}),
			}
		},
--класс		guard = guard2(),
	},
}
end

-- Лавка т3
function zoneMerchZone3()
return {
	{
		goods = {
			itemTypes = { Item.Orb },
			value = { min = 700, max = 700 },
			itemValue = { min = 700, max = 700 },
			items = {
				{ id = 'g000ig0001', min = 5, max = 5 },
				{ id = 'g000ig0006', min = 5, max = 5 },

				orr({ id = 'g000ig0011', min = 1, max = 1 }, { id = 'g000ig0002', min = 1, max = 1 }), --ини15/защита15
				orr({ id = 'g000ig0014', min = 1, max = 1 }, { id = 'g000ig0008', min = 1, max = 1 }), --атака15/точность15
				{ id = 'g000ig0008', min = 1, max = 1 }, --точность15
				orr({ id = 'g000ig0021', min = 1, max = 1 }, { id = 'g000ig0024', min = 1, max = 1 }), --возд/огня
				orr({ id = 'g000ig0022', min = 1, max = 1 }, { id = 'g000ig0023', min = 1, max = 1 }), --воды/земли
				{ id = 'g000ig0023', min = 1, max = 1 }, --земли

				orr({ id = 'g001ig0125', min = 1, max = 1 }, { id = 'g001ig0036', min = 1, max = 1 }), --разума/смерти
				orr({ id = 'g001ig0355', min = 1, max = 1 }, { id = 'g001ig0128', min = 1, max = 1 }), --вардурон/вард оружия
				orr({ id = d15(), min = 1, max = 1 }, { id = 'g001ig0351', min = 1, max = 1 }), -- случ. дотвард/вард-поглащения
				{ id = pw5(), min = 1, max = 1},
				{ id = pw6(), min = 1, max = 1},

				orr(orr({ id = 'g001ig0022', min = 1, max = 1 }, { id = 'g001ig0028', min = 1, max = 1 }), { id = 'g001ig0534', min = 1, max = 1 }), -- Аура меткости 10 аое точности 600 / Аура выносливости 5%оз аое 700 | Экстракт таинственной энергии (см. источн.) 700
				orr({ id = 'g001ig0548', min = 1, max = 1 }, { id = 'g001ig0019', min = 1, max = 1 }), -- Зелье удачи (+10 крит) 700 / Малая аура вампиризма (+10 вамп) 900
				orr({ id = 'g001ig0521', min = 1, max = 1 }, { id = 'g001ig0376', min = 1, max = 1 }), -- Зелье разоблачения (-20 воры) 1000 / Эликсир обновления +30 реген

				--талик
				orr5({id = 'g000ig9130', min = 1, max = 1}, {id = 'g000ig9136', min = 1, max = 1}, {id = 'g001ig0185', min = 1, max = 1}, {id = 'g000ig9123', min = 1, max = 1}, {id = 'g001ig0202', min = 1, max = 1}), -- Талисман Бури 1000 / Талисман Горы 1600 / Талисман Землетрясения 1800 / Талисман Пожара 1000 / Талисман призыва нейтралов IV 1000

				--свитки
				orr5({ id = 'g000ig5090', min = 1, max = 1}, { id = 'g000ig5116', min = 1, max = 1}, { id = 'g000ig5114', min = 1, max = 1}, { id = 'g001ig0586', min = 1, max = 1}, { id = 'g000ig5095', min = 1, max = 1}), -- Свиток "Potentia Ignis"-40ударка / Свиток "Благословение Галеана"+50хп / Свиток "Плесень"-30брони / Свиток "Предательство-20воры / Свиток "Сумерки"-вижн
			
				--рел=
				{ id = ruin31(), min = 1, max = 1 },
				
				--знамя=
				{ id = ruin32(), min = 1, max = 1 },

				--арт=
				{ id = ruin33(), min = 1, max = 1 },
				
				--посох700 Посох дневного света / Посох морей5x5 / Посох сумерек / Посох духа / Посох озер3x3
				orr5({ id = 'g000ig6017', min = 1, max = 1 }, { id = 'g001ig0098', min = 1, max = 1 }, { id = 'g000ig6018', min = 1, max = 1 }, { id = 'g000ig6013', min = 1, max = 1 }, { id = 'g001ig0097', min = 1, max = 1 }),
			}
		},
--класс		guard = guard3(),
	},
}
end


----------------------

-- Руины зона 1
local valueRuinRespZ = { min = v14*kef, max = v14*kef*kr }
local goldRuinRespZ = { min = 350, max = 400 } 

function zoneRuinRespZ()
return {
	{
		gold = goldRuinRespZ,
		loot = {
			items = {
				{id = ruin1(), min = 1, max = 1},
			},	
		},
		guard = {
			subraceTypes = rsub(),
			value = valueRuinRespZ
		}
	},	
}
end


-- Руины зона 2
local valueRuinZone = { min = v24*kef, max = v24*kef*kr }
local goldRuinZone = { min = 450, max = 500 }

function zoneRuinZone2()
return {
	{
		gold = goldRuinZone,
		loot = {
			items = {
				{id = ruin21(), min = 1, max = 1},
			},	
		},
		guard = {
			subraceTypes = NoUndead(),
			value = valueRuinZone
		}
	},

	{
		gold = goldRuinZone,
		loot = {
			items = {
				{id = ruin22(), min = 1, max = 1},
			},	
		},
		guard = {
			subraceTypes = NoUndead(),
			value = valueRuinZone
		}
	},
}
end

-- Руины зона 3
local valueRuinZone3 = { min = v34*kef, max = v34*kef*kr }
local goldRuinZone3 = { min = 550, max = 600 }

function zoneRuinZone3()
return {
	{
		gold = goldRuinZone3,
		loot = {
			items = {
				{id = ruin31(), min = 1, max = 1},
			},	
		},
		guard = {
			subraceTypes = NoUndead(),
			value = valueRuinZone3
		}
	},
	{
		gold = goldRuinZone3,
		loot = {
			items = {
				{id = ruin32(), min = 1, max = 1},
			},	
		},
		guard = {
			subraceTypes = NoUndead(),
			value = valueRuinZone3
		}
	},	
	{
		gold = goldRuinZone3,
		loot = {
			items = {
				{id = ruin33(), min = 1, max = 1},
			},	
		},
		guard = {
			subraceTypes = NoUndead(),
			value = valueRuinZone3
		}
	},	
}
end

---------------------

-- Источники Респ
function getMinesRespZ(race)
	local mines = {
		gold = 1,
	}
	if race == Race.Human then
		mines.lifeMana = 1
	elseif race == Race.Dwarf then
		mines.runicMana = 1
	elseif race == Race.Undead then
		mines.deathMana = 1
	elseif race == Race.Heretic then
		mines.infernalMana = 1
	elseif race == Race.Elf then
		mines.groveMana = 1
	end
	return mines
end

-- Источники т1.1
function getMinesRespZ11(race)
	local mines = {}
	if race == Race.Human then
		mines.lifeMana = 1
		mines.runicMana = 1
		mines.groveMana = 1
	elseif race == Race.Dwarf then
		mines.runicMana = 1
		mines.lifeMana = 1
		mines.groveMana = 1
	elseif race == Race.Undead then
		mines.deathMana = 1
		mines.infernalMana = 1
		mines.groveMana = 1
	elseif race == Race.Heretic then
		mines.infernalMana = 1
		mines.deathMana = 1
		mines.groveMana = 1
	elseif race == Race.Elf then
		mines.groveMana = 1
		mines.lifeMana = 1
		mines.infernalMana = 1
	end
	return mines
end

-- Источники т1.2
function getMinesRespZ12(race)
	local mines = {
		gold = 1,
	}
	if race == Race.Human then
		mines.deathMana = 1
		mines.infernalMana = 1
	elseif race == Race.Dwarf then
		mines.deathMana = 1
		mines.infernalMana = 1
	elseif race == Race.Undead then
		mines.lifeMana = 1
		mines.runicMana = 1
	elseif race == Race.Heretic then
		mines.lifeMana = 1
		mines.runicMana = 1
	elseif race == Race.Elf then
		mines.runicMana = 1
		mines.deathMana = 1
	end
	return mines
end

-- Источники т2
function getMinesZone2(race, race2)
	local mines = {
		gold = 1,
	}

	if race == Race.Human then
		mines.lifeMana = 1
	elseif race == Race.Dwarf then
		mines.runicMana = 1
	elseif race == Race.Undead then
		mines.deathMana = 1
	elseif race == Race.Heretic then
		mines.infernalMana = 1
	elseif race == Race.Elf then
		mines.groveMana = 1
	end	

	if race2 == Race.Human then
		mines.lifeMana = 1
	elseif race2 == Race.Dwarf then
		mines.runicMana = 1
	elseif race2 == Race.Undead then
		mines.deathMana = 1
	elseif race2 == Race.Heretic then
		mines.infernalMana = 1
	elseif race2 == Race.Elf then
		mines.groveMana = 1
	end	

  return mines

end

-- Источники т3
function getMinesZone3(race, race2)
	local mines = {
		gold = 1,
	}
	if race == Race.Human and race2 == Race.Dwarf then
		mines.deathMana = 1
		mines.infernalMana = 1
		mines.groveMana = 1
	elseif race == Race.Human and race2 == Race.Undead then
		mines.runicMana = 1
		mines.infernalMana = 1
		mines.groveMana = 1
	elseif race == Race.Human and race2 == Race.Heretic then
		mines.runicMana = 1
		mines.deathMana = 1
		mines.groveMana = 1
	elseif race == Race.Human and race2 == Race.Elf then
		mines.runicMana = 1
		mines.deathMana = 1
		mines.infernalMana = 1
	elseif race == Race.Dwarf and race2 == Race.Undead then
		mines.lifeMana = 1
		mines.infernalMana = 1
		mines.groveMana = 1
	elseif race == Race.Dwarf and race2 == Race.Heretic then
		mines.lifeMana = 1
		mines.deathMana = 1
		mines.groveMana = 1
	elseif race == Race.Dwarf and race2 == Race.Elf then
		mines.lifeMana = 1
		mines.deathMana = 1
		mines.infernalMana = 1
	elseif race == Race.Undead and race2 == Race.Heretic then
		mines.lifeMana = 1
		mines.runicMana = 1
		mines.groveMana = 1
	elseif race == Race.Undead and race2 == Race.Elf then
		mines.lifeMana = 1
		mines.runicMana = 1
		mines.infernalMana = 1
	elseif race == Race.Heretic and race2 == Race.Elf then
		mines.lifeMana = 1
		mines.runicMana = 1
		mines.deathMana = 1
--
	elseif race == Race.Dwarf and race2 == Race.Human then
		mines.deathMana = 1
		mines.infernalMana = 1
		mines.groveMana = 1
	elseif race == Race.Undead and race2 == Race.Human then
		mines.runicMana = 1
		mines.infernalMana = 1
		mines.groveMana = 1
	elseif race == Race.Heretic and race2 == Race.Human then
		mines.runicMana = 1
		mines.deathMana = 1
		mines.groveMana = 1
	elseif race == Race.Elf and race2 == Race.Human then
		mines.runicMana = 1
		mines.deathMana = 1
		mines.infernalMana = 1
	elseif race == Race.Undead and race2 == Race.Dwarf then
		mines.lifeMana = 1
		mines.infernalMana = 1
		mines.groveMana = 1
	elseif race == Race.Heretic and race2 == Race.Dwarf then
		mines.lifeMana = 1
		mines.deathMana = 1
		mines.groveMana = 1
	elseif race == Race.Elf and race2 == Race.Dwarf then
		mines.lifeMana = 1
		mines.deathMana = 1
		mines.infernalMana = 1
	elseif race == Race.Heretic and race2 == Race.Undead then
		mines.lifeMana = 1
		mines.runicMana = 1
		mines.groveMana = 1
	elseif race == Race.Elf and race2 == Race.Undead then
		mines.lifeMana = 1
		mines.runicMana = 1
		mines.infernalMana = 1
	elseif race == Race.Elf and race2 == Race.Heretic then
		mines.lifeMana = 1
		mines.runicMana = 1
		mines.deathMana = 1
	end	

  return mines

end


----------------

-- Юниты для наёмников зоны 1
function unitsMercen0(race)
local unitsm = {}
local i = 1

if race == Race.Human then
unitsm[i] = { id = 'g003uu5001', level = 1, unique = false } i = i + 1 -- Боец ополчения
unitsm[i] = { id = 'g000uu0001', level = 1, unique = false } i = i + 1 -- Сквайр
unitsm[i] = { id = 'g000uu0006', level = 1, unique = false } i = i + 1 -- Лучник
unitsm[i] = { id = 'g000uu0011', level = 1, unique = false } i = i + 1 -- Послушница
unitsm[i] = { id = 'g000uu0008', level = 1, unique = false } i = i + 1 -- Ученик
unitsm[i] = { id = 'g000uu7628', level = 1, unique = false } i = i + 1 -- Имперский гвардеец
unitsm[i] = { id = 'g000uu0018', level = 1, unique = true } i = i + 1 -- Титан

elseif race == Race.Dwarf then
unitsm[i] = { id = 'g000uu0036', level = 1, unique = false } i = i + 1 -- Гном
unitsm[i] = { id = 'g004uu5039', level = 1, unique = false } i = i + 1 -- Снежный волк
unitsm[i] = { id = 'g000uu0026', level = 1, unique = false } i = i + 1 -- Метатель топоров
unitsm[i] = { id = 'g000uu0033', level = 1, unique = false } i = i + 1 -- Травница
unitsm[i] = { id = 'g000uu0029', level = 1, unique = false } i = i + 1 -- Холмовой великан
unitsm[i] = { id = 'g000uu7627', level = 1, unique = false } i = i + 1 -- Советник Витара
unitsm[i] = { id = 'g000uu0043', level = 1, unique = true } i = i + 1 -- Йети

elseif race == Race.Undead then
unitsm[i] = { id = 'g000uu0086', level = 1, unique = false } i = i + 1 -- Мертвец
unitsm[i] = { id = 'g001uu7539', level = 1, unique = false } i = i + 1 -- Колотун
unitsm[i] = { id = 'g000uu0080', level = 1, unique = false } i = i + 1 -- Адепт
unitsm[i] = { id = 'g000uu0078', level = 1, unique = false } i = i + 1 -- Привидение
unitsm[i] = { id = 'g000uu0093', level = 1, unique = false } i = i + 1 -- Виверна
unitsm[i] = { id = 'g001uu7592', level = 1, unique = false } i = i + 1 -- Торхот
unitsm[i] = { id = 'g000uu0092', level = 1, unique = true } i = i + 1 -- Оборотень

elseif race == Race.Heretic then
unitsm[i] = { id = 'g000uu0052', level = 1, unique = false } i = i + 1 -- Одержимый
unitsm[i] = { id = 'g000uu0062', level = 1, unique = false } i = i + 1 -- Сектант
unitsm[i] = { id = 'g000uu0055', level = 1, unique = false } i = i + 1 -- Горгулья
unitsm[i] = { id = 'g000uu0057', level = 1, unique = false } i = i + 1 -- Черт
unitsm[i] = { id = 'g000uu7605', level = 1, unique = false } i = i + 1 -- Скульптор лжи
unitsm[i] = { id = 'g000uu0069', level = 1, unique = true } i = i + 1 -- Манкуб
unitsm[i] = { id = 'g004uu6120', level = 1, unique = true } i = i + 1 -- Ведьмино отродье

elseif race == Race.Elf then
unitsm[i] = { id = 'g000uu8014', level = 1, unique = false } i = i + 1 -- Кентавр-копейщик
unitsm[i] = { id = 'g000uu8018', level = 1, unique = false } i = i + 1 -- Разведчик
unitsm[i] = { id = 'g000uu8025', level = 1, unique = false } i = i + 1 -- Послушник леса
unitsm[i] = { id = 'g000uu8031', level = 1, unique = false } i = i + 1 -- Дух
unitsm[i] = { id = 'g003uu8037', level = 1, unique = false } i = i + 1 -- Священное древо
unitsm[i] = { id = 'g000uu7629', level = 1, unique = false } i = i + 1 -- Благородный эльф
unitsm[i] = { id = 'g000uu8029', level = 1, unique = true } i = i + 1 -- Грифон

end

return unitsm
end


-- Наёмники в зоне 1
function zoneMercenZone1(race)
return {
	{
		units = unitsMercen0(race),
		guard = guard1n(),
	},
}
end


-- Юниты для наёмников зоны 3
function unitsMercen3()
local unitsm = {}
local i = 1

unitsm[i] = { id = 'g001uu8308', level = 1, unique = false } i = i + 1 -- Молодой триббог

if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu5024', level = 1, unique = true } i = i + 1 end -- Ящер-воин
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu7590', level = 1, unique = true } i = i + 1 end -- Ящер-охотник
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu8274', level = 1, unique = true } i = i + 1 end -- Медуза-охотница
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu8157', level = 1, unique = true } i = i + 1 end -- Гоблин-громыхун
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu5012', level = 1, unique = true } i = i + 1 end -- Орк-багатур
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g001uu7546', level = 1, unique = true } i = i + 1 end -- Орк-крушитель
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu8247', level = 1, unique = true } i = i + 1 end -- Разоритель
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu8045', level = 1, unique = true } i = i + 1 end -- Траппер
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu6112', level = 1, unique = true } i = i + 1 end -- Дикий великан
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu8047', level = 1, unique = true } i = i + 1 end -- Циклоп

return unitsm
end

-- Наёмники в зоне 3
function zoneMercenZone3()
return {
	{
		units = unitsMercen3(),
		guard = guard3n(),
	},
}
end

----------------------

-- Сундуки Респ
function bags0()
return {
	count = 1,
	loot = {
			items = {
				orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --рес/хил100
				{ id = 'g001ig0180', min = 2, max = 2}, -- хил25
				orr3({ id = rmss(), min = 1, max = 1 }, { id = 'g000ig7001', min = 1, max = 1 }, { id = 'g000ig7001', min = 1, max = 1 }), --случ.мал.шар/кольцо50/кольцо50
				orr({ id = d15(), min = 1, max = 1 },{ id = 'g000ig0008', min = 1, max = 1 }), -- сл.дотвард/точность15
				-- Зелье посмертного зова (талисманы) / Зелье завоевателя (жезлы) / Зелье посмертного зова (талисманы) / Зелье постижения (реликвии) / Зелье дозорного+1вижн
				orr5({ id = 'g001ig0530', min = 1, max = 1 }, { id = 'g001ig0524', min = 1, max = 1 }, { id = 'g001ig0530', min = 1, max = 1 }, { id = 'g001ig0527', min = 1, max = 1 }, { id = 'g001ig0532', min = 1, max = 1 }),
			}
	}
}
end


-- Сундуки т1
function bags1()
return {
	count = 1,
	loot = {
			items = {
				orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --рес/хил100
				{ id = 'g000ig0005', min = 1, max = 1}, -- хил50
				{ id = 'g001ig0180', min = 1, max = 1}, -- хил25
				orr3({ id = rmss(), min = 1, max = 1 }, { id = 'g001ig0431', min = 1, max = 1 }, { id = 'g001ig0431', min = 1, max = 1 }), --случ.мал.шар/гранат75/гранат75
				orr({ id = 'g001ig0125', min = 1, max = 1}, { id = 'g001ig0036', min = 1, max = 1}), -- разума/смерти				
				{ id = e2(), min = 1, max = 1 },
				-- Эликсир учености (артефакты) / Эликсир учености (артефакты) / Честный труд (сапоги) | Зелье слова (свитки) / Зелье ясного взора (+2 обзора)
				orr5({ id = 'g001ig0525', min = 1, max = 1 }, { id = 'g001ig0525', min = 1, max = 1 }, { id = 'g001ig0528', min = 1, max = 1 }, { id = 'g001ig0531', min = 1, max = 1 }, { id = 'g001ig0533', min = 1, max = 1 }),
			}
	}
}
end

-- Сундуки т2
function bags2()
return {
	count = 1,
	loot = {
			items = {
				orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --рес/хил100
				{ id = 'g001ig0378', min = 1, max = 1}, -- хил75				
				{ id = 'g000ig0005', min = 1, max = 1}, -- хил50
				orr({ id = rms(), min = 1, max = 1 }, { id = 'g000ig7002', min = 1, max = 1 }), --случ.шар/кольцо100				
				orr({ id = d15(), min = 1, max = 1 },{ id = w15(), min = 1, max = 1 }), -- сл.дотвард/сл.вард
				{ id = e4(), min = 1, max = 1 },
				-- Зелье постижения (реликвии) / Зелье оруженосца (знамёна) / Зелье оруженосца (знамёна) / Война престолов (-10 воры) / Зелье воеводы (опыт 10)
				orr5({ id = 'g001ig0527', min = 1, max = 1 }, { id = 'g001ig0526', min = 1, max = 1 }, { id = 'g001ig0526', min = 1, max = 1 }, { id = 'g001ig0519', min = 1, max = 1 }, { id = 'g001ig0523', min = 1, max = 1 }),
				orr({ id = 'g001ig0125', min = 1, max = 1}, { id = 'g001ig0036', min = 1, max = 1}), -- разума/смерти				
			}
		}
}
end

-- Сундуки т3
function bags3()
return {
	count = 1,
	loot = {
			items = {
				orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --рес/хил100
				{ id = 'g000ig0006', min = 1, max = 1 }, --хил100
				{ id = 'g001ig0378', min = 1, max = 1}, -- хил75				
				orr3({ id = rmsb(), min = 1, max = 1 }, { id = 'g001ig0486', min = 1, max = 1 }, { id = 'g001ig0432', min = 1, max = 1 }), --случ.боль.шар/Малый шар колдовства/Аметист (Драгоценность)125
				orr({ id = b15(), min = 1, max = 1 },{ id = w15(), min = 1, max = 1 }), -- сл.банка15/сл.вард
				{ id = pw5(), min = 1, max = 1 },
				orr({ id = 'g001ig0355', min = 1, max = 1 }, { id = 'g001ig0128', min = 1, max = 1 }), --вардурон/вард оружия
				-- Каталог магических сфер (сферы) / Каталог магических сфер (сферы) / Экстракт таинственной энергии (смена атаки) / Зелье разоблачения-20воры / Дары Галлеана (лес)
				orr5({ id = 'g001ig0529', min = 1, max = 1 }, { id = 'g001ig0529', min = 1, max = 1 }, { id = 'g001ig0534', min = 1, max = 1 }, { id = 'g001ig0521', min = 1, max = 1 }, { id = 'g001ig0501', min = 1, max = 1 }),
			}
		}
	}
end

----------------------
-- МОИ ФУНКЦИИ
----------------------

-- Быль или не быть 50%
function yn(what)
	local radn = math.random(0,1)
	if radn == 0 then
	return what
	elseif radn == 1 then
	return ""
	end
end

-- Быль или не быть 66%
function yn3(what)
	local radn = math.random(0,2)
	if radn == 0 then
	return what
	elseif radn == 1 then
	return what
	elseif radn == 2 then
	return ""
	end
end

-- Или / или
function orr(what, what2)
	local radn = math.random(0,1)
	if radn == 0 then
	return what
	elseif radn == 1 then
	return what2
	end
end

-- Или / или 3
function orr3(what, what2, what3)
	local radn = math.random(0,2)
	if radn == 0 then
	return what
	elseif radn == 1 then
	return what2
	elseif radn == 2 then
	return what3
	end
end

-- Или / или 5
function orr5(what, what2, what3, what4, what5)
	local radn = math.random(0,4)
	if radn == 0 then
	return what
	elseif radn == 1 then
	return what2
	elseif radn == 2 then
	return what3
	elseif radn == 3 then
	return what4
	elseif radn == 4 then
	return what5
	end
end

-- Если вода, то
function watorr(water, other)
	if brz == 0 then
	return orr5(water, other, other, other, other)
	elseif brz == 1 then
	return other
	elseif brz == 2 then
	return other
	elseif brz == 3 then
	return orr3(water, water, other)
	elseif brz == 4 then
	return orr(water, other)
	elseif brz == 5 then
	return orr3(water, other, other)
	end
end

-- субраса игрока
function getPlayerSubRace(race)
	if race == Race.Human then return Subrace.Human
	elseif race == Race.Dwarf then return Subrace.Dwarf
	elseif race == Race.Undead then return Subrace.Undead
	elseif race == Race.Heretic then return Subrace.Heretic
	elseif race == Race.Elf then return Subrace.Elf
	end
end

-- большой родной шар манны
function ExtraBigHomeMana(race)
	
	shmn = 'g001ig0277' -- Большой шар маны Жизни
	sdw = 'g001ig0279' -- Большой шар маны Рун
	sun = 'g001ig0280' -- Большой шар маны Смерти
	shr = 'g001ig0278' -- Большой шар маны Преисподней
	self = 'g001ig0281' -- Большой шар маны Лесного эликсира 
	
	if race == Race.Human then return shmn
	elseif race == Race.Dwarf then return sdw
	elseif race == Race.Undead then return sun
	elseif race == Race.Heretic then return shr
	elseif race == Race.Elf then return self
	end
end


-- доп шар в ст-ице на старте на спец. заклы
function ExtraManaProject4(race)
	
	shmn = orr('g001ig0149','g001ig0147') -- Шар маны Смерти \ Шар маны Преисподней
	sdw = orr('g001ig0149','g001ig0147') -- Шар маны Смерти \ Шар маны Преисподней
	sun = orr('g001ig0146','g001ig0148') -- Шар маны Жизни \ Шар маны Рун
	shr = orr('g001ig0146','g001ig0148') -- Шар маны Жизни \ Шар маны Рун
	self = orr('g001ig0149','g001ig0148') -- Шар маны Смерти \ Шар маны Рун
	
	if race == Race.Human then return shmn
	elseif race == Race.Dwarf then return sdw
	elseif race == Race.Undead then return sun
	elseif race == Race.Heretic then return shr
	elseif race == Race.Elf then return self
	end
end


-- случайный малый шар манны
function rmss()
	local radn = math.random(0,4)
	if radn == 0 then
	return 'g001ig0481' --жизни
	elseif radn == 1 then
	return 'g001ig0485' --лес
	elseif radn == 2 then
	return 'g001ig0482' --преисп.
	elseif radn == 3 then
	return 'g001ig0483' --рун
	elseif radn == 4 then
	return 'g001ig0484' --смерти
	end
end


-- случайный шар манны
function rms()
	local radn = math.random(0,4)
	if radn == 0 then
	return 'g001ig0146' --жизни
	elseif radn == 1 then
	return 'g001ig0150' --лес
	elseif radn == 2 then
	return 'g001ig0147' --преисп.
	elseif radn == 3 then
	return 'g001ig0148' --рун
	elseif radn == 4 then
	return 'g001ig0149' --смерти
	end
end

-- случайный большой шар манны
function rmsb()
	local radn = math.random(0,4)
	if radn == 0 then
	return 'g001ig0277' --жизни
	elseif radn == 1 then
	return 'g001ig0281' --лес
	elseif radn == 2 then
	return 'g001ig0278' --преисп.
	elseif radn == 3 then
	return 'g001ig0279' --рун
	elseif radn == 4 then
	return 'g001ig0280' --смерти
	end
end

-- случайная банка на 15
function b15()
	local radn = math.random(0,3)
	if radn == 0 then
	return 'g000ig0002' --зашита
	elseif radn == 1 then
	return 'g000ig0014' --атака
	elseif radn == 2 then
	return 'g000ig0011' --ини
	elseif radn == 3 then
	return 'g000ig0008' --точность
	end
end

-- случайная банка вард от стихий
function w15()
	local radn = math.random(0,3)
	if radn == 0 then
	return 'g000ig0021' --воздух
	elseif radn == 1 then
	return 'g000ig0022' --вода
	elseif radn == 2 then
	return 'g000ig0023' --земля
	elseif radn == 3 then
	return 'g000ig0024' --огонь
	end
end
-- случайная банка вард от дотов и спец урона
function d15()
	local radn = math.random(0,3)
	if radn == 0 then
	return 'g001ig0329' -- Эликсир защиты от дота
	elseif radn == 1 then
	return 'g001ig0351' --Эликсир защиты от поглощения
	elseif radn == 2 then
	return 'g001ig0343' --Эликсир защиты от проклятий
	elseif radn == 3 then
	return 'g001ig0341' -- Эликсир защиты от аффекта
	end
end

-- случайный эликсир 200 + эффект варды (от-яд з1)
function e2()
	local radn = math.random(0,4)
	if radn == 0 then
	return 'g001ig0560' -- Зелье провокатора 25принять
	elseif radn == 1 then
	return 'g001ig0547' -- Зелье пронзающего взгляда +10крит
	elseif radn == 2 then
	return 'g001ig0490' -- Зелье выносливости +25оз
	elseif radn == 3 then
	return 'g001ig0329' -- Эликсир защиты от дота
	elseif radn == 4 then
	return 'g001ig0351' --Эликсир защиты от поглощения
	end
end

-- случайный эликсир 400-500 + афф.вард
function e4()
	local radn = math.random(0,5)
	if radn == 0 then
	return 'g001ig0562' -- Зелье дуэлянта +20крит
	elseif radn == 1 then
	return 'g001ig0491' -- Зелье похищения жизни +25вамп
	elseif radn == 2 then
	return 'g001ig0355' -- Зелье тритоньей чешуи +вардурон
	elseif radn == 3 then
	return 'g001ig0127' -- Эликсир жизненной силы +50максоз
	elseif radn == 4 then
	return 'g001ig0128' -- Эликсир защиты от Оружия
	elseif radn == 5 then
	return 'g001ig0341' -- Эликсир защиты от аффекта
	end
end

-- случайный пермо вард 500
function pw5()
	local radn = math.random(0,5)
	if radn == 0 then
	return 'g001ig0332' -- Зелье ихора Танатоса вард-яд
	elseif radn == 1 then
	return 'g001ig0328' -- Эликсир ледяной плоти вард-мороз
	elseif radn == 2 then
	return 'g001ig0330' -- Эликсир Неопалимых вард-ожог
	elseif radn == 3 then
	return 'g001ig0346' -- Эликсир неудержимости вард-ослабление	
	elseif radn == 4 then
	return 'g001ig0344' -- Эликсир предназначения вард-замедление	
	elseif radn == 5 then
	return 'g001ig0346' -- Эликсир неудержимости вард-ослабление	
	end
end

-- случайный пермо вард 600
function pw6()
	local radn = math.random(0,7)
	if radn == 0 then
	return 'g001ig0354' -- Жидкий металл Уру вард-разрушение
	elseif radn == 1 then
	return 'g001ig0320' -- Зелье глубинного чудища вард-вода
	elseif radn == 2 then
	return 'g001ig0325' -- Зелье здравомыслия вард-разум
	elseif radn == 3 then
	return 'g001ig0326' -- Зелье немертвых вард-смерть
	elseif radn == 4 then
	return 'g001ig0323' -- Зелье родства с пламенем вард-огонь	
	elseif radn == 5 then
	return 'g001ig0322' -- Зелье текучего камня вард-земля	
	elseif radn == 6 then
	return 'g001ig0321' -- Зелье укротителя небосвода вард-воздух	
	elseif radn == 7 then
	return 'g001ig0352' -- Эликсир гонителя нечисти вард-тауматургии	
	end
end

-- случайный пермо-эликсир на 5% за 400
function p05()
	local radn = math.random(0,4)
	if radn == 0 then
	return 'g001ig0309' -- Эликсир задиры +5ини
	elseif radn == 1 then
	return 'g001ig0313' -- Эликсир совершенствования +5урон
	elseif radn == 2 then
	return 'g001ig0311' -- Эликсир хладнокровия +5точности
	elseif radn == 3 then
	return 'g001ig0315' -- Зелье великана +5ОЗ
	elseif radn == 4 then
	return 'g001ig0307' -- Зелье стойкости +5брони
	end
end

-- случайный пермо-эликсир на 10% +
function p10pl()
	local radn = math.random(0,6)
	if radn == 0 then
	return 'g000ig0013' -- Эликсир неуловимости +10ини
	elseif radn == 1 then
	return 'g000ig0016' -- Эликсир мощи +10урон
	elseif radn == 2 then
	return 'g000ig0010' -- Эликсир внимательности +10точности
	elseif radn == 3 then
	return 'g000ig0004' -- Эликсир твердости +10брони
	elseif radn == 4 then
	return 'g001ig0028' -- Аура выносливости 5%оз аое 700
	elseif radn == 5 then
	return 'g001ig0034' -- Аура жизненной силы 10оз аое 400
	elseif radn == 6 then
	return 'g001ig0022' -- Аура меткости 10% точности 600
	end
end


-- случайная банка навык
function lp6()
	local radn = math.random(0,6)
	if radn == 0 then
	return 'g001ig0525' -- Эликсир учености (артефакты)
	elseif radn == 1 then
	return 'g001ig0528' -- Честный труд (сапоги)
	elseif radn == 2 then
	return 'g001ig0531' -- Зелье слова (свитки)
	elseif radn == 3 then
	return 'g001ig0527' -- Зелье постижения (реликвии)
	elseif radn == 4 then
	return 'g001ig0526' -- Зелье оруженосца (знамёна)
	elseif radn == 5 then
	return 'g001ig0529' -- Каталог магических сфер (сферы)
	elseif radn == 6 then
	return 'g001ig0530' -- Зелье посмертного зова (талики)
	end
end

-- сфера в драконе
function spherex()
	local radn = math.random(0,5)
	if radn == 0 then
	return 'g001ig0462' -- Сфера направленного ослабления II 700
	elseif radn == 1 then
	return 'g001ig0059' -- Сфера защиты от Оружия 800
	elseif radn == 2 then
	return 'g001ig0181' -- Сфера Страха 800
	elseif radn == 3 then
	return 'g001ig0455' -- Сфера Спасения 700
	elseif radn == 4 then
	return 'g000ig9016' -- Сфера Великого исцеления 700
	elseif radn == 5 then
	return 'g001ig0203' -- Сфера Массового ослабления II
	end
end

-- стартовый предмет арт300-400 сап300 посох200
function startitm()
	local radn = math.random(0,12)
	if radn == 0 then
	return 'g001ig0418' -- Руна защиты Фрейра (Артефакт)
	elseif radn == 1 then
	return 'g000ig2001' -- Рунный камень (Артефакт)
	elseif radn == 2 then
	return 'g001ig0611' -- Цепи жертвенности (Артефакт)
	elseif radn == 3 then
	return 'g000ig3001' -- Гномьи наручи (Артефакт)	
	elseif radn == 4 then
	return 'g001ig0100' -- Цеп Хана (Артефакт)
	elseif radn == 5 then
	return 'g002ig0001' -- Потайной кинжал (Артефакт)
	elseif radn == 6 then
	return 'g001ig0108' -- Гномьи сапоги
	elseif radn == 7 then
	return 'g001ig0110' -- Легкие сапоги
	elseif radn == 8 then
	return 'g001ig0105' -- Литейные сапоги
	elseif radn == 9 then
	return 'g001ig0107' -- Сапоги ветров
	elseif radn == 10 then
	return 'g001ig0109' -- Сапоги жизни
	elseif radn == 11 then
	return 'g001ig0106' -- Сапоги каменщика
	elseif radn == 12 then
	return 'g001ig0113' -- Укрепленные сапоги
	end
end

-- посохи т1
function wand1()
	local radn = math.random(0,6)
	if radn == 0 then
	return 'g001ig0395' -- Посох наместника Махаля
	elseif radn == 1 then
	return 'g001ig0405' -- Посох обреченности
	elseif radn == 2 then
	return 'g001ig0402' -- Посох отлучения
	elseif radn == 3 then
	return 'g001ig0399' -- Посох раздора
	elseif radn == 4 then
	return 'g000ig6003' -- Посох святости
	elseif radn == 5 then
	return 'g001ig0394' -- Посох северных стражей
	elseif radn == 6 then
	return 'g000ig6012' -- Посох скорости
	end
end

-- предмет зона 0
function item0()
	local radn = math.random(0,7)
	if radn == 0 then
	return 'g000ig6001' -- Посох грома
	elseif radn == 1 then
	return 'g001ig0387' -- Посох следопыта
	elseif radn == 2 then
	return 'g000ig3008' -- Обод мертвых (Реликвия)
	elseif radn == 3 then
	return 'g000ig4008' -- Фолиант Мысли
	elseif radn == 4 then
	return 'g001ig0101' -- Череп Хана
	elseif radn == 5 then
	return 'g001ig0130' -- Эликсир регенерации +20 реген
	elseif radn == 6 then
	return 'g001ig0323' -- Зелье родства с пламенем +вард.огонь
	elseif radn == 7 then
	return 'g001ig0321' -- Зелье укротителя небосвода +вард.воздух
	end
end

-- руины 1 (в лавку 1) пул наград арт500-650 / сап500-700 / посох 400
function ruin1()
	local radn = math.random(0,13)
	if radn == 0 then
	return 'g001ig0582' -- Камень врат (Артефакт)
	elseif radn == 1 then
	return 'g000ig3002' -- Дьявольская чаша (Артефакт)
	elseif radn == 2 then
	return 'g001ig0487' -- Кольцо темных искуств (Артефакт)
	elseif radn == 3 then
	return 'g000ig3017' -- Кинжал Вампиризма (Артефакт)
	elseif radn == 4 then
	return 'g001ig0182' -- Счастливая кость (Артефакт)
	elseif radn == 5 then
	return 'g000ig2002' -- Святая чаша (Артефакт)
	elseif radn == 6 then
	return 'g001ig0048' -- Амулет Кракена (Артефакт)
	elseif radn == 7 then
	return 'g001ig0111' -- Сапоги ассасина
	elseif radn == 8 then
	return 'g001ig0114' -- Тяжелые сапоги
	elseif radn == 9 then
	return watorr('g000ig1011', 'g000ig1010') -- Сапоги мореплавателя / Эльфийские сапоги
	elseif radn == 10 then
	return 'g001ig0403' -- Посох неизбежной кары
	elseif radn == 11 then
	return 'g001ig0404' -- Посох Ниграэля
	elseif radn == 12 then
	return watorr('g001ig0386', 'g001ig0401') -- Посох семи ветров (мореплавание) / Посох проклятой метки
	elseif radn == 13 then
	return 'g001ig0392' -- Посох знаний Фрегги
	end
end

-- руины 2.1 (в лавку 2) пул наград рел 600-800 +сапоги
function ruin21()
	local radn = math.random(0,10)
	if radn == 0 then
	return 'g001ig0420' -- Вечные латы (Реликвия)
	elseif radn == 1 then
	return 'g001ig0104' -- Зуб людоеда (Реликвия)
	elseif radn == 2 then
	return 'g001ig0422' -- Кровавый покров (Реликвия)
	elseif radn == 3 then
	return 'g001ig0423' -- Латы Спасителя (Реликвия)
	elseif radn == 4 then
	return 'g001ig0427' -- Нагрудник Стража (Реликвия)
	elseif radn == 5 then
	return 'g000ig2006' -- Тиара чистоты (Реликвия)
	elseif radn == 6 then
	return 'g001ig0037' -- Шлем проклятого (Реликвия)
	elseif radn == 7 then
	return 'g001ig0602' -- Доспех жатвы (Реликвия)
	elseif radn == 8 then
	return 'g002ig0002' -- Промасленная кольчуга (Реликвия)
	elseif radn == 9 then
	return 'g000ig8003' -- Сапоги скорости (Сапоги)
	elseif radn == 10 then
	return 'g001ig0606' -- Сапоги родных земель (Сапоги)
	end
end

-- руины 2.2 (в лавку 2) пул наград знамя 500-700
function ruin22()
	local radn = math.random(0,8)
	if radn == 0 then
	return 'g001ig0293' -- Баннер неудержимых
	elseif radn == 1 then
	return 'g001ig0361' -- Знамя горна
	elseif radn == 2 then
	return 'g001ig0289' -- Знамя городских стражей
	elseif radn == 3 then
	return 'g001ig0357' -- Знамя неистовства
	elseif radn == 4 then
	return 'g001ig0365' -- Ловец Кошмаров
	elseif radn == 5 then
	return 'g001ig0292' -- Стяг концентрации
	elseif radn == 6 then
	return 'g001ig0370' -- Знамя искоренителя ереси
	elseif radn == 7 then
	return 'g001ig0587' -- Знамя мастера
	elseif radn == 8 then
	return 'g001ig0369' -- Знамя снежной охоты
	end
end

-- руины 3.1 (в лавку 3) пул наград реликвия 850-1100 +сапоги
function ruin31()
	local radn = math.random(0,8)
	if radn == 0 then
	return 'g001ig0424' -- Длани ангела (Реликвия)
	elseif radn == 1 then
	return 'g001ig0425' -- Кафтан первооткрывателя (Реликвия)
	elseif radn == 2 then
	return 'g001ig0429' -- Одеяния из шкуры зверя (Реликвия)
	elseif radn == 3 then
	return 'g001ig0430' -- Роба убийцы (Реликвия)
	elseif radn == 4 then
	return 'g001ig0539' -- Тисовый лук (Реликвия)
	elseif radn == 5 then
	return 'g001ig0156' -- Шкатулка предсказаний (Реликвия)
	elseif radn == 6 then
	return 'g001ig0419' -- Шлем воителя (Реликвия)
	elseif radn == 7 then
	return 'g001ig0115' -- Железная поступь (Сапоги)
	elseif radn == 8 then
	return 'g001ig0112' -- Крылья ангела (Сапоги)
	end
end

-- руины 3.2 (в лавку 3) пул наград знамя 850-1100
function ruin32()
	local radn = math.random(0,6)
	if radn == 0 then
	return 'g000ig1002' -- Знамя неуязвимости
	elseif radn == 1 then
	return 'g000ig1006' -- Знамя скорости
	elseif radn == 2 then
	return 'g000ig1008' -- Знамя энергии
	elseif radn == 3 then
	return 'g000ig1004' -- Знамя битвы
	elseif radn == 4 then
	return 'g001ig0362' -- Знамя болот
	elseif radn == 5 then
	return 'g001ig0364' -- Знамя ветра перемен
	elseif radn == 6 then
	return 'g001ig0374' -- Знамя стального листопада
	end
end

-- руины 3.3 (в лавку 3) пул наград артефакт 900-1150 +кандалы
function ruin33()
	local radn = math.random(0,9)
	if radn == 0 then
	return 'g001ig0124' -- Клинок Возвышенного (Артефакт)
	elseif radn == 1 then
	return 'g001ig0042' -- Клыки Бездны (Артефакт)
	elseif radn == 2 then
	return 'g001ig0612' -- Кольцо небесной воли (Артефакт)
	elseif radn == 3 then
	return 'g001ig0591' -- Щит отражения (Артефакт)
	elseif radn == 4 then
	return 'g001ig0071' -- Эльфийская брошь (Артефакт)
	elseif radn == 5 then
	return 'g001ig0488' -- Кольцо Несгибаемого стража (Артефакт)
	elseif radn == 6 then
	return 'g000ig3019' -- Клинок Танатоса (Артефакт)
	elseif radn == 7 then
	return 'g001ig0415' -- Руна кары Тьяцци (Артефакт)
	elseif radn == 8 then
	return 'g001ig0603' -- Чаша жатвы (Артефакт)
	elseif radn == 9 then
	return 'g000ig2007' -- Ржавые кандалы (Артефакт)
	end
end

-- лавка 1 пул реликвий 400-550
function merch1()
	local radn = math.random(0,9)
	if radn == 0 then
	return 'g001ig0421' -- Борода Имира (Реликвия)
	elseif radn == 1 then
	return 'g000ig4002' -- Книга Воды
	elseif radn == 2 then
	return 'g000ig4001' -- Книга Воздуха
	elseif radn == 3 then
	return 'g000ig4003' -- Книга Земли
	elseif radn == 4 then
	return 'g000ig4004' -- Книга Огня
	elseif radn == 5 then
	return 'g001ig0428' -- Кожаные эльфийские доспехи (Реликвия)
	elseif radn == 6 then
	return 'g000ig4007' -- Медицинский трактат
	elseif radn == 7 then
	return 'g001ig0099' -- Перчатки дуэлянта (Реликвия)
	elseif radn == 8 then
	return 'g000ig3020' -- Череп Танатоса (Реликвия)
	elseif radn == 9 then
	return 'g001ig0426' -- Куртка капитана (Реликвия)
	end
end

-- лавка 1 пул знамён 400
function merch1b()
	local radn = math.random(0,4)
	if radn == 0 then
	return 'g000ig1005' -- Знамя быстроты
	elseif radn == 1 then
	return 'g001ig0051' -- Знамя выносливости
	elseif radn == 2 then
	return 'g000ig1001' -- Знамя защиты
	elseif radn == 3 then
	return 'g000ig1007' -- Знамя силы
	elseif radn == 4 then
	return 'g000ig1003' -- Знамя сражения
	end
end

-- лавка 2 пул артов 700-850
function merch2()
	local radn = math.random(0,13)
	if radn == 0 then
	return 'g001ig0155' -- Благословенный браслет (Артефакт)
	elseif radn == 1 then
	return 'g001ig0045' -- Кровь святого (Артефакт)
	elseif radn == 2 then
	return 'g000ig2003' -- Наручи с черепом (Артефакт)
	elseif radn == 3 then
	return 'g001ig0558' -- Рог возмездия (Артефакт)
	elseif radn == 4 then
	return 'g001ig0557' -- Рог непреклонности (Артефакт)
	elseif radn == 5 then
	return 'g001ig0559' -- Руна благоволения Тиу (Артефакт)
	elseif radn == 6 then
	return 'g001ig0589' -- Щит неведения (Артефакт)
	elseif radn == 7 then
	return 'g001ig0594' -- Щит телохранителя (Артефакт)
	elseif radn == 8 then
	return 'g000ig3003' -- Кольцо силы (Артефакт)
	elseif radn == 9 then
	return 'g001ig0173' -- Пояс травницы (Артефакт)
	elseif radn == 10 then
	return 'g001ig0417' -- Руна верности Моккуркальфи (Артефакт)
	elseif radn == 11 then
	return 'g001ig0196' -- Рунный молот (Артефакт)
	elseif radn == 12 then
	return 'g000ig9137' -- Сердце Имира (Артефакт)
	elseif radn == 13 then
	return 'g001ig0657' -- Топор палача (Артефакт)
	end
end

-- родной талисман
function TalismanHome(race)
	sphmn = 'g000ig9101' -- Талисман Сквайра
	spdw = 'g001ig0265' -- Талисман кузнеца
	spun = 'g001ig0264' -- Талисман мертвеца
	sphr = 'g001ig0267' -- Талисман еретика
	spelf = 'g001ig0266' -- Талисман лесного воина
	
	if race == Race.Human then return sphmn
	elseif race == Race.Dwarf then return spdw
	elseif race == Race.Undead then return spun
	elseif race == Race.Heretic then return sphr
	elseif race == Race.Elf then return spelf
	end
end

-- случайная субраса
function rsub()
	local radn = math.random(0,4)
	if radn == 0 then
	return {Subrace.Human, Subrace.Neutral, Subrace.NeutralHuman, Subrace.NeutralGreenSkin, Subrace.NeutralDragon, Subrace.NeutralMarsh, Subrace.NeutralBarbarian, Subrace.NeutralWolf} --люди
	elseif radn == 1 then
	return {Subrace.Elf, Subrace.Neutral, Subrace.NeutralElf, Subrace.NeutralGreenSkin, Subrace.NeutralDragon, Subrace.NeutralMarsh, Subrace.NeutralBarbarian, Subrace.NeutralWolf} --эльфы
	elseif radn == 2 then
	return {Subrace.Heretic, Subrace.Neutral, Subrace.NeutralGreenSkin, Subrace.NeutralDragon, Subrace.NeutralMarsh, Subrace.NeutralBarbarian, Subrace.NeutralWolf} --демоны
	elseif radn == 3 then
	return {Subrace.Dwarf, Subrace.Neutral, Subrace.NeutralGreenSkin, Subrace.NeutralDragon, Subrace.NeutralMarsh, Subrace.NeutralBarbarian, Subrace.NeutralWolf} --гномы
	elseif radn == 4 then
	return {Subrace.Undead, Subrace.Neutral, Subrace.NeutralGreenSkin, Subrace.NeutralDragon, Subrace.NeutralMarsh, Subrace.NeutralBarbarian, Subrace.NeutralWolf} --нежить
	end
end

-- субраса только не нежить + водные
function NoUndead()
	local radn = math.random(0,3)
	if radn == 0 then
	return {Subrace.Human, Subrace.Neutral, Subrace.NeutralHuman, Subrace.NeutralGreenSkin, Subrace.NeutralDragon, Subrace.NeutralMarsh, Subrace.NeutralBarbarian, Subrace.NeutralWolf, Subrace.NeutralWater} --люди
	elseif radn == 1 then
	return {Subrace.Elf, Subrace.Neutral, Subrace.NeutralElf, Subrace.NeutralGreenSkin, Subrace.NeutralDragon, Subrace.NeutralMarsh, Subrace.NeutralBarbarian, Subrace.NeutralWolf, Subrace.NeutralWater} --эльфы
	elseif radn == 2 then
	return {Subrace.Heretic, Subrace.Neutral, Subrace.NeutralGreenSkin, Subrace.NeutralDragon, Subrace.NeutralMarsh, Subrace.NeutralBarbarian, Subrace.NeutralWolf, Subrace.NeutralWater} --демоны
	elseif radn == 3 then
	return {Subrace.Dwarf, Subrace.Neutral, Subrace.NeutralGreenSkin, Subrace.NeutralDragon, Subrace.NeutralMarsh, Subrace.NeutralBarbarian, Subrace.NeutralWolf, Subrace.NeutralWater} --гномы
	end
end

-- граница зоны 0
function BorCh0()
	if brz == 0 then
	return Border.Close -- закрытые
	elseif brz == 1 then
	return Border.Close -- закрытые
	elseif brz == 2 then
	return Border.Open -- открытые
	elseif brz == 3 then
	return Border.Water -- водные
	elseif brz == 4 then
	return orr(Border.Open, Border.Water) --открытые/водные
	elseif brz == 5 then
	return orr3(Border.Open, Border.Water, Border.Close) --открытые/водные/закрытые
	end
end

-- граница зон 1.1-1.2
function BorCh1()
	if brz == 0 then
	return Border.Open -- открытые (0 для лучшей генерации)
	elseif brz == 1 then
	return Border.Open -- открытые (1 для лучшей генерации)
	elseif brz == 2 then
	return Border.Open -- открытые
	elseif brz == 3 then
	return Border.Water -- водные
	elseif brz == 4 then
	return orr(Border.Open, Border.Water ) --открытые/водные
	elseif brz == 5 then
	return orr3(Border.Open, Border.Water, Border.Close) --открытые/водные/закрытые
	end
end

-- граница зон 2
function BorCh2()
	if brz == 0 then
	return orr3(Border.Open, Border.Water, Border.Close) --открытые/водные/закрытые
	elseif brz == 1 then
	return Border.Close -- закрытые
	elseif brz == 2 then
	return Border.Open -- открытые
	elseif brz == 3 then
	return Border.Water -- водные
	elseif brz == 4 then
	return orr(Border.Open, Border.Water) --открытые/водные
	elseif brz == 5 then
	return orr3(Border.Open, Border.Water, Border.Close) --открытые/водные/закрытые
	end
end

-- граница зоны 3
function BorCh3()
	if brz == 0 then
	return Border.Close -- закрытые
	elseif brz == 1 then
	return Border.Close -- закрытые
	elseif brz == 2 then
	return Border.Open -- открытые
	elseif brz == 3 then
	return Border.Water -- водные
	elseif brz == 4 then
	return orr(Border.Open, Border.Water) --открытые/водные
	elseif brz == 5 then
	return orr3(Border.Open, Border.Water, Border.Close) --открытые/водные/закрытые
	end
end


----------------------
-- Отряды респ зона 0
---------------------

function z0Stacks12(itm) -- банка15
return {  
		subraceTypes = { Subrace.NeutralGreenSkin, Subrace.NeutralWolf },
		count = 1,
		value = { min = v01*kef, max = v01*kef*kr },
		loot = {
			items = {
				{ id = 'g001ig0180', min = 1, max = 1}, -- хил25
				{ id = itm, min = 1, max = 1 },
			}
		}
}
end

function z0Stacks34(itm) -- вард15
return {  
		subraceTypes = { Subrace.NeutralGreenSkin, Subrace.NeutralWolf },
		count = 1,
		value = { min = v02*kef, max = v02*kef*kr },
		loot = {
			items = {
				{ id = 'g001ig0180', min = 1, max = 1}, -- хил25
				{ id = itm, min = 1, max = 1 },
			}
		}
}
end

function z0Stacks5()  -- разума/смерти	
return {  
		subraceTypes = { Subrace.NeutralGreenSkin, Subrace.NeutralWolf },
		count = 1,
		value = { min = v03*kef, max = v03*kef*kr },
		loot = {
			items = {
				orr({ id = 'g000ig0005', min = 1, max = 1}, { id = 'g001ig0180', min = 2, max = 2}), -- хил50/2хил25
				orr({ id = 'g001ig0125', min = 1, max = 1}, { id = 'g001ig0036', min = 1, max = 1}), -- разума/смерти				
			}
		}
}
end

function z0Stacks6() -- сфера100
return {  
		subraceTypes = { Subrace.NeutralGreenSkin, Subrace.NeutralWolf, Subrace.NeutralMarsh },
		count = 1,
		value = { min = v04*kef, max = v04*kef*kr },
		loot = {
			itemTypes = { Item.Orb },
			value = { min = 100, max = 100 },
			itemValue = { min = 100, max = 100 },
			items = {
				{ id = 'g000ig0005', min = 1, max = 1}, -- хил50
			}
		}
}
end

function z0Stacks7() -- драги
return {  
		subraceTypes = { Subrace.NeutralGreenSkin, Subrace.NeutralWolf, Subrace.NeutralMarsh, Subrace.NeutralBarbarian },
		count = 1,
		value = { min = v05*kef, max = v05*kef*kr },
		loot = {
			items = {
				{ id = 'g001ig0378', min = 1, max = 1}, -- хил75			
				orr({ id = rmss(), min = 1, max = 1 }, { id = 'g001ig0431', min = 1, max = 1 }), --случ.мал.шар/гранат75
			}
		}
}
end

function z0Stacks8() -- арт
return {  
		subraceTypes = { Subrace.NeutralElf, Subrace.Elf, Subrace.Dwarf, Subrace.Heretic, Subrace.Undead },
		count = 1,
		value = { min = v06*kef, max = v06*kef*kr },
		loot = {
			items = {
				{ id = 'g001ig0378', min = 1, max = 1}, -- хил75	
				orr({ id = rmss(), min = 1, max = 1 }, { id = 'g000ig7001', min = 1, max = 1 }), --случ.мал.шар/кольцо50
				orr({ id = item0(), min = 1, max = 1}, { id = wand1(), min = 1, max = 1}),
			}
		}
}
end

--------------
-- Отряды зона 1
--------------

function z1Stacks14(val, itm) -- =f.проход01 банка15/вард15
return {  
		subraceTypes = rsub(),
		count = 1,
		value = { min = val*kef, max = val*kef*kr },
		loot = {
			items = {
				{ id = 'g001ig0378', min = 1, max = 1}, -- хил75			
				{ id = itm, min = 1, max = 1 },
			}
		}
}
end

function z1Stacks5(val) -- =f.проход01 сфера
return {  
		subraceTypes = rsub(),
		count = 1,
		value = { min = val*kef, max = val*kef*kr },
		loot = {
			itemTypes = { Item.Orb },
			value = { min = 200, max = 200 },
			itemValue = { min = 200, max = 200 },
			items = {
				{ id = 'g001ig0378', min = 1, max = 1}, -- хил75			
			}
		}
}
end

function z1Stacks6(val) -- =f.проход01 свиток 
return {  
		subraceTypes = NoUndead(),
		count = 1,
		value = { min = val*kef, max = val*kef*kr },
		loot = {
			itemTypes = { Item.Scroll },
			value = { min = 200, max = 200 },
			itemValue = { min = 200, max = 200 },
			items = {
				{ id = 'g001ig0378', min = 1, max = 1}, -- хил75			
				{ id = 'g001ig0180', min = 1, max = 1}, -- хил25
			}
		}
}
end

function z1Stacks7(val) -- =f.проход01 рес
return {  
		subraceTypes = NoUndead(),
		count = 1,
		value = { min = val*kef, max = val*kef*kr },
		loot = {
			items = {
				{ id = 'g000ig0001', min = 1, max = 1}, -- рес
				orr({ id = 'g000ig0005', min = 2, max = 2}, { id = 'g000ig0006', min = 1, max = 1}), -- хил50*2/хил100
			}
		}
}
end

function z1Stacks8(val) -- =f.проход01 драги
return {  
		subraceTypes = NoUndead(),
		count = 1,
		value = { min = val*kef, max = val*kef*kr },
		loot = {
			items = {
				orr3({ id = 'g000ig0005', min = 2, max = 2}, { id = 'g000ig0006', min = 1, max = 1}, { id = 'g000ig0001', min = 1, max = 1}), -- хил50*2/хил100/рес
				{ id = 'g001ig0180', min = 1, max = 1}, -- хил25
				orr({ id = rms(), min = 1, max = 1 }, { id = 'g000ig7002', min = 1, max = 1 }), --случ.шар/кольцо100				
			}
		}
}
end

function z1Stacks9() -- арт
return {  
		subraceTypes = { Subrace.NeutralElf, Subrace.Elf, Subrace.Dwarf, Subrace.Heretic },
		count = 1,
		value = { min = v16*kef, max = v16*kef*kr },
		loot = {
			items = {
				{ id = 'g001ig0378', min = 1, max = 1}, -- хил75			
				watorr({ id = 'g000ig5027', min = 1, max = 1}, { id = 'g000ig0001', min = 1, max = 1}), -- свит.мореплавание/рес
				orr({ id = rmss(), min = 1, max = 1 }, { id = 'g001ig0431', min = 1, max = 1 }), --случ.мал.шар/гранат75
				-- знамя400 / знамя400 / релик 400-550/ Эликсир обновления +30 реген
				orr(orr({ id = merch1b(), min = 1, max = 1 }, { id = merch1b(), min = 1, max = 1 }), orr({ id = merch1(), min = 1, max = 1 }, { id = 'g001ig0376', min = 1, max = 1 })),
			}
		}
}
end

------------------
-- Отряды зона 2
------------------

function z2Stacks13(val, itm) -- =f.проход12 эликсир200
return {  
		subraceTypes = rsub(),
		count = 1,
		value = { min = val*kef, max = val*kef*kr },
		loot = {
			items = {
				orr({ id = 'g000ig0005', min = 2, max = 2}, { id = 'g000ig0006', min = 1, max = 1}), -- хил50*2/хил100
				{ id = 'g001ig0180', min = 1, max = 1}, -- хил25
				{ id = itm, min = 1, max = 1 },
			}
		}
}
end

function z2Stacks4(val) -- =f.проход12 сфера200
return {  
		subraceTypes = rsub(),
		count = 1,
		value = { min = val*kef, max = val*kef*kr },
		loot = {
			itemTypes = { Item.Orb },
			value = { min = 400, max = 400 },
			itemValue = { min = 400, max = 400 },		
			items = {
				{ id = 'g000ig0006', min = 1, max = 1}, -- хил100
				{ id = 'g000ig0005', min = 1, max = 1}, -- хил50
			}
		}
}
end

function z2Stacks5(val) -- =f.проход12 свиток400
return {  
		subraceTypes = rsub(),
		count = 1,
		value = { min = val*kef, max = val*kef*kr },
		loot = {
			itemTypes = { Item.Scroll },
			value = { min = 400, max = 400 },
			itemValue = { min = 400, max = 400 },
			items = {
				{ id = 'g001ig0378', min = 2, max = 2}, -- хил75			
				{ id = 'g001ig0180', min = 1, max = 1}, -- хил25
			}
		}
}
end

function z2Stacks6(val) -- =f.проход12 рес + хил/банка15
return {  
		subraceTypes = NoUndead(),
		count = 1,
		value = { min = val*kef, max = val*kef*kr },
		loot = {
			items = {
				{ id = 'g000ig0001', min = 1, max = 1}, -- рес
				orr({ id = 'g000ig0005', min = 2, max = 2}, { id = 'g000ig0006', min = 1, max = 1}), -- хил50*2/хил100
				orr({ id = b15(), min = 1, max = 1}, { id = 'g000ig0005', min = 1, max = 1}), -- банка15/хил50
				{ id = 'g001ig0180', min = 1, max = 1}, -- хил25
			}
		}
}
end

function z2Stacks7(val) -- =f.проход12 драги + хил вард/дотвард
return {  
		subraceTypes = NoUndead(),
		count = 1,
		value = { min = val*kef, max = val*kef*kr },
		loot = {
			items = {
				orr({ id = 'g000ig0005', min = 2, max = 2}, { id = 'g000ig0006', min = 1, max = 1}), -- хил50*2/хил100
				{ id = 'g000ig0005', min = 1, max = 1}, -- хил50
				orr({ id = 'g000ig0008', min = 1, max = 1}, { id = 'g000ig0005', min = 1, max = 1}), -- точность15/хил50
				orr({ id = rms(), min = 1, max = 1 }, { id = 'g001ig0432', min = 1, max = 1 }), --случ.шар/Аметист (Драгоценность)125				
			}
		}
}
end

function z2Stacks8() --арт
return {  
		subraceTypes = { Subrace.NeutralElf, Subrace.Elf, Subrace.Dwarf, Subrace.Heretic },
		count = 1,
		value = { min = v26*kef, max = v26*kef*kr },
		loot = {
			items = {
				orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --рес/хил100
				{ id = 'g000ig0006', min = 1, max = 1}, -- хил100
				orr({ id = rms(), min = 1, max = 1 }, { id = 'g000ig7002', min = 1, max = 1 }), --случ.шар/кольцо100
				-- арт 700-850 / Аура регенерации +10 реген аое / пермо5%
				orr3({ id = merch2(), min = 1, max = 1 }, { id = 'g001ig0026', min = 1, max = 1 }, { id = p05(), min = 1, max = 1 }),
			}
		}
}
end

--------------------
-- Отряды зона 3
--------------------

function z3Stacks14(itm) --эликсир400
return {  
		subraceTypes = rsub(),
		count = 1,
		value = { min = v31*kef, max = v31*kef*kr },
		loot = {
			items = {
				orr({ id = 'g000ig0005', min = 2, max = 2}, { id = 'g000ig0006', min = 1, max = 1}), -- хил50*2/хил100
				{ id = 'g000ig0006', min = 1, max = 1}, -- хил100
				{ id = itm, min = 1, max = 1 },
			}
		}
}
end

function z3Stacks58(itm) --пермо5
return {  
		subraceTypes = rsub(),
		count = 1,
		value = { min = v32*kef, max = v32*kef*kr },
		loot = {
			items = {
				{ id = 'g000ig0006', min = 1, max = 1}, -- хил100
				{ id = 'g000ig0006', min = 1, max = 1}, -- хил100
				{ id = itm, min = 1, max = 1 },
			}
		}
}
end

function z3Stacks9() --сфера
return {  
		subraceTypes = rsub(),
		count = 1,
		value = { min = v33*kef, max = v33*kef*kr },
		loot = {
			itemTypes = { Item.Orb },
			value = { min = 500, max = 600 },
			itemValue = { min = 500, max = 600 },				
			items = {
				{ id = 'g001ig0378', min = 2, max = 2}, -- хил75
				{ id = 'g000ig0005', min = 1, max = 1}, -- хил50
				{ id = 'g001ig0180', min = 1, max = 1}, -- хил25
			}
		}
}
end

function z3Stacks10() --свиток
return {  
		subraceTypes = NoUndead(),
		count = 1,
		value = { min = v34*kef, max = v34*kef*kr },
		loot = {
			itemTypes = { Item.Scroll },
			value = { min = 550, max = 550 },
			itemValue = { min = 550, max = 550 },
			items = {
				orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --рес/хил100
				{ id = 'g000ig0006', min = 1, max = 1}, -- хил100
				{ id = 'g001ig0180', min = 1, max = 1}, -- хил25
			}
		}
}
end

function z3Stacks11() --рес + хил/банка15
return {  
		subraceTypes = NoUndead(),
		count = 1,
		value = { min = v35*kef, max = v35*kef*kr },
		loot = {
			items = {
				{ id = 'g000ig0001', min = 1, max = 1}, -- рес
				{ id = 'g000ig0006', min = 1, max = 1}, -- хил100
				orr({ id = 'g000ig0005', min = 2, max = 2}, { id = 'g000ig0006', min = 1, max = 1}), -- хил50*2/хил100
				orr({ id = b15(), min = 1, max = 1}, { id = 'g000ig0005', min = 1, max = 1}), -- банка15/хил50
			}
		}
}
end

function z3Stacks12() --драги + вард разум/вард смерть/хил
return {  
		subraceTypes = NoUndead(),
		count = 1,
		value = { min = v36*kef, max = v36*kef*kr },
		loot = {
			items = {
				orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --рес/хил100
				{ id = 'g000ig0006', min = 1, max = 1}, -- хил100
				orr3({ id = 'g001ig0125', min = 1, max = 1 }, { id = 'g001ig0036', min = 1, max = 1 }, { id = 'g001ig0378', min = 1, max = 1}), -- вард разум/вард смерть/хил75	
				orr3({ id = rmsb(), min = 1, max = 1 }, { id = 'g001ig0486', min = 1, max = 1 }, { id = 'g000ig7003', min = 1, max = 1 }), --случ.боль.шар/Малый шар колдовства/Изумруд (Драгоценность) 150
			}
		}
}
end

function z3Stacks13() -- арт
return {  
		subraceTypes = { Subrace.NeutralElf, Subrace.Elf, Subrace.Dwarf, Subrace.Heretic },
		count = 1,
		value = { min = v37*kef, max = v37*kef*kr },
		loot = {
			items = {
				{ id = 'g000ig0001', min = 1, max = 1}, -- рес
				orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --рес/хил100
				{ id = 'g000ig0006', min = 1, max = 1}, -- хил100
				{ id = 'g000ig0005', min = 1, max = 1}, -- хил50
				-- пермо10 / Великая аура тролля +20 реген аое / Аура силы +5урон.аое / Аура брони +5броня.аое / Аура скорости +5ини.аое
				orr5({ id = p10pl(), min = 1, max = 1 }, { id = 'g001ig0018', min = 1, max = 1 }, { id = 'g001ig0029', min = 1, max = 1 }, { id = 'g001ig0027', min = 1, max = 1 }, { id = 'g001ig0030', min = 1, max = 1 }),
			}
		}
}
end
	
-------------------------

-- Охрана объектов

function guard1n() -- у наёмников 1
return { 
	subraceTypes = { Subrace.NeutralGreenSkin, Subrace.NeutralMarsh, Subrace.NeutralBarbarian},

	value = { min = v15*kef, max = v15*kef*kr },
	loot = {
		items = {
			orr({ id = 'g000ig0005', min = 2, max = 2}, { id = 'g000ig0006', min = 1, max = 1}), -- хил50*2/хил100
			{ id = 'g001ig0180', min = 1, max = 1}, -- хил25
			orr3({ id = rmss(), min = 1, max = 1 }, { id = rmss(), min = 1, max = 1 }, { id = 'g000ig7001', min = 1, max = 1 }), --случ.мал.шар/случ.мал.шар/кольцо50
			-- Рунный камень (Артефакт) / Гномьи наручи (Артефакт) / Книга колдовства / Легкие сапоги|Укрепленные сапоги / Посохи т1
			orr5({id = 'g000ig2001', min = 1, max = 1}, {id = 'g000ig3001', min = 1, max = 1}, {id = 'g001ig0497', min = 1, max = 1}, orr({id = 'g001ig0110', min = 1, max = 1}, { id = 'g001ig0113', min = 1, max = 1 }), { id = wand1(), min = 1, max = 1 }),
		},
	}
}
end

function guard2m() -- у башни 2
return { 
	subraceTypes = { Subrace.NeutralGreenSkin, Subrace.NeutralMarsh, Subrace.NeutralBarbarian},

	value = { min = v25*kef, max = v25*kef*kr },
	loot = {
		items = {
			orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --рес/хил100
			orr3({ id = b15(), min = 1, max = 1}, { id = w15(), min = 1, max = 1}, { id = 'g001ig0378', min = 1, max = 1}), -- банка15/вард/хил75
			orr3({ id = rmss(), min = 1, max = 1 }, { id = rmss(), min = 1, max = 1 }, { id = 'g001ig0431', min = 1, max = 1 }), --случ.мал.шар/случ.мал.шар/гранат75
			--  Руна защиты Фрейра (Артефакт) / Потайной кинжал (Артефакт) / Сапоги ассасина|Тяжелые сапоги / Книга тайного знания (сферы) | Талисман Восстановления 400 / Талисман призыва нейтралов II 450 / Талисман щита стихий 500
			orr5({id = 'g001ig0418', min = 1, max = 1}, {id = 'g002ig0001', min = 1, max = 1}, orr({id = 'g001ig0111', min = 1, max = 1}, {id = 'g001ig0114', min = 1, max = 1}), {id = 'g000ig4006', min = 1, max = 1}, orr3({ id = 'g001ig0184', min = 1, max = 1 }, { id = 'g000ig9109', min = 1, max = 1 }, { id = 'g000ig9120', min = 1, max = 1 })),
		},
	}
}
end

function guard3n() -- у наёмников 3
return { 
	subraceTypes = { Subrace.NeutralGreenSkin, Subrace.NeutralMarsh, Subrace.NeutralBarbarian},

	value = { min = v35*kef, max = v35*kef*kr },
	loot = {
		items = {
			{ id = 'g000ig0001', min = 1, max = 1}, -- рес
			{ id = 'g000ig0006', min = 1, max = 1}, -- хил100
			orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --рес/хил100
			orr3({ id = b15(), min = 1, max = 1}, { id = w15(), min = 1, max = 1}, { id = 'g001ig0378', min = 1, max = 1}), -- банка15/вард/хил75
			orr3({ id = rms(), min = 1, max = 1 }, { id = rms(), min = 1, max = 1 }, { id = 'g000ig7002', min = 1, max = 1 }), --случ.шар/случ.шар/кольцо100
			-- Святая чаша (Артефакт) / Кинжал Вампиризма (Артефакт) / Счастливая кость (Артефакт) / Лютня Очарования (Реликвия) / Посох Возни|Посох защиты|Посох скальда
			orr5({id = 'g000ig2002', min = 1, max = 1}, {id = 'g000ig3017', min = 1, max = 1}, {id = 'g001ig0182', min = 1, max = 1}, {id = 'g000ig3022', min = 1, max = 1}, orr3({id = 'g000ig6020', min = 1, max = 1}, {id = 'g000ig6014', min = 1, max = 1}, {id = 'g001ig0398', min = 1, max = 1})),
		},
	}
}
end

-------------------------
-- проходы 23

function guard31() -- сфера / свиток 500-550
return {  
		subraceTypes = NoUndead(),
		count = 1,
		value = { min = v33*kef, max = v33*kef*kr },
		loot = {
			itemTypes = { Item.Orb, Item.Scroll },
			value = { min = 500, max = 600 },
			itemValue = { min = 500, max = 600 },
			items = {
				{ id = 'g000ig0006', min = 1, max = 1}, -- хил100
				orr3({ id = w15(), min = 1, max = 1}, { id = 'g001ig0351', min = 1, max = 1}, { id = 'g000ig0006', min = 1, max = 1}), -- вард/вард-поглащения/хил100		
			}
		}
}
end

function guard32() -- драги
return {  
		subraceTypes = NoUndead(),
		count = 1,
		value = { min = v33*kef, max = v33*kef*kr },
		loot = {
			itemTypes = { Item.Valuable },
			value = { min = 500, max = 500 },
			itemValue = { min = 500, max = 500 },
			items = {
				orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --рес/хил100
				{ id = 'g000ig0006', min = 1, max = 1}, -- хил100
			}
		}
}
end

function guard33() -- рес + пермо.вард/пермо5 
return {  
		subraceTypes = NoUndead(),
		count = 1,
		value = { min = v33*kef, max = v33*kef*kr },
		loot = {
			items = {
				{ id = 'g000ig0001', min = 1, max = 1 }, --рес
				orr5({ id = pw5(), min = 1, max = 1 }, { id = pw6(), min = 1, max = 1 }, { id = pw5(), min = 1, max = 1 }, { id = pw6(), min = 1, max = 1 }, { id = p05(), min = 1, max = 1 }), -- пермо.вард 500 / пермо.вард 600 / пермо.вард 500 / пермо.вард 600 / пермо5
				{ id = 'g000ig0006', min = 1, max = 1}, -- хил100
				{ id = 'g000ig0005', min = 1, max = 1}, -- хил50
			}
		}
}
end

-- проход 03 дракон
function guard03() -- рандом предмет + навык + сфера/свиток 
return {  
		subraceTypes = { Subrace.NeutralDragon, Subrace.Human, Subrace.Heretic, Subrace.Dwarf, Subrace.Elf }, -- Subrace.Undead, убрал
		count = 1,
		value = { min = vp03*kef, max = vp03*kef*kr },
		loot = {
			itemTypes = { Item.Armor, Item.Jewel, Item.Weapon, Item.Banner, Item.Talisman, Item.TravelItem },
			value = { min = 600, max = 700 },
			itemValue = { min = 600, max = 700 },
			items = {
				{ id = 'g000ig0001', min = 2, max = 2 }, --рес
				{ id = 'g000ig0006', min = 2, max = 2 }, --хил100
				{ id = p05(), min = 1, max = 1 }, -- пермо5
				-- Сфера 700-800 / Свиток "Проворство"/Свиток "Поспешность"/Свиток "Проклятие безволия/Свиток "Забвение"/Свиток "Неподкупность"
				orr({ id = spherex(), min = 1, max = 1 }, orr5({ id = 'g000ig5120', min = 1, max = 1 },{ id = 'g001ig0094', min = 1, max = 1 },{ id = 'g001ig0440', min = 1, max = 1 },{ id = 'g001ig0165', min = 1, max = 1 },{ id = 'g000ig5039', min = 1, max = 1 })),
			}
		}
}
end

----------------------

-- СВОДНЫЕ ТАБЛИЦЫ

-- Вернет таблицу с описанием Респа 0
function getPlayerZone0(zoneId, playerRace, zoneSize)
	return {
		id = zoneId,
		type = Zone.PlayerStart,
		race = playerRace,
		size = zoneSize,
		border = BorCh0(),
		mines = getMinesRespZ(playerRace),
		bags = bags0(),
--		ruins = zoneRuinRespZ0(),
		stacks = {	z0Stacks12(orr('g000ig0011','g000ig0002')), --ини15/защита15 
					z0Stacks12(orr('g000ig0014','g000ig0008')), --атака15/точность15
					z0Stacks34(orr('g000ig0021','g000ig0024')), --возд/огня
					z0Stacks34(orr('g000ig0022','g000ig0023')), --воды/земли
					z0Stacks5(), z0Stacks6(), z0Stacks7(), z0Stacks8(),
		},

		capital = {
			garrison = { -- столица
				subraceTypes = { getPlayerSubRace(playerRace) },
				value = { min = 50, max = 50 }, 
				loot = {
					items = {
						{ id = 'g000ig0001', min = 6, max = 6}, -- рес
						{ id = 'g000ig0006', min = 6, max = 6}, -- хил100
						{ id = 'g001ig0378', min = 5, max = 5}, -- хил75
						{ id = 'g000ig0005', min = 5, max = 5}, -- хил50
						{ id = 'g001ig0180', min = 5, max = 5}, -- хил25
 
						{ id = b15(), min = 1, max = 1 },  -- случ. банка15
						orr({ id = 'g000ig0014', min = 1, max = 1 }, { id = 'g000ig0002', min = 1, max = 1 }), --атака15/защита15
						orr({ id = 'g000ig0011', min = 1, max = 1 }, { id = 'g000ig0008', min = 1, max = 1 }), --ини15/точность15
						{ id = 'g000ig0011', min = 1, max = 1 }, --ини15
						{ id = 'g000ig0008', min = 2, max = 2 }, --точность15

						{ id = w15(), min = 1, max = 1 }, -- случ. вард
						orr({ id = 'g000ig0021', min = 1, max = 1 }, { id = 'g000ig0024', min = 1, max = 1 }), --возд/огня
						orr({ id = 'g000ig0022', min = 1, max = 1 }, { id = 'g000ig0023', min = 1, max = 1 }), --воды/земли
						{ id = 'g000ig0024', min = 1, max = 1 }, --огня
						{ id = 'g000ig0021', min = 1, max = 1 }, --возд
						{ id = 'g000ig0022', min = 1, max = 1 }, --воды
						
						orr(orr({ id = 'g001ig0458', min = 1, max = 1}, { id = 'g000ig9031', min = 1, max = 1}), orr({ id = 'g000ig9022', min = 1, max = 1}, { id = 'g001ig0302', min = 1, max = 1})), -- 25 Сфера Каменного проклятия / Сфера Ливня | Сфера Углей / Сфера Шторма
						orr(orr({ id = 'g001ig0189', min = 1, max = 1}, { id = 'g001ig0178', min = 1, max = 1}), orr({ id = 'g001ig0472', min = 1, max = 1}, { id = 'g001ig0473', min = 1, max = 1})), -- 50 Сфера Камня / Сфера Костра | Сфера Ледяного осколка / Сфера Статического разряда
												
--						orr(orr({ id = 'g000ig5021', min = 1, max = 1}, { id = 'g000ig5003', min = 1, max = 1}), orr({ id = 'g001ig0250', min = 1, max = 1}, { id = 'g000ig5023', min = 1, max = 1})), -- свиток л.щит, сила, с.кости, с.витара
--						orr(orr({ id = 'g001ig0248', min = 1, max = 1}, { id = 'g000ig5045', min = 1, max = 1}), orr({ id = 'g000ig5064', min = 1, max = 1}, { id = 'g000ig5101', min = 1, max = 1})), -- свиток устр. гимн, tormentio-броня, слабость, стая 
						
						orr3(orr({id = 'g000ig9105', min = 1, max = 1}, {id = 'g000ig9131', min = 1, max = 1}), {id = TalismanHome(playerRace), min = 1, max = 1}, {id = TalismanHome(playerRace), min = 1, max = 1}), -- Талисман Костра / Талисман Ливня | Родной талик / Родной талик

						{ id = startitm(), min = 1, max = 1 }, --стартовый предмет

						--посох200
						{ id = wand1(), min = 1, max = 1 },				

						orr({ id = 'g000ig7003', min = 1, max = 1 }, { id = 'g001ig0486', min = 1, max = 1 }), -- изумруд150/Малый шар колдовства50каждой
						{ id = ExtraManaProject4(playerRace), min = 1, max = 1 }, --доп.шар
						orr3({ id = rmss(), min = 1, max = 1 }, { id = 'g000ig7001', min = 1, max = 1 }, { id = 'g000ig7001', min = 1, max = 1 }), --случ.мал.шар/кольцо50/кольцо50
					}
				},
			},
--			spells = {
--				CapSpell(playerRace)
--			}			
		}
	}
end

-- сводная зоны 1.1 =

function getPlayerZone11(zoneId, playerRace, zoneSize)
	return {
		id = zoneId,
		type = Zone.Junction,
		border = BorCh1(),
		race = playerRace,
		size = zoneSize,
		ruins = zoneRuinRespZ(),
		merchants = zoneMerch1(),
		bags = bags1(),
		mines = getMinesRespZ11(playerRace),
		mercenaries = zoneMercenZone1(playerRace),
		stacks = {
			z1Stacks14(v11, orr('g000ig0011','g000ig0021')), --ини/воздух
			z1Stacks14(v11, orr('g000ig0002','g000ig0024')), --защита/огонь
			z1Stacks14(v11, orr('g000ig0014','g000ig0022')), --атака/вода
			z1Stacks14(v11, orr('g000ig0008','g000ig0023')), --точность/земля
			z1Stacks5(v12), z1Stacks6(v13), z1Stacks7(v14), z1Stacks8(v15), z1Stacks9(),
		},
	}
end

-- сводная зоны 1.2 =
function getPlayerZone12(zoneId, playerRace, zoneSize)
	return {
		id = zoneId,
		type = Zone.Junction,
		border = BorCh1(),
		race = playerRace,
		size = zoneSize,
		ruins = zoneRuinRespZ(),
		merchants = zoneMerch1(),
		bags = bags1(),
		mines = getMinesRespZ12(playerRace),
		mercenaries = zoneMercenZone1(playerRace),
		stacks = {
			z1Stacks14(v11, orr('g000ig0011','g000ig0021')), --ини/воздух
			z1Stacks14(v11, orr('g000ig0002','g000ig0024')), --защита/огонь
			z1Stacks14(v11, orr('g000ig0014','g000ig0022')), --атака/вода
			z1Stacks14(v11, orr('g000ig0008','g000ig0023')), --точность/земля
			z1Stacks5(v12), z1Stacks6(v13), z1Stacks7(v14), z1Stacks8(v15), z1Stacks9(),
		},
	}
end


-- сводная зоны 2
function getTreasureZone2(zoneId, playerRace, playerRace2, zoneSizeTre)
	return {
		id = zoneId,
		race = playerRace,
		race2 = playerRace2,
		type = Zone.Junction,
		border = BorCh2(),
		bags = bags2(),
		size = zoneSizeTre,
		ruins = zoneRuinZone2(),
		merchants = zoneMerch2(),
		mines = getMinesZone2(playerRace, playerRace2),
		mages = zoneMageResp2(),		
		stacks = {
			z2Stacks13(v21, 'g001ig0560'), --Зелье провокатора 25принять
			z2Stacks13(v21, 'g001ig0547'), --Зелье пронзающего взгляда +10крит
			z2Stacks13(v21, 'g001ig0490'), --Зелье выносливости +25оз
			z2Stacks4(v22), z2Stacks5(v23), z2Stacks6(v24), z2Stacks7(v25), z2Stacks8(),
		},

--		towns = zoneTowns2(playerRace),
	}
end

-- сводная зоны 3
function getTreasureZone3(zoneId, playerRace, playerRace2, zoneSizeTre)
	return {
		id = zoneId,
		race = playerRace,
		race2 = playerRace2,
		type = Zone.Treasure,  -- Junction -- Treasure
		border = BorCh3(),
		size = zoneSizeTre,
		ruins = zoneRuinZone3(),
		merchants = zoneMerchZone3(),
		mercenaries = zoneMercenZone3(),
		bags = bags3(),
		mines = getMinesZone3(playerRace, playerRace2),
		stacks = { 
			z3Stacks14('g001ig0562'), -- Зелье дуэлянта +20крит
			z3Stacks14('g001ig0491'), -- Зелье похищения жизни +25вамп
			z3Stacks14('g001ig0355'), -- Зелье тритоньей чешуи +вардурон
			z3Stacks14('g001ig0127'), -- Эликсир жизненной силы +50максоз
			
			z3Stacks58('g001ig0309'), -- Эликсир задиры +5ини
			z3Stacks58('g001ig0313'), -- Эликсир совершенствования +5урон
			z3Stacks58('g001ig0311'), -- Эликсир хладнокровия +5точности
			z3Stacks58('g001ig0307'), -- Зелье стойкости +5брони
			
			z3Stacks9(), z3Stacks10(), z3Stacks11(), z3Stacks12(), z3Stacks13(),
		},

--		towns = zoneTownsZone3(),
--		mages = zoneMage3(),		
--		trainers = {{}, {}},
	}
end

-------------------------------------------------


-- РАЗМЕРЫ ЗОН: Вернет таблицу с зонами

local z0 = 34 --3
local z1 = 40 --4
local z2 = 50 --5
local zc = 58 --6


function getZones(races)
	local zones = {}

	zones[1] = getPlayerZone0(0, races[1], z0) -- 
	zones[2] = getPlayerZone11(1, races[1], z1) -- 
	zones[3] = getPlayerZone12(2, races[1], z1) -- 

	zones[4] = getPlayerZone0(3, races[2], z0) -- 
	zones[5] = getPlayerZone12(5, races[2], z1) -- 
	zones[6] = getPlayerZone11(6, races[2], z1) -- 

	zones[7] = getTreasureZone2(7, races[1], races[2], z2) -- 
	zones[8] = getTreasureZone2(8, races[1], races[2], z2) -- 
	
	zones[9] = getTreasureZone3(4, races[1], races[2], zc) -- чёрный


	return zones
end

----------------------

-- ПРОХОДЫ: Вернет таблицу с проходами между зонами:
function getZoneConnections()

	return {

{from = 0, to = 1, guard = z1Stacks14(v13, orr3(b15(),w15(),e2()))},
{from = 0, to = 1, guard = z1Stacks5(v13)},
{from = 0, to = 1, guard = z1Stacks6(v13)},
{from = 0, to = 1, guard = z1Stacks7(v13)},
{from = 0, to = 1, guard = z1Stacks8(v13)},

{from = 0, to = 2, guard = z1Stacks14(v13, orr3(b15(),w15(),e2()))},
{from = 0, to = 2, guard = z1Stacks5(v13)},
{from = 0, to = 2, guard = z1Stacks6(v13)},
{from = 0, to = 2, guard = z1Stacks7(v13)},
{from = 0, to = 2, guard = z1Stacks8(v13)},
--
{from = 3, to = 5, guard = z1Stacks14(v13, orr3(b15(),w15(),e2()))},
{from = 3, to = 5, guard = z1Stacks5(v13)},
{from = 3, to = 5, guard = z1Stacks6(v13)},
{from = 3, to = 5, guard = z1Stacks7(v13)},
{from = 3, to = 5, guard = z1Stacks8(v13)},

{from = 3, to = 6, guard = z1Stacks14(v13, orr3(b15(),w15(),e2()))},
{from = 3, to = 6, guard = z1Stacks5(v13)},
{from = 3, to = 6, guard = z1Stacks6(v13)},
{from = 3, to = 6, guard = z1Stacks7(v13)},
{from = 3, to = 6, guard = z1Stacks8(v13)},
--
--
{from = 7, to = 1, guard = z2Stacks13(v23, e4())},
{from = 7, to = 1, guard = z2Stacks4(v23)},
{from = 7, to = 1, guard = z2Stacks5(v23)},
{from = 7, to = 1, guard = z2Stacks6(v23)},
{from = 7, to = 1, guard = z2Stacks7(v23)},

{from = 7, to = 5, guard = z2Stacks13(v23, e4())},
{from = 7, to = 5, guard = z2Stacks4(v23)},
{from = 7, to = 5, guard = z2Stacks5(v23)},
{from = 7, to = 5, guard = z2Stacks6(v23)},
{from = 7, to = 5, guard = z2Stacks7(v23)},
--
{from = 8, to = 2, guard = z2Stacks13(v23, e4())},
{from = 8, to = 2, guard = z2Stacks4(v23)},
{from = 8, to = 2, guard = z2Stacks5(v23)},
{from = 8, to = 2, guard = z2Stacks6(v23)},
{from = 8, to = 2, guard = z2Stacks7(v23)},

{from = 8, to = 6, guard = z2Stacks13(v23, e4())},
{from = 8, to = 6, guard = z2Stacks4(v23)},
{from = 8, to = 6, guard = z2Stacks5(v23)},
{from = 8, to = 6, guard = z2Stacks6(v23)},
{from = 8, to = 6, guard = z2Stacks7(v23)},
--
--
{from = 1, to = 4, guard = guard31()},
{from = 1, to = 4, guard = guard32()},
{from = 1, to = 4, guard = guard33()},
--
{from = 7, to = 4, guard = guard31()},
{from = 7, to = 4, guard = guard32()},
{from = 7, to = 4, guard = guard33()},

{from = 5, to = 4, guard = guard31()},
{from = 5, to = 4, guard = guard32()},
{from = 5, to = 4, guard = guard33()},
--
{from = 6, to = 4, guard = guard31()},
{from = 6, to = 4, guard = guard32()},
{from = 6, to = 4, guard = guard33()},

{from = 8, to = 4, guard = guard31()},
{from = 8, to = 4, guard = guard32()},
{from = 8, to = 4, guard = guard33()},
--
{from = 2, to = 4, guard = guard31()},
{from = 2, to = 4, guard = guard32()},
{from = 2, to = 4, guard = guard33()},
--
--
{from = 0, to = 4, guard = guard03()},
{from = 3, to = 4, guard = guard03()},

}
end

-- Вернет описание содержимого сценария для генератора - ОК
function getTemplateContents(races)
	local contents = {}
	
	contents.zones = getZones(races)
	contents.connections = getZoneConnections()

	return contents
end

-- Название шаблона
function nametempl()
	local name0 = 'Ultimate 1.2'
	if brz == 0 then nameplus = ' [0-close/corner_random]'
	elseif brz == 1 then nameplus = ' [1-close]'
	elseif brz == 2 then nameplus = ' [2-open]'
	elseif brz == 3 then nameplus = ' [3-water]'
	elseif brz == 4 then nameplus = ' [4-open|water]'
	elseif brz == 5 then nameplus = ' [5-random]'
	end
	return name0..nameplus
end	

-- ШАБЛОН
template = {
	name = nametempl(),
	description = 'Шаблон для игры без пвп-правил.\nЧерная зона в центре, ее должны касаться все остальные зоны.\nУсловие победы: убить всех лидеров соперника или соперник сдался.\nСпасибо за поддержку! Карта Тинькофф: 2200700846776804',
	minSize = 48,
	maxSize = 48,
	maxPlayers = 2,
	startingGold = 1100,
	startingNativeMana = 100,
	roads = 40,
	forest = 20,


--ИСКЛЮЧЕНЯ ЮНИТОВ
forbiddenUnits = {

-- Старндарные
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
'g000uu8044', -- Темный Эльф Гаст л.

-----------исключения шаблона
'g000uu8266', -- Дроттар--
'g000uu8265', -- дева пламени--
'g001uu0171', -- двойник
'g000uu8217', -- Призрачный дракон л.
'g000uu8216', -- Призрачный дракон
'g000uu8269', -- Кровавый дракон л.
'g001uu8269', -- Кровавый дракон
'g000uu5022', -- Черный дракон
'g000uu5122', -- Черный дракон л.
'g000uu8144', -- темный эльф гаст л.
'g000uu2007', -- Мумификатор
'g000uu2008', -- Длань Мортис

-- этот шаблон+
'g000uu2022', -- Ламия
'g001uu8238', -- Демиург

},


--ИСКЛЮЧЕНЯ ПРЕДМТОВ
forbiddenItems = {


-----------СТАНДАРТНЫЕ
-- ОСНОВНЫЕ
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

-- ЕЩЁ
'g001ig0575', --Свиток "Подавляющая жизнь

-----------исключения шаблона
'g001ig0414', --Отравленный вороний коготь (Артефакт)--
'g000ig3015', --кристалл души (артефакт)--
'g000ig3016', --рог инкуба (артефакт)--
'g001ig0154', --знамя поглощения--
'g001ig0158', --ужасающий топор (артефакт)--
'g000ig3021', --кольцо колдуньи (артефакт)--
'g001ig0023', --аура стремительности--
'g001ig0017', --малая аура троля--
'g000ig9007', --сфера забвения--
'g000ig9040', --сфера ведьм--
'g001ig0296', --сфера жестокости--
'g001ig0275', --Кулон подстрекательства--
'g000ig1011', --сапоги мореплавания
'g001ig0044', --Сердце океана (Артефакт)
--+
'g001ig0605', --Книга постижения (не фонтан)
'g000ig3022', --Лютня Очарования (воровать то лучше)
'g001ig0597', --Кираса резонанса (Реликвия) (жесковато)
--+ в драконе не фонтан
'g001ig0348', --Эликсир мудрости Лазгурона(не фонтан)
'g001ig0321', --Зелье укротителя небосвода
'g001ig0322', --Зелье текучего камня
'g001ig0323', --Зелье родства с пламенем
'g001ig0320', --Зелье глубинного чудища
--+ в драконе жирно
'g000ig1002', --Знамя неуязвимости
'g000ig1006', --Знамя скорости
'g000ig1008', --Знамя энергии

--доп.новое
'g000ig3008', -- Обод мертвых (обидно ну)

--свитки
'g001ig0092', --Свиток "Гниение леса" за 400 в ролле нафиг надо
'g000ig5057', --Свиток "Мerum Facies" Защита от полиморфа за 700 в ролле нафиг надо
'g000ig5118', --Свиток "Ослепления" Уменьшает обзор противника на 3 в радиусе 5х5.
'g000ig5057', --Свиток "Мerum Facies" Защита от полиморфа.
'g000ig5107', --Свиток "Создание Рощи" (такое себе за 400)
'g000ig5047', --Свиток "Incantare Beliarh Illudere"
'g000ig5059', --Свиток "Incantare Avenger Illudere"

--свитки на мувы
'g000ig5027', --свиток мореплавания
'g000ig5006', --Свиток "Ускорение"--
'g000ig5100', --Свиток "Скорость"--
'g000ig5113', --Свиток "Порыв"--
'g000ig5099', --Свиток "Опутывание"--

--призывы
'g000ig5031', -- Свиток "Призыв II: Валькирия"
'g000ig5015', -- Свиток "Призыв II: Голем"
'g000ig5038', -- Свиток "Призыв III: Каменный Предок"
'g000ig5071', -- Свиток "Призыв III: Кошмар"
'g000ig5108', -- Свиток "Призыв III: Энт Большой"
'g001ig0076', -- Свиток "Призыв III: Каменная сущность"
'g001ig0075', -- Свиток "Призыв III: Ледяная сущность"
'g001ig0074', -- Свиток "Призыв III: Сущность бури"
'g001ig0077', -- Свиток "Призыв III: Сущность пламени"
'g000ig5117', -- Свиток "Призыв IV: Вердант"
'g001ig0078', -- Свиток "Призыв IV: Стихийный голем"
'g000ig5078', -- Свиток "Призыв IV: Танатос"
'g001ig0080', -- Свиток "Призыв V: Вестник немощи"
'g001ig0081', -- Свиток "Призыв V: Вестник перемен"
'g001ig0079', -- Свиток "Призыв V: Вестник поглощения"

--т3+
'g001ig0577', --Свиток "Dominatum ignis Лишает отряд сопротивлений к Огню и ожогу, а иммунитеты заменяет на сопротивления.
'g001ig0580', --Свиток "Небесный молот Лишает отряд сопротивлений к Воздуху и РБ, а иммунитеты заменяет на сопротивления.
'g001ig0576', --Свиток "Прах к праху Лишает отряд сопротивлений к Смерти, вампиризму и тауматургии, иммунитеты заменяет на сопротивления.
'g001ig0578', --Свиток "Пробирающий холод Лишает отряд сопротивления Воды и мороза, а иммунитеты заменяет на сопротивления.
'g001ig0579', --Свиток "Хворь Лишает отряд сопротивлений к магии Земли и яду, а иммунитеты заменяет на сопротивления.
'g000ig5096', --Свиток "Прикосновение вампира" +35вапририк

--свитки на урон т3+
'g000ig5054', --Menta potens
'g000ig5109', --Блуждающий Огонек
'g000ig5033', --Буря
'g000ig5014', --Гнев Богов
'g000ig5072', --Свиток "Драконья гниль"

--свитки на урон т4+
'g000ig5090', --Potentia Ignis
'g000ig5056', --Sinestra ignis
'g000ig5086', --Духи льда
'g000ig5112', --Лавина
'g000ig5077', --Огненное дыхание
'g000ig5093', --Смерч Смерти
'g000ig5105', --Утопление
'g000ig5081', --Цепь молний
'g000ig5060', --Deus talonis
'g000ig5019', --Армагеддон
'g000ig5080', --Истребление

},
	
	getContents = getTemplateContents
}