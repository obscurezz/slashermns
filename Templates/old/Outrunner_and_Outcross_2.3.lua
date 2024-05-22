-- Шаблон "Outrunner_and_Outcross_2.3"

-- ЗОНА		|ИГРОК1		|ИГРОК2
-------------------------------------
-- Cтолица 	|красная	|пурпурная	|
-- Зона т1	|зелёная	|голубая	|
-- Зона т2	|синяя 		|жёлтая		|
-- Зона т3 	|белая	 	|серая		|
-- Трежа т4	|		 чёрная			|
-------------------------------------
-- ГО: 		!чёрной зоны должны касаться: синяя, белая, жёлтая, серая.

---------------
-- НАСТРОЙКИ

-- режим карты (1 - для игры одним героем; 2 - для классической игры)
local gmode = 1

-- коэффициент сложности (0.6-0.8 легко; 0.8-1 средне; >1 сложно)
local kef = 0.92


---------------
-- КОД ШАБЛОНА

--Башня магии в зоне 2
function zoneMageResp()
	return {
		{
			spellTypes = {Spell.Boost, Spell.Lower},
			value = { min = 1200, max = 1210 },
			spellLevel = { min = 2, max = 2 },
			spells = { 	yn('g000ss0004'), -- молния
						yn('g000ss0002'), -- быстрота
						yn('g000ss0024'), -- буран
						yn('g000ss0023'), -- сила витара
						yn('g000ss0043'), -- ignis mare
						yn('g000ss0045'), -- tormentio
						yn('g000ss0062'), -- мор
						yn('g000ss0064'), -- слабость
						yn('g000ss0097'), -- кустарник
						yn('g000ss0101'), -- стая
						
						yn('g000ss0183'), -- сокрушение
						yn('g000ss0126'), -- сокол.зоркость
						yn('g000ss0028'), -- лед.столб
						yn('g000ss0184'), -- прокл.эмира
						yn('g000ss0185'), -- terebrare corde
						yn('g000ss0050'), -- Chronos
						yn('g000ss0067'), -- чума
						yn('g000ss0186'), -- Спешащее время
						yn('g000ss0187'), -- могущество
						yn('g000ss0102'), -- стойкость рощи
						
						yn('g000ss0011'), -- з.маг.разум
						yn('g000ss0054'), -- menta potens
						yn('g000ss0093'), -- смерч.смерти
						yn('g000ss0111'), -- отвлечение

						yn('g000ss0007'), -- Исцеление
						yn('g000ss0029'), -- Ритуал исцеления
						
--						yn('g000ss0177'), -- Откровение
						yn('g000ss0153'), -- Очищающая молитва
						yn('g000ss0144'), -- Затопление
						yn('g000ss0142'), -- Призыв IV: Стихийный голем
			},			
			guard = gmm({}, guard2m())
		}
	}
end

----------------------

-- Город т1

local tierTowerResp0 = 1
local valueTowerResp0 = { min = 230*kef, max = 240*kef }

function zoneTownsResp0()
	return {
	{
		tier = tierTowerResp0,
		stack = {
			value = valueTowerResp0,
			loot = {
				itemTypes = { Item.TravelItem, Item.Weapon },
				value = { min = 300, max = 300 },
				itemValue = { min = 300, max = 300 },
				items = {
					{ id = 'g000ig0001', min = 1, max = 1 }, --рес
					{ id = 'g000ig0006', min = 1, max = 1 }, -- хил100
					orr({ id = 'g001ig0180', min = 2, max = 2 }, { id = 'g000ig0005', min = 1, max = 1 }), -- хил25*2/хил 50
					gmm({ id = 'g000ig7001', min = 1, max = 1 },{ id = 'g000ig7002', min = 1, max = 1 }), --кольцо50/кольцо100	
					{ id = rms(), min = 1, max = 1 }, -- случ.шар манны
					{ id = d15(), min = 1, max = 1 }, -- случ. дотвард
				}
			}
		}
	}
	}
end

-- Город т2
local tierTowerResp = 2
local valueTowerResp = { min = 370*kef, max = 390*kef }

function zoneTownsResp()
	return {
	{
		tier = tierTowerResp,
		stack = {
			value = valueTowerResp,
			loot = {
				itemTypes = { Item.Jewel, Item.Armor, Item.Weapon },
				value = { min = 400, max = 660 },
				itemValue = { min = 400, max = 660 },
				items = {
					{ id = 'g000ig0001', min = 1, max = 1 }, --рес
					{ id = 'g000ig0006', min = 1, max = 1 }, -- хил100
					{ id = 'g001ig0378', min = 1, max = 2 }, -- хил75
					gmm({ id = 'g000ig7002', min = 1, max = 1 },{ id = 'g000ig7005', min = 1, max = 1 }), --кольцо100/изумруд150
					orr(orr({ id = 'g000ig9005', min = 1, max = 1 },{ id = 'g000ig9002', min = 1, max = 1 }), orr({ id = 'g000ig9003', min = 1, max = 1 },{ id = 'g000ig9010', min = 1, max = 1 })), -- кристалл ада / жизни | рун / смерти
					orr({ id = 'g000ig0024', min = 1, max = 1 },{ id = 'g000ig0023', min = 1, max = 1 }), -- вард огня/земли
					yn({ id = 'g000ig0002', min = 1, max = 1 }), --15
					yn({ id = 'g000ig0014', min = 1, max = 1 }), --15
					yn({ id = 'g000ig0011', min = 1, max = 1 }), --15
					{ id = w15(), min = 1, max = 1}, -- случ. вард
				}
			}
		}
	}
	}
end


-- Город т3
local tierTowerZone = 3;
local valueTowerZone = { min = 780*kef, max = 820*kef }

function zoneTownsZone34()
	return {
	{
		tier = tierTowerZone,
		stack = {
			subraceTypes = NoUndead(),
			value = valueTowerZone,
			loot = {
				itemTypes = { Item.Armor, Item.Weapon },
				value = { min = 700, max = 760 },
				itemValue = { min = 700, max = 760 },
				items = {
					{ id = 'g000ig0001', min = 1, max = 1 },
					{ id = 'g000ig0006', min = 2, max = 2 },
					gmm({ id = 'g000ig7003', min = 1, max = 1 }, { id = 'g000ig7004', min = 1, max = 1 }), --изумруд150/золотое кольцо200
					orr(orr({ id = 'g001ig0461', min = 1, max = 1 },{ id = 'g000ig9020', min = 1, max = 1 }), orr({ id = 'g001ig0183', min = 1, max = 1 },{ id = 'g000ig9014', min = 1, max = 1 })), -- Сфера порчи-33урон-2-им / энергии+25аое-урон | Сфера распада / Сфера Вьюги
					orr({ id = 'g001ig0128', min = 1, max = 1 },{ id = 'g001ig0125', min = 1, max = 1 }), -- вард оружия/разума
					yn({ id = 'g000ig0002', min = 1, max = 1 }), --15
					yn({ id = 'g000ig0014', min = 1, max = 1 }), --15
					yn({ id = 'g000ig0011', min = 1, max = 1 }), --15
					yn({ id = 'g000ig0008', min = 1, max = 1 }), --15
					{ id = p05(), min = 1, max = 1}, -- случ. пермо-эликсир на 5%					
				}
			}
		}
	},
	}
end

-- Город т4
function zoneTownsZone5()
	return {
	{
		tier = 4,
		stack = {
			subraceTypes = { Subrace.NeutralDragon, Subrace.Human, Subrace.Heretic, Subrace.Dwarf, Subrace.Elf }, -- Subrace.Undead, убрал
			value = { min = 1550*kef, max = 1630*kef },
			loot = {
				itemTypes = { Item.Banner },
				value = { min = 750, max = 810 },
				itemValue = { min = 750, max = 810 },
				items = {
					{ id = 'g000ig0001', min = 2, max = 2 },
					{ id = 'g000ig0006', min = 1, max = 2 }, -- хил100
					gmm({ id = 'g000ig7004', min = 1, max = 1 },{ id = 'g000ig7005', min = 1, max = 1 }), -- золотое кольцо200/рубин250
					orr(orr({ id = 'g000ig9040', min = 1, max = 1 },{ id = 'g000ig9007', min = 1, max = 1 }), orr({ id = 'g001ig0462', min = 1, max = 1 },{ id = 'g001ig0176', min = 1, max = 1 })), -- сфера ведьм / забвения | загробных огней / помрачения
					orr({ id = 'g000ig0018', min = 1, max = 1 },{ id = 'g001ig0128', min = 1, max = 1 }), -- хил200/вард оружия
					yn({ id = 'g000ig0012', min = 1, max = 1 }), --ини30
					yn({ id = 'g000ig0015', min = 1, max = 1 }), --урон30
					yn({ id = 'g000ig0003', min = 1, max = 1 }), --защита30
				}
			}
		}
	}
	}
end

----------------------

-- Лавка на Респе
function zoneMerchRespZ0()
return {
	{
		goods = {
			itemTypes = { Item.Talisman },
			value = { min = 200, max = 210 },
			itemValue = { min = 200, max = 200 },
			items = {
				{ id = 'g000ig0001', min = 3, max = 4 },
				{ id = 'g000ig0006', min = 3, max = 4 },
				{ id = 'g001ig0378', min = 4, max = 5}, --хил75
				{ id = 'g000ig0005', min = 5, max = 7 },
				{ id = 'g001ig0180', min = 7, max = 10 },
				yn({ id = 'g000ig0002', min = 1, max = 2 }), --15
				yn({ id = 'g000ig0014', min = 1, max = 2 }), --15
				yn({ id = 'g000ig0011', min = 1, max = 2 }), --15
				yn({ id = 'g000ig0008', min = 1, max = 2 }), --15
				yn({ id = 'g000ig0021', min = 1, max = 2 }), -- вард
				yn({ id = 'g000ig0022', min = 1, max = 2 }), -- вард
				yn({ id = 'g000ig0023', min = 1, max = 2 }), -- вард
				yn({ id = 'g000ig0024', min = 1, max = 2 }), -- вард
				
--				yn({ id = 'g001ig0125', min = 1, max = 1 }), -- вард разума
--				yn({ id = 'g001ig0036', min = 1, max = 1 }), -- вард смерти
				
				yn({ id = d15(), min = 1, max = 2}), -- случ. дотвард
				yn({ id = d15(), min = 1, max = 2}), -- случ. дотвард
				yn({ id = d15(), min = 1, max = 2}), -- случ. дотвард
				yn({ id = d15(), min = 1, max = 2}), -- случ. дотвард

				orr(orr({ id = 'g001ig0532', min = 1, max = 1 }, { id = 'g001ig0519', min = 1, max = 1 }), orr({ id = 'g001ig0532', min = 1, max = 1 }, { id = 'g001ig0534', min = 1, max = 1 })), -- Зелье дозорного (+1 обзор) / Война престолов (-10 воры) | Зелье ясного взора (+2 обзора) / Эликсир скорого возрождения (-75 лечения)
				
				orr(orr({ id = 'g001ig0301', min = 1, max = 1}, { id = 'g001ig0300', min = 1, max = 1}), orr({ id = 'g001ig0302', min = 1, max = 1}, { id = 'g001ig0299', min = 1, max = 1})), -- 25 сфера песч.бури / льда | искры / углей
				orr(orr({ id = 'g001ig0187', min = 1, max = 1}, { id = 'g001ig0190', min = 1, max = 1}), orr({ id = 'g001ig0188', min = 1, max = 1}, { id = 'g001ig0189', min = 1, max = 1})), -- 50 сфера огн.шара / смерча | потока / геоментии
				yn({ id = 'g000ig9024', min = 1, max = 1 }), -- сфера вампиризма
				yn({ id = 'g000ig9017', min = 1, max = 1 }), -- сфера восст.
				yn({ id = 'g000ig9034', min = 1, max = 1 }), -- сфера злобы
				yn({ id = 'g000ig9013', min = 1, max = 1 }), -- сфера ржавчины
				yn({ id = 'g000ig9033', min = 1, max = 1 }), -- сфера яда 100
				yn({ id = 'g001ig0478', min = 1, max = 1 }), -- Сфера мороза
				yn({ id = 'g001ig0453', min = 1, max = 1 }), -- Сфера святой земли
				yn({ id = 'g001ig0467', min = 1, max = 1 }), -- Сфера цепи молний
				
				orr(orr({ id = 'g000ig5021', min = 1, max = 1}, { id = 'g000ig5003', min = 1, max = 1}), orr({ id = 'g001ig0250', min = 1, max = 1}, { id = 'g000ig5023', min = 1, max = 1})), -- свиток л.щит, сила, с.кости, с.витара
				orr(orr({ id = 'g001ig0248', min = 1, max = 1}, { id = 'g000ig5045', min = 1, max = 1}), orr({ id = 'g000ig5064', min = 1, max = 1}, { id = 'g000ig5101', min = 1, max = 1})), -- свиток устр. гимн, tormentio-броня, слабость, стая  
				
			}
		},
			guard = gmm({}, guard0()),
	}
}
end

-- Лавка т1
function zoneMerchRespZ()
return {
	{
		goods = {
			itemTypes = { Item.Scroll },
			value = { min = 300, max = 310 },
			itemValue = { min = 150, max = 150 },
			items = {
				{ id = 'g000ig0001', min = 3, max = 4 },
				{ id = 'g000ig0006', min = 3, max = 4 },
				{ id = 'g001ig0378', min = 4, max = 5}, --хил75
				{ id = 'g000ig0005', min = 5, max = 7 },
				{ id = 'g001ig0180', min = 7, max = 10 },
				yn({ id = 'g000ig0002', min = 1, max = 1 }), --15
				yn({ id = 'g000ig0014', min = 1, max = 1 }), --15
				yn({ id = 'g000ig0011', min = 1, max = 1 }), --15
				yn({ id = 'g000ig0008', min = 1, max = 1 }), --15
				yn({ id = 'g000ig0021', min = 1, max = 2 }), -- вард
				yn({ id = 'g000ig0022', min = 1, max = 2 }), -- вард
				yn({ id = 'g000ig0023', min = 1, max = 2 }), -- вард
				yn({ id = 'g000ig0024', min = 1, max = 2 }), -- вард

				yn({ id = 'g001ig0125', min = 1, max = 1 }), -- вард разума
				yn({ id = 'g001ig0036', min = 1, max = 1 }), -- вард смерти
				
				yn({ id = d15(), min = 1, max = 1}), -- случ. дотвард
				yn({ id = d15(), min = 1, max = 1}), -- случ. дотвард
				yn({ id = d15(), min = 1, max = 1}), -- случ. дотвард
				yn({ id = d15(), min = 1, max = 1}), -- случ. дотвард
			
				orr({ id = 'g001ig0027', min = 1, max = 1 }, { id = 'g001ig0563', min = 1, max = 1 }), -- аура брони / аура внимательности
				orr({ id = 'g001ig0548', min = 1, max = 1 }, { id = 'g001ig0561', min = 1, max = 1 }), -- Зелье удачи (крит 10) / эликсир самопожертвования
				orr({ id = 'g001ig0524', min = 1, max = 1 }, { id = 'g001ig0528', min = 1, max = 1 }), -- Честный труд (сапоги) / Зелье посмертного зова (талисманы)

				yn({ id = 'g000ig3001', min = 1, max = 1 }), -- наручи
				yn({ id = 'g000ig2001', min = 1, max = 1 }), -- р.камень
				yn({ id = 'g001ig0101', min = 1, max = 1 }), -- череп хана
				yn({ id = 'g001ig0418', min = 1, max = 1 }), -- Руна защиты Фрейра (Артефакт)
				yn({ id = 'g001ig0611', min = 1, max = 1 }), -- Цепи жертвенности (Артефакт)300
			
				yn({ id = 'g000ig3008', min = 1, max = 1 }), -- обод мёртв.
				yn({ id = 'g001ig0428', min = 1, max = 1 }), -- Кожаные эльфийские доспехи (Реликвия)
				yn({ id = 'g001ig0101', min = 1, max = 1 }), -- Череп Хана (Реликвия)
				yn({ id = 'g001ig0421', min = 1, max = 1 }), -- Борода Имира (Реликвия)
				yn({ id = 'g001ig0610', min = 1, max = 1 }), -- Оковы долга (Реликвия)
				yn({ id = 'g001ig0099', min = 1, max = 1 }), -- перчатки

				orr({ id = 'g001ig0113', min = 1, max = 1 }, { id = 'g001ig0110', min = 1, max = 1 }), -- сапоги укрепл / лёгкие	

				--посох
				orr(orr({ id = 'g001ig0394', min = 1, max = 1 }, { id = 'g000ig6012', min = 1, max = 1 }), orr({ id = 'g001ig0395', min = 1, max = 1 }, { id = 'g001ig0399', min = 1, max = 1 })), -- Посох северных стражей+10брони / Посох скорости+10ини / Посох наместника Махаля+10брони / Посох раздора-10ини
				
				yn({ id = 'g001ig0471', min = 1, max = 1 }), -- Сфера ветров погибели
				yn({ id = 'g001ig0470', min = 1, max = 1 }), -- Сфера волны боли
				yn({ id = 'g000ig9016', min = 1, max = 1 }), -- с.исциления 200
				yn({ id = 'g001ig0458', min = 1, max = 1 }), -- Сфера заражения
				yn({ id = 'g001ig0456', min = 1, max = 1 }), -- Сфера ледяных вод
				yn({ id = 'g001ig0466', min = 1, max = 1 }), -- Сфера ледяных столбов
				yn({ id = 'g001ig0489', min = 1, max = 1 }), -- Сфера насыщения
				yn({ id = 'g001ig0469', min = 1, max = 1 }), -- Сфера огненной стены

				yn({ id = 'g000ig1001', min = 1, max = 1 }), -- знамя защиты400
				yn({ id = 'g001ig0051', min = 1, max = 1 }), -- знамя выносл400
				yn({ id = 'g000ig1007', min = 1, max = 1 }), -- знамя силы400
				yn({ id = 'g000ig1005', min = 1, max = 1 }), -- знамя быстроты400
				
				--талик
				orr(orr({ id = 'g001ig0274', min = 1, max = 1}, { id = 'g001ig0270', min = 1, max = 1}), orr({ id = 'g001ig0063', min = 1, max = 1}, { id = 'g001ig0263', min = 1, max = 1})), -- ведьма, стража, стихийный, могил
				
				orr({ id = 'g000ig5007', min = 1, max = 1 }, { id = 'g000ig5029', min = 1, max = 1 }), -- св. исцеление / рит. исцеления
		
			}
		},
			guard = gmm({}, guard1()),
	}
}
end

-- Лавка т2
function zoneMerchResp() -- свитки т1+т2 / т2+т2
return {
	{
		goods = {
			itemTypes = { Item.Scroll },
			value = { min = 400, max = 410 },
			itemValue = { min = 150, max = 250 },
			items = {
				{ id = 'g000ig0001', min = 5, max = 6 },
				{ id = 'g000ig0006', min = 5, max = 6 },
				{ id = 'g001ig0378', min = 6, max = 7}, --хил75
				{ id = 'g000ig0005', min = 7, max = 10 },
				{ id = 'g001ig0180', min = 7, max = 10 },
				
				yn({ id = 'g000ig0002', min = 1, max = 2 }), --15
				yn({ id = 'g000ig0014', min = 1, max = 2 }), --15
				yn({ id = 'g000ig0011', min = 1, max = 2 }), --15
				yn({ id = 'g000ig0008', min = 1, max = 1 }), --15
				yn({ id = 'g000ig0021', min = 1, max = 1 }), -- вард
				yn({ id = 'g000ig0022', min = 1, max = 1 }), -- вард
				yn({ id = 'g000ig0023', min = 1, max = 1 }), -- вард
				yn({ id = 'g000ig0024', min = 1, max = 1 }), -- вард
				
				yn({ id = 'g001ig0125', min = 1, max = 1 }), -- вард разума
				yn({ id = 'g001ig0036', min = 1, max = 1 }), -- вард смерти

				yn({ id = d15(), min = 1, max = 1}), -- случ. дотвард
				yn({ id = d15(), min = 1, max = 1}), -- случ. дотвард
				yn({ id = d15(), min = 1, max = 1}), -- случ. дотвард
				yn({ id = d15(), min = 1, max = 1}), -- случ. дотвард
				
				orr({ id = 'g000ig0004', min = 1, max = 1 }, { id = 'g001ig0028', min = 1, max = 1 }), -- эликсир твердости / аура выносл
				orr({ id = 'g001ig0328', min = 1, max = 1 }, { id = 'g001ig0330', min = 1, max = 1 }), -- Эликсир ледяной плоти (мороз) / Эликсир Неопалимых (горение)
				orr({ id = 'g001ig0531', min = 1, max = 1 }, { id = 'g001ig0525', min = 1, max = 1 }), -- Зелье слова (свитки) / Эликсир учености (артефакты)
				
				yn({ id = 'g000ig2002', min = 1, max = 1 }), -- св.чаша
				yn({ id = 'g000ig3017', min = 1, max = 1 }), -- кинж. вамп.
				yn({ id = 'g001ig0047', min = 1, max = 1 }), -- рун.жизн800
				yn({ id = 'g001ig0197', min = 1, max = 1 }), -- прокл.пепел950
				yn({ id = 'g001ig0487', min = 1, max = 1 }), -- Кольцо темных искуств (Артефакт)650
				yn({ id = 'g001ig0558', min = 1, max = 1 }), -- Рог возмездия (Артефакт) 700
				yn({ id = 'g001ig0417', min = 1, max = 1 }), -- Руна верности Моккуркальфи (Артефакт)
				yn({ id = 'g001ig0045', min = 1, max = 1 }), -- кров.свят800
				yn({ id = 'g000ig3003', min = 1, max = 1 }), -- кол.силы800
				yn({ id = 'g001ig0594', min = 1, max = 1 }), -- Щит телохранителя (Артефакт)
				
				yn({ id = 'g001ig0104', min = 1, max = 1 }), -- зуб людоеда
				yn({ id = 'g000ig3022', min = 1, max = 1 }), -- р.лютня650
				orr({ id = 'g000ig4006', min = 1, max = 1 }, { id = 'g001ig0497', min = 1, max = 1 }), -- книга т.з. / книга колдовства
				yn({ id = 'g000ig4001', min = 1, max = 1 }), -- книга возд
				yn({ id = 'g000ig4004', min = 1, max = 1 }), -- книга огня
				yn({ id = 'g001ig0420', min = 1, max = 1 }), -- Вечные латы (Реликвия)800
				yn({ id = 'g001ig0424', min = 1, max = 1 }), -- Длани ангела (Реликвия)
				yn({ id = 'g001ig0422', min = 1, max = 1 }), -- Кровавый покров (Реликвия)
				
				orr({ id = 'g001ig0114', min = 1, max = 1 }, { id = 'g000ig8003', min = 1, max = 1 }), -- сапоги тяж 500 / Сапоги скорости 700

				--посох
				orr(orr({ id = 'g001ig0404', min = 1, max = 1 }, { id = 'g001ig0401', min = 1, max = 1 }), orr({ id = 'g001ig0398', min = 1, max = 1 }, { id = 'g000ig6011', min = 1, max = 1 })), -- Посох Ниграэля-15урона / Посох проклятой метки-15урона / Посох скальда+15ини / Посох повелителя драконов50урона
				
				yn({ id = 'g000ig9019', min = 1, max = 1 }), -- с.жизни 225-300
				yn({ id = 'g000ig9016', min = 1, max = 1 }), -- с.исциления
				yn({ id = 'g001ig0297', min = 1, max = 1 }), -- с.беспл
				yn({ id = 'g000ig9036', min = 1, max = 1 }), -- с.танатоса
				yn({ id = 'g001ig0294', min = 1, max = 1 }), -- сфера бальзам
				yn({ id = 'g001ig0183', min = 1, max = 1 }), -- сфера распада
				yn({ id = 'g001ig0475', min = 1, max = 1 }), -- Сфера огненного порыва
				yn({ id = 'g001ig0468', min = 1, max = 1 }), -- Сфера оползня
				yn({ id = 'g001ig0480', min = 1, max = 1 }), -- Сфера порченной крови
				
				yn({ id = 'g001ig0289', min = 1, max = 1 }), -- знамя гор.стр700
				yn({ id = 'g000ig1006', min = 1, max = 1 }), -- знамя скорости700
				yn({ id = 'g001ig0145', min = 1, max = 1 }), -- знамя разум700
				yn({ id = 'g000ig1008', min = 1, max = 1 }), -- знамя энерг700
				yn({ id = 'g001ig0370', min = 1, max = 1 }), -- Знамя искоренителя ереси600
				yn({ id = 'g001ig0357', min = 1, max = 1 }), -- Знамя неистовства

				--талик
				orr({ id = 'g000ig9138', min = 1, max = 1 }, { id = 'g000ig9108', min = 1, max = 1 }), -- Талисман Ледяных Волков / Талисман Скелета-рыцаря

				yn({ id = 'g000ig5029', min = 1, max = 1 }), -- рит. исцеления
				yn({ id = 'g000ig5007', min = 1, max = 1 }), -- св. исцеление
				
				orr(orr({ id = 'g000ig5021', min = 1, max = 1}, { id = 'g000ig5003', min = 1, max = 1}), orr({ id = 'g001ig0250', min = 1, max = 1}, { id = 'g000ig5023', min = 1, max = 1})), -- свиток л.щит, сила, с.кости, с.витара
			}
		},
		guard = gmm({}, guard2()),
	},
	
		{
		goods = {
			itemTypes = { Item.Scroll },
			value = { min = 400, max = 410 },
			itemValue = { min = 150, max = 250 },
			items = {
				{ id = 'g000ig0001', min = 5, max = 6 },
				{ id = 'g000ig0006', min = 5, max = 6 },
				{ id = 'g001ig0378', min = 6, max = 7}, --хил75
				{ id = 'g000ig0005', min = 7, max = 10 },
				{ id = 'g001ig0180', min = 7, max = 10 },
				
				yn({ id = 'g000ig0002', min = 1, max = 2 }), --15
				yn({ id = 'g000ig0014', min = 1, max = 2 }), --15
				yn({ id = 'g000ig0011', min = 1, max = 2 }), --15
				yn({ id = 'g000ig0008', min = 1, max = 1 }), --15
				yn({ id = 'g000ig0021', min = 1, max = 1 }), -- вард
				yn({ id = 'g000ig0022', min = 1, max = 1 }), -- вард
				yn({ id = 'g000ig0023', min = 1, max = 1 }), -- вард
				yn({ id = 'g000ig0024', min = 1, max = 1 }), -- вард

				yn({ id = 'g001ig0125', min = 1, max = 1 }), -- вард разума
				yn({ id = 'g001ig0036', min = 1, max = 1 }), -- вард смерти

				yn({ id = d15(), min = 1, max = 1}), -- случ. дотвард
				yn({ id = d15(), min = 1, max = 1}), -- случ. дотвард
				yn({ id = d15(), min = 1, max = 1}), -- случ. дотвард
				yn({ id = d15(), min = 1, max = 1}), -- случ. дотвард
				
				orr({ id = 'g000ig0016', min = 1, max = 1 }, { id = 'g001ig0564', min = 1, max = 1 }), -- эликсир мощи / аура интуиции
				orr({ id = 'g001ig0344', min = 1, max = 1 }, { id = 'g001ig0346', min = 1, max = 1 }), -- Эликсир предназначения (замедление) / Эликсир неудержимости (ослабление)
				orr({ id = 'g001ig0526', min = 1, max = 1 }, { id = 'g001ig0527', min = 1, max = 1 }), -- Зелье оруженосца (знамёна) / Зелье постижения (реликвии)

				yn({ id = 'g000ig3002', min = 1, max = 1 }), -- д.чаша
				yn({ id = 'g001ig0182', min = 1, max = 1 }), -- счастл. кость
				yn({ id = 'g001ig0040', min = 1, max = 1 }), -- пер.песк1000
				yn({ id = 'g001ig0042', min = 1, max = 1 }), -- клыки бездны
				yn({ id = 'g001ig0196', min = 1, max = 1 }), -- рун.мол800
				yn({ id = 'g001ig0582', min = 1, max = 1 }), -- Камень врат (Артефакт)800
				yn({ id = 'g001ig0559', min = 1, max = 1 }), -- Руна благоволения Тиу (Артефакт) 700
				yn({ id = 'g001ig0557', min = 1, max = 1 }), -- Рог непреклонности (Артефакт) 700
				yn({ id = 'g001ig0416', min = 1, max = 1 }), -- Руна предвидения Вотана (Артефакт) 800
				yn({ id = 'g001ig0589', min = 1, max = 1 }), -- Щит неведения (Артефакт)

				yn({ id = 'g000ig2006', min = 1, max = 1 }), -- таира чистоты
				yn({ id = 'g000ig3020', min = 1, max = 1 }), -- череп танатоса
				orr({ id = 'g000ig4006', min = 1, max = 1 }, { id = 'g001ig0497', min = 1, max = 1 }), -- книга т.з. / книга колдовства
				yn({ id = 'g000ig3022', min = 1, max = 1 }), -- р.лютня650
				yn({ id = 'g000ig4002', min = 1, max = 1 }), -- книга воды
				yn({ id = 'g000ig4003', min = 1, max = 1 }), -- книга земли
				yn({ id = 'g001ig0423', min = 1, max = 1 }), -- Латы Спасителя (Реликвия)
				yn({ id = 'g001ig0430', min = 1, max = 1 }), -- Роба убийцы (Реликвия)

				orr({ id = 'g001ig0111', min = 1, max = 1 }, { id = 'g000ig1010', min = 1, max = 1 }), -- сапоги асс 500 / эльфийские сапоги 700

				--посох
				orr(orr({ id = 'g001ig0122', min = 1, max = 1 }, { id = 'g001ig0391', min = 1, max = 1 }), orr({ id = 'g000ig6003', min = 1, max = 1 }, { id = 'g001ig0120', min = 1, max = 1 })), -- Посох гнева Вотана30урона / Посох оракула+30оз / Посох святости+30оз / Посох полуночного танца30урона
				
				yn({ id = 'g000ig9016', min = 1, max = 1 }), -- с.исциления
				yn({ id = 'g000ig9019', min = 1, max = 1 }), -- с.жизни
				yn({ id = 'g001ig0295', min = 1, max = 1 }), -- с.обета
				yn({ id = 'g001ig0157', min = 1, max = 1 }), -- с.очищ
				yn({ id = 'g001ig0476', min = 1, max = 1 }), -- Сфера безумия
				yn({ id = 'g001ig0454', min = 1, max = 1 }), -- Сфера восполнения
				yn({ id = 'g001ig0464', min = 1, max = 1 }), -- Сфера истирания
				yn({ id = 'g001ig0457', min = 1, max = 1 }), -- Сфера магмы
				yn({ id = 'g001ig0446', min = 1, max = 1 }), -- Сфера неутолимого голода

				yn({ id = 'g001ig0293', min = 1, max = 1 }), -- знамя бан.неуд700
				yn({ id = 'g001ig0292', min = 1, max = 1 }), -- знамя стяг.конц700
				yn({ id = 'g001ig0141', min = 1, max = 1 }), -- знамя земли700
				yn({ id = 'g000ig1003', min = 1, max = 1 }), -- знамя сражения
				yn({ id = 'g001ig0361', min = 1, max = 1 }), -- Знамя горна700
				yn({ id = 'g001ig0358', min = 1, max = 1 }), -- Знамя ража

				--талик
				orr({ id = 'g000ig9102', min = 1, max = 1 }, { id = 'g000ig9105', min = 1, max = 1 } ), -- Талисман Ангела / Талисман Возвышенного
				
				yn({ id = 'g000ig5029', min = 1, max = 1 }), -- рит. исцеления
				yn({ id = 'g000ig5007', min = 1, max = 1 }), -- св. исцеление
				
				orr(orr({ id = 'g001ig0248', min = 1, max = 1}, { id = 'g000ig5045', min = 1, max = 1}), orr({ id = 'g000ig5064', min = 1, max = 1}, { id = 'g000ig5101', min = 1, max = 1})), -- свиток устр. гимн, tormentio-броня, слабость, стая  
				
			}
		},
		guard = gmm({}, guard2()),
	},

}
end

-- Лавка т3
function zoneMerchZone34() -- свитки т2+т3 / т3+т3 и затопление / роща
return {
	{
		goods = {
			itemTypes = { Item.Scroll },
			value = { min = 550, max = 610 },
			itemValue = { min = 250, max = 300 },
			items = {
				{ id = 'g000ig0001', min = 5, max = 6 },
				{ id = 'g000ig0006', min = 5, max = 6 },
				{ id = 'g001ig0378', min = 6, max = 7}, --хил75
				{ id = 'g000ig0005', min = 7, max = 10 },
				{ id = 'g000ig0018', min = 1, max = 2 },

				yn({ id = 'g000ig0012', min = 1, max = 2 }), --ини30
				yn({ id = 'g000ig0015', min = 1, max = 2 }), --урон30
				yn({ id = 'g000ig0003', min = 1, max = 2 }), --защита30

				yn({ id = 'g000ig0002', min = 1, max = 1 }), --15
				yn({ id = 'g000ig0014', min = 1, max = 1 }), --15
				yn({ id = 'g000ig0011', min = 1, max = 1 }), --15
				yn({ id = 'g000ig0008', min = 1, max = 1 }), --15
				
				yn({ id = 'g000ig0021', min = 1, max = 1 }), -- вард
				yn({ id = 'g000ig0022', min = 1, max = 1 }), -- вард
				yn({ id = 'g000ig0023', min = 1, max = 1 }), -- вард
				yn({ id = 'g000ig0024', min = 1, max = 1 }), -- вард
				
				yn({ id = 'g001ig0128', min = 1, max = 1 }), -- вард оружия
				yn({ id = 'g001ig0125', min = 1, max = 1 }), -- вард разума
				yn({ id = 'g001ig0036', min = 1, max = 1 }), -- вард смерти

				yn({ id = d15(), min = 1, max = 1}), -- случ. дотвард
				yn({ id = d15(), min = 1, max = 1}), -- случ. дотвард
				yn({ id = d15(), min = 1, max = 1}), -- случ. дотвард
				yn({ id = d15(), min = 1, max = 1}), -- случ. дотвард
				
				orr({ id = 'g001ig0127', min = 1, max = 1 }, { id = 'g000ig0018', min = 1, max = 1 }), -- Эликсир жизненной силы / целебная мазь
				orr({ id = 'g001ig0340', min = 1, max = 1 }, { id = 'g001ig0338', min = 1, max = 1 }), -- Эликсир непорочности (превращение) / Эликсир непоколебимости (паралич)
				orr({ id = 'g001ig0523', min = 1, max = 1 }, { id = 'g001ig0521', min = 1, max = 1 }), -- Зелье воеводы (опыт 10) / Зелье разоблачения (неподкупность 20)

				yn({ id = 'g000ig3004', min = 1, max = 1 }), -- рун.клин1200
				yn({ id = 'g000ig2004', min = 1, max = 1 }), -- рог.всев1200
				yn({ id = 'g001ig0124', min = 1, max = 1 }), -- клин.возв1200
				yn({ id = 'g000ig9137', min = 1, max = 1 }), -- серд.эмира1200
				yn({ id = 'g000ig9035', min = 1, max = 1 }), -- Слеза Мортис (Артефакт)
				yn({ id = 'g000ig3019', min = 1, max = 1 }), -- Клинок Танатоса (Артефакт)
				yn({ id = 'g001ig0071', min = 1, max = 1 }), -- Эльфийская брошь (Артефакт)
				yn({ id = 'g001ig0612', min = 1, max = 1 }), -- Кольцо небесной воли (Артефакт)
				yn({ id = 'g001ig0488', min = 1, max = 1 }), -- Кольцо Несгибаемого стража (Артефакт)
				yn({ id = 'g001ig0413', min = 1, max = 1 }), -- Корни триббога (Артефакт) 1200
				yn({ id = 'g001ig0415', min = 1, max = 1 }), -- Руна кары Тьяцци (Артефакт) 1150
				yn({ id = 'g001ig0591', min = 1, max = 1 }), -- Щит отражения (Артефакт)
				yn({ id = 'g001ig0590', min = 1, max = 1 }), -- Щит Мизраэля (Артефакт)
				yn({ id = 'g001ig0060', min = 1, max = 1 }), -- Тысяча чешуек (Артефакт)
				
				yn({ id = 'g000ig2006', min = 1, max = 1 }), -- р.таира800
				yn({ id = 'g001ig0156', min = 1, max = 1 }), -- р.шкатулка800
				yn({ id = 'g000ig3022', min = 1, max = 1 }), -- р.лютня650
				yn({ id = 'g000ig4006', min = 1, max = 1 }), -- книга т.з.
				yn({ id = 'g001ig0597', min = 1, max = 1 }), -- Кираса резонанса (Реликвия)
				yn({ id = 'g001ig0427', min = 1, max = 1 }), -- Нагрудник Стража (Реликвия)
				yn({ id = 'g001ig0539', min = 1, max = 1 }), -- Тисовый лук (Реликвия)
				yn({ id = 'g001ig0605', min = 1, max = 1 }), -- Книга постижения

				yn({ id = 'g001ig0606', min = 1, max = 1 }), -- Сапоги родных земель 1000

				--посох
				orr(orr({ id = 'g000ig6020', min = 1, max = 1 }, { id = 'g001ig0380', min = 1, max = 1 }), orr({ id = 'g000ig6021', min = 1, max = 1 }, { id = 'g001ig0393', min = 1, max = 1 })), -- Посох Возни-15точ-10урона / Посох врат Бездны-белик / Посох Зов Леса-энт2 / Посох милости леса+50оз
				
				yn({ id = 'g001ig0054', min = 1, max = 1 }), -- сфера возд 350-400
				yn({ id = 'g001ig0056', min = 1, max = 1 }), -- сфера воды
				yn({ id = 'g000ig9029', min = 1, max = 1 }), -- сфера земли75
				yn({ id = 'g000ig9041', min = 1, max = 1 }), -- сфера пламени
				yn({ id = 'g000ig9018', min = 1, max = 1 }), -- сфера реген
				yn({ id = 'g000ig9038', min = 1, max = 1 }), -- сфера холода
				yn({ id = 'g001ig0053', min = 1, max = 1 }), -- сфера огня
				yn({ id = 'g000ig9042', min = 1, max = 1 }), -- сфера ослабл
				yn({ id = 'g001ig0455', min = 1, max = 1 }), -- Сфера благодати Всевышнего
				yn({ id = 'g001ig0472', min = 1, max = 1 }), -- Сфера бурана
				yn({ id = 'g001ig0473', min = 1, max = 1 }), -- Сфера гнева небес
				yn({ id = 'g001ig0474', min = 1, max = 1 }), -- Сфера горного лабиринта
				yn({ id = 'g001ig0479', min = 1, max = 1 }), -- Сфера жара
				yn({ id = 'g001ig0062', min = 1, max = 1 }), -- Сфера теней
				yn({ id = 'g001ig0477', min = 1, max = 1 }), -- Сфера упокоения
				yn({ id = 'g001ig0181', min = 1, max = 1 }), -- Сфера устрашения
				orr(orr({ id = 'g001ig0056', min = 1, max = 1 }, { id = 'g001ig0054', min = 1, max = 1 }), orr({ id = 'g001ig0055', min = 1, max = 1 }, { id = 'g001ig0053', min = 1, max = 1 })), -- сфера защиты воды / воздуха / земли / огня
				
				yn({ id = 'g000ig1002', min = 1, max = 1 }), -- знамя неуязв700
				yn({ id = 'g001ig0362', min = 1, max = 1 }), -- Знамя болот
				yn({ id = 'g001ig0364', min = 1, max = 1 }), -- Знамя ветра перемен
				yn({ id = 'g001ig0587', min = 1, max = 1 }), -- Знамя мастера
				yn({ id = 'g001ig0363', min = 1, max = 1 }), -- Знамя отваги
				yn({ id = 'g001ig0372', min = 1, max = 1 }), -- Знамя славы
				yn({ id = 'g001ig0374', min = 1, max = 1 }), -- Знамя стального листопада

				--талик
				orr({ id = 'g000ig9109', min = 1, max = 1 }, { id = 'g000ig9127', min = 1, max = 1 } ), -- Талисман Вампира / Талисман Грома (Белый маг)

--				orr({ id = 'g000ig5107', min = 1, max = 1}, { id = 'g001ig0084', min = 1, max = 1}), -- создание рощи / затопление
				orr(orr({ id = 'g001ig0252', min = 1, max = 1}, { id = 'g001ig0253', min = 1, max = 1}), orr({ id = 'g001ig0255', min = 1, max = 1}, { id = 'g001ig0256', min = 1, max = 1})), -- свиток сокрушение-брон, прокл.эмира-урон, спеш.время+ини, могущество+урон 
				orr({ id = 'g000ig5007', min = 1, max = 1 }, { id = 'g000ig5029', min = 1, max = 1 }), -- св. исцеление / рит. исцеления
				
			}
		},
		guard = gmm({}, guard3()),
	},
	
}
end

-- Предметы т4 (предметы)
function itemsMerchZone5()
return {
				{ id = 'g000ig0001', min = 3, max = 5 },
				{ id = 'g000ig0006', min = 3, max = 5 },
				{ id = 'g000ig0018', min = 2, max = 3 },

				yn({ id = 'g000ig0012', min = 1, max = 1 }), --ини30
				yn({ id = 'g000ig0015', min = 1, max = 1 }), --урон30
				yn({ id = 'g000ig0003', min = 1, max = 1 }), --защита30
--				yn({ id = 'g000ig0002', min = 1, max = 1 }), --15
--				yn({ id = 'g000ig0014', min = 1, max = 1 }), --15
--				yn({ id = 'g000ig0011', min = 1, max = 1 }), --15
--				yn({ id = 'g000ig0008', min = 1, max = 1 }), --15

				yn({ id = 'g001ig0128', min = 1, max = 1 }), -- вард оружия
				yn({ id = 'g001ig0125', min = 1, max = 1 }), -- вард разума
				yn({ id = 'g001ig0036', min = 1, max = 1 }), -- вард смерти

				yn({ id = 'g001ig0411', min = 1, max = 1 }), -- Грань реальности (Артефакт)
				yn({ id = 'g001ig0604', min = 1, max = 1 }), -- Кинжал жатвы (Артефакт)
				yn({ id = 'g001ig0585', min = 1, max = 1 }), -- Кольцо создателя (Артефакт)
				yn({ id = 'g001ig0046', min = 1, max = 1 }), -- Кровь Владыки (Артефакт)
				yn({ id = 'g001ig0410', min = 1, max = 1 }), -- Дьявольская булава (Артефакт)
				yn({ id = 'g001ig0102', min = 1, max = 1 }), -- Коготь Пожирателя (Артефакт)
				yn({ id = 'g000ig2005', min = 1, max = 1 }), -- Гравированная диадема (Артефакт)
				
				yn({ id = 'g001ig0419', min = 1, max = 1 }), -- Шлем воителя (Реликвия)1000
				yn({ id = 'g001ig0116', min = 1, max = 1 }), -- р.плас.досп1200
				yn({ id = 'g000ig7010', min = 1, max = 1 }), -- р.кор.имп1800
				yn({ id = 'g001ig0038', min = 1, max = 1 }), -- р.тяж.латы1550
				yn({ id = 'g000ig3005', min = 1, max = 1 }), -- р.кор.мьолн1200
--				yn({ id = 'g001ig0596', min = 1, max = 1 }), -- Линарет (Реликвия)

				yn({ id = 'g001ig0115', min = 1, max = 1 }), -- сапоги поступ1100
				yn({ id = 'g001ig0112', min = 1, max = 1 }), -- сапоги ангел800

				--посох
				orr({ id = 'g001ig0097', min = 1, max = 1 }, { id = 'g000ig6019', min = 1, max = 1 }), -- Посох озер / Посох Листвы 
				
				yn({ id = 'g000ig9014', min = 1, max = 1 }), -- сфера вьюги
				yn({ id = 'g001ig0296', min = 1, max = 1 }), -- Сфера жестокости
				yn({ id = 'g000ig9007', min = 1, max = 1 }), -- Сфера Забвения
				yn({ id = 'g001ig0496', min = 1, max = 1 }), -- Сфера паука
				yn({ id = 'g001ig0443', min = 1, max = 1 }), -- Сфера тайного знания
				yn({ id = 'g000ig9027', min = 1, max = 1 }), -- Сфера грома
				yn({ id = 'g000ig9004', min = 1, max = 1 }), -- Сфера испепеления
				
				--талик
				orr(orr({ id = 'g000ig9037', min = 1, max = 1 }, { id = 'g000ig9132', min = 1, max = 1 }), orr({ id = 'g001ig0066', min = 1, max = 1 }, { id = 'g000ig9141', min = 1, max = 1 })), -- Талисман Ледников / Талисман Морских Змеев | Талисман Стихийного Голема / Талисман Крылатого Ужаса
				
				yn({ id = 'g000ig5029', min = 1, max = 1 }), -- рит. исцеления
				yn({ id = 'g000ig5110', min = 1, max = 1 }), -- Свиток "Излечение"

}
end

-- Лавка т4
function zoneMerchZone5() -- свитки
return {
	{
		goods = {
			itemTypes = { Item.Scroll },
			value = { min = 600, max = 710 },
			itemValue = { min = 300, max = 400 },
			items = itemsMerchZone5()
		}
	}
	}
end

----------------------

-- Руины Респ 0
local valueRuinRespZ0 = { min = 165*kef, max = 175*kef }
local goldRuinRespZ0 = { min = 150, max = 165 } 

function zoneRuinRespZ0()
return {
	{
		gold = goldRuinRespZ0,
		loot = {
				items = {
					{id = p05(), min = 1, max = 1},
				},
		},
		guard = {
			value = valueRuinRespZ0
		}
	},
	{
		gold = goldRuinRespZ0,
		loot = {
			items = {
				orr(orr({ id = 'g000ig3001', min = 1, max = 1}, { id = 'g000ig2001', min = 1, max = 1}), orr({ id = 'g000ig3008', min = 1, max = 1}, { id = 'g001ig0101', min = 1, max = 1})), -- Гномьи наручи (Артефакт) / Рунный камень (Артефакт) | Обод мертвых (Реликвия) / Череп Хана (Реликвия)
			},
		},
		guard = {
			value = valueRuinRespZ0
		}
	},
}
end

-- Руины  зона 1
local valueRuinRespZ = { min = 220*kef, max = 230*kef }
local goldRuinRespZ = { min = 200, max = 220 } 

function zoneRuinRespZ()
return {
	{
		gold = goldRuinRespZ,
		loot = {
			items = {
				orr(orr({ id = 'g001ig0418', min = 1, max = 1}, { id = 'g001ig0428', min = 1, max = 1}), orr({ id = 'g001ig0100', min = 1, max = 1}, { id = 'g001ig0611', min = 1, max = 1})), -- Руна защиты Фрейра (Артефакт) / Кожаные эльфийские доспехи (Реликвия) | Цеп Хана (Артефакт) / Цепи жертвенности (Артефакт)
			},
		},
		guard = {
			value = valueRuinRespZ
		}
	},
	{
		gold = goldRuinRespZ,
		loot = {
				itemTypes = { Item.Jewel, Item.Wand },
				value = { min = 375, max = 410 },
				itemValue = { min = 375, max = 410 }
		},
		guard = {
			value = valueRuinRespZ
		}
	},
}
end


-- Руины зона 2
local valueRuinResp = { min = 380*kef, max = 400*kef }
local goldRuinResp = { min = 250, max = 275 } 

function zoneRuinResp()
return {
	{
		gold = goldRuinResp,
		loot = {
				itemTypes = { Item.Armor, Item.TravelItem },
				value = { min = 500, max = 660 },
				itemValue = { min = 500, max = 660 }
		},
		guard = {
			value = valueRuinResp
		}
	},

	{
		gold = goldRuinResp,
		loot = {
				itemTypes = { Item.Banner },
				value = { min = 400, max = 500 },
				itemValue = { min = 400, max = 500 }
		},
		guard = {
			value = valueRuinResp
		}
	}	
	}
end

-- Руины зона 3
local valueRuinZone = { min = 800*kef, max = 840*kef }
local goldRuinZone = { min = 300, max = 330 }

function zoneRuinZone34()
return {
	{
		gold = goldRuinZone,
		loot = {
				itemTypes = { Item.Jewel, Item.Weapon, Item.Armor },
				value = { min = 800, max = 1010 },
				itemValue = { min = 800, max = 1010 }
		},
		guard = {
			subraceTypes = NoUndead(),
			value = valueRuinZone
		}
	},
	{
		gold = goldRuinZone,
		loot = {
				itemTypes = { Item.Banner },
				value = { min = 600, max = 760 },
				itemValue = { min = 600, max = 760 }
		},
		guard = {
			subraceTypes = NoUndead(),
			value = valueRuinZone
		}
	},
	
}
end

-- Руины зона 4
local valueRuinZone5 = { min = 1600*kef, max = 1700*kef }
local goldRuinZone5 = { min = 350, max = 385 }

function zoneRuinZone5()
return {
	{
		gold = goldRuinZone5,
		loot = {
				itemTypes = { Item.Weapon, Item.Armor, Item.Jewel },
				value = { min = 1150, max = 1310 },
				itemValue = { min = 1150, max = 1310 }
		},
		guard = {
			subraceTypes = NoUndead(),
			value = valueRuinZone5
		}
	},
	{
		gold = goldRuinZone5,
		loot = {
			items = {
				orr(orr({ id = 'g001ig0312', min = 1, max = 1}, { id = 'g001ig0310', min = 1, max = 1}), orr({ id = 'g001ig0314', min = 1, max = 1}, { id = 'g001ig0356', min = 1, max = 1})), -- Эликсир предвиденья 15точность, Эликсир опережения 15ини, Эликсир наследия 15урон, Зелье вознесения вард-урон
			},
		},
		guard = {
			subraceTypes = NoUndead(),
			value = valueRuinZone5
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

-- Источники т1
function getMinesRespZ2(race)
	local r0 = math.random(0, 1)
	local r1 = math.random(0, 2)
	local mines = {}
	if race == Race.Human then
		if r0 == 0 then mines.lifeMana = 1 elseif r0 == 1 then mines.gold = 1 end
		if r1 == 0 then mines.deathMana = 1 elseif r1 == 1 then mines.infernalMana = 1 elseif r1 == 2 then mines.groveMana = 1 end
	elseif race == Race.Dwarf then
		if r0 == 0 then mines.runicMana = 1 elseif r0 == 1 then mines.gold = 1 end
		if r1 == 0 then mines.deathMana = 1 elseif r1 == 1 then mines.infernalMana = 1 elseif r1 == 2 then mines.groveMana = 1 end
	elseif race == Race.Undead then
		if r0 == 0 then mines.deathMana = 1 elseif r0 == 1 then mines.gold = 1 end
		if r1 == 0 then mines.lifeMana = 1 elseif r1 == 1 then mines.runicMana = 1 elseif r1 == 2 then mines.groveMana = 1 end
	elseif race == Race.Heretic then
		if r0 == 0 then mines.infernalMana = 1 elseif r0 == 1 then mines.gold = 1 end
		if r1 == 0 then mines.lifeMana = 1 elseif r1 == 1 then mines.runicMana = 1 elseif r1 == 2 then mines.groveMana = 1 end
	elseif race == Race.Elf then
		if r0 == 0 then mines.groveMana = 1 elseif r0 == 1 then mines.gold = 1 end
		if r1 == 0 then mines.deathMana = 1 elseif r1 == 1 then mines.lifeMana = 1 elseif r1 == 2 then mines.runicMana = 1 end
	end
	return mines		
end

-- Источники т2
function getMinesResp()
	local mines = {
		gold = 1,
		lifeMana = 1,
		runicMana = 1,
		groveMana = 1,
		infernalMana = 1,
		deathMana = 1,
	}
	return mines
end

-- Источники т3
function getMinesZone34(race)
	local r1 = math.random(0, 3)
	local mines = {
		gold = 1,
	}
	if race == Race.Human then
		mines.lifeMana = 1
		mines.runicMana = 1
		if r1 == 0 then
			mines.groveMana = 1
		elseif r1 == 1 then
			mines.infernalMana = 1
		elseif r1 == 2 then
			mines.deathMana = 1
		elseif r1 == 3 then
			mines.gold = 2
		end
	elseif race == Race.Dwarf then
		mines.runicMana = 1
		mines.lifeMana = 1
		if r1 == 0 then
			mines.deathMana = 1
		elseif r1 == 1 then
			mines.groveMana = 1
		elseif r1 == 2 then
			mines.infernalMana = 1
		elseif r1 == 3 then
			mines.gold = 2
		end
	elseif race == Race.Undead then
		mines.deathMana = 1
		mines.infernalMana = 1
		if r1 == 0 then
			mines.groveMana = 1
		elseif r1 == 1 then
			mines.runicMana = 1
		elseif r1 == 2 then
			mines.lifeMana = 1
		elseif r1 == 3 then
			mines.gold = 2
		end
	elseif race == Race.Heretic then
		mines.infernalMana = 1
		mines.deathMana = 1
		if r1 == 0 then
			mines.groveMana = 1
		elseif r1 == 1 then
			mines.runicMana = 1
		elseif r1 == 2 then
			mines.lifeMana = 1
		elseif r1 == 3 then
			mines.gold = 2
		end
	elseif race == Race.Elf then
		mines.groveMana = 1
		mines.lifeMana = 1
		if r1 == 0 then
			mines.runicMana = 1
		elseif r1 == 1 then
			mines.infernalMana = 1
		elseif r1 == 2 then
			mines.deathMana = 1
		elseif r1 == 3 then
			mines.gold = 2
		end
	end

	return mines		

end

-- Источники т4
function getMinesZone5()
	local resourceType = math.random(0, 4)
	local mines = {
		gold = 1,
	}
--	if resourceType == 0 then
--		mines.runicMana = 1
--	elseif resourceType == 1 then
--		mines.lifeMana = 1
--	elseif resourceType == 2 then
--		mines.deathMana = 1
--	elseif resourceType == 3 then
--		mines.groveMana = 1
--	elseif resourceType == 4 then
--		mines.infernalMana = 1
--	end
	
  return mines
end

----------------


-- Юниты для наёмников (начальные)
function unitsMercen12()
local unitsm = {}
local i = 1

unitsm[i] = { id = 'g000uu5030', level = 1, unique = false } i = i + 1 -- разбойник

if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0011', level = 1, unique = true } i = i + 1 end -- Послушница
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0006', level = 1, unique = true } i = i + 1 end -- Лучник
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0009', level = 2, unique = true } i = i + 1 end -- Волшебник
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0002', level = 2, unique = true } i = i + 1 end -- Рыцарь
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0004', level = 2, unique = true } i = i + 1 end -- Охотник на ведьм
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu2014', level = 2, unique = true } i = i + 1 end -- Оруженосец

if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0034', level = 2, unique = true } i = i + 1 end -- Посвященная
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0027', level = 2, unique = true } i = i + 1 end -- Арбалетчик
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0029', level = 1, unique = true } i = i + 1 end -- Холмовой великан
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0037', level = 2, unique = true } i = i + 1 end -- Воин

if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8031', level = 1, unique = true } i = i + 1 end -- Дух
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8018', level = 1, unique = true } i = i + 1 end -- Разведчик
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8026', level = 2, unique = true } i = i + 1 end -- Чанелер
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8015', level = 2, unique = true } i = i + 1 end -- Кентавр-латник
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8016', level = 2, unique = true } i = i + 1 end -- Кентавр-странник

if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0063', level = 2, unique = true } i = i + 1 end -- Темный колдун
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0055', level = 1, unique = true } i = i + 1 end -- Горгулья
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0057', level = 1, unique = true } i = i + 1 end -- Черт
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0053', level = 2, unique = true } i = i + 1 end -- Берсеркер

if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0078', level = 1, unique = true } i = i + 1 end -- Привидение
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0081', level = 2, unique = true } i = i + 1 end -- Колдун
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu7542', level = 2, unique = true } i = i + 1 end -- Чумотворец
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0093', level = 1, unique = true } i = i + 1 end -- Виверна
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0087', level = 2, unique = true } i = i + 1 end -- Зомби
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0090', level = 2, unique = true } i = i + 1 end -- Тамплиер

--if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8169', level = 1, unique = true } i = i + 1 end -- к.сущн700
--if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8168', level = 1, unique = true } i = i + 1 end -- л.сущн700
--if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8171', level = 1, unique = true } i = i + 1 end -- бури.сущн700
--if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8170', level = 1, unique = true } i = i + 1 end -- плам.сущ700

--if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu5031', level = 1, unique = true } i = i + 1 end -- голов
--if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu5018', level = 1, unique = true } i = i + 1 end -- гоблин.л
--if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8196', level = 1, unique = true } i = i + 1 end -- гоблин.тр.
--if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu5013', level = 1, unique = true } i = i + 1 end -- орк
--if math.random(0,1) == 1 then unitsm[i] = { id = 'g001uu7547', level = 1, unique = true } i = i + 1 end -- бутуз
--if math.random(0,1) == 1 then unitsm[i] = { id = 'g001uu7550', level = 1, unique = true } i = i + 1 end -- айтвар
--if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8199', level = 1, unique = true } i = i + 1 end -- д.резни
--if math.random(0,1) == 1 then unitsm[i] = { id = 'g001uu8309', level = 1, unique = true } i = i + 1 end -- триббог


return unitsm
end

-- Наёмники в зоне 2
function zoneMercenZone12()
return {
	{
		units = unitsMercen12(),
		guard = gmm({}, guard2n()),
		}
	}
end


-- Юниты для наёмников (основные)
function unitsMercen()
local unitsm = {}
local i = 1

unitsm[i] = { id = 'g000uu5028', level = 1, unique = false } i = i + 1 -- тритон

if math.random(0,1) == 1 then unitsm[i] = { id = 'g001uu7571', level = 2, unique = true } i = i + 1 end -- б.волк
if math.random(0,1) == 1 then unitsm[i] = { id = 'g001uu8279', level = 1, unique = true } i = i + 1 end -- ч.волк
if math.random(0,1) == 1 then unitsm[i] = { id = 'g001uu7564', level = 2, unique = true } i = i + 1 end -- Хорт
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu5032', level = 1, unique = true } i = i + 1 end -- Вождь варваров
if math.random(0,1) == 1 then unitsm[i] = { id = 'g002uu0025', level = 1, unique = true } i = i + 1 end -- эл.земли
if math.random(0,1) == 1 then unitsm[i] = { id = 'g002uu5026', level = 1, unique = true } i = i + 1 end -- эл.воды

if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0157', level = 4, unique = true } i = i + 1 end -- Великий инквизитор
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0014', level = 4, unique = true } i = i + 1 end -- Ангел
if math.random(0,1) == 1 then unitsm[i] = { id = 'g001uu7560', level = 1, unique = true } i = i + 1 end -- Каратель
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu2031', level = 4, unique = true } i = i + 1 end -- Эмиссар
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0152', level = 4, unique = true } i = i + 1 end -- Белый маг
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu7595', level = 2, unique = true } i = i + 1 end -- Рефаим

if math.random(0,1) == 1 then unitsm[i] = { id = 'g001uu7579', level = 4, unique = true } i = i + 1 end -- Кентавр-гвардеец
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu2013', level = 4, unique = true } i = i + 1 end -- Налетчик
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8212', level = 3, unique = true } i = i + 1 end -- прародитель
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8151', level = 1, unique = true } i = i + 1 end -- фурия
if math.random(0,1) == 1 then unitsm[i] = { id = 'g001uu8240', level = 4, unique = true } i = i + 1 end -- Штормовой кентавр

if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu7610', level = 1, unique = true } i = i + 1 end -- Ледяной ходок
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0040', level = 4, unique = true } i = i + 1 end -- Старый ветеран
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu7583', level = 2, unique = true } i = i + 1 end -- Йамму
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0190', level = 1, unique = true } i = i + 1 end -- Дух Фенрира
if math.random(0,1) == 1 then unitsm[i] = { id = 'g001uu7613', level = 1, unique = true } i = i + 1 end -- Огнеборец

if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0171', level = 3, unique = true } i = i + 1 end -- подражатель
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8192', level = 4, unique = true } i = i + 1 end -- Бехемот
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0166', level = 4, unique = true } i = i + 1 end -- Возвышенный
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8254', level = 4, unique = true } i = i + 1 end -- Искоренитель
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0061', level = 4, unique = true } i = i + 1 end -- Повелитель демонов

if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0178', level = 4, unique = true } i = i + 1 end -- Сущий
if math.random(0,1) == 1 then unitsm[i] = { id = 'g001uu8314', level = 4, unique = true } i = i + 1 end -- Клеврет Смерти
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8174', level = 1, unique = true } i = i + 1 end -- Вестник распада
if math.random(0,1) == 1 then unitsm[i] = { id = 'g001uu7598', level = 3, unique = true } i = i + 1 end -- Теневидец
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu6109', level = 1, unique = true } i = i + 1 end -- Женщина-некромант

if math.random(0,1) == 1 then unitsm[i] = { id = 'g001uu8255', level = 1, unique = true } i = i + 1 end -- Эльф-тень
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu7589', level = 1, unique = true } i = i + 1 end -- Осквернитель
if math.random(0,1) == 1 then unitsm[i] = { id = 'g001uu8260', level = 1, unique = true } i = i + 1 end -- Искуситель

return unitsm
end

-- Наёмники в зоне 3
function zoneMercenZone()
return {
	{
		units = unitsMercen(),
		guard = gmm({}, guard3n()),
		}
	}
end

----------------------

-- Сундуки Респ
function bagsResp00()
return {
	count = 1,
	loot = {
		itemTypes = { Item.Valuable },
		value = { min = 250, max = 375 }, 
		itemValue = { min = 250, max = 375 },
			items = {
				orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --рес/хил100
				orr({ id = 'g001ig0180', min = 2, max = 2 }, { id = 'g000ig0005', min = 1, max = 1 }), --2трава/хил50
				{ id = d15(), min = 1, max = 1 },
			}
	}
}
end


-- Сундуки т1
function bagsResp0()
return {
	count = 1,
	loot = {
		itemTypes = { Item.Valuable },
		value = { min = 500, max = 625 }, 
		itemValue = { min = 250, max = 625 },
			items = {
				orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --рес/хил100
				orr({ id = 'g001ig0180', min = 3, max = 3 }, { id = 'g001ig0378', min = 1, max = 1 }), --2-3трава/хил75
				{ id = b15(), min = 1, max = 1 },
			}
	}
}
end

-- Сундуки т2
function bagsResp()
return {
	count = 1,
	loot = {
		itemTypes = { Item.Valuable },
		value = { min = 750, max = 875 }, 
		itemValue = { min = 250, max = 875 },
			items = {
				orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --рес/хил100
				orr({ id = 'g000ig0006', min = 1, max = 1 }, { id = 'g000ig0005', min = 2, max = 2 }), --хил100/2хил50
				{ id = w15(), min = 1, max = 1 },
			}
		}
}
end

-- Сундуки т3
function bagsZone34()
return {
	count = 1,
	loot = {
		itemTypes = { Item.Valuable },
		value = { min = 1000, max = 1000 },
		itemValue = { min = 500, max = 1000 },
			items = {
				orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --рес/хил100
				orr({ id = 'g000ig0005', min = 3, max = 3 }, { id = 'g001ig0378', min = 1, max = 1 }), --3хил50/2хил75
				orr(orr({ id = 'g001ig0128', min = 1, max = 1 }, { id = 'g001ig0560', min = 1, max = 1 }), orr({ id = 'g001ig0490', min = 1, max = 1 }, { id = 'g001ig0547', min = 1, max = 1 })), --вард оружие/провокатора, Зелье выносливости/Зелье пронзающего взгляда
			}
		}
	}
end

-- Сундуки т4
function bagsZone5()
return {
	count = 1,
	loot = {
		itemTypes = { Item.Valuable },
		value = { min = 1000, max = 1000 },
		itemValue = { min = 500, max = 1000 },
			items = {
				{ id = 'g000ig0001', min = 1, max = 1 }, --рес
				{ id = 'g000ig0018', min = 1, max = 1 }, --хил200
				-- orr(orr({ id = 'g001ig0128', min = 1, max = 1 }, { id = 'g001ig0560', min = 1, max = 1 }), orr({ id = 'g001ig0125', min = 1, max = 1 }, { id = 'g001ig0547', min = 1, max = 1 })), --вард оружие/провокатора, вард разум/Зелье пронзающего взгляда
				{ id = p05(), min = 1, max = 1 },
		}
	}
}
end

----------------------
-- МОИ ФУНКЦИИ
----------------------

-- Быль или не быть
function yn(what)
	local radn = math.random(0,1)
	if radn == 0 then
	return what
	elseif radn == 1 then
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

-- Режим карты
function gmm(outrun, classic)
	if gmode == 1 then
	return outrun
	elseif gmode == 2 then
	return classic
	end
end

function getPlayerSubRace(race) -- субраса игрока
	if race == Race.Human then return Subrace.Human
	elseif race == Race.Dwarf then return Subrace.Dwarf
	elseif race == Race.Undead then return Subrace.Undead
	elseif race == Race.Heretic then return Subrace.Heretic
	elseif race == Race.Elf then return Subrace.Elf
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

-- случайная банка на 15
function b15()
	local radn = math.random(0,3)
	if radn == 0 then
	return 'g000ig0002'
	elseif radn == 1 then
	return 'g000ig0014'
	elseif radn == 2 then
	return 'g000ig0011'
	elseif radn == 3 then
	return 'g000ig0008'
	end
end

-- случайная банка вард от стихий
function w15()
	local radn = math.random(0,3)
	if radn == 0 then
	return 'g000ig0021'
	elseif radn == 1 then
	return 'g000ig0022'
	elseif radn == 2 then
	return 'g000ig0023'
	elseif radn == 3 then
	return 'g000ig0024'
	end
end

-- случайная банка вард от дотов и спец урона
function d15()
	local radn = math.random(0,13)
	if radn == 0 then
	return 'g001ig0333' -- Эликсир безличия
	elseif radn == 1 then
	return 'g001ig0349' -- Эликсир защиты от Вампиризма
	elseif radn == 2 then
	return 'g001ig0343' -- Эликсир защиты от Замедления
	elseif radn == 3 then
	return 'g001ig0329' -- Эликсир защиты от Горения
	elseif radn == 4 then
	return 'g001ig0327' -- Эликсир защиты от Мороза
	elseif radn == 5 then
	return 'g001ig0335' -- Эликсир защиты от окаменения
	elseif radn == 6 then
	return 'g001ig0345' -- Эликсир защиты от Ослабления
	elseif radn == 7 then
	return 'g001ig0337' -- Эликсир защиты от Паралича
	elseif radn == 8 then
	return 'g001ig0347' -- Эликсир защиты от Понижения уровня
	elseif radn == 9 then
	return 'g001ig0339' -- Эликсир защиты от Превращения
	elseif radn == 10 then
	return 'g001ig0353' -- Эликсир защиты от Разрушения
	elseif radn == 11 then
	return 'g001ig0341' -- Эликсир защиты от Страха
	elseif radn == 12 then
	return 'g001ig0351' -- Эликсир защиты от Тауматургии
	elseif radn == 13 then
	return 'g001ig0331' -- Эликсир защиты от Яда
	end
end


-- случайный пермо-эликсир на 5% за 400
function p05()
	local radn = math.random(0,5) -- убрал 6 вапиризм 
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
	elseif radn == 5 then
	return 'g001ig0533' -- Зелье ясного взора +2обзора
--	elseif radn == 6 then
--	return 'g001ig0317' -- Зелье дьявольских таинств+15варпирик
	end
end




-- только не нежить
function NoUndead()
	return {Subrace.Human, Subrace.Heretic, Subrace.Dwarf, Subrace.Elf, Subrace.Neutral, Subrace.NeutralHuman, Subrace.NeutralElf, Subrace.NeutralGreenSkin, Subrace.NeutralDragon, Subrace.NeutralMarsh, Subrace.NeutralWater, Subrace.NeutralBarbarian, Subrace.NeutralWolf}
end

-- отряд варвары
function PredBarb(vmin, vmax, vlmin, vlmax)
return { 
-- новые: 90 трибог, 110 айтвар, 135 ящер-воин, 485 ларней, 775 болотный страж, 985 лиргид, 1775 болотный дракон
-- старые: 165 шаманка, 175 трапер, 220 вождь, 270 дик.вел

		count = 1,
			subraceTypes = { Subrace.NeutralBarbarian, Subrace.NeutralMarsh, Subrace.Human, Subrace.Undead, Subrace.Heretic, Subrace.Dwarf, Subrace.Elf },
			value = { min = vmin*kef, max = vmax*kef },
			loot = {
				itemTypes = { Item.Scroll, Item.Orb },
				value = { min = vlmin, max = vlmin },
				itemValue = { min = vlmin, max = vlmin },
				items = {
					orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --рес/хил100
				}
			}
}
end

-- отряд орки
function PredSkin(omin, omax, olmin, olmax)
return { -- 70 орк/cегаш, 90 череполом, 110 бутуз, 190! - палач
		count = 1,
			subraceTypes = { Subrace.NeutralGreenSkin, Subrace.Human, Subrace.Undead, Subrace.Heretic, Subrace.Dwarf, Subrace.Elf },
			value = { min = omin*kef, max = omax*kef },
			loot = {
				itemTypes = { Item.PotionHeal, Item.PotionRevive },
				value = { min = olmin, max = olmax },
				itemValue = { min = 50, max = 250 },
				items = {
					orr({ id = b15(), min = 1, max = 1 }, { id = w15(), min = 1, max = 1}), -- случ. банка15 /  случ. вард
				}
			}
}
end


----------------------
-- Отряды респ
---------------------

function zoneStacksRespZ00()
return {  -- 175*3
		count = 3,
		value = { min = 525*kef, max = 550*kef },
		loot = {
			items = {
				{ id = 'g000ig0005', min = 1, max = 1 }, -- хил50
				{ id = 'g001ig0180', min = 2, max = 2 }, -- хил25
				{ id = 'g000ig7001', min = 1, max = 1 }, --кольцо50
				{ id = 'g000ig0008', min = 1, max = 1 }, -- точность15
				{ id = 'g000ig0002', min = 1, max = 1 }, --защита15
				{ id = d15(), min = 1, max = 1}, -- случ. дотвард
			}
		}
}
end


function zoneStacksRespZ001()
return { -- 180*2
		count = 2,
		value = { min = 360*kef, max = 380*kef },
		loot = {
			items = {
				{ id = 'g001ig0378', min = 1, max = 1}, --хил75
				{ id = 'g000ig0005', min = 1, max = 1 }, -- хил50
				{ id = 'g000ig7001', min = 1, max = 1 }, --кольцо50
				orr({ id = 'g000ig0021', min = 1, max = 1 }, { id = 'g000ig0024', min = 1, max = 1 }), --возд/огня
			}
		}
}
end

function zoneStacksRespZ002()
return { -- 185*2
		count = 2,
		value = { min = 370*kef, max = 390*kef },
		loot = {
			itemTypes = { Item.Orb },
			value = { min = 200, max = 210 },
			itemValue = { min = 100, max = 110 },		
			items = {
				{ id = 'g000ig0001', min = 1, max = 1 }, --рес
				{ id = 'g000ig0005', min = 1, max = 1 }, -- хил50
				{ id = 'g000ig7001', min = 1, max = 1 }, --кольцо50
			}
		}
}
end

--------------
-- Отряды т1
--------------

function Pred1RespZ0()
return {  --200xp*2 -- сфера 100 / 150
		count = 2,
			value = { min = 400*kef, max = 420*kef },
			loot = {
				itemTypes = { Item.Orb },
				value = { min = 260, max = 310 },
				itemValue = { min = 110, max = 150 },
				items = {
					{ id = b15(), min = 1, max = 1}, -- случ. банка15					
					{ id = 'g000ig0005', min = 2, max = 2 }, -- хил50
					{ id = 'g001ig0180', min = 1, max = 1}, -- хил25
				}
			}
}
end

function Pred1RespZ01()
return { --230xp*2 -- свиток 150
		count = 2,
			value = { min = 460*kef, max = 480*kef }, 
			loot = {
				itemTypes = { Item.Scroll },
				value = { min = 300, max = 310 },
				itemValue = { min = 150, max = 150 },
				items = {
					{ id = 'g000ig0006', min = 1, max = 1}, --хил100
					{ id = 'g001ig0180', min = 1, max = 1}, -- хил25
					orr({ id = 'g000ig0022', min = 1, max = 1 }, { id = 'g000ig0023', min = 1, max = 1 }), --воды/земли
					{ id = d15(), min = 1, max = 1}, -- случ. дотвард					
				}
			}
}
end

function Pred1RespZ02() 
return { --250xp*1 -- вард разума / смерти
		count = 1,
			subraceTypes = NoUndead(),
			value = { min = 250*kef, max = 260*kef }, 
			loot = {
				items = {
					orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --рес/хил100
					{ id = 'g000ig0005', min = 1, max = 1 }, -- хил50
					orr({ id = 'g001ig0125', min = 1, max = 1 }, { id = 'g001ig0036', min = 1, max = 1 }), --разума/смерти
					{ id = b15(), min = 1, max = 1}, -- случ. банка15					
				}
			}
}
end


function Pred1RespZD() 
return { --280xp*1 -- свиток 250 / талисман 200
		count = 1,
			subraceTypes = NoUndead(),
			value = { min = 280*kef, max = 290*kef }, 
			loot = {
				itemTypes = { Item.Scroll, Item.Talisman },
				value = { min = 200, max = 260 },
				itemValue = { min = 200, max = 250 },
				items = {
					{ id = 'g000ig0001', min = 1, max = 1 }, --рес
					{ id = 'g001ig0378', min = 1, max = 1}, --хил75
					orr({ id = 'g000ig0021', min = 1, max = 1 }, { id = 'g000ig0024', min = 1, max = 1 }), --возд/огня
				}
			}
}
end


------------------
-- Отряды т2
------------------

function zoneStacksResp1()
return { -- 250xp*2
		count = 2,
		value = { min = 500*kef, max = 525*kef}, 
		loot = {
			items = {
				{ id = 'g000ig0006', min = 1, max = 1 }, --хил100
				{ id = 'g001ig0378', min = 1, max = 1}, --хил75
				orr({ id = 'g000ig0022', min = 1, max = 1 }, { id = 'g000ig0023', min = 1, max = 1 }), --воды/земли
				{ id = 'g000ig0011', min = 1, max = 1 }, --ини15
				{ id = 'g000ig7002', min = 1, max = 1 }, --кольцо100
				{ id = d15(), min = 1, max = 1}, -- случ. дотвард
			}
		},
	}	
end

function Pred1Resp01()
return { -- 300хп*2
			count = 2,
			value = { min = 600*kef, max = 630*kef },
			loot = {
				items = {
					{ id = 'g000ig0001', min = 1, max = 1 }, --рес
					{ id = 'g000ig0005', min = 1, max = 2 }, --хил50
					orr({ id = 'g000ig0021', min = 1, max = 1 }, { id = 'g000ig0024', min = 1, max = 1 }), --возд/огня
					{ id = 'g000ig0014', min = 1, max = 1 }, --атака15
					{ id = 'g000ig7002', min = 1, max = 1 }, --кольцо100
					{ id = d15(), min = 1, max = 1 }, --случ. дотвард
				}
			}
}
end

function zoneStacksResp()
return { -- 350xp*2 / свитки 150-200
		count = 2,
		value = { min = 700*kef, max = 735*kef}, 
		loot = {
			itemTypes = { Item.Scroll },
			value = { min = 400, max = 410 }, -- 2 * сфиток 150 (200)
			itemValue = { min = 150, max = 250 },
			items = {
				{ id = 'g000ig0006', min = 1, max = 1 }, --хил100
				{ id = 'g001ig0378', min = 1, max = 1}, --хил75
				{ id = 'g000ig0008', min = 1, max = 1 }, --меткость15
				orr({ id = 'g001ig0125', min = 1, max = 1 }, { id = 'g001ig0036', min = 1, max = 1 }), --разума/смерти
			}
		},
	}
end

function Pred1Resp1() 
return { -- 400хп*2 -- сфера/свиток 150-225
			count = 2,
			value = { min = 800*kef, max = 840*kef },
			loot = {
				itemTypes = { Item.Orb, Item.Scroll },
				value = { min = 350, max = 435 },
				itemValue = { min = 150, max = 225 },
				items = {
					{ id = 'g000ig0006', min = 1, max = 1 }, --хил100
					orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --рес/хил100
					orr({ id = 'g000ig0022', min = 1, max = 1 }, { id = 'g000ig0023', min = 1, max = 1 }), --воды/земли
					{ id = 'g000ig0002', min = 1, max = 1 }, --защита15
				}
			}
}
end

function Pred1Resp2()
return { -- 450хп*2 -- свиток 150-250
			count = 2,
			value = { min = 900*kef, max = 945*kef },
			loot = {
				itemTypes = { Item.Scroll },
				value = { min = 400, max = 510 }, -- свиток150+250 или 250+250
				itemValue = { min = 150, max = 250 },
				items = {
					{ id = 'g000ig0001', min = 1, max = 1 }, --рес
					{ id = 'g000ig0005', min = 1, max = 1 }, --хил100
					orr({ id = 'g000ig0021', min = 1, max = 1 }, { id = 'g000ig0024', min = 1, max = 1 }), --возд/огня
					{ id = w15(), min = 1, max = 1 }, --случ. вард
				}
			}
}
end

function Pred1Resp3()
return { -- 500хп*2 -- сфера 225-250
			count = 2,
			value = { min = 1000*kef, max = 1050*kef },
			loot = {
				itemTypes = { Item.Orb },
				value = { min = 450, max = 510 }, -- 2 сфера 
				itemValue = { min = 225, max = 250 },
				items = {
					{ id = 'g000ig0001', min = 1, max = 1 }, --рес
					{ id = 'g001ig0378', min = 1, max = 1}, --хил75
					{ id = 'g000ig0005', min = 1, max = 1 }, --хил50
					{ id = 'g000ig7002', min = 1, max = 1 }, --кольцо100
				}
			}
}
end

function Pred1Resp4()
return { -- 570хп*1 -- вард оружия / оз+25%
			count = 1,
			value = { min = 570*kef, max = 600*kef },
			loot = {
				items = {
					orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --рес/хил100
					{ id = 'g000ig0005', min = 1, max = 1 }, --хил50
					orr({ id = 'g001ig0128', min = 1, max = 1 },{ id = 'g001ig0490', min = 1, max = 1 }), -- вард оружия/зелье выносливости +25%
					{ id = b15(), min = 1, max = 1}, -- случ. банка15
				}
			}
}
end


function Pred1RespD()
return { -- 670хп*1 -- перк 600
			count = 1,
			subraceTypes = NoUndead(),
			value = { min = 670*kef, max = 700*kef },
			loot = {
				items = {
					{ id = 'g000ig0001', min = 1, max = 1 }, --рес
					{ id = 'g001ig0378', min = 1, max = 1}, --хил75
					orr({ id = 'g001ig0125', min = 1, max = 1 }, { id = 'g001ig0036', min = 1, max = 1 }), --разума/смерти
					orr({ id = 'g001ig0531', min = 1, max = 1}, { id = 'g001ig0524', min = 1, max = 1 }), -- Зелье слова (свитки) / Зелье завоевателя (жезлы)
				}
			}
}
end

--------------------
-- Отряды т3
--------------------

function zoneStacksZone34()
return { -- 550xp*4
		count = 4,
		value = { min = 2200*kef, max = 2310*kef},
		loot = {
			items = {
				{ id = 'g000ig0001', min = 2, max = 2 }, --рес
				{ id = 'g000ig0006', min = 1, max = 1 }, --хил100
				{ id = 'g001ig0378', min = 1, max = 1}, --хил75
				orr({ id = 'g000ig0022', min = 1, max = 1 }, { id = 'g000ig0023', min = 1, max = 1 }), --воды/земли
				orr({ id = 'g000ig0021', min = 1, max = 1 }, { id = 'g000ig0024', min = 1, max = 1 }), --возд/огня
				{ id = 'g000ig0002', min = 1, max = 1 }, --защита15
				orr({ id = 'g000ig0011', min = 1, max = 1 }, { id = 'g000ig0008', min = 1, max = 1 }), --15ини/точности
				{ id = 'g000ig7003', min = 1, max = 1 }, --изумруд150
				{ id = 'g001ig0036', min = 1, max = 1 }, --смерти
				{ id = 'g001ig0125', min = 1, max = 1 }, --разума
				{ id = d15(), min = 1, max = 1}, -- случ. дотвард
			}
		},
	}
end

local Pred1ZoneValue = { min = 1520*kef, max = 1600*kef } -- 760*2

function Pred1Zone1()
return { -- 600хп*2 -- свиток250-350
			count = 2,
			value = { min = 1200*kef, max = 1260*kef },
			loot = {
				itemTypes = { Item.Scroll },
				value = { min = 500, max = 660 }, --свиток 250, 300, 350
				itemValue = { min = 250, max = 350 },
				items = {
					orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --рес/хил100
					{ id = 'g000ig0006', min = 1, max = 1 }, --хил100
					{ id = 'g000ig0005', min = 1, max = 1 }, --хил50
					orr({ id = 'g000ig0021', min = 1, max = 1 }, { id = 'g000ig0024', min = 1, max = 1 }), --возд/огня
					orr({ id = 'g000ig0002', min = 1, max = 1 }, { id = 'g000ig0014', min = 1, max = 1 }), --15зашиты/атаки
					{ id = 'g001ig0128', min = 1, max = 1 }, --оружия
				}
			}
}
end

function Pred1Zone2()
return { -- 700хп*2 -- сфера375-400
			count = 2,
			value = { min = 1400*kef, max = 1470*kef },
				loot = {
					itemTypes = { Item.Orb },
					value = { min = 775, max = 810 }, -- сфера 375, 400
					itemValue = { min = 375, max = 400 },
					items = {
						{ id = 'g000ig0001', min = 1, max = 1 }, --рес
						{ id = 'g000ig0006', min = 1, max = 1 }, --хил100
						{ id = 'g001ig0378', min = 1, max = 1}, --хил75
						orr({ id = 'g000ig0011', min = 1, max = 1 }, { id = 'g000ig0008', min = 1, max = 1 }), --15ини/точности
						orr({ id = 'g000ig0022', min = 1, max = 1 }, { id = 'g000ig0023', min = 1, max = 1 }), --воды/земли
						{ id = 'g000ig0012', min = 1, max = 1 }, --ини30
					}
				}
}
end

function Pred1Zone3()
return { -- 800хп*2 -- элексир буст 350-500
			count = 2,
			value = { min = 1600*kef, max = 1680*kef },
				loot = {
					itemTypes = { Item.PotionBoost },
					value = { min = 850, max = 1010 }, -- эликсир 350, 425, 500
					itemValue = { min = 350, max = 500 },
					items = {
						orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --рес/хил100
						{ id = 'g000ig0006', min = 2, max = 2 }, --хил100
						orr({ id = 'g000ig0008', min = 1, max = 1 }, { id = 'g000ig0014', min = 1, max = 1 }), --15точности/атаки
						orr({ id = 'g001ig0125', min = 1, max = 1 }, { id = 'g001ig0036', min = 1, max = 1 }), --разума/смерти
						{ id = 'g000ig0015', min = 1, max = 1 }, --атака30
					}
				}
}
end

function Pred1Zone4()
return { -- 900хп*2 -- сфера/свиток 400
			count = 2,
			value = { min = 1800*kef, max = 1890*kef },
				loot = {
					itemTypes = { Item.Scroll, Item.Orb },
					value = { min = 800, max = 810 },
					itemValue = { min = 400, max = 400 },
					items = {
						{ id = 'g000ig0001', min = 1, max = 1 }, --рес
						{ id = 'g000ig0006', min = 2, max = 2 }, --хил100
						{ id = 'g000ig0005', min = 1, max = 1 }, --хил50
						{ id = 'g001ig0128', min = 1, max = 1 }, --оружия
						orr({ id = 'g000ig0011', min = 1, max = 1 }, { id = 'g000ig0002', min = 1, max = 1 }), --15ини/защиты
						{ id = 'g000ig0003', min = 1, max = 1 }, --30защиты
 					}
				}
}
end

function Pred1ZoneD() 
return { --1200хп*1 --свито400-600 + пермо
			count = 1,
			subraceTypes = NoUndead(),
			value = { min = 1200*kef, max = 1260*kef },
				loot = {
					itemTypes = { Item.Scroll },
					value = { min = 400, max = 610 },
					itemValue = { min = 400, max = 600 },
					items = {
						{ id = 'g000ig0001', min = 1, max = 1 }, --рес
						{ id = 'g000ig0006', min = 2, max = 2 }, --хил100
						orr({ id = 'g000ig0003', min = 1, max = 1 }, { id = 'g000ig0015', min = 1, max = 1 }), --30защиты/атаки
						orr({ id = p05(), min = 1, max = 1}, { id = 'g001ig0529', min = 1, max = 1 }), -- случ. пермо-эликсир на 5% / Каталог магических сфер (сферы)
					}
				}
		}
end


--------------------
-- Отряды т4 (трежа)
--------------------

function zoneStacksZone5()
return { -- 1200хп*4
		count = 4,
		value = { min = 4800*kef, max = 5050*kef},
		loot = {
			items = {
				{ id = 'g000ig0001', min = 2, max = 2 }, --рес
				{ id = 'g000ig0006', min = 2, max = 2 }, --хил100
				{ id = 'g001ig0378', min = 1, max = 1}, --хил75
				{ id = 'g000ig0015', min = 1, max = 1 }, --атака30
				{ id = 'g000ig0012', min = 1, max = 1 }, --ини30
				{ id = 'g000ig7004', min = 1, max = 1 }, --золотое кольцо
				{ id = 'g000ig0018', min = 1, max = 1 }, --мазь
				{ id = 'g001ig0547', min = 1, max = 1 }, --крит15
				{ id = 'g001ig0127', min = 1, max = 1 }, --оз50
				{ id = 'g001ig0560', min = 1, max = 1 }, --провокатора
				{ id = 'g001ig0355', min = 1, max = 1 }, --вард.урон
			}
		},
}
end


local Pred1Zone5Value = { min = 1600*kef, max = 1680*kef } -- 1600

function Pred1Zone51()
return { -- эликсир425-550
			count = 1,
			subraceTypes = NoUndead(),
			value = Pred1Zone5Value,
				loot = {
--					itemTypes = { Item.PotionBoost },
--					value = { min = 425, max = 500 }, -- эликсир
--					itemValue = { min = 425, max = 500 },
					items = {
						orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --рес/хил100
						{ id = 'g001ig0378', min = 1, max = 1}, --хил75
						{ id = 'g000ig0015', min = 1, max = 1 }, --атака30
						{ id = 'g001ig0125', min = 1, max = 1 }, -- резума
						orr(orr({ id = 'g001ig0128', min = 1, max = 1 }, { id = 'g001ig0560', min = 1, max = 1 }), orr({ id = 'g001ig0125', min = 1, max = 1 }, { id = 'g001ig0547', min = 1, max = 1 })), --вард оружие/провокатора, вард разум/Зелье пронзающего взгляда
					}
				}
}
end

function Pred1Zone52()
return { -- свиток300-400
			count = 1,
			subraceTypes = NoUndead(),
			value = Pred1Zone5Value,
				loot = {
					itemTypes = { Item.Scroll },
					value = { min = 300, max = 410 }, -- свиток 400
					itemValue = { min = 300, max = 400 }, 
					items = {
					orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --рес/хил100
						{ id = 'g001ig0378', min = 1, max = 1}, --хил75
						{ id = 'g000ig0012', min = 1, max = 1 }, --ини30
						{ id = 'g001ig0036', min = 1, max = 1 }, --смерти
					}
				}
}
end

function Pred1Zone53()
return { -- сфера400-800
			count = 1,
			subraceTypes = NoUndead(),
			value = Pred1Zone5Value,
				loot = {
					itemTypes = { Item.Orb },
					value = { min = 450, max = 710 }, -- сфера 450-700
					itemValue = { min = 450, max = 700 }, 
					items = {
					orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --рес/хил100
						{ id = 'g001ig0378', min = 1, max = 1}, --хил75
						{ id = 'g000ig7004', min = 1, max = 1 }, --золотое кольцо
						{ id = 'g001ig0128', min = 1, max = 1 }, --оружия
					}
				}
}
end
	
function Pred1Zone5D() 
return { --2100хп*1 -- пермо500*2
			count = 1,
			subraceTypes = NoUndead(),
			value = { min = 2100*kef, max = 2200*kef },
				loot = {
					itemTypes = { Item.PotionPermanent }, -- 2 пермо 500-700
					value = { min = 1000, max = 1210 },
					itemValue = { min = 500, max = 700 }, 
					items = {
						{ id = 'g000ig0001', min = 2, max = 2 }, --рес
						{ id = 'g000ig0006', min = 1, max = 2 }, --хил100
						{ id = 'g001ig0152', min = 1, max = 1 }, --хил300
						
					}
				}
}
end
	
-------------------------

-- Охрана объектов
function guard0() -- респ0
return {
	value = { min = 150*kef, max = 165*kef },
	loot = {
		itemTypes = { Item.Valuable },
		value = { min = 250, max = 250 },
		itemValue = { min = 250, max = 250 },
		items = {
			{ id = 'g001ig0180', min = 1, max = 2}, -- хил25
		},
	}
}
end

function guard1() -- зона1 --драги 250-375
return {
	value = { min = 200*kef, max = 220*kef },
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
	value = { min = 300*kef, max = 330*kef },
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
	value = { min = 350*kef, max = 385*kef },
	loot = {
		items = {
			{ id = 'g000ig0006', min = 1, max = 1}, -- хил100
			{ id = d15(), min = 1, max = 1 }, --случ. дотвард
		},
	}
}
end

function guard2m() -- зона2 башня
return {
	value = { min = 350*kef, max = 385*kef },
	loot = {
		items = {
			orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --рес/хил100
			{ id = w15(), min = 1, max = 1 }, --случ. вард стих.
		},
	}
}
end

function guard3() -- зона3 --драги 500-625
return { 
	value = { min = 400*kef, max = 440*kef },
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
	value = { min = 600*kef, max = 660*kef },
	loot = {
		items = {
				{ id = 'g000ig0001', min = 1, max = 1 }, --рес
				{ id = b15(), min = 1, max = 1 }, --случ. банка на 15
		},
	}
}
end

------------------

-- Главная охрана прохода между зонами - сильная
function zoneGuardZone()
return {
	subraceTypes = { Subrace.NeutralDragon, Subrace.Human, Subrace.Heretic, Subrace.Dwarf, Subrace.Elf }, -- Subrace.Undead, убрал
	value = { min = 1700*kef, max = 1800*kef },
	loot = {
		value = { min = 500, max = 710 },
		itemValue = { min = 500, max = 700 },
		itemTypes = { Item.PotionPermanent },
		items = {
			{ id = 'g000ig0001', min = 2, max = 3 },
			{ id = 'g000ig0006', min = 2, max = 3 },
			orr({ id = 'g000ig7005', min = 1, max = 1 }, { id = rms(), min = 1, max = 1 }), --рубин/случ. шар манны
			orr({ id = 'g001ig0125', min = 1, max = 1 }, { id = 'g001ig0036', min = 1, max = 1 }), --разума/смерти
			orr({ id = 'g000ig0018', min = 1, max = 1 }, { id = 'g001ig0128', min = 1, max = 1 }), --мазь/з.оружия
			{ id = p05(), min = 1, max = 1}, -- случ. пермо-эликсир на 5%
		}
	}
}
end

-- ГО прохода между зонами очень-сильная -- не используется
function zoneGuardZoneR()
return {
	subraceTypes = { Subrace.NeutralDragon, Subrace.Human, Subrace.Heretic, Subrace.Dwarf, Subrace.Elf }, -- Subrace.Undead, убрал
	value = { min = 2700*kef, max = 2800*kef },
	loot = {
		value = { min = 1450, max = 1800 },
		itemValue = { min = 1450, max = 1800 },
		itemTypes = { Item.Weapon, Item.Armor, Item.Jewel, Item.Banner },
		items = {
			{ id = 'g000ig0001', min = 2, max = 3 },
			{ id = 'g000ig0006', min = 2, max = 3 },
			{ id = 'g000ig0018', min = 1, max = 1 }, --мазь
			orr({ id = 'g001ig0090', min = 1, max = 1 }, { id = 'g001ig0282', min = 1, max = 1 }), --слиток/б.шар манны
			orr({ id = 'g000ig6015', min = 1, max = 1 }, { id = 'g000ig6014', min = 1, max = 1 }), --посох всевышнего/посох защиты
			orr(orr({ id = 'g001ig0172', min = 1, max = 1 },{ id = 'g001ig0181', min = 1, max = 1 }), orr({ id = 'g000ig9004', min = 1, max = 1 },{ id = 'g000ig9008', min = 1, max = 1 })), -- сфера з.здор / устраш  | испепеления / слабости 
			orr({ id = 'g000ig0008', min = 2, max = 3 }, { id = 'g000ig0002', min = 2, max = 3 }), --15меткость/защита
		}
	}
}
end

----------------------


-- СВОДНЫЕ ТАБЛИЦЫ

-- Вернет таблицу с описанием Респа 0
function getPlayerZone00(zoneId, playerRace, zoneSize)
	return {
		id = zoneId,
		type = Zone.PlayerStart,
		race = playerRace,
		size = zoneSize,
		mines = getMinesRespZ(playerRace),
		ruins = zoneRuinRespZ0(),
		bags = bagsResp00(),
		stacks = {zoneStacksRespZ00(), zoneStacksRespZ001(), zoneStacksRespZ002(), PredSkin(130, 140, 100, 100), PredSkin(140, 150, 100, 100)},
		merchants = zoneMerchRespZ0(),

		capital = {
			garrison = { -- столица
				subraceTypes = { getPlayerSubRace(playerRace) },
				value = { min = 50, max = 50 },
				loot = {
--					itemTypes = { Item.PotionBoost },
--					value = { min = 1500, max = 1500 },
--					itemValue = { min = 150, max = 250 },
					items = {
						{ id = 'g000ig0001', min = 4, max = 4}, --рес
						{ id = 'g000ig0006', min = 4, max = 4}, --хил100
						{ id = 'g001ig0378', min = 3, max = 3}, --хил75
						{ id = 'g000ig0005', min = 5, max = 5}, -- хил50
						{ id = 'g001ig0180', min = 6, max = 6}, -- хил25

						{ id = b15(), min = 1, max = 1}, -- случ. банка15
						{ id = b15(), min = 1, max = 1}, -- случ. банка15
						{ id = b15(), min = 1, max = 1}, -- случ. банка15
						{ id = b15(), min = 1, max = 1}, -- случ. банка15
						{ id = b15(), min = 1, max = 1}, -- случ. банка15

						{ id = w15(), min = 1, max = 1}, -- случ. вард
						{ id = w15(), min = 1, max = 1}, -- случ. вард
						{ id = w15(), min = 1, max = 1}, -- случ. вард
						
						{ id = d15(), min = 1, max = 1}, -- случ. дотвард
						{ id = d15(), min = 1, max = 1}, -- случ. дотвард
						
						
						orr(orr({ id = 'g001ig0301', min = 1, max = 1}, { id = 'g001ig0300', min = 1, max = 1}), orr({ id = 'g001ig0302', min = 1, max = 1}, { id = 'g001ig0299', min = 1, max = 1})), -- 25 сфера песч.бури / льда | искры / углей
						orr(orr({ id = 'g001ig0187', min = 1, max = 1}, { id = 'g001ig0190', min = 1, max = 1}), orr({ id = 'g001ig0188', min = 1, max = 1}, { id = 'g001ig0189', min = 1, max = 1})), -- 50 сфера огн.шара / смерча | потока / геоментии
						
						orr(orr({ id = 'g000ig5021', min = 1, max = 1}, { id = 'g000ig5003', min = 1, max = 1}), orr({ id = 'g001ig0250', min = 1, max = 1}, { id = 'g000ig5023', min = 1, max = 1})), -- свиток л.щит, сила, с.кости, с.витара
						orr(orr({ id = 'g001ig0248', min = 1, max = 1}, { id = 'g000ig5045', min = 1, max = 1}), orr({ id = 'g000ig5064', min = 1, max = 1}, { id = 'g000ig5101', min = 1, max = 1})), -- свиток устр. гимн, tormentio-броня, слабость, стая  
						
--						gmm({id = rms(), min = 1, max = 1},{}), -- случ.шар манны / -
					}
				}
			}
		}
	}
end

-- Вернет таблицу с описанием зоны 1
function getPlayerZone0(zoneId, playerRace, zoneSize)
	return {
		id = zoneId,
		type = Zone.Junction,
		race = playerRace,
		size = zoneSize,
		towns = zoneTownsResp0(),
		merchants = zoneMerchRespZ(),
		ruins = zoneRuinRespZ(),
		bags = bagsResp0(),
		mines = getMinesRespZ2(playerRace),
		stacks = {Pred1RespZ0(), Pred1RespZ01(), Pred1RespZ02(), Pred1RespZD(), PredSkin(180, 185, 100, 150), PredSkin(185, 189, 150, 200), PredBarb(165,169,150,200), PredBarb(210,219,150,225)},

	}
end

-- Респ: Вернет таблицу с описанием зоны 2
function getPlayerZone(zoneId, zoneSize)
	return {
		id = zoneId,
		type = Zone.Junction,
		size = zoneSize,
		towns = zoneTownsResp(),
		merchants = zoneMerchResp(),
		ruins = zoneRuinResp(),
		mercenaries = zoneMercenZone12(),
		mines = getMinesResp(),
		mages = zoneMageResp(),
		stacks = {zoneStacksResp(), zoneStacksResp1(), Pred1Resp01(), Pred1Resp1(), Pred1Resp2(), Pred1Resp3(), Pred1Resp4(), Pred1RespD(), PredBarb(480,484,300,350)},
		bags = bagsResp(),
	}
end

-- Вернет таблицу с описанием зоны 3
function getTreasureZone34(zoneId, playerRace, zoneSizeTre)
	return {
		id = zoneId,
		race = playerRace,
		type = Zone.Junction,
		size = zoneSizeTre,
		towns = zoneTownsZone34(),
		merchants = zoneMerchZone34(),
		ruins = zoneRuinZone34(),
		mines = getMinesZone34(playerRace),
		mercenaries = zoneMercenZone(),
		stacks = {zoneStacksZone34(), Pred1Zone1(), Pred1Zone2(), Pred1Zone3(), Pred1Zone4(), Pred1ZoneD(), PredBarb(770,774,350,400) },
		bags = bagsZone34(),
	}
end

-- Вернет таблицу с описанием зоны 4
function getTreasureZone5(zoneId, zoneSizeTre)
	return {
		id = zoneId,
		type = Zone.Treasure,  -- Junction -- Treasure
		size = zoneSizeTre,
		towns = zoneTownsZone5(),
		merchants = zoneMerchZone5(),
		ruins = zoneRuinZone5(),
		mines = getMinesZone5(),
		stacks = {zoneStacksZone5(), Pred1Zone51(), Pred1Zone52(), Pred1Zone53(), Pred1Zone5D(), PredBarb(1550,1600,600,800) },
		bags = bagsZone5(),
		--mages = zoneMageZone5(),
	}
end


----------------------

-- РАЗМЕРЫ ЗОН: Вернет таблицу с зонами
function getZones(races)
	local zones = {}

	zones[1] = getPlayerZone00(0, races[1], 8) -- красный 8
	zones[2] = getPlayerZone0(1, races[1], 10) -- зелёный 10
	zones[3] = getPlayerZone(2, 21) -- синий 18
	zones[4] = getTreasureZone34(3, races[1], 19) -- белый 21
	zones[5] = getTreasureZone5(4, 14) -- чёрный 14
	zones[6] = getTreasureZone34(5, races[2], 19) -- серый 21
	zones[7] = getPlayerZone(6, 21) -- жёлтый 18
	zones[8] = getPlayerZone0(7, races[2], 10) -- голубой 10
	zones[9] = getPlayerZone00(8, races[2], 8) -- пурпурный 8
	
	return zones
end

----------------------

-- ПРОХОДЫ: Вернет таблицу с проходами между зонами:
function getZoneConnections()
	return {
--{from = 0, to = 1}, {from = 0, to = 1}, {from = 0, to = 1}, {from = 0, to = 1}, {from = 0, to = 1}, 
--{from = 0, to = 1}, {from = 0, to = 1}, {from = 0, to = 1}, {from = 0, to = 1}, {from = 0, to = 1}, 
--{from = 0, to = 1}, {from = 0, to = 1}, {from = 0, to = 1}, {from = 0, to = 1}, {from = 0, to = 1}, 

{from = 1, to = 0}, {from = 1, to = 0}, {from = 1, to = 0}, {from = 1, to = 0}, {from = 1, to = 0}, 
{from = 1, to = 0}, {from = 1, to = 0}, {from = 1, to = 0}, {from = 1, to = 0}, {from = 1, to = 0}, 
{from = 1, to = 0}, {from = 1, to = 0}, {from = 1, to = 0}, {from = 1, to = 0}, {from = 1, to = 0}, 

{from = 1, to = 2}, {from = 1, to = 2}, {from = 1, to = 2}, {from = 1, to = 2}, {from = 1, to = 2}, 
{from = 1, to = 2}, {from = 1, to = 2}, {from = 1, to = 2}, {from = 1, to = 2}, {from = 1, to = 2}, 
{from = 1, to = 2}, {from = 1, to = 2}, {from = 1, to = 2}, {from = 1, to = 2}, {from = 1, to = 2}, 

{from = 2, to = 3}, {from = 2, to = 3}, {from = 2, to = 3}, {from = 2, to = 3}, {from = 2, to = 3}, 
{from = 2, to = 3}, {from = 2, to = 3}, {from = 2, to = 3}, {from = 2, to = 3}, {from = 2, to = 3}, 
{from = 2, to = 3}, {from = 2, to = 3}, {from = 2, to = 3}, {from = 2, to = 3}, {from = 2, to = 3}, 
{from = 2, to = 3}, {from = 2, to = 3}, {from = 2, to = 3}, {from = 2, to = 3}, {from = 2, to = 3}, 

{from = 2, to = 4, guard = zoneGuardZone()}, 
{from = 3, to = 4, guard = zoneGuardZone()}, 
{from = 4, to = 5, guard = zoneGuardZone()}, 
{from = 4, to = 6, guard = zoneGuardZone()}, 

{from = 5, to = 6}, {from = 5, to = 6}, {from = 5, to = 6}, {from = 5, to = 6}, {from = 5, to = 6}, 
{from = 5, to = 6}, {from = 5, to = 6}, {from = 5, to = 6}, {from = 5, to = 6}, {from = 5, to = 6}, 
{from = 5, to = 6}, {from = 5, to = 6}, {from = 5, to = 6}, {from = 5, to = 6}, {from = 5, to = 6}, 
{from = 5, to = 6}, {from = 5, to = 6}, {from = 5, to = 6}, {from = 5, to = 6}, {from = 5, to = 6}, 

{from = 6, to = 7}, {from = 6, to = 7}, {from = 6, to = 7}, {from = 6, to = 7}, {from = 6, to = 7}, 
{from = 6, to = 7}, {from = 6, to = 7}, {from = 6, to = 7}, {from = 6, to = 7}, {from = 6, to = 7}, 
{from = 6, to = 7}, {from = 6, to = 7}, {from = 6, to = 7}, {from = 6, to = 7}, {from = 6, to = 7}, 

{from = 7, to = 8}, {from = 7, to = 8}, {from = 7, to = 8}, {from = 7, to = 8}, {from = 7, to = 8}, 
{from = 7, to = 8}, {from = 7, to = 8}, {from = 7, to = 8}, {from = 7, to = 8}, {from = 7, to = 8}, 
{from = 7, to = 8}, {from = 7, to = 8}, {from = 7, to = 8}, {from = 7, to = 8}, {from = 7, to = 8}, 

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
	name = 'Outrunner_and_Outcross_2.3',
	description = 'Outrunner_and_Outcross for sMNS2 mod',
	minSize = 72,
	maxSize = 72,
	maxPlayers = 2,
	startingGold = gmm(550,1200),
	roads = gmm(45,41), --45,41
	forest = gmm(42,40), --42,40

	getContents = getTemplateContents
}