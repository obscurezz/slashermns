-- ГО: 	!чёрной зоны касаться: синяя, жёлтая, белая, серая.

---------------
-- НАСТРОЙКИ

-- коэффициент сложности (<0.9 легко; 0.9-1.1 средне; >1.1 сложно)
local kef = 1

-- коэффициент разброса силы нейтралов
local kr = 1.05

---------------
-- КОД ШАБЛОНА

--Башня магии в зоне 1
function zoneMageResp1()
	return {
		{
			spells = { 	
						yn('g000ss0002'), -- быстрота
						yn('g000ss0007'), -- Исцеление
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
						
						yn('g000ss0029'), -- Ритуал исцеления
						yn('g000ss0184'), -- прокл.эмира
						yn('g000ss0034'), -- Заколдованное оружие --мэд
						
						yn('g000ss0050'), -- Chronos
						yn('g000ss0185'), -- terebrare corde
						yn('g000ss0122'), -- Целительные ожоги

						yn('g000ss0186'), -- Спешащее время
						yn('g000ss0069'), -- Проклятие Ниграэля
						yn('g000ss0124'), -- Отсрочка неизбежного

						yn('g000ss0187'), -- могущество
						yn('g000ss0133'), -- Песнь слез
						yn('g000ss0107'), -- Дикие саженцы --мж
					
			},			
--класс			guard = guard2m()
		},
	}
end


--Башня магии в зоне 3
function zoneMageResp()
	return {
		{
			spells = {
						
						yn3('g000ss0013'), -- Святая сила +15 точн и урон
						yn3('g000ss0026'), -- Гимн Кланов +15 ини
						yn3('g000ss0089'), -- Preces -15 точн и урон
						yn3('g000ss0074'), -- Туман Смерти
						yn3('g000ss0108'), -- Призыв III: Энт Большой

						yn3('g000ss0082'), -- Благословение Всевышнего +20%хп +5 брони 1200
						yn3('g000ss0114'), -- Плесень

						yn3('g000ss0079'), -- Защита от Оружия

						yn3('g000ss0207'), -- Пробирающий холод -вард вода
						yn3('g000ss0208'), -- Хворь -вард земля				

						yn3('g000ss0144'), -- Затопление
						
			},			
--класс			guard = guard2m()
		},
		-- вторя б
		{
			spells = {

						yn3('g000ss0012'), -- Святая броня + 15 Брони
						yn3('g000ss0031'), -- Призыв II: Валькирия
						yn3('g000ss0199'), -- Terra oblivionem -25опыт
						yn3('g000ss0073'), -- Прикосновение Мортис +20% ХП
						yn3('g000ss0111'), -- Отвлечение -15 точн и урон

						yn3('g000ss0091'), -- Tempus status -33 ини 1200
						yn3('g000ss0116'), -- Благословение Галеана +50хп
						
						yn3('g000ss0039'), -- Неподкупность

						yn3('g000ss0206'), -- Dominatum ignis -вард огонь
						yn3('g000ss0209'), -- Небесный молот -вард воздух

						yn3('g000ss0145'), -- Потоп

			},			
--класс			guard = guard3m()
		}
	}
end

----------------------

-- Город т1

local tierTowerResp0 = 1
local valueTowerResp0 = { min = 240*kef, max = 240*kef*kr }

function zoneTownsResp0(race)
	return {
	{
		tier = tierTowerResp0,
		stack = {
			subraceTypes = rsub(),
			value = valueTowerResp0,
			loot = {
				itemTypes = { Item.Scroll, Item.Orb },
				value = { min = 400, max = 400 },
				itemValue = { min = 400, max = 400 },			
				items = {
					{ id = 'g000ig0001', min = 1, max = 1 }, --рес
					{ id = 'g000ig0006', min = 1, max = 1 }, --хил100
					orr({ id = 'g001ig0180', min = 2, max = 2 }, { id = 'g000ig0005', min = 1, max = 1 }), --2хил25/хил50
--					{ id = 'g001ig0431', min = 1, max = 1 }, --гранат75
					orr({ id = ExtraManaProject4(race), min = 1, max = 1 }, { id = 'g000ig7002', min = 1, max = 1 }), --доп.шар / кольцо100
					orr3({ id = 'g001ig0530', min = 1, max = 1}, { id = 'g001ig0531', min = 1, max = 1}, { id = p05(), min = 1, max = 1}), -- Зелье посмертного зова (талики) / Зелье слова (свитки) / Случ. пермо 5%
					{ id = b15(), min = 1, max = 1 },
					{ id = e4(), min = 1, max = 1 },
				}
			}
		}
	}
	}
end

-- Город 2
local tierTowerZone = 1;
local valueTowerZone = { min = 450*kef, max = 450*kef*kr }

function zoneTowns2(race)
	return {
	{
		tier = tierTowerZone,
		stack = {
			subraceTypes = NoUndead(),
			value = valueTowerZone,
			loot = {
				itemTypes = { Item.Scroll, Item.Orb },
				value = { min = 450, max = 600 },
				itemValue = { min = 450, max = 600 },
				items = {
					{ id = 'g000ig0001', min = 1, max = 1 }, --рес
					{ id = 'g000ig0006', min = 1, max = 1 }, --хил100
					orr({ id = 'g000ig0006', min = 1, max = 1 }, { id = 'g000ig0005', min = 2, max = 2 }), --хил100/2хил50		
--					{ id = 'g001ig0432', min = 1, max = 1 }, --аметист125
					orr3({ id = ExtraManaProject4(race), min = 1, max = 1 }, { id = ExtraHomeMana(race), min = 1, max = 1 }, { id = 'g000ig7003', min = 1, max = 1 }), -- доп.шар / родной шар / изумруд150
					orr3({ id = 'g001ig0529', min = 1, max = 1}, { id = 'g001ig0528', min = 1, max = 1}, { id = p05(), min = 1, max = 1}), -- Каталог магических сфер (сферы) / Честный труд (сапоги) / Случ. пермо 5%
					orr({ id = b15(), min = 1, max = 1 }, { id = w15(), min = 1, max = 1 }), -- случ. банка15 / случ. вард
					{ id = pw5(), min = 1, max = 1 },
				}
			}
		}
	},
	}
end

-- Город 3
function zoneTownsZone3()
	return {
	{
		tier = 1,
		stack = {
			subraceTypes = { Subrace.NeutralDragon, Subrace.Human, Subrace.Heretic, Subrace.Dwarf, Subrace.Elf }, -- Subrace.Undead, убрал
			value = { min = 950*kef, max = 950*kef*kr },
			loot = {
				itemTypes = { Item.Scroll, Item.Orb },
				value = { min = 700, max = 800 },
				itemValue = { min = 700, max = 800 },
				items = {
					{ id = 'g000ig0001', min = 1, max = 1 }, --рес
					{ id = 'g000ig0006', min = 2, max = 2 }, --хил100
					orr({ id = 'g000ig0006', min = 1, max = 1 }, { id = 'g000ig0005', min = 2, max = 2 }), --хил100/2хил50
--					{ id = 'g001ig0433', min = 1, max = 1 }, --аквамарин175					
					orr({ id = rmsb(), min = 1, max = 1 }, { id = 'g000ig7005', min = 1, max = 1 }), --случ. большой шар манны / рубин250
					orr(orr({ id = 'g001ig0563', min = 1, max = 1}, { id = 'g001ig0035', min = 1, max = 1}), orr({ id = 'g001ig0019', min = 1, max = 1}, { id = 'g001ig0506', min = 1, max = 1})),	-- Аура внимательности +5 крит / Великая аура жизненной силы +30хп / Малая аура вампиризма +10вамп / Настойка оратора +1лидер	
					{ id = b30(), min = 1, max = 1 }, -- случ. банка30
					{ id = pw6(), min = 1, max = 1 },
				}
			}
		}
	}
	}
end

----------------------

-- Лавка т1
function zoneMerch1() -- свитки 400
return {
	{
		goods = {
			itemTypes = { Item.Scroll },
			value = { min = 800, max = 800 },
			itemValue = { min = 400, max = 400 },
			items = {
				{ id = 'g000ig0001', min = 3, max = 4 },
				{ id = 'g000ig0006', min = 3, max = 4 },
				{ id = 'g001ig0378', min = 4, max = 5 }, --хил75
				{ id = 'g000ig0005', min = 5, max = 7 },
				{ id = 'g001ig0180', min = 7, max = 10 },

				{ id = 'g000ig0002', min = 1, max = 2 }, --15з
				{ id = 'g000ig0014', min = 1, max = 1 }, --15а
				{ id = 'g000ig0011', min = 1, max = 2 }, --15и
				{ id = 'g000ig0008', min = 1, max = 1 }, --15т

				{ id = 'g000ig0021', min = 1, max = 2 }, -- вард в
				{ id = 'g000ig0022', min = 1, max = 1 }, -- вард в
				{ id = 'g000ig0023', min = 1, max = 1 }, -- вард з
				{ id = 'g000ig0024', min = 1, max = 2 }, -- вард о

				orr({ id = 'g001ig0125', min = 1, max = 1 }, { id = 'g001ig0036', min = 1, max = 1 }), --разума/смерти

				{ id = d15(), min = 1, max = 1 }, -- случ. дотвард

				{ id = e2(), min = 1, max = 1},
				{ id = e2(), min = 1, max = 1},
				{ id = e4(), min = 1, max = 1},				
				
				orr({ id = 'g001ig0533', min = 1, max = 1 }, { id = 'g001ig0006', min = 1, max = 1 }), -- Зелье ясного взора (+2 обзора) / Эликсир маскировки (-50 опыт за его уб-во)
				orr({ id = 'g001ig0027', min = 1, max = 1 }, { id = 'g000ig0013', min = 1, max = 1 }), -- аура брони +5 брони аое / Эликсир неуловимости +10 ини
				orr({ id = 'g001ig0130', min = 1, max = 1 }, { id = 'g001ig0561', min = 1, max = 1 }), -- Эликсир регенерации +20 / эликсир самопожертвования
				
				{ id = 'g001ig0530', min = 1, max = 1 }, -- Зелье посмертного зова (талисманы)
				orr({ id = 'g001ig0531', min = 1, max = 1 }, { id = 'g001ig0497', min = 1, max = 1 }), -- Зелье слова (свитки) / Книга колдовства (свитки)
				orr({ id = 'g001ig0526', min = 1, max = 1 }, { id = 'g001ig0527', min = 1, max = 1 }), -- Зелье оруженосца (знамёна) / Зелье постижения (реликвии)	

				orr(orr({ id = 'g000ig3001', min = 1, max = 1}, { id = 'g000ig2001', min = 1, max = 1}), orr({ id = 'g001ig0100', min = 1, max = 1}, { id = 'g001ig0101', min = 1, max = 1})), -- Гномьи наручи (Артефакт) / Рунный камень (Артефакт) | Цеп Хана (Артефакт) / Череп Хана (Реликвия)				
				yn({ id = 'g001ig0611', min = 1, max = 1 }), -- Цепи жертвенности (Артефакт)
				yn({ id = 'g001ig0421', min = 1, max = 1 }), -- Борода Имира (Реликвия)
				yn({ id = 'g001ig0610', min = 1, max = 1 }), -- Оковы долга (Реликвия)
				yn({ id = 'g002ig0001', min = 1, max = 1 }), -- Потайной кинжал (Артефакт)
				yn({ id = 'g001ig0609', min = 1, max = 1 }), -- Загробный фонарь (Артефакт)
				yn({ id = 'g001ig0418', min = 1, max = 1 }), -- Руна защиты Фрейра (Артефакт)

				yn({ id = 'g000ig2002', min = 1, max = 1 }), -- св.чаша
				yn({ id = 'g000ig3002', min = 1, max = 1 }), -- д.чаша
				yn({ id = 'g001ig0182', min = 1, max = 1 }), -- счастл. кость
				yn({ id = 'g000ig3017', min = 1, max = 1 }), -- кинж. вамп.
				yn({ id = 'g001ig0048', min = 1, max = 1 }), -- Амулет Кракена (Артефакт)
				yn({ id = 'g001ig0487', min = 1, max = 1 }), -- Кольцо темных искуств (Артефакт)650
				yn({ id = 'g001ig0559', min = 1, max = 1 }), -- Руна благоволения Тиу (Артефакт) 700
				yn({ id = 'g001ig0557', min = 1, max = 1 }), -- Рог непреклонности (Артефакт) 700
				yn({ id = 'g001ig0558', min = 1, max = 1 }), -- Рог возмездия (Артефакт) 700
				yn({ id = 'g001ig0594', min = 1, max = 1 }), -- Щит телохранителя (Артефакт) 700
				
				yn({ id = 'g001ig0426', min = 1, max = 1 }), -- Куртка капитана (Реликвия)
				yn({ id = 'g001ig0104', min = 1, max = 1 }), -- зуб людоеда
				yn({ id = 'g000ig3022', min = 1, max = 1 }), -- р.лютня650
				yn({ id = 'g000ig4003', min = 1, max = 1 }), -- книга земли
				yn({ id = 'g001ig0605', min = 1, max = 1 }), -- Книга постижения600		
				yn({ id = 'g000ig3020', min = 1, max = 1 }), -- череп танатоса500
				
				--сапоги
				orr(orr({ id = 'g001ig0105', min = 1, max = 1 }, { id = 'g001ig0107', min = 1, max = 1 }), orr({ id = 'g001ig0108', min = 1, max = 1 }, { id = 'g001ig0106', min = 1, max = 1 })), -- Литейные сапоги / Сапоги ветров / Гномьи сапоги / Сапоги каменщика
				orr({ id = 'g001ig0113', min = 1, max = 1 }, { id = 'g001ig0110', min = 1, max = 1 }), -- сапоги укрепл / лёгкие	

				--посох
				orr(orr({ id = 'g001ig0383', min = 1, max = 1 }, { id = 'g001ig0387', min = 1, max = 1 }), orr({ id = 'g000ig6001', min = 1, max = 1 }, { id = 'g000ig6003', min = 1, max = 1 })), -- Посох первых побегов (малый энт) / Посох следопыта (хождение по лесу) / Посох грома (15 дамаг) / Посох святости+30оз
				orr(orr({ id = 'g001ig0394', min = 1, max = 1 }, { id = 'g000ig6012', min = 1, max = 1 }), orr({ id = 'g001ig0395', min = 1, max = 1 }, { id = 'g001ig0399', min = 1, max = 1 })), -- Посох северных стражей+10брони / Посох скорости+10ини / Посох наместника Махаля+10брони / Посох раздора-10ини

				--сферы
				yn({ id = 'g001ig0458', min = 1, max = 1}), -- Сфера Каменного проклятия 100
				yn({ id = 'g000ig9031', min = 1, max = 1}), -- Сфера Ливня 100
				yn({ id = 'g000ig9022', min = 1, max = 1}), -- Сфера Углей 100
				yn({ id = 'g001ig0302', min = 1, max = 1}), -- Сфера Шторма 100
				yn({ id = 'g001ig0189', min = 1, max = 1}), -- Сфера Камня 100
				yn({ id = 'g001ig0178', min = 1, max = 1}), -- Сфера Костра 100
				yn({ id = 'g001ig0472', min = 1, max = 1}), -- Сфера Ледяного осколка 100
				yn({ id = 'g001ig0473', min = 1, max = 1}), -- Сфера Статического разряда 100
				yn({ id = 'g001ig0470', min = 1, max = 1}), -- Сфера Подавления 100
				yn({ id = 'g001ig0192', min = 1, max = 1}), -- Сфера Пыток 100
				yn({ id = 'g000ig9033', min = 1, max = 1}), -- Сфера Чумы 100	
				yn({ id = 'g001ig0133', min = 1, max = 1 }), -- Сфера Брони I +15брони-1 200
				yn({ id = 'g001ig0446', min = 1, max = 1 }), -- Сфера Вампиризма I +20вамп-1 200
				yn({ id = 'g000ig9017', min = 1, max = 1 }), -- Сфера Восстановления 30хил-аое 200
				yn({ id = 'g001ig0471', min = 1, max = 1 }), -- Сфера Охотника 40урона-1 200
				yn({ id = 'g001ig0464', min = 1, max = 1 }), -- Сфера Разрушения доспеха I -15брони-1 200
				yn({ id = 'g001ig0450', min = 1, max = 1 }), -- Сфера Урона I +20урон-1 200	

				--знамя
				yn({ id = 'g000ig1001', min = 1, max = 1 }), -- знамя защиты400
				yn({ id = 'g001ig0051', min = 1, max = 1 }), -- знамя выносл400
				yn({ id = 'g000ig1007', min = 1, max = 1 }), -- знамя силы400
				yn({ id = 'g000ig1005', min = 1, max = 1 }), -- знамя быстроты400
				yn({ id = 'g000ig1003', min = 1, max = 1 }), -- знамя сражения400
				yn({ id = 'g001ig0370', min = 1, max = 1 }), -- Знамя искоренителя ереси600
				yn({ id = 'g001ig0369', min = 1, max = 1 }), -- Знамя снежной охоты600

				--талик
				orr3({ id = 'g001ig0184', min = 1, max = 1 }, { id = 'g000ig9109', min = 1, max = 1 }, { id = 'g000ig9120', min = 1, max = 1 }), -- Талисман Восстановления 400 / Талисман призыва нейтралов II 450 / Талисман щита стихий 500
				
				--свитки
				orr(orr({ id = 'g000ig5021', min = 1, max = 1}, { id = 'g000ig5003', min = 1, max = 1}), orr({ id = 'g001ig0250', min = 1, max = 1}, { id = 'g000ig5023', min = 1, max = 1})), -- свиток л.щит, сила, с.кости, с.витара
				orr(orr({ id = 'g001ig0248', min = 1, max = 1}, { id = 'g000ig5045', min = 1, max = 1}), orr({ id = 'g000ig5064', min = 1, max = 1}, { id = 'g000ig5101', min = 1, max = 1})), -- свиток устр. гимн, tormentio-броня, слабость, стая
				orr({ id = 'g000ig5007', min = 1, max = 1 }, { id = 'g000ig5029', min = 1, max = 1 }), -- св. исцеление / рит. исцеления
			}
		},
--класс			guard = guard1(),
	}
}
end

-- Лавка т2
function zoneMerch2() -- свитки 550
return {
	{
		goods = {
			itemTypes = { Item.Scroll },
			value = { min = 1100, max = 1100 },
			itemValue = { min = 550, max = 550 },
			items = {
				{ id = 'g000ig0001', min = 5, max = 6 },
				{ id = 'g000ig0006', min = 5, max = 6 },
				{ id = 'g001ig0378', min = 6, max = 7}, --хил75
				{ id = 'g000ig0005', min = 7, max = 10 },
				{ id = 'g001ig0180', min = 7, max = 10 },
				
				{ id = 'g000ig0002', min = 1, max = 1 }, --15з
				{ id = 'g000ig0014', min = 1, max = 2 }, --15а
				{ id = 'g000ig0011', min = 1, max = 1 }, --15и
				{ id = 'g000ig0008', min = 1, max = 2 }, --15т

				{ id = 'g000ig0021', min = 1, max = 1 }, -- вард в
				{ id = 'g000ig0022', min = 1, max = 2 }, -- вард в
				{ id = 'g000ig0023', min = 1, max = 2 }, -- вард з
				{ id = 'g000ig0024', min = 1, max = 1 }, -- вард о

				orr({ id = 'g001ig0125', min = 1, max = 1 }, { id = 'g001ig0036', min = 1, max = 1 }), --разума/смерти
				
				{ id = d15(), min = 1, max = 1 }, -- случ. дотвард
				
				{ id = e4(), min = 1, max = 1},
				{ id = e4(), min = 1, max = 1},
				{ id = pw5(), min = 1, max = 1},

				orr({ id = 'g001ig0534', min = 1, max = 1 }, { id = 'g001ig0519', min = 1, max = 1 }), -- Экстракт таинственной энергии (смена атаки) / Война престолов (-10 воры)				
				orr({ id = 'g000ig0004', min = 1, max = 1 }, { id = 'g001ig0028', min = 1, max = 1 }), -- эликсир твердости / аура выносл 5оз аое
				orr({ id = 'g000ig0016', min = 1, max = 1 }, { id = 'g001ig0029', min = 1, max = 1 }), -- эликсир мощи +10атака / Аура силы +5атака аое
				
				orr({ id = 'g000ig4006', min = 1, max = 1 }, { id = 'g001ig0529', min = 1, max = 1 }), -- книга т.з. (сферы) / Каталог магических сфер
				orr({ id = 'g001ig0494', min = 1, max = 1 }, { id = 'g001ig0528', min = 1, max = 1 }), -- Книга странника (сапоги) / Честный труд (сапоги)
				orr({ id = 'g001ig0495', min = 1, max = 1 }, { id = 'g001ig0525', min = 1, max = 1 }), -- Книга наследия (знамёна) / Эликсир учености (артефакты)			

				yn({ id = 'g001ig0417', min = 1, max = 1 }), -- Руна верности Моккуркальфи (Артефакт) 800
				yn({ id = 'g001ig0045', min = 1, max = 1 }), -- кров.свят800
				yn({ id = 'g000ig3003', min = 1, max = 1 }), -- кол.силы800
				yn({ id = 'g001ig0042', min = 1, max = 1 }), -- клыки бездны800
				yn({ id = 'g001ig0047', min = 1, max = 1 }), -- рун.жизн800		
				yn({ id = 'g001ig0196', min = 1, max = 1 }), -- рун.мол800
				yn({ id = 'g001ig0582', min = 1, max = 1 }), -- Камень врат (Артефакт)800
				yn({ id = 'g001ig0416', min = 1, max = 1 }), -- Руна предвидения Вотана (Артефакт) 800
				yn({ id = 'g001ig0589', min = 1, max = 1 }), -- Щит неведения (Артефакт) 800
				yn({ id = 'g001ig0040', min = 1, max = 1 }), -- пер.песк1000
				yn({ id = 'g001ig0657', min = 1, max = 1 }), -- Топор палача (Артефакт) 700
				
				yn({ id = 'g001ig0420', min = 1, max = 1 }), -- Вечные латы (Реликвия)800
				yn({ id = 'g001ig0424', min = 1, max = 1 }), -- Длани ангела (Реликвия) 750
				yn({ id = 'g001ig0422', min = 1, max = 1 }), -- Кровавый покров (Реликвия)700
				yn({ id = 'g000ig2006', min = 1, max = 1 }), -- таира чистоты800
				yn({ id = 'g001ig0427', min = 1, max = 1 }), -- Нагрудник Стража (Реликвия)600
				yn({ id = 'g001ig0423', min = 1, max = 1 }), -- Латы Спасителя (Реликвия)700
				yn({ id = 'g001ig0156', min = 1, max = 1 }), -- р.шкатулка800
				yn({ id = 'g002ig0002', min = 1, max = 1 }), -- Промасленная кольчуга (Реликвия) 700
				yn({ id = 'g001ig0602', min = 1, max = 1 }), -- Доспех жатвы (Реликвия)800
				
				orr({ id = 'g001ig0114', min = 1, max = 1 }, { id = 'g001ig0111', min = 1, max = 1 }), -- сапоги тяж 500 / сапоги асс 500
				orr({ id = 'g001ig0115', min = 1, max = 1 }, { id = 'g001ig0112', min = 1, max = 1 }), -- сапоги жел. поступь1100 / сапоги ангел800 

				--посох
				orr(orr({ id = 'g001ig0406', min = 1, max = 1 }, { id = 'g001ig0392', min = 1, max = 1 }), orr({ id = 'g001ig0380', min = 1, max = 1 }, { id = 'g000ig6021', min = 1, max = 1 })), -- Посох провидицы+вижн / Посох знаний Фрегги (40 хила) / Посох врат Бездны+белик / Посох Зов Леса+энт
				orr(orr({ id = 'g001ig0401', min = 1, max = 1 }, { id = 'g001ig0404', min = 1, max = 1 }), orr({ id = 'g001ig0403', min = 1, max = 1 }, { id = 'g000ig6019', min = 1, max = 1 })), -- Посох проклятой метки-15урон / Посох Ниграэля-15урона / Посох неизбежной кары+15точность / Посох Листвы+деревья

				--сферы
				orr(orr({ id = 'g001ig0056', min = 1, max = 1 }, { id = 'g001ig0054', min = 1, max = 1 }), orr({ id = 'g001ig0055', min = 1, max = 1 }, { id = 'g001ig0053', min = 1, max = 1 })), -- сфера защиты воды / воздуха / земли / огня
				yn({ id = 'g001ig0058', min = 1, max = 1 }), -- Сфера защиты от магии Разума 400
				yn({ id = 'g001ig0057', min = 1, max = 1 }), -- Сфера защиты от магии Смерти 400				
				yn({ id = 'g001ig0187', min = 1, max = 1 }), -- Сфера Пламени 80урон 400
				yn({ id = 'g001ig0453', min = 1, max = 1 }), -- Сфера Святой земли 60хил-ряду 400
				yn({ id = 'g001ig0176', min = 1, max = 1 }), -- Сфера Вампиризма II 40-1 400
				yn({ id = 'g001ig0456', min = 1, max = 1 }), -- Сфера Прилива 80 400
				yn({ id = 'g001ig0496', min = 1, max = 1 }), -- Сфера Мучений 80 400
				yn({ id = 'g000ig9042', min = 1, max = 1 }), -- Сфера направленного ослабления I -33урон-1 400
				yn({ id = 'g001ig0475', min = 1, max = 1 }), -- Сфера Обширной коррозии I-10броня-аое 400
				yn({ id = 'g000ig9018', min = 1, max = 1 }), -- Сфера Прорицательницы 55хил аое 400
				yn({ id = 'g001ig0134', min = 1, max = 1 }), -- Сфера Урона II +40урон-1 400
				yn({ id = 'g001ig0191', min = 1, max = 1 }), -- Сфера Вампира 70 400
				yn({ id = 'g001ig0474', min = 1, max = 1 }), -- Сфера Скалы 80урон-1 400
				yn({ id = 'g001ig0461', min = 1, max = 1 }), -- Сфера Массового ослабления I -33урон аое 400
				yn({ id = 'g001ig0479', min = 1, max = 1 }), -- Сфера Разрушения доспеха II -30брони-1 400
				yn({ id = 'g001ig0454', min = 1, max = 1 }), -- Сфера Помощи 75хил 2x2 400
				yn({ id = 'g001ig0295', min = 1, max = 1 }), -- Сфера Замедления 50-1 400

				--знамя
				yn({ id = 'g001ig0289', min = 1, max = 1 }), -- знамя гор.стр700
				yn({ id = 'g000ig1006', min = 1, max = 1 }), -- знамя скорости700
				yn({ id = 'g000ig1008', min = 1, max = 1 }), -- знамя энерг700
				yn({ id = 'g001ig0293', min = 1, max = 1 }), -- знамя бан.неуд700
				yn({ id = 'g001ig0292', min = 1, max = 1 }), -- знамя стяг.конц700
				yn({ id = 'g001ig0361', min = 1, max = 1 }), -- Знамя горна700
				yn({ id = 'g001ig0357', min = 1, max = 1 }), -- Знамя неистовства700			

				--талик
				orr5({ id = 'g000ig9128', min = 1, max = 1}, { id = 'g001ig0259', min = 1, max = 1}, { id = 'g001ig0063', min = 1, max = 1}, { id = 'g000ig9116', min = 1, max = 1}, { id = 'g000ig9140', min = 1, max = 1}), -- Талисман Молнии 800 / Талисман призыва нейтралов III 600 / Талисман Прилива 800 / Талисман Святой земли 800 / Талисман лесной колдуньи 800

				--свитки
				orr(orr({ id = 'g000ig5050', min = 1, max = 1}, { id = 'g001ig0253', min = 1, max = 1}), orr({ id = 'g001ig0255', min = 1, max = 1}, { id = 'g001ig0256', min = 1, max = 1})), -- Свиток "Chronos"-ини, прокл.эмира-урон, спеш.время+ини, могущество+урон			
				orr(orr({ id = 'g000ig5103', min = 1, max = 1}, { id = 'g000ig5030', min = 1, max = 1}), orr({ id = 'g000ig5104', min = 1, max = 1}, { id = 'g001ig0085', min = 1, max = 1})), -- Свиток "Призыв II: Энт" / Свиток "Взгляд Сивиллы"+7x7карта / Свиток "Опаление"-25дмг / Свиток "Потоп"		
				orr({ id = 'g000ig5007', min = 1, max = 1 }, { id = 'g000ig5029', min = 1, max = 1 }), -- св. исцеление / рит. исцеления
			}
		},
--класс		guard = guard2(),
	},
}
end

-- Лавка т3
function zoneMerchZone3() -- свиток 700
return {
	{
		goods = {
			itemTypes = { Item.Scroll },
			value = { min = 1400, max = 1400 },
			itemValue = { min = 700, max = 700 },
			items = {
				{ id = 'g000ig0001', min = 5, max = 6 },
				{ id = 'g000ig0006', min = 5, max = 6 },
				{ id = 'g001ig0378', min = 6, max = 7 }, --хил75
				{ id = 'g000ig0005', min = 7, max = 10 },
				{ id = 'g000ig0018', min = 1, max = 1 },

				{ id = 'g000ig0012', min = 1, max = 2 }, --ини30
				{ id = 'g000ig0015', min = 1, max = 2 }, --урон30
				{ id = 'g000ig0003', min = 1, max = 1 }, --защита30
				yn({ id = 'g000ig0009', min = 1, max = 1 }), --точность30

				yn({ id = 'g000ig0002', min = 1, max = 2 }), --защита15
				yn({ id = 'g000ig0014', min = 1, max = 2 }), --атака15
				yn({ id = 'g000ig0011', min = 1, max = 2 }), --ини15
				yn({ id = 'g000ig0008', min = 1, max = 2 }), --точность15
				
				yn({ id = 'g000ig0021', min = 1, max = 2 }), -- вард воздух
				yn({ id = 'g000ig0022', min = 1, max = 2 }), -- вард вода
				yn({ id = 'g000ig0023', min = 1, max = 2 }), -- вард земля
				yn({ id = 'g000ig0024', min = 1, max = 2 }), -- вард огонь
				
				yn({ id = 'g001ig0125', min = 1, max = 1 }), -- вард разума
				yn({ id = 'g001ig0036', min = 1, max = 1 }), -- вард смерти

				{ id = pw5(), min = 1, max = 1},
				{ id = pw5(), min = 1, max = 1},
				{ id = pw6(), min = 1, max = 1},

				orr({ id = 'g001ig0019', min = 1, max = 1 }, { id = 'g001ig0506', min = 1, max = 1 }), -- аое Малая аура вампиризма +10вамп / Настойка оратора +1лидер
				{ id = p15(), min = 1, max = 1},

				yn({ id = 'g001ig0591', min = 1, max = 1 }), -- Щит отражения (Артефакт) 900
				yn({ id = 'g000ig2004', min = 1, max = 1 }), -- рог.всев1200
				yn({ id = 'g000ig9137', min = 1, max = 1 }), -- серд.эмира1200
				yn({ id = 'g000ig3019', min = 1, max = 1 }), -- Клинок Танатоса (Артефакт) 1150
				yn({ id = 'g001ig0071', min = 1, max = 1 }), -- Эльфийская брошь (Артефакт) 1000
				yn({ id = 'g001ig0488', min = 1, max = 1 }), -- Кольцо Несгибаемого стража (Артефакт) 1000
				yn({ id = 'g001ig0590', min = 1, max = 1 }), -- Щит Мизраэля (Артефакт) 1200
				yn({ id = 'g001ig0603', min = 1, max = 1 }), -- Чаша жатвы (Артефакт) 1000

				yn({ id = 'g001ig0585', min = 1, max = 1 }), -- Кольцо создателя (Артефакт)1400
				yn({ id = 'g001ig0060', min = 1, max = 1 }), -- Тысяча чешуек (Артефакт) 1200				
				yn({ id = 'g001ig0410', min = 1, max = 1 }), -- Дьявольская булава (Артефакт)1500
				yn({ id = 'g000ig2005', min = 1, max = 1 }), -- Гравированная диадема (Артефакт)1800			
				
				yn({ id = 'g001ig0597', min = 1, max = 1 }), -- Кираса резонанса (Реликвия)1000
				yn({ id = 'g001ig0419', min = 1, max = 1 }), -- Шлем воителя (Реликвия)1000
				yn({ id = 'g001ig0430', min = 1, max = 1 }), -- Роба убийцы (Реликвия)850
				yn({ id = 'g001ig0539', min = 1, max = 1 }), -- Тисовый лук (Реликвия)900
				yn({ id = 'g001ig0116', min = 1, max = 1 }), -- р.плас.досп1200
				yn({ id = 'g000ig3005', min = 1, max = 1 }), -- р.кор.мьолн1200				
				yn({ id = 'g000ig7010', min = 1, max = 1 }), -- р.кор.имп1800
				yn({ id = 'g001ig0038', min = 1, max = 1 }), -- р.тяж.латы1550

				orr({ id = 'g001ig0501', min = 1, max = 1 }, { id = 'g000ig1010', min = 1, max = 1 }), -- Дары Галлеана (лес) 900 / эльфийские сапоги 700
				orr({ id = 'g000ig8003', min = 1, max = 1 }, { id = 'g001ig0606', min = 1, max = 1 }), -- Сапоги скорости 700 | Сапоги родных земель 1000

				--посох
				orr3({ id = 'g000ig6020', min = 1, max = 1 }, { id = 'g000ig6014', min = 1, max = 1 }, { id = 'g001ig0391', min = 1, max = 1 }), -- Посох Возни-15точ-10урон / Посох защиты+15броня / Посох оракула+60оз
				orr3({ id = 'g000ig6016', min = 1, max = 1 }, { id = 'g000ig6018', min = 1, max = 1 }, { id = 'g001ig0097', min = 1, max = 1 }), -- Посох бури=40дмг / Посох сумерек-вижн / Посох озер+вода
				
				--сферы
				yn({ id = 'g001ig0478', min = 1, max = 1 }), -- Сфера Переохлаждения 40мороз непр. 500
				yn({ id = 'g001ig0467', min = 1, max = 1 }), -- Сфера Бури 66 2x2 500
				yn({ id = 'g000ig9024', min = 1, max = 1 }), -- Сфера Жажды 45вамп 500
				yn({ id = 'g000ig9020', min = 1, max = 1 }), -- Сфера Энергии +25аоеурон 500
				yn({ id = 'g000ig9021', min = 1, max = 1 }), -- Сфера Вампиризма III 60 700
				yn({ id = 'g000ig9016', min = 1, max = 1 }), -- Сфера Великого исцеления 80 700
				yn({ id = 'g001ig0203', min = 1, max = 1 }), -- Сфера Массового ослабления II 50 700
				yn({ id = 'g001ig0466', min = 1, max = 1 }), -- Сфера Морской пучины 110урон 700
				yn({ id = 'g001ig0457', min = 1, max = 1 }), -- Сфера Испепеления 110урон 700
				yn({ id = 'g001ig0183', min = 1, max = 1 }), -- Сфера Обширной коррозии II -20брони аое 700
				yn({ id = 'g001ig0480', min = 1, max = 1 }), -- Сфера Горы урон110 800
				yn({ id = 'g001ig0059', min = 1, max = 1 }), -- Сфера защиты от Оружия 800
				yn({ id = 'g000ig9025', min = 1, max = 1 }), -- Сфера Алчности 60 вамп аое 900
				yn({ id = 'g001ig0459', min = 1, max = 1 }), -- Сфера Землетрясения 75 колонны 900
				yn({ id = 'g000ig9014', min = 1, max = 1 }), -- Сфера Массового замедления 50 1000
				
				--знамя				
				yn({ id = 'g000ig1002', min = 1, max = 1 }), -- знамя неуязв700
				yn({ id = 'g001ig0362', min = 1, max = 1 }), -- Знамя болот800
				yn({ id = 'g001ig0363', min = 1, max = 1 }), -- Знамя отваги750
				yn({ id = 'g001ig0374', min = 1, max = 1 }), -- Знамя стального листопада800
				yn({ id = 'g001ig0364', min = 1, max = 1 }), -- Знамя ветра перемен800
				yn({ id = 'g001ig0358', min = 1, max = 1 }), -- Знамя ража800
				yn({ id = 'g001ig0375', min = 1, max = 1 }), -- Знамя наследия1000
				yn({ id = 'g001ig0291', min = 1, max = 1 }), -- Штандарт равновесия1500
				yn({ id = 'g001ig0290', min = 1, max = 1 }), -- Стяг непреклонности1500
				yn({ id = 'g001ig0052', min = 1, max = 1 }), -- Знамя стойких1500
				yn({ id = 'g000ig1017', min = 1, max = 1 }), -- Знамя Здоровья1500

				--талик
				orr5({id = 'g000ig9130', min = 1, max = 1}, {id = 'g000ig9136', min = 1, max = 1}, {id = 'g001ig0185', min = 1, max = 1}, {id = 'g000ig9123', min = 1, max = 1}, {id = 'g001ig0202', min = 1, max = 1}), -- Талисман Бури 1000 / Талисман Горы 1600 / Талисман Землетрясения 1800 / Талисман Пожара 1000 / Талисман призыва нейтралов IV 1000

				--свитки
				orr(orr({ id = 'g000ig5110', min = 1, max = 1}, { id = 'g000ig5109', min = 1, max = 1}), orr({ id = 'g001ig0165', min = 1, max = 1}, { id = 'g000ig5108', min = 1, max = 1})), -- Свиток "Излечение" / Свиток "Блуждающий Огонек"-40дмг / Свиток "Забвение"-перки / Свиток "Призыв III: Энт Большой"
				orr(orr({ id = 'g000ig5089', min = 1, max = 1}, { id = 'g000ig5026', min = 1, max = 1}), orr({ id = 'g000ig5013', min = 1, max = 1}, { id = 'g000ig5012', min = 1, max = 1})), -- Свиток "Preces"-точн.урон / Свиток "Гимн кланов"+ини / Свиток "Святая сила"+точн.урон / Свиток "Святая броня"+броня 
			}
		},
--класс		guard = guard3(),
	},

	-- вторая лавка
	
	{
		goods = {
			itemTypes = { Item.Scroll },
			value = { min = 1400, max = 1400 },
			itemValue = { min = 700, max = 700 },
			items = {
				{ id = 'g000ig0001', min = 5, max = 6 },
				{ id = 'g000ig0006', min = 5, max = 6 },
				{ id = 'g001ig0378', min = 6, max = 7 }, --хил75
				{ id = 'g000ig0005', min = 7, max = 10 },
				{ id = 'g000ig0018', min = 1, max = 1 },

				{ id = 'g000ig0012', min = 1, max = 1 }, --ини30
				{ id = 'g000ig0015', min = 1, max = 1 }, --урон30
				{ id = 'g000ig0003', min = 1, max = 2 }, --защита30
				yn({ id = 'g000ig0009', min = 1, max = 1 }), --точность30			

				yn({ id = 'g000ig0002', min = 1, max = 2 }), --защита15
				yn({ id = 'g000ig0014', min = 1, max = 2 }), --атака15
				yn({ id = 'g000ig0011', min = 1, max = 2 }), --ини15
				yn({ id = 'g000ig0008', min = 1, max = 2 }), --точность15
				
				yn({ id = 'g000ig0021', min = 1, max = 2 }), -- вард воздух
				yn({ id = 'g000ig0022', min = 1, max = 2 }), -- вард вода
				yn({ id = 'g000ig0023', min = 1, max = 2 }), -- вард земля
				yn({ id = 'g000ig0024', min = 1, max = 2 }), -- вард огонь
				
				yn({ id = 'g001ig0125', min = 1, max = 1 }), -- вард разума
				yn({ id = 'g001ig0036', min = 1, max = 1 }), -- вард смерти

				{ id = pw5(), min = 1, max = 1},
				{ id = pw5(), min = 1, max = 1},
				{ id = pw6(), min = 1, max = 1},

				orr({ id = 'g001ig0563', min = 1, max = 1 }, { id = 'g001ig0035', min = 1, max = 1 }), -- Аура внимательности +5 крит / Великая аура жизненной силы аое +30хп
				{ id = p15(), min = 1, max = 1},

				yn({ id = 'g001ig0197', min = 1, max = 1 }), -- прокл.пепел950
				yn({ id = 'g000ig3004', min = 1, max = 1 }), -- рун.клин1200
				yn({ id = 'g001ig0124', min = 1, max = 1 }), -- клин.возв1200
				yn({ id = 'g000ig9035', min = 1, max = 1 }), -- Слеза Мортис (Артефакт) 1200
				yn({ id = 'g001ig0415', min = 1, max = 1 }), -- Руна кары Тьяцци (Артефакт) 1150
				yn({ id = 'g001ig0612', min = 1, max = 1 }), -- Кольцо небесной воли (Артефакт) 1000
				yn({ id = 'g001ig0413', min = 1, max = 1 }), -- Корни триббога (Артефакт) 1200

				yn({ id = 'g001ig0411', min = 1, max = 1 }), -- Грань реальности (Артефакт)1400
				yn({ id = 'g001ig0604', min = 1, max = 1 }), -- Кинжал жатвы (Артефакт)1300
				yn({ id = 'g001ig0046', min = 1, max = 1 }), -- Кровь Владыки (Артефакт)1400
				yn({ id = 'g001ig0102', min = 1, max = 1 }), -- Коготь Пожирателя (Артефакт)1800
				
				yn({ id = 'g001ig0597', min = 1, max = 1 }), -- Кираса резонанса (Реликвия)1000
				yn({ id = 'g001ig0419', min = 1, max = 1 }), -- Шлем воителя (Реликвия)1000
				yn({ id = 'g001ig0430', min = 1, max = 1 }), -- Роба убийцы (Реликвия)850
				yn({ id = 'g001ig0539', min = 1, max = 1 }), -- Тисовый лук (Реликвия)900
				yn({ id = 'g001ig0116', min = 1, max = 1 }), -- р.плас.досп1200
				yn({ id = 'g000ig3005', min = 1, max = 1 }), -- р.кор.мьолн1200				
				yn({ id = 'g000ig7010', min = 1, max = 1 }), -- р.кор.имп1800
				yn({ id = 'g001ig0038', min = 1, max = 1 }), -- р.тяж.латы1550

				orr({ id = 'g001ig0501', min = 1, max = 1 }, { id = 'g000ig1010', min = 1, max = 1 }), -- Дары Галлеана (лес) 900 / эльфийские сапоги 700
				orr({ id = 'g000ig8003', min = 1, max = 1 }, { id = 'g001ig0606', min = 1, max = 1 }), -- Сапоги скорости 700 | Сапоги родных земель 1000

				--посох
				orr3({ id = 'g000ig6011', min = 1, max = 1 }, { id = 'g001ig0398', min = 1, max = 1 }, { id = 'g001ig0400', min = 1, max = 1 }), -- Посох повелителя драконов=40дмг / Посох скальда+15ини / Посох созыва шабаша-вижн
				orr3({ id = 'g000ig6015', min = 1, max = 1 }, { id = 'g000ig6017', min = 1, max = 1 }, { id = 'g000ig6009', min = 1, max = 1 }), -- Посох Всевышнего+20хп+5брони / Посох дневного света+вижн / Посох земли+голем
				
				--сферы
				yn({ id = 'g001ig0469', min = 1, max = 1 }), -- Сфера Пожара 55крест 500
				yn({ id = 'g001ig0304', min = 1, max = 1 }), -- Сфера Боли 60 ряд 500
				yn({ id = 'g001ig0468', min = 1, max = 1 }), -- Сфера Оползня 50урон 2колоны 500
				yn({ id = 'g001ig0443', min = 1, max = 1 }), -- Сфера Брони II 25 600
				yn({ id = 'g001ig0462', min = 1, max = 1 }), -- Сфера направленного ослабления II 50 700
				yn({ id = 'g001ig0455', min = 1, max = 1 }), -- Сфера Спасения 100хил 2колонны 700
				yn({ id = 'g001ig0489', min = 1, max = 1 }), -- Сфера Угнетения 110 урон 700
				yn({ id = 'g001ig0131', min = 1, max = 1 }), -- Сфера Урона III +урон60 700
				yn({ id = 'g000ig9028', min = 1, max = 1 }), -- Сфера Грозы 110урон 700
				yn({ id = 'g001ig0136', min = 1, max = 1 }), -- Сфера Брони III 35 800
				yn({ id = 'g001ig0303', min = 1, max = 1 }), -- Сфера Древнего вамп100 800
				yn({ id = 'g001ig0477', min = 1, max = 1 }), -- Сфера Терзаний 85 ряд 900
				yn({ id = 'g000ig9027', min = 1, max = 1 }), -- Сфера Урагана 99 2x2 900
				yn({ id = 'g000ig9032', min = 1, max = 1 }), -- Сфера цунами 90 неприкр 900

				--знамя				
				yn({ id = 'g000ig1002', min = 1, max = 1 }), -- знамя неуязв700
				yn({ id = 'g001ig0362', min = 1, max = 1 }), -- Знамя болот800
				yn({ id = 'g001ig0363', min = 1, max = 1 }), -- Знамя отваги750
				yn({ id = 'g001ig0374', min = 1, max = 1 }), -- Знамя стального листопада800
				yn({ id = 'g001ig0364', min = 1, max = 1 }), -- Знамя ветра перемен800
				yn({ id = 'g001ig0358', min = 1, max = 1 }), -- Знамя ража800
				yn({ id = 'g001ig0375', min = 1, max = 1 }), -- Знамя наследия1000
				yn({ id = 'g001ig0291', min = 1, max = 1 }), -- Штандарт равновесия1500
				yn({ id = 'g001ig0290', min = 1, max = 1 }), -- Стяг непреклонности1500
				yn({ id = 'g001ig0052', min = 1, max = 1 }), -- Знамя стойких1500
				yn({ id = 'g000ig1017', min = 1, max = 1 }), -- Знамя Здоровья1500

				--талик
				orr5({id = 'g000ig9130', min = 1, max = 1}, {id = 'g000ig9136', min = 1, max = 1}, {id = 'g001ig0185', min = 1, max = 1}, {id = 'g000ig9123', min = 1, max = 1}, {id = 'g001ig0202', min = 1, max = 1}), -- Талисман Бури 1000 / Талисман Горы 1600 / Талисман Землетрясения 1800 / Талисман Пожара 1000 / Талисман призыва нейтралов IV 1000

				--свитки
				orr(orr({ id = 'g000ig5110', min = 1, max = 1}, { id = 'g000ig5109', min = 1, max = 1}), orr({ id = 'g001ig0165', min = 1, max = 1}, { id = 'g000ig5108', min = 1, max = 1})), -- Свиток "Излечение" / Свиток "Блуждающий Огонек"-40дмг / Свиток "Забвение"-перки / Свиток "Призыв III: Энт Большой"
				orr(orr({ id = 'g000ig5089', min = 1, max = 1}, { id = 'g000ig5026', min = 1, max = 1}), orr({ id = 'g000ig5013', min = 1, max = 1}, { id = 'g000ig5012', min = 1, max = 1})), -- Свиток "Preces"-точн.урон / Свиток "Гимн кланов"+ини / Свиток "Святая сила"+точн.урон / Свиток "Святая броня"+броня 


				
			}
		},
--класс		guard = guard3(),
	},
	
}
end


----------------------

-- Руины Респ 0
local valueRuinRespZ0 = { min = 160*kef, max = 160*kef*kr }

function z0Ruins()
return {
	{
		gold = { min = 250, max = 300 },
		loot = {
			items = {
				{id = ruin01(), min = 1, max = 1},
			},
		},
		guard = {
			subraceTypes = rsub(),
			value = valueRuinRespZ0
		}
	},
-- вторые р
	{
		gold = { min = 200, max = 250 },
		loot = {
			items = {
				{id = ruin02(), min = 1, max = 1},
			},
		},
		guard = {
			subraceTypes = rsub(),
			value = valueRuinRespZ0
		}
	},	
	
}
end

-- Руины зона 1
local valueRuinRespZ = { min = 240*kef, max = 240*kef*kr }
local goldRuinRespZ = { min = 300, max = 350 } 

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
local valueRuinZone = { min = 400*kef, max = 400*kef*kr }
local goldRuinZone = { min = 400, max = 450 }

function zoneRuinZone2()
return {
	{
		gold = goldRuinZone,
		loot = {
			itemTypes = { Item.Talisman, Item.Armor, Item.Jewel, Item.Weapon, Item.Banner, Item.TravelItem},
			value = { min = 700, max = 800 },
			itemValue = { min = 700, max = 800 }
		},
		guard = {
			subraceTypes = NoUndead(),
			value = valueRuinZone
		}
	},
}
end

-- Руины зона 3
local valueRuinZone3 = { min = 900*kef, max = 900*kef*kr }
local goldRuinZone3 = { min = 500, max = 550 }

function zoneRuinZone3()
return {
	{
		gold = goldRuinZone3,
		loot = {
				itemTypes = { Item.Armor }, -- 12 итемов
				value = { min = 900, max = 1200 },
				itemValue = { min = 900, max = 1200 }
		},
		guard = {
			subraceTypes = NoUndead(),
			value = valueRuinZone3
		}
	},
	{
		gold = goldRuinZone3,
		loot = {
				itemTypes = { Item.Weapon }, -- 9 итемов
				value = { min = 900, max = 1200 },
				itemValue = { min = 900, max = 1200 }
		},
		guard = {
			subraceTypes = NoUndead(),
			value = valueRuinZone3
		}
	},
	{
		gold = goldRuinZone3,
		loot = {
				itemTypes = { Item.Jewel, Item.Talisman }, -- 7 + 4 итемов
				value = { min = 900, max = 1200 },
				itemValue = { min = 900, max = 1200 }
		},
		guard = {
			subraceTypes = NoUndead(),
			value = valueRuinZone3
		}
	},
	{
		gold = goldRuinZone3,
		loot = {
				itemTypes = { Item.Banner }, -- 8 итемов
				value = { min = 800, max = 1000 },
				itemValue = { min = 800, max = 1000 }
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
		mines.infernalMana = 1
		mines.lifeMana = 1		
	end
	return mines
end

-- Источники т1
function getMinesRespZ2(race)
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

-- Источники т2
function getMinesZone2(race)
	local mines = {
--		gold = 1,
	}
	if race == Race.Human then
--		mines.lifeMana = 1
		mines.infernalMana = 1
		mines.deathMana = 1
	elseif race == Race.Dwarf then
--		mines.runicMana = 1
		mines.deathMana = 1
		mines.infernalMana = 1
	elseif race == Race.Undead then
--		mines.deathMana = 1
		mines.runicMana = 1
		mines.lifeMana = 1
	elseif race == Race.Heretic then
--		mines.infernalMana = 1
		mines.runicMana = 1
		mines.lifeMana = 1
	elseif race == Race.Elf then
--		mines.groveMana = 1
		mines.runicMana = 1
		mines.deathMana = 1
	end

	return mines		

end

-- Источники т3
function getMinesZone3()
	local mines = {
		gold = 4,
		lifeMana = 1,
		runicMana = 1,
		groveMana = 1,
		infernalMana = 1,
		deathMana = 1,
	}
  return mines
end

----------------

-- Юниты для наёмников зоны 2
function unitsMercen0(race)
local unitsm = {}
local i = 1

if race == Race.Human then
unitsm[i] = { id = 'g003uu5001', level = 1, unique = false } i = i + 1 -- Боец ополчения
unitsm[i] = { id = 'g000uu0001', level = 1, unique = false } i = i + 1 -- Сквайр
unitsm[i] = orr3({ id = 'g000uu0003', level = 3, unique = true }, { id = 'g000uu0005', level = 3, unique = true }, { id = 'g000uu0154', level = 3, unique = true }) i = i + 1 -- Имперский рыцарь / Инквизитор / Ассасин
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu7595', level = 2, unique = true } i = i + 1 end -- Рефаим 1300
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g003uu5002', level = 2, unique = true } i = i + 1 end -- Алебардист
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu0009', level = 2, unique = true } i = i + 1 end -- Волшебник
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu7561', level = 2, unique = true } i = i + 1 end -- Егерь
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu0012', level = 2, unique = true } i = i + 1 end -- Жрец
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu0016', level = 2, unique = true } i = i + 1 end -- Монахиня
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu2014', level = 2, unique = true } i = i + 1 end -- Оруженосец
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu0004', level = 2, unique = true } i = i + 1 end -- Охотник на ведьм
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu2029', level = 2, unique = true } i = i + 1 end -- Поборник
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu0007', level = 2, unique = true } i = i + 1 end -- Рейнджер
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu0002', level = 2, unique = true } i = i + 1 end -- Рыцарь
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu8310', level = 2, unique = true } i = i + 1 end -- Саггитар

elseif race == Race.Dwarf then
unitsm[i] = { id = 'g000uu0036', level = 1, unique = false } i = i + 1 -- Гном
unitsm[i] = { id = 'g004uu5039', level = 1, unique = false } i = i + 1 -- Снежный волк
unitsm[i] = orr3({ id = 'g000uu0038', level = 3, unique = true }, { id = 'g000uu0038', level = 3, unique = true }, { id = 'g000uu0162', level = 3, unique = true }) i = i + 1 -- Ветеран / Ветеран / Защитник горна
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu0030', level = 2, unique = true } i = i + 1 end -- Горный великан
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu7583', level = 2, unique = true } i = i + 1 end -- Йамму 1500
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu0027', level = 2, unique = true } i = i + 1 end -- Арбалетчик
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g001uu7571', level = 2, unique = true } i = i + 1 end -- Белый волк
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu0037', level = 2, unique = true } i = i + 1 end -- Воин
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g004uu8005', level = 2, unique = true } i = i + 1 end -- Гарм
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu0034', level = 2, unique = true } i = i + 1 end -- Посвященная

elseif race == Race.Undead then
unitsm[i] = { id = 'g000uu0086', level = 1, unique = false } i = i + 1 -- Воин
unitsm[i] = { id = 'g001uu7539', level = 1, unique = false } i = i + 1 -- Колотун
unitsm[i] = orr3({ id = 'g000uu0091', level = 3, unique = true }, { id = 'g000uu0088', level = 3, unique = true }, { id = 'g000uu0085', level = 3, unique = true }) i = i + 1 -- Лорд Тьмы / Скелет-воин / Злой дух
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu0094', level = 2, unique = true } i = i + 1 end -- Дракон Рока
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g001uu7564', level = 2, unique = true } i = i + 1 end -- Хорт 900
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g001uu7563', level = 2, unique = true } i = i + 1 end -- Волколак
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g001uu7565', level = 2, unique = true } i = i + 1 end -- Чумной оборотень
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu7542', level = 2, unique = true } i = i + 1 end -- Чумотворец
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu0087', level = 2, unique = true } i = i + 1 end -- Зомби
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu0081', level = 2, unique = true } i = i + 1 end -- Колдун
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu0079', level = 2, unique = true } i = i + 1 end -- Призрак
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu0090', level = 2, unique = true } i = i + 1 end -- Тамплиер
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g003uu5013', level = 2, unique = true } i = i + 1 end -- Череполом

elseif race == Race.Heretic then
unitsm[i] = { id = 'g000uu0052', level = 1, unique = false } i = i + 1 -- Одержимый
unitsm[i] = orr3({ id = 'g000uu0054', level = 3, unique = true }, { id = 'g000uu0054', level = 3, unique = true }, { id = 'g000uu2003', level = 3, unique = true }) i = i + 1 -- Черный паладин / Черный паладин / Мучитель
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu7577', level = 2, unique = true } i = i + 1 end -- Сатир 1500
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu0058', level = 2, unique = true } i = i + 1 end -- Демон
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu7572', level = 2, unique = true } i = i + 1 end -- Апатитовая горгулья
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu0056', level = 2, unique = true } i = i + 1 end -- Мраморная горгулья
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu0053', level = 2, unique = true } i = i + 1 end -- Берсеркер
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu0067', level = 2, unique = true } i = i + 1 end -- Ведьма
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g004uu6101', level = 2, unique = true } i = i + 1 end -- Дьяволенок
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu0063', level = 2, unique = true } i = i + 1 end -- Темный колдун

elseif race == Race.Elf then
unitsm[i] = { id = 'g000uu8014', level = 1, unique = false } i = i + 1 -- Кентавр-копейщик
unitsm[i] = { id = 'g000uu8036', level = 1, unique = false } i = i + 1 -- Энт Малый
unitsm[i] = orr3({ id = 'g001uu7579', level = 3, unique = true }, { id = 'g000uu8017', level = 3, unique = true }, { id = 'g000uu8021', level = 3, unique = true }) i = i + 1 -- Кентавр-гвардеец / Кентавр-дикарь / Бандит
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu8030', level = 2, unique = true } i = i + 1 end -- Владыка Небес 1300
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g003uu8038', level = 2, unique = true } i = i + 1 end -- Энт-целитель
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu8015', level = 2, unique = true } i = i + 1 end -- Кентавр-латник
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu8016', level = 2, unique = true } i = i + 1 end -- Кентавр-странник
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu8032', level = 2, unique = true } i = i + 1 end -- Оракул
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu8019', level = 2, unique = true } i = i + 1 end -- Охотник
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu8022', level = 2, unique = true } i = i + 1 end -- Сторож
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu8026', level = 2, unique = true } i = i + 1 end -- Чанелер

end

return unitsm
end


-- Наёмники в зоне 2
function zoneMercenZone2(race)
return {
	{
		units = unitsMercen0(race),
--класс		guard = guard2n(),
	},
	}
end



-- Юниты для наёмников 1 зоны 3
function unitsMercen1()
local unitsm = {}
local i = 1

unitsm[i] = orr({ id = 'g000uu7629', level = 1, unique = false }, { id = 'g000uu7628', level = 1, unique = false }) i = i + 1 -- Благ-дный эльф / Имперский гвардеец

if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu2030', level = 3, unique = true } i = i + 1 end -- Детектив
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu2009', level = 3, unique = true } i = i + 1 end -- Клинок в тени
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0157', level = 4, unique = true } i = i + 1 end -- Великий инквизитор
if math.random(0,1) == 1 then unitsm[i] = { id = 'g001uu7543', level = 4, unique = true } i = i + 1 end -- Сенешаль
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0152', level = 4, unique = true } i = i + 1 end -- Белый маг

if math.random(0,1) == 1 then unitsm[i] = { id = 'g006uu1128', level = 3, unique = true } i = i + 1 end -- Мастер печи
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu7568', level = 3, unique = true } i = i + 1 end -- Сотрясатель
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0190', level = 1, unique = true } i = i + 1 end -- Дух Фенрира
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0040', level = 4, unique = true } i = i + 1 end -- Старый ветеран

if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu2012', level = 3, unique = true } i = i + 1 end -- Кентавр Стрелок
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8023', level = 3, unique = true } i = i + 1 end -- Стражник
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8028', level = 3, unique = true } i = i + 1 end -- Тиург
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu2013', level = 4, unique = true } i = i + 1 end -- Налетчик
if math.random(0,1) == 1 then unitsm[i] = { id = 'g001uu8240', level = 4, unique = true } i = i + 1 end -- Штормовой кентавр

if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu2003', level = 3, unique = true } i = i + 1 end -- Мучитель
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0171', level = 3, unique = true } i = i + 1 end -- подражатель
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0166', level = 4, unique = true } i = i + 1 end -- Возвышенный
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0059', level = 3, unique = true } i = i + 1 end -- Молох

if math.random(0,1) == 1 then unitsm[i] = { id = 'g003uu5012', level = 3, unique = true } i = i + 1 end -- Орк-палач
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0082', level = 3, unique = true } i = i + 1 end -- Некромант
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0177', level = 4, unique = true } i = i + 1 end -- Смерть
if math.random(0,1) == 1 then unitsm[i] = { id = 'g003uu5014', level = 4, unique = true } i = i + 1 end -- Хан Каменной Пасти

return unitsm
end


-- Юниты для наёмников 2 зоны 3
function unitsMercen2()
local unitsm = {}
local i = 1

unitsm[i] = orr({ id = 'g000uu7629', level = 1, unique = false }, { id = 'g000uu7628', level = 1, unique = false }) i = i + 1 -- Благ-дный эльф / Имперский гвардеец

if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu2015', level = 3, unique = true } i = i + 1 end -- Страж Святости
if math.random(0,1) == 1 then unitsm[i] = { id = 'g001uu7560', level = 1, unique = true } i = i + 1 end -- Каратель
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0014', level = 4, unique = true } i = i + 1 end -- Ангел
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu2031', level = 4, unique = true } i = i + 1 end -- Эмиссар
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu2010', level = 4, unique = true } i = i + 1 end -- Кара Императора

if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0164', level = 4, unique = true } i = i + 1 end -- Повелитель волков
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8201', level = 1, unique = true } i = i + 1 end -- Скальд
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0041', level = 3, unique = true } i = i + 1 end -- Горец
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu2011', level = 4, unique = true } i = i + 1 end -- Хранитель рун

if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8020', level = 3, unique = true } i = i + 1 end -- Стингер
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8024', level = 3, unique = true } i = i + 1 end -- Часовой
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8151', level = 1, unique = true } i = i + 1 end -- фурия
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu7578', level = 4, unique = true } i = i + 1 end -- Кераст

if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu7605', level = 1, unique = true } i = i + 1 end -- Скульптор лжи
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0064', level = 3, unique = true } i = i + 1 end -- Демонолог
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu2004', level = 4, unique = true } i = i + 1 end -- Истязатель душ
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8254', level = 4, unique = true } i = i + 1 end -- Искоренитель
if math.random(0,1) == 1 then unitsm[i] = { id = 'g001uu7574', level = 3, unique = true } i = i + 1 end -- Цитриновая горгулья

if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu2007', level = 3, unique = true } i = i + 1 end -- Мумификатор
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0178', level = 4, unique = true } i = i + 1 end -- Сущий
if math.random(0,1) == 1 then unitsm[i] = { id = 'g001uu8314', level = 4, unique = true } i = i + 1 end -- Клеврет Смерти
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0089', level = 4, unique = true } i = i + 1 end -- Скелет-рыцарь

return unitsm
end

-- Наёмники в зоне 3
function zoneMercenZone3()
return {
	{
		units = unitsMercen1(),
--класс		guard = guard2n(),
	},
-- второй лагерь
	{
		units = unitsMercen2(),
--класс		guard = guard2n(),
	},
	
	}
end

----------------------

-- Сундуки Респ
function bags0()
return {
	count = 1,
	loot = {
		itemTypes = { Item.Valuable },
		value = { min = 250, max = 250 }, 
		itemValue = { min = 250, max = 250 },
			items = {
				orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --рес/хил100
				orr({ id = 'g001ig0180', min = 2, max = 2 }, { id = 'g000ig0005', min = 1, max = 1 }), --2хил25/хил50
				{ id = d15(), min = 1, max = 1 },
			}
	}
}
end


-- Сундуки т1
function bags1()
return {
	count = 1,
	loot = {
		itemTypes = { Item.Valuable },
		value = { min = 500, max = 500 }, 
		itemValue = { min = 250, max = 500 },
			items = {
				orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --рес/хил100
				orr({ id = 'g001ig0180', min = 3, max = 3 }, { id = 'g001ig0378', min = 1, max = 1 }), --3хил25/хил75
				{ id = e2(), min = 1, max = 1 },
			}
	}
}
end

-- Сундуки т2
function bags2()
return {
	count = 1,
	loot = {
		itemTypes = { Item.Valuable },
		value = { min = 750, max = 750 }, 
		itemValue = { min = 250, max = 750 },
			items = {
				orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --рес/хил100
				orr({ id = 'g000ig0005', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --2хил50/хил100
				{ id = e4(), min = 1, max = 1 },
			}
		}
}
end

-- Сундуки т3
function bags3()
return {
	count = 3,
	loot = {
		itemTypes = { Item.Valuable },
		value = { min = 3000, max = 3000 },
		itemValue = { min = 500, max = 1000 },
			items = {
				{ id = 'g000ig0001', min = 2, max = 2 }, --рес
				{ id = 'g000ig0006', min = 2, max = 2 }, --хил100
				{ id = 'g000ig0018', min = 1, max = 1 }, --хил200
				{ id = pw5(), min = 1, max = 1 },
				{ id = pw5(), min = 1, max = 1 },
				{ id = pw5(), min = 1, max = 1 },					
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

-- субраса игрока
function getPlayerSubRace(race)
	if race == Race.Human then return Subrace.Human
	elseif race == Race.Dwarf then return Subrace.Dwarf
	elseif race == Race.Undead then return Subrace.Undead
	elseif race == Race.Heretic then return Subrace.Heretic
	elseif race == Race.Elf then return Subrace.Elf
	end
end

-- родной шар манны
function ExtraHomeMana(race)
	
	shmn = 'g001ig0146' -- Шар маны Жизни
	sdw = 'g001ig0148' -- Шар маны Рун
	sun = 'g001ig0149' -- Шар маны Смерти
	shr = 'g001ig0147' -- Шар маны Преисподней
	self = 'g001ig0150' -- Шар Лесного эликсира 
	
	if race == Race.Human then return shmn
	elseif race == Race.Dwarf then return sdw
	elseif race == Race.Undead then return sun
	elseif race == Race.Heretic then return shr
	elseif race == Race.Elf then return self
	end
end

-- родной малый шар манны
function ExtraSmallHomeMana(race)
	
	shmn = 'g001ig0481' -- Шар маны Жизни
	sdw = 'g001ig0483' -- Шар маны Рун
	sun = 'g001ig0484' -- Шар маны Смерти
	shr = 'g001ig0482' -- Шар маны Преисподней
	self = 'g001ig0485' -- Шар Лесного эликсира 
	
	if race == Race.Human then return shmn
	elseif race == Race.Dwarf then return sdw
	elseif race == Race.Undead then return sun
	elseif race == Race.Heretic then return shr
	elseif race == Race.Elf then return self
	end
end

-- доп малый шар в ст-ице на старте на спец. заклы
function ExtraSmallManaProject4(race)
	
	shmn = orr('g001ig0484','g001ig0482') -- Шар маны Смерти \ Шар маны Преисподней
	sdw = orr('g001ig0484','g001ig0482') -- Шар маны Смерти \ Шар маны Преисподней
	sun = orr('g001ig0481','g001ig0483') -- Шар маны Жизни \ Шар маны Рун
	shr = orr('g001ig0481','g001ig0483') -- Шар маны Жизни \ Шар маны Рун
	self = orr('g001ig0484','g001ig0483') -- Шар маны Смерти \ Шар маны Рун
	
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

-- случайная банка на 30
function b30()
	local radn = math.random(0,3)
	if radn == 0 then
	return 'g000ig0003' --зашита
	elseif radn == 1 then
	return 'g000ig0015' --атака
	elseif radn == 2 then
	return 'g000ig0012' --ини
	elseif radn == 3 then
	return 'g000ig0009' --точность
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

-- случайный эликсир 200-375 + эффект варды (от-яд з1)
function e2()
	local radn = math.random(0,5)
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
	elseif radn == 5 then
	return 'g001ig0343' --Эликсир защиты от проклятий
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
	local radn = math.random(0,6)
	if radn == 0 then
	return 'g001ig0332' -- Зелье ихора Танатоса вард-яд
	elseif radn == 1 then
	return 'g001ig0334' -- Эликсир безраздельности имун-имитация
	elseif radn == 2 then
	return 'g001ig0328' -- Эликсир ледяной плоти вард-мороз
	elseif radn == 3 then
	return 'g001ig0330' -- Эликсир Неопалимых вард-ожог
	elseif radn == 4 then
	return 'g001ig0346' -- Эликсир неудержимости вард-ослабление	
	elseif radn == 5 then
	return 'g001ig0344' -- Эликсир предназначения вард-замедление	
	elseif radn == 6 then
	return 'g001ig0346' -- Эликсир неудержимости вард-ослабление	
	end
end

-- случайный пермо вард 600
function pw6()
	local radn = math.random(0,8)
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
	elseif radn == 8 then
	return 'g001ig0534' -- Экстракт таинственной энергии (смена атаки)
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

-- случайный пермо-эликсир на 15% за 1200
function p15()
	local radn = math.random(0,4)
	if radn == 0 then
	return 'g001ig0308' -- Зелье заступника +15брони
	elseif radn == 1 then
	return 'g001ig0314' -- Эликсир наследия +15урон
	elseif radn == 2 then
	return 'g001ig0310' -- Эликсир опережения +15ини
	elseif radn == 3 then
	return 'g001ig0522' -- Зелье посла +неподкупность
	elseif radn == 4 then
	return 'g001ig0513' -- Зелье твердого шага +5мувов
	end
end

-- р-ны 0 пул наград 1 400
function ruin01()
	local radn = math.random(0,10)
	if radn == 0 then
	return 'g001ig0309' -- Эликсир задиры +5ини
	elseif radn == 1 then
	return 'g001ig0313' -- Эликсир совершенствования +5урон
	elseif radn == 2 then
	return 'g001ig0307' -- Зелье стойкости +5брони
	elseif radn == 3 then
	return 'g001ig0315' -- Зелье великана +5оз	
	elseif radn == 4 then
	return 'g001ig0493' -- Книга божественных даров +арты
	elseif radn == 5 then
	return 'g001ig0495' -- Книга наследия +знамёна
	elseif radn == 6 then
	return 'g001ig0494' -- Книга странника +сапоги
	elseif radn == 7 then
	return 'g001ig0428' -- Кожаные эльфийские доспехи (Реликвия)
	elseif radn == 8 then
	return 'g001ig0111' -- Сапоги ассасина
	elseif radn == 9 then
	return 'g001ig0609' -- Загробный фонарь (Артефакт)
	elseif radn == 10 then
	return 'g002ig0001' -- Потайной кинжал (Артефакт)
	end
end

-- р-ны 0 пул наград 2 з400 а500
function ruin02()
	local radn = math.random(0,10)
	if radn == 0 then
	return 'g000ig3017' -- Кинжал Вампиризма (Артефакт)
	elseif radn == 1 then
	return 'g001ig0182' -- Счастливая кость (Артефакт)
	elseif radn == 2 then
	return 'g000ig2002' -- Святая чаша (Артефакт)
	elseif radn == 3 then
	return 'g001ig0048' -- Амулет Кракена (Артефакт)
	elseif radn == 4 then
	return 'g000ig1005' -- Знамя быстроты	
	elseif radn == 5 then
	return 'g001ig0051' -- Знамя выносливости
	elseif radn == 6 then
	return 'g000ig1001' -- Знамя защиты
	elseif radn == 7 then
	return 'g000ig1007' -- Знамя силы
	elseif radn == 8 then
	return 'g000ig1003' -- Знамя сражения
	elseif radn == 9 then
	return 'g001ig0114' -- Тяжелые сапоги
	elseif radn == 10 then
	return 'g001ig0426' -- Куртка капитана (Реликвия)
	end
end

-- р-ны 1 пул наград 600 + талики400-500
function ruin1()
	local radn = math.random(0,10)
	if radn == 0 then
	return 'g001ig0582' -- Камень врат (Артефакт)
	elseif radn == 1 then
	return 'g000ig3002' -- Дьявольская чаша (Артефакт)
	elseif radn == 2 then
	return 'g001ig0487' -- Кольцо темных искуств (Артефакт)
	elseif radn == 3 then
	return 'g001ig0605' -- Книга постижения
	elseif radn == 4 then
	return 'g000ig3022' -- Лютня Очарования (Реликвия)
	elseif radn == 5 then
	return 'g001ig0427' -- Нагрудник Стража (Реликвия)
	elseif radn == 6 then
	return 'g001ig0370' -- Знамя искоренителя ереси
	elseif radn == 7 then
	return 'g001ig0369' -- Знамя снежной охоты
	elseif radn == 8 then
	return 'g000ig9120' -- Талисман щита стихий
	elseif radn == 9 then
	return 'g001ig0184' -- Талисман Восстановления
	elseif radn == 10 then
	return 'g000ig9109' -- Талисман призыва нейтралов II

	end
end

-- заклы со старта
function CapSpell(race)
	sphmn = orr(orr('g000ss0002','g000ss0003'),orr('g000ss0004','g000ss0009')) -- Быстрота\Сила\Молния\Истинное зрение
	spdw = orr(orr('g000ss0021','g000ss0023'),orr('g000ss0024','g000ss0025')) -- Ледяной щит\Сила Витара\Буран\Призыв I: Рух
	spun = orr(orr('g000ss0061','g000ss0062'),orr('g000ss0065','g000ss0064')) -- Призыв I: Скелет\Мор\Ржавчина\Слабость
	sphr = orr(orr('g000ss0041','g000ss0042'),orr('g000ss0043','g000ss0044')) -- Incantare Hellhound\Incantare Hellhound Illudere\Ignis mare\Menta minoris
	spelf = orr(orr('g000ss0097','g000ss0098'),orr('g000ss0101','g000ss0106')) -- Кустарник\Призыв I: Энт Малый\Стая\Смятение
	
	if race == Race.Human then return sphmn
	elseif race == Race.Dwarf then return spdw
	elseif race == Race.Undead then return spun
	elseif race == Race.Heretic then return sphr
	elseif race == Race.Elf then return spelf
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

-- субраса только не нежить
function NoUndead()
	local radn = math.random(0,3)
	if radn == 0 then
	return {Subrace.Human, Subrace.Neutral, Subrace.NeutralHuman, Subrace.NeutralGreenSkin, Subrace.NeutralDragon, Subrace.NeutralMarsh, Subrace.NeutralBarbarian, Subrace.NeutralWolf} --люди
	elseif radn == 1 then
	return {Subrace.Elf, Subrace.Neutral, Subrace.NeutralElf, Subrace.NeutralGreenSkin, Subrace.NeutralDragon, Subrace.NeutralMarsh, Subrace.NeutralBarbarian, Subrace.NeutralWolf} --эльфы
	elseif radn == 2 then
	return {Subrace.Heretic, Subrace.Neutral, Subrace.NeutralGreenSkin, Subrace.NeutralDragon, Subrace.NeutralMarsh, Subrace.NeutralBarbarian, Subrace.NeutralWolf} --демоны
	elseif radn == 3 then
	return {Subrace.Dwarf, Subrace.Neutral, Subrace.NeutralGreenSkin, Subrace.NeutralDragon, Subrace.NeutralMarsh, Subrace.NeutralBarbarian, Subrace.NeutralWolf} --гномы
	end
end

----------------------
-- Отряды респ зона 0
---------------------

function z0Stacks1()
return {  -- 140*2
		subraceTypes = { Subrace.NeutralGreenSkin, Subrace.NeutralWolf },
		count = 2,
		value = { min = 280*kef, max = 280*kef*kr },
		loot = {
			items = {
				{ id = 'g001ig0180', min = 1, max = 1 }, --хил25
				{ id = 'g000ig7001', min = 1, max = 1 }, --кольцо50
				{ id = rmss(), min = 1, max = 1 }, --случ. мал. шар манны
				orr({ id = 'g000ig0021', min = 1, max = 1 }, { id = 'g000ig0024', min = 1, max = 1 }), --возд/огня
			}
		}
}
end

function z0Stacks2()
return {  -- 150*2
		subraceTypes = rsub(),
		count = 2,
		value = { min = 300*kef, max = 300*kef*kr },
		loot = {
			items = {
				{ id = 'g000ig0005', min = 1, max = 1 }, --хил50
				{ id = 'g001ig0431', min = 1, max = 1 }, --гранат75
				orr({ id = 'g000ig0011', min = 1, max = 1 }, { id = 'g000ig0008', min = 1, max = 1 }), --ини15/точность15
				orr({ id = 'g000ig0023', min = 1, max = 1 }, { id = 'g000ig0022', min = 1, max = 1 }), --земли/воды		
			}
		}
}
end

function z0Stacks3()
return { -- 160*2
		subraceTypes = rsub(),
		count = 2,
		value = { min = 320*kef, max = 320*kef*kr },
		loot = {
			itemTypes = { Item.Orb },
			value = { min = 200, max = 200 },
			itemValue = { min = 100, max = 100 },		
			items = {
				{ id = 'g001ig0378', min = 1, max = 1}, --хил75
				orr({ id = 'g000ig0014', min = 1, max = 1 }, { id = 'g000ig0002', min = 1, max = 1 }), --атака15/защита15
			}
		}
}
end

function z0Stacks4(race)
return { -- 170*2
		subraceTypes = NoUndead(),
		count = 2,
		value = { min = 340*kef, max = 340*kef*kr },
		loot = {
			itemTypes = { Item.Scroll },
			value = { min = 400, max = 400 },
			itemValue = { min = 200, max = 200 },		
			items = {
				orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --рес/хил100
				orr({ id = ExtraSmallManaProject4(race), min = 1, max = 1 }, { id = rmss(), min = 1, max = 1 }), --случ. доп. мал. доп. / случ мал шар манны
				{ id = b15(), min = 1, max = 1 }, -- случ. банка15
				{ id = d15(), min = 1, max = 1 }, -- случ. дотвард				
			}
		}
}
end

--------------
-- Отряды зона 1
--------------

function z1Stacks1(race)
return {  --200xp*2
		subraceTypes = { Subrace.NeutralGreenSkin, Subrace.NeutralWolf },
		count = 2,
		value = { min = 400*kef, max = 400*kef*kr },
		loot = {
			items = {
				{ id = 'g001ig0378', min = 2, max = 2 }, --хил75
				{ id = 'g001ig0431', min = 1, max = 1 }, --гранат75
				{ id = ExtraSmallManaProject4(race), min = 1, max = 1 }, --случ. мал. доп. шар манны
				orr({ id = 'g000ig0011', min = 1, max = 1 }, { id = 'g000ig0008', min = 1, max = 1 }), --ини15/точность15
				{ id = w15(), min = 1, max = 1 }, --случ. вард
			}
		}
}
end

function z1Stacks2()
return { --220xp*2
		subraceTypes = rsub(),
		count = 2,
			value = { min = 440*kef, max = 440*kef*kr }, 
			loot = {
				itemTypes = { Item.Orb },
				value = { min = 400, max = 400 },
				itemValue = { min = 200, max = 200 },
				items = {
					orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --рес/хил100
					orr({ id = 'g000ig0014', min = 1, max = 1 }, { id = 'g000ig0002', min = 1, max = 1 }), --атака15/защита15
					orr({ id = 'g000ig0021', min = 1, max = 1 }, { id = 'g000ig0024', min = 1, max = 1 }), --возд/огня
					{ id = 'g000ig7002', min = 1, max = 1 }, --кольцо100
				}
			}

}
end

function z1Stacks3() 
return { --240xp*2
		subraceTypes = rsub(),
		count = 2,
			value = { min = 480*kef, max = 480*kef*kr }, 
			loot = {
				itemTypes = { Item.Scroll },
				value = { min = 800, max = 800 },
				itemValue = { min = 400, max = 400 },
				items = {
					orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --рес/хил100
					{ id = 'g001ig0378', min = 1, max = 1 }, --хил75
					orr({ id = 'g000ig0022', min = 1, max = 1 }, { id = 'g000ig0023', min = 1, max = 1 }), --воды/земли
					{ id = rms(), min = 1, max = 1 }, --случ. шар манны
				}
			}
}
end

function z1Stacks4() 
return { --280xp*1
		count = 1,
			subraceTypes = NoUndead(),
			value = { min = 280*kef, max = 280*kef*kr }, 
			loot = {
				items = {
					{ id = 'g000ig0006', min = 1, max = 1 }, --хил100
					orr({ id = 'g001ig0533', min = 1, max = 1 },{ id = 'g001ig0026', min = 1, max = 1 }), -- Зелье ясного взора / Аура регенерации +10реген аое
					{ id = b15(), min = 1, max = 1 }, --случ. банка15
					orr({ id = 'g001ig0125', min = 1, max = 1 }, { id = 'g001ig0036', min = 1, max = 1 }), --разума/смерти					
				}
			}
}
end

function z1Stacks5() 
return { --320xp*1
		count = 1,
			subraceTypes = NoUndead(),
			value = { min = 320*kef, max = 320*kef*kr }, 
			loot = {
				itemTypes = { Item.Talisman, Item.Wand },
				value = { min = 200, max = 200 },
				itemValue = { min = 200, max = 200 },
				items = {
					{ id = 'g000ig0006', min = 1, max = 1 }, --хил100
					{ id = 'g001ig0432', min = 1, max = 1 }, --аметист125
					{ id = d15(), min = 1, max = 1 }, --спец.вард					
				}
			}
}
end

------------------
-- Отряды зона 2
------------------

function z2Stacks1()
return { -- 300xp*2
		subraceTypes = rsub(),
		count = 2,
		value = { min = 600*kef, max = 600*kef*kr}, 
		loot = {
			items = {
				{ id = 'g000ig0006', min = 1, max = 1 }, --хил100
				{ id = 'g001ig0378', min = 1, max = 1 }, --хил75
				{ id = 'g001ig0432', min = 1, max = 1 }, --аметист125
				{ id = rms(), min = 1, max = 1 }, --случ. шар манны				
				{ id = b15(), min = 1, max = 1 }, --случ. банка15				
				orr({ id = 'g001ig0128', min = 1, max = 1 }, { id = d15(), min = 1, max = 1 }), --оружия/дот.вард
			}
		},
	}	
end

function z2Stacks2()
return { -- 400хп*2
		subraceTypes = rsub(),
		count = 2,
		value = { min = 800*kef, max = 800*kef*kr },
		loot = {
			itemTypes = { Item.Orb },
			value = { min = 800, max = 800 },
			itemValue = { min = 400, max = 400 },
			items = {
				orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --рес/хил100
				{ id = 'g000ig0006', min = 1, max = 1 }, --хил100
				orr({ id = 'g001ig0125', min = 1, max = 1 }, { id = 'g001ig0036', min = 1, max = 1 }), --разума/смерти
				{ id = 'g000ig7003', min = 1, max = 1 }, --изумруд150
			}
		}
}
end

function z2Stacks3()
return { -- 500xp*2
		subraceTypes = rsub(),
		count = 2,
		value = { min = 1000*kef, max = 1000*kef*kr}, 
		loot = {
			itemTypes = { Item.Scroll },
			value = { min = 1100, max = 1100 },
			itemValue = { min = 550, max = 550 },
			items = {
				{ id = 'g000ig0001', min = 1, max = 1 }, --рес
				{ id = 'g000ig0006', min = 1, max = 1 }, --хил100
				{ id = 'g001ig0125', min = 1, max = 1 }, --разума
				{ id = rms(), min = 1, max = 1 }, --случ. шар манны				
			}
		}
	}
end

function z2Stacks4() 
return { -- 550хп*1
		subraceTypes = NoUndead(),
		count = 1,
		value = { min = 550*kef, max = 550*kef*kr },
		loot = {
			items = {
				orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --рес/хил100
				orr({ id = 'g001ig0516', min = 1, max = 1 }, { id = 'g001ig0523', min = 1, max = 1 }), --Зелье омоложения разума(-10планка)/Зелье воеводы(+10опыта)
				{ id = w15(), min = 1, max = 1 }, --случ. вард
				{ id = 'g001ig0036', min = 1, max = 1 }, --смерти
			}
		},
}
end

function z2Stacks5()
return { -- 600хп*1
		subraceTypes = NoUndead(),
		count = 1,
		value = { min = 600*kef, max = 600*kef*kr },
		loot = {
			itemTypes = { Item.PotionPermanent },
			value = { min = 500, max = 600 },
			itemValue = { min = 500, max = 600 },
			items = {
				{ id = 'g000ig0006', min = 1, max = 1 }, --хил100
				{ id = 'g001ig0433', min = 1, max = 1 }, --аквамарин175
				{ id = b15(), min = 1, max = 1 }, --случ. банка15
			}
		},
}
end

--------------------
-- Отряды зона 3
--------------------

function z3Stacks1(zshm)
return { -- 600xp
		subraceTypes = rsub(),
		count = 1,
		value = { min = 600*kef, max = 600*kef*kr},
		loot = {
			items = {
				orr(orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), orr({ id = 'g000ig0006', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 })), --рес25%/хил100-75%
				orr({ id = 'g001ig0180', min = 2, max = 2 }, { id = 'g000ig0005', min = 1, max = 1 }), --2хил25/хил50
				orr({ id = zshm, min = 1, max = 1 }, { id = 'g001ig0433', min = 1, max = 1 }), --шар манны / аквамарин175
				orr({ id = b15(), min = 1, max = 1 }, { id = w15(), min = 1, max = 1 }), --случ.банка15/случ.вард
			}
		},
	}
end

function z3Stacks2(zb30)
return { -- 700хп
		subraceTypes = rsub(),
		count = 1,
		value = { min = 700*kef, max = 700*kef*kr },
		loot = {
			items = {
				orr(orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), orr({ id = 'g000ig0006', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 })), --рес25%/хил100-75%
				orr({ id = 'g001ig0180', min = 2, max = 2 }, { id = 'g000ig0005', min = 1, max = 1 }), --2хил25/хил50				
				{ id = zb30, min = 1, max = 1 }, --банка30
				orr(orr({ id = 'g001ig0125', min = 1, max = 1 }, { id = 'g001ig0036', min = 1, max = 1 }), orr({ id = d15(), min = 1, max = 1 }, orr({ id = b15(), min = 1, max = 1 }, { id = w15(), min = 1, max = 1 }))), -- разума/смерти | d15/b15|w15
			}
		}
}
end

function z3Stacks3(zusil200)
return { -- 750хп
		subraceTypes = rsub(),
		count = 1,
		value = { min = 750*kef, max = 750*kef*kr },
		loot = {
			itemTypes = { Item.Orb },
			value = { min = 450, max = 600 },
			itemValue = { min = 450, max = 600 },
				items = {
					orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --рес/хил100
					orr({ id = 'g001ig0180', min = 3, max = 3 }, { id = 'g001ig0378', min = 1, max = 1 }), --3хил25/хил75				
					{ id = zusil200, min = 1, max = 1 }, --усиление200				
				}
		}
}
end

function z3Stacks4(zusil500, Scroll34)
return { -- 800хп
		subraceTypes = NoUndead(),
		count = 1,
		value = { min = 800*kef, max = 800*kef*kr },
		loot = {
--			itemTypes = { Item.Scroll },
--			value = { min = 700, max = 700 },
--			itemValue = { min = 700, max = 700 },
			items = {
				orr(orr({ id = 'g001ig0378', min = 2, max = 2 }, { id = 'g001ig0378', min = 2, max = 2 }), orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0018', min = 1, max = 1 })), -- хил75-50%/рес-25%/мазь-25%
				orr({ id = 'g000ig0006', min = 1, max = 1 }, { id = 'g000ig0005', min = 2, max = 2 }), --хил100/2хил50
				{ id = zusil500, min = 1, max = 1 }, --усиление500					
				{ id = Scroll34, min = 1, max = 1 }, --свиток т3/т4			
			}
		}
}
end

function z3Stacks5(zperm)
return { -- 850хп
		subraceTypes = NoUndead(),
		count = 1,
		value = { min = 850*kef, max = 850*kef*kr },
		loot = {
			items = {
				orr(orr({ id = 'g000ig0006', min = 1, max = 1 }, { id = 'g000ig0001', min = 1, max = 1 }), orr({ id = 'g000ig0018', min = 1, max = 1 }, { id = 'g000ig0018', min = 1, max = 1 })), -- хил100-25%/рес25%/мазь-50%
				orr({ id = 'g001ig0378', min = 1, max = 1 }, { id = 'g000ig0005', min = 2, max = 2 }), --2хил75/3хил50		
				{ id = zperm, min = 1, max = 1 }, --пермо400					
				orr(orr({ id = rms(), min = 1, max = 1 }, { id = 'g000ig7004', min = 1, max = 1 }), orr({ id = b15(), min = 1, max = 1 }, { id = w15(), min = 1, max = 1 })), -- сл.шар/кольцо200/b15/w15
			}
		}
}
end

function z3StacksX()
return { -- 1100хп
		subraceTypes = { Subrace.NeutralDragon, Subrace.Human, Subrace.Heretic, Subrace.Dwarf, Subrace.Elf }, -- Subrace.Undead, убрал
		count = 1,
		value = { min = 1100*kef, max = 1100*kef*kr },
		loot = {
			items = {
				{ id = 'g000ig0001', min = 1, max = 1 }, --рес
				orr({ id = 'g001ig0378', min = 2, max = 2 }, { id = 'g000ig0006', min = 1, max = 1 }), --хил75/хил100				
				orr({ id = 'g001ig0152', min = 1, max = 1 }, { id = 'g000ig0018', min = 1, max = 1 }), -- Эликсир избавления/мазь
				{ id = p15(), min = 1, max = 1 }, --пермо 1200
				orr({ id = 'g001ig0151', min = 1, max = 1 }, { id = 'g000ig7008', min = 1, max = 1 }), -- Шар колдовства/Древняя реликвия-400
			}
		}
}
end
	
-------------------------

-- Охрана объектов

function guard1() -- зона1 --драги 250-375
return {
	value = { min = 230*kef, max = 230*kef*kr },
	loot = {
		itemTypes = { Item.Valuable },
		value = { min = 250, max = 400 },
		itemValue = { min = 250, max = 400 },
		items = {
			{ id = 'g000ig0005', min = 1, max = 1}, -- хил50
		},
	}
}
end

function guard2() -- зона2 --драги 375-500
return {
	value = { min = 400*kef, max = 400*kef*kr },
	loot = {
		itemTypes = { Item.Valuable },
		value = { min = 375, max = 525 },
		itemValue = { min = 375, max = 525 },
		items = {
			{ id = 'g001ig0378', min = 1, max = 1}, -- хил75
		},
	}
}
end

function guard2n() -- зона2 наём.
return {
	value = { min = 400*kef, max = 400*kef*kr },
	loot = {
		items = {
			{ id = 'g000ig0006', min = 1, max = 1}, -- хил100
			{ id = b15(), min = 1, max = 1 }, --случ. банка на 15
		},
	}
}
end

function guard2m() -- зона2 башня
return {
	value = { min = 400*kef, max = 400*kef*kr },
	loot = {
		items = {
			orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --рес/хил100
			{ id = w15(), min = 1, max = 1 }, --случ. вард стих.
		},
	}
}
end

function guard3m() -- зона3 башня
return {
	value = { min = 750*kef, max = 750*kef*kr },
	loot = {
		items = {
			orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --рес/хил100
			orr({ id = 'g001ig0432', min = 1, max = 1 }, { id = rms(), min = 1, max = 1 }), --аметист125/случ. шар манны			
			{ id = b15(), min = 1, max = 1}, -- случ. банка15
			{ id = w15(), min = 1, max = 1}, -- случ. вард
		},
	},
}
end

function guard3() -- зона3 --драги 500-625
return { 
	value = { min = 750*kef, max = 750*kef*kr },
	loot = {
		itemTypes = { Item.Valuable },
		value = { min = 500, max = 650 },
		itemValue = { min = 500, max = 650 },
		items = {
			{ id = 'g000ig0006', min = 1, max = 1}, --хил100
		},
	}
}
end

function guard3n() -- зона3 наём.
return {
	value = { min = 750*kef, max = 750*kef*kr },
	loot = {
		items = {
				{ id = 'g000ig0001', min = 1, max = 1 }, --рес
				{ id = b15(), min = 1, max = 1 }, --случ. банка на 15
		},
	}
}
end

-- Главная охрана т2-т0
function zoneGuardZone0()
return {
	subraceTypes = { Subrace.NeutralDragon, Subrace.Human, Subrace.Heretic, Subrace.Dwarf, Subrace.Elf }, -- Subrace.Undead, убрал
	value = { min = 1000*kef, max = 1000*kef*kr }, --
	loot = {
		value = { min = 600, max = 740 },
		itemValue = { min = 600, max = 740 },
		itemTypes = { Item.PotionPermanent },
		items = {
			{ id = 'g000ig0001', min = 2, max = 2 },
			{ id = 'g000ig0006', min = 2, max = 2 },
			orr({ id = 'g001ig0151', min = 1, max = 1 }, { id = 'g000ig7006', min = 1, max = 1 }), -- Шар колдовства/Сапфир-300
			{ id = p05(), min = 1, max = 1},
			orr3({id = b15(), min = 1, max = 1}, {id = w15(), min = 1, max = 1}, {id = d15(), min = 1, max = 1}),
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
		ruins = z0Ruins(),
		mines = getMinesRespZ(playerRace),
		bags = bags0(),
		stacks = {z0Stacks1(), z0Stacks2(), z0Stacks3(), z0Stacks4(playerRace)},

		capital = {
			garrison = { -- столица
				subraceTypes = { getPlayerSubRace(playerRace) },
				value = { min = 50, max = 50 }, 
				loot = {
					itemTypes = { Item.Weapon, Item.Armor, Item.Jewel, Item.TravelItem },
					value = { min = 300, max = 300 },
					itemValue = { min = 300, max = 300 },				
					items = {
						{ id = 'g000ig0001', min = 3, max = 3}, --рес
						{ id = 'g000ig0006', min = 4, max = 4}, --хил100
						{ id = 'g001ig0378', min = 5, max = 5}, --хил75
						{ id = 'g000ig0005', min = 6, max = 6}, -- хил50
						{ id = 'g001ig0180', min = 7, max = 7}, -- хил25

						{ id = 'g000ig0002', min = 1, max = 1 }, --15
						{ id = 'g000ig0014', min = 1, max = 1 }, --15
						{ id = 'g000ig0011', min = 1, max = 1 }, --15
						{ id = 'g000ig0008', min = 1, max = 1 }, --15
						{ id = b15(), min = 1, max = 1}, -- случ. банка15
						{ id = b15(), min = 1, max = 1}, -- случ. банка15

						{ id = 'g000ig0021', min = 1, max = 1 }, -- вард
						{ id = 'g000ig0022', min = 1, max = 1 }, -- вард
						{ id = 'g000ig0023', min = 1, max = 1 }, -- вард
						{ id = 'g000ig0024', min = 1, max = 1 }, -- вард
						{ id = w15(), min = 1, max = 1}, -- случ. вард
						{ id = w15(), min = 1, max = 1}, -- случ. вард

						orr({ id = 'g001ig0125', min = 1, max = 1 }, { id = 'g001ig0036', min = 1, max = 1 }), --разума/смерти
						orr({ id = 'g001ig0355', min = 1, max = 1 }, { id = 'g001ig0128', min = 1, max = 1 }), --вардурон/вард оружия
						
						{ id = d15(), min = 1, max = 1}, -- случ. дотвард
						{ id = d15(), min = 1, max = 1}, -- случ. дотвард
						
						orr(orr({ id = 'g001ig0458', min = 1, max = 1}, { id = 'g000ig9031', min = 1, max = 1}), orr({ id = 'g000ig9022', min = 1, max = 1}, { id = 'g001ig0302', min = 1, max = 1})), -- 25 Сфера Каменного проклятия / Сфера Ливня | Сфера Углей / Сфера Шторма
						orr(orr({ id = 'g001ig0189', min = 1, max = 1}, { id = 'g001ig0178', min = 1, max = 1}), orr({ id = 'g001ig0472', min = 1, max = 1}, { id = 'g001ig0473', min = 1, max = 1})), -- 50 Сфера Камня / Сфера Костра | Сфера Ледяного осколка / Сфера Статического разряда
		
						{ id = ExtraManaProject4(playerRace), min = 1, max = 1 }, --доп.шар
												
						orr(orr({ id = 'g000ig5021', min = 1, max = 1}, { id = 'g000ig5003', min = 1, max = 1}), orr({ id = 'g001ig0250', min = 1, max = 1}, { id = 'g000ig5023', min = 1, max = 1})), -- свиток л.щит, сила, с.кости, с.витара
						orr(orr({ id = 'g001ig0248', min = 1, max = 1}, { id = 'g000ig5045', min = 1, max = 1}), orr({ id = 'g000ig5064', min = 1, max = 1}, { id = 'g000ig5101', min = 1, max = 1})), -- свиток устр. гимн, tormentio-броня, слабость, стая 
						
						orr3({id = 'g000ig9105', min = 1, max = 1}, {id = 'g000ig9131', min = 1, max = 1}, {id = TalismanHome(playerRace), min = 1, max = 1}), -- Талисман Костра / Талисман Ливня / Родной талик
						
						-- бонус
						orr5({id = 'g001ig0532', min = 1, max = 1}, {id = 'g000ig5009', min = 1, max = 1}, {id = 'g000ig5041', min = 1, max = 1}, {id = 'g001ig0006', min = 1, max = 1}, {id = 'g001ig0130', min = 1, max = 1}), -- Зелье дозорного +1вижн / Свиток "Истинное зрение" / Свиток "Incantare Hellhound" / Эликсир маскировки / Эликсир регенерации
						
						
					}
				},
			},
			spells = {
				CapSpell(playerRace)
			}			
		}
	}
end

-- сводная зоны 1
function getPlayerZone1(zoneId, playerRace, zoneSize)
	return {
		id = zoneId,
		type = Zone.Junction,
		race = playerRace,
		size = zoneSize,
		towns = zoneTownsResp0(playerRace),
		merchants = zoneMerch1(),
		mages = zoneMageResp1(),		
		ruins = zoneRuinRespZ(),
		mines = getMinesRespZ2(playerRace),
		bags = bags1(),
		stacks = {z1Stacks1(playerRace), z1Stacks2(), z1Stacks3(), z1Stacks4(), z1Stacks5()},

	}
end

-- сводная зоны 2
function getTreasureZone2(zoneId, playerRace, zoneSizeTre)
	return {
		id = zoneId,
		race = playerRace,
		type = Zone.Junction,
		size = zoneSizeTre,
		towns = zoneTowns2(playerRace),
		merchants = zoneMerch2(),
		ruins = zoneRuinZone2(),
		mines = getMinesZone2(playerRace),
		mercenaries = zoneMercenZone2(playerRace),
		stacks = {z2Stacks1(), z2Stacks2(), z2Stacks3(), z2Stacks4(), z2Stacks5()},
		bags = bags2(),
	}
end

-- сводная зоны 3
function getTreasureZone3(zoneId, zoneSizeTre)
	return {
		id = zoneId,
		type = Zone.Treasure,  -- Junction -- Treasure
--		border = Border.Water,
		size = zoneSizeTre,
		towns = zoneTownsZone3(),
		merchants = zoneMerchZone3(),
		mages = zoneMageResp(),		
		ruins = zoneRuinZone3(),
		mines = getMinesZone3(),
		mercenaries = zoneMercenZone3(),
		trainers = {{}, {}},
		stacks = { --21+1
			z3Stacks1('g001ig0146'), z3Stacks1('g001ig0148'), z3Stacks1('g001ig0149'), z3Stacks1('g001ig0147'), z3Stacks1('g001ig0150'), -- шар жизни/рун/смерти/преисп/элексир
			z3Stacks2('g000ig0003'), z3Stacks2('g000ig0009'), z3Stacks2('g000ig0015'), z3Stacks2('g000ig0012'), -- банка30 дубовый/точности/силы/скорости
			z3Stacks3('g001ig0560'), z3Stacks3('g001ig0547'), z3Stacks3('g001ig0490'), z3Stacks3('g001ig0128'), -- Зелье провокатора 25принять/Зелье пронзающего взгляда +10крит/Зелье выносливости +25оз/Эликсир защиты от Оружия 
			z3Stacks4('g001ig0562', orr('g000ig5091', 'g000ig5055')), -- Зелье дуэлянта +20крит и Свиток "Tempus status" -33ини / Свиток "Tortio menta" -33точность
			z3Stacks4('g001ig0491', orr('g000ig5039', 'g001ig0586')), -- Зелье похищения жизни +25вамп и Свиток "Неподкупность" / Свиток "Предательство -20 воры
			z3Stacks4('g001ig0355', orr('g000ig5079', 'g000ig5096')), -- Зелье тритоньей чешуи +вардурон и Свиток "Защита от Оружия" / Свиток "Прикосновение вампира" +35вамп
			z3Stacks4('g001ig0127', orr('g000ig5012', 'g000ig5013')), -- Эликсир жизненной силы +50максоз и Свиток "Святая броня" +15 броня / Свиток "Святая сила" +15урон и точн
			z3Stacks5('g001ig0315'), z3Stacks5('g001ig0307'), z3Stacks5('g001ig0309'), z3Stacks5('g001ig0313'), -- Зелье великана/Зелье стойкости/Эликсир задиры/Эликсир совершенствования+5урон
			z3StacksX(), -- пермо+15
		},
		bags = bags3(),
	}
end

-------------------------------------------------


-- РАЗМЕРЫ ЗОН: Вернет таблицу с зонами (размеры 2 и 5)

local z0 = 2 
local z1 = 2
local z2 = 2
local zc = 4.5

function getZones(races)
	local zones = {}

	zones[1] = getPlayerZone0(0, races[1], z0) -- красный
	zones[2] = getPlayerZone1(1, races[1], z1) -- зелёный
	zones[3] = getTreasureZone2(2, races[1], z2) -- синий

	zones[4] = getPlayerZone0(11, races[2], z0) -- т.синий
	zones[5] = getPlayerZone1(12, races[2], z1) -- коричневый
	zones[6] = getTreasureZone2(5, races[2], z2) -- серый

	zones[7] = getPlayerZone0(8, races[3], z0) -- пурпурный
	zones[8] = getPlayerZone1(7, races[3], z1) -- голубой
	zones[9] = getTreasureZone2(6, races[3], z2) -- жёлтый
	
	zones[10] = getPlayerZone0(9, races[4], z0) -- оранжавый
	zones[11] = getPlayerZone1(10, races[4], z1) -- т.зеленый
	zones[12] = getTreasureZone2(3, races[4], z2) -- белый
	
	zones[13] = getTreasureZone3(4, zc) -- чёрный


	return zones
end

----------------------

-- ПРОХОДЫ: Вернет таблицу с проходами между зонами:
function getZoneConnections()
	return {

--го т2-центр
--{from = 2, to = 4, guard = zoneGuardZone()},	
--{from = 5, to = 4, guard = zoneGuardZone()},
--{from = 6, to = 4, guard = zoneGuardZone()},
--{from = 3, to = 4, guard = zoneGuardZone()},

--го т2-т0 (сделал обратный порядок, работает лучше)
{from = 11, to = 2, guard = zoneGuardZone0()},	
{from = 8, to = 5, guard = zoneGuardZone0()},
{from = 9, to = 6, guard = zoneGuardZone0()},
{from = 0, to = 3, guard = zoneGuardZone0()},

{from = 2, to = 4},
{from = 2, to = 4},
{from = 2, to = 4},

{from = 5, to = 4},
{from = 5, to = 4},
{from = 5, to = 4},

{from = 6, to = 4},
{from = 6, to = 4},
{from = 6, to = 4},

{from = 3, to = 4},
{from = 3, to = 4},
{from = 3, to = 4},
	
{from = 0, to = 1},
{from = 0, to = 1},
{from = 0, to = 1},
{from = 0, to = 1},
{from = 0, to = 1},
{from = 1, to = 2},
{from = 1, to = 2},
{from = 1, to = 2},
{from = 1, to = 2},
{from = 1, to = 2},

{from = 11, to = 12},
{from = 11, to = 12},
{from = 11, to = 12},
{from = 11, to = 12},
{from = 11, to = 12},
{from = 12, to = 5},
{from = 12, to = 5},
{from = 12, to = 5},
{from = 12, to = 5},
{from = 12, to = 5},

{from = 8, to = 7},
{from = 8, to = 7},
{from = 8, to = 7},
{from = 8, to = 7},
{from = 8, to = 7},
{from = 7, to = 6},
{from = 7, to = 6},
{from = 7, to = 6},
{from = 7, to = 6},
{from = 7, to = 6},

{from = 9, to = 10},
{from = 9, to = 10},
{from = 9, to = 10},
{from = 9, to = 10},
{from = 9, to = 10},
{from = 10, to = 3},
{from = 10, to = 3},
{from = 10, to = 3},
{from = 10, to = 3},
{from = 10, to = 3},


}
end

-- Вернет описание содержимого сценария для генератора - ОК
function getTemplateContents(races)
	local contents = {}
	
	contents.zones = getZones(races)
	contents.connections = getZoneConnections()

	return contents
end

-- ШАБЛОН
template = {
	name = 'Bladerunner 1.3c',
	description = 'Черная зона в центре, ее должны касаться: синяя, желтая, белая, серая. Спасибо за поддержку! Карта Тинькофф: 2200700846776804',
	minSize = 72,
	maxSize = 72,
	maxPlayers = 4,
	startingGold = 800,
	startingNativeMana = 150,
	roads = 40,
	forest = 25,

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


-------------БЛЕЙД

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

},

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

-------------БЛЕЙД

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
'g000ig2007', --ржавые кандалы--
'g001ig0275', --Кулон подстрекательства--
'g000ig1011', --сапоги мореплавания
'g001ig0044', --Сердце океана (Артефакт)

--свитки на мувы
'g000ig5027', --свиток мореплавания
'g000ig5006', --Свиток "Ускорение"--
'g000ig5100', --Свиток "Скорость"--
'g000ig5113', --Свиток "Порыв"--
'g000ig5099', --Свиток "Опутывание"--
'g001ig0094', --Свиток "Поспешность" отступление
'g000ig5120', --Свиток "Проворство" отступление

--общее новое (имба)
'g001ig0386', -- Посох семи ветров
'g001ig0317', --Зелье дьявольских таинств +15 вампирик (пермо 600 дёшево)

--доп
'g000ig9125', --Талисман Лоупрау --т2 оборотни на всё поле (убрал из-за р-н т1 - дёшево 400)
'g000ig9129', --Талисман Медвежьего Гнева (убрал из-за р-н т1)

--доп.новое
'g000ig3008', --Обод мертвых (обидно ну)

--свитки
'g001ig0195', --Свиток "Откровение" (для аутрана не катит)
'g001ig0439', --Свиток "Et seminibus discordiae - Уменьшает лидерство на 1 в области 5x5 (не для аутранера)
'g001ig0440', --Свиток "Проклятие безволия минус лидерство
'g001ig0092', --Свиток "Гниение леса" за 400 в ролле нафиг надо
'g000ig5057', --Свиток "Мerum Facies" Защита от полиморфа за 700 в ролле нафиг надо
'g000ig5118', --Свиток "Ослепления" Уменьшает обзор противника на 3 в радиусе 5х5.
'g000ig5057', --Свиток "Мerum Facies" Защита от полиморфа.
--на урон т4+
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