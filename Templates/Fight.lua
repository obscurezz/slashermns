-- НАСТРОЙКИ

-- Ценность стека отряда в столице (стандартное значение 1050)
local stack = 1050

-- Юниты стека (0 - без исключений; 1 - с исключениями)
local units = 1


-- КОД ШАБЛОНА

-- ФУНКЦИИ

-- Или / или
function orr(what, what2)
	local radn = math.random(0,1)
	if radn == 0 then
	return what
	elseif radn == 1 then
	return what2
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

-- банка на 15
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

-- пермо-эликсир на 5% за 400
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

-- реликвия 400
function jewel()
	local radn = math.random(0,9)
	if radn == 0 then
	return 'g001ig0493' -- Книга божественных даров +арты
	elseif radn == 1 then
	return 'g001ig0494' -- Книга странника +сапоги
	elseif radn == 2 then
	return 'g001ig0428' -- Кожаные эльфийские доспехи (Реликвия) +45оз
	elseif radn == 3 then
	return 'g000ig4006' -- Книга тайного знания +сферы
	elseif radn == 4 then
	return 'g000ig4006' -- Книга тайного знания +сферы +шанс
	elseif radn == 5 then
	return 'g001ig0610' -- Оковы долга (Реликвия)
	elseif radn == 6 then
	return 'g001ig0422' -- Кровавый покров (Реликвия)
	elseif radn == 7 then
	return 'g001ig0423' -- Латы Спасителя (Реликвия)
	elseif radn == 8 then
	return 'g001ig0099' -- Перчатки дуэлянта (Реликвия)
	elseif radn == 9 then
	return 'g000ig4007' -- Медицинский трактат
	end
end

-- сапоги 300
function boots()
	local radn = math.random(0,6)
	if radn == 0 then
	return 'g001ig0108' -- Гномьи сапоги
	elseif radn == 1 then
	return 'g001ig0110' -- Легкие сапоги
	elseif radn == 2 then
	return 'g001ig0105' -- Литейные сапоги
	elseif radn == 3 then
	return 'g001ig0107' -- Сапоги ветров
	elseif radn == 4 then
	return 'g001ig0109' -- Сапоги жизни
	elseif radn == 5 then
	return 'g001ig0106' -- Сапоги каменщика
	elseif radn == 6 then
	return 'g001ig0113' -- Укрепленные сапоги
	end
end

-- артефакт 300+
function artifact()
	local radn = math.random(0,9)
	if radn == 0 then
	return 'g000ig2001' -- Рунный камень (Артефакт)
	elseif radn == 1 then
	return 'g001ig0611' -- Цепи жертвенности (Артефакт)
	elseif radn == 2 then
	return 'g000ig3001' -- Гномьи наручи (Артефакт)
	elseif radn == 3 then
	return 'g001ig0100' -- Цеп Хана (Артефакт)
	elseif radn == 4 then
	return 'g000ig3017' -- Кинжал Вампиризма (Артефакт) 500
	elseif radn == 5 then
	return 'g001ig0182' -- Счастливая кость (Артефакт) 500
	elseif radn == 6 then
	return 'g001ig0418' -- Руна защиты Фрейра (Артефакт) 400
	elseif radn == 7 then
	return 'g001ig0582' -- Камень врат (Артефакт)
	elseif radn == 8 then
	return 'g001ig0594' -- Щит телохранителя (Артефакт)
	elseif radn == 9 then
	return 'g002ig0001' -- Потайной кинжал (Артефакт)
	end
end
-- сферы 200
function orb()
	local radn = math.random(0,11)
	if radn == 0 then
	return 'g001ig0133' -- Сфера Брони I
	elseif radn == 1 then
	return 'g001ig0446' -- Сфера Вампиризма I
	elseif radn == 2 then
	return 'g000ig9017' -- Сфера Восстановления
	elseif radn == 3 then
	return 'g001ig0471' -- Сфера Охотника
	elseif radn == 4 then
	return 'g001ig0157' -- Сфера очищения
	elseif radn == 5 then
	return 'g001ig0450' -- Сфера Урона I
	elseif radn == 6 then
	return 'g001ig0295' -- Сфера Замедления
	elseif radn == 7 then
	return 'g001ig0458' -- Сфера Каменного проклятия
	elseif radn == 8 then
	return 'g000ig9033' -- Сфера Чумы
	elseif radn == 9 then
	return 'g001ig0302' -- Сфера Шторма
	elseif radn == 10 then
	return 'g000ig9022' -- Сфера Углей
	elseif radn == 11 then
	return 'g001ig0192' -- Сфера Пыток
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

-- СВОДНЫЕ ТАБЛИЦЫ

-- Вернет таблицу с описанием Респа
function getPlayerZone0(zoneId, playerRace, zoneSize)
	return {
		id = zoneId,
		type = Zone.PlayerStart,
--		border = Border.Open,
		race = playerRace,
		size = zoneSize,
--		mines = {gold = 1},
--		capital = {
--		}
	}
end

-- Город

function zoneTown(race)
	return {
	{
		tier = 5,
		owner = race,
			garrison = { -- столица
				subraceTypes = { getPlayerSubRace(race) },
				value = { min = stack, max = stack }, 
				loot = {
					items = {
						{ id = 'g002ig0004', min = 1, max = 1 }, --Эликсир восхищения +2 лидерста (было g001ig0506 - настойка оратора +1 лидерство)
						{ id = 'g001ig0527', min = 1, max = 1 }, --Зелье постижения +релики
						{ id = 'g001ig0530', min = 1, max = 1 }, --зелье посмертного зова +талики
						{ id = p05(), min = 1, max = 1 }, -- пермо 5						
						{ id = jewel(), min = 1, max = 1 }, --реликвия 400 (8)
						{ id = artifact(), min = 1, max = 1 }, -- артефакт 300 (7)
						{ id = boots(), min = 1, max = 1 }, -- сапоги 300 (7)
						orr({ id = TalismanHome(race), min = 1, max = 1 }, orr({ id = 'g000ig9105', min = 1, max = 1 }, { id = 'g000ig9131', min = 1, max = 1 })), --талик

						{ id = orb(), min = 1, max = 1 }, -- сферы 200 (8)

						{ id = b15(), min = 1, max = 1 }, -- банка 15
						{ id = b15(), min = 1, max = 1 }, -- банка 15
						orr({ id = b15(), min = 1, max = 1 }, { id = 'g001ig0560', min = 1, max = 1 }), -- банка 15 / зелье провакатора

						{ id = 'g000ig0001', min = 1, max = 1 }, --рес
						{ id = 'g000ig0006', min = 1, max = 1 }, --хил100
						{ id = 'g001ig0180', min = 7, max = 7 }, --хил25

					}
				},
			},
	}
	}
end

-- сводная зоны 1
function getPlayerZone1(zoneId, zoneSize)
	return {
		id = zoneId,
		type = Zone.Treasure,
		size = zoneSize,
		
	}
end

-- сводная зон 3,4
function getPlayerZone34(zoneId, playerRace, zoneSize)
	return {
		id = zoneId,
		type = Zone.Treasure,
		size = zoneSize,
		race = playerRace,
		border = Border.Open,
		towns = zoneTown(playerRace),

	}
end
-------------------------------------------------


-- ЗОНЫ:
function getZones(races)
	local zones = {}
	zones[1] = getPlayerZone0(0, races[1], 1) -- 
	zones[2] = getPlayerZone0(1, races[2], 1) -- 
	zones[3] = getPlayerZone1(2, 12) -- 
	zones[4] = getPlayerZone34(3, races[1], 1) -- 
	zones[5] = getPlayerZone34(4, races[2], 1) -- 
	
	return zones
end

-- ПРОХОД
function getZoneConnections()
	return {
		{from = 3, to = 4},	
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
local nametemp = 'Fight! 1.4 [' .. stack ..'xp]'

function unitsorr()
	if units == 0 then
return {
--стандарт=
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
--+
'g001uu0025', --Голем
'g001uu0024', --Оживший доспех
'g001uu0103', --Кошмар
'g001uu0101', --Скелет
'g001uu0104', --Танатос
'g001uu0102', --Хуорн
'g001uu0105', --Адская гончая
'g001uu0106', --Белиарх
'g001uu0107', --Мститель
'g000uu0057', --Черт
'g001uu0050', --Валькирия
'g000uu0190', --Дух Фенрира
'g001uu0051', --Каменный предок
'g001uu0049', --Рух
'g002uu8039', --Вердант
'g002uu8037', --Энт
'g002uu8038', --Энт Большой
'g000uu8036', --Энт Малый
}
elseif units == 1 then
return {
--стандарт=
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
--+
'g001uu0025', --Голем
'g001uu0024', --Оживший доспех
'g001uu0103', --Кошмар
'g001uu0101', --Скелет
'g001uu0104', --Танатос
'g001uu0102', --Хуорн
'g001uu0105', --Адская гончая
'g001uu0106', --Белиарх
'g001uu0107', --Мститель
'g000uu0057', --Черт
'g001uu0050', --Валькирия
'g000uu0190', --Дух Фенрира
'g001uu0051', --Каменный предок
'g001uu0049', --Рух
'g002uu8039', --Вердант
'g002uu8037', --Энт
'g002uu8038', --Энт Большой
'g000uu8036', --Энт Малый

-- ДОПОЛНИТЕЛЬНЫЕ ИСКЛЮЧЕНИЯ
--империя
'g003uu5001', --Боец ополчения
'g000uu7628', --Имперский гвардеец
'g000uu0006', --Лучник
'g000uu0011', --Послушница
'g000uu0001', --Сквайр
'g000uu0018', --Титан
'g000uu0008', --Ученик
--т2
'g003uu5002', --Алебардист
'g000uu0009', --Волшебник
'g000uu7561', --Егерь
'g000uu0012', --Жрец
'g000uu0016', --Монахиня
'g000uu2014', --Оруженосец
'g000uu0004', --Охотник на ведьм
'g000uu2029', --Поборник
'g000uu0007', --Рейнджер
'g000uu0002', --Рыцарь
'g000uu8310', --Саггитар
--+
'g000uu7595', --Рефаим
--т3
'g000uu0017', --Аббатиса
'g000uu7569', --Иерей
'g000uu0013', --Священник
--т5
'g001uu8238', --Демиург

--нежить
'g000uu0080', --Адепт
'g000uu0093', --Виверна
'g001uu7539', --Колотун
'g000uu0086', --Мертвец
'g000uu0092', --Оборотень
'g000uu0078', --Привидение
'g001uu0102', --Хуорн
'g001uu7592', --Торхот
--т2
'g000uu0087', --Зомби
'g000uu0081', --Колдун
'g000uu0079', --Призрак
'g000uu0090', --Тамплиер
'g003uu5013', --Череполом
'g000uu7542', --Чумотворец
--+
'g000uu0094', --Дракон Рока
--т3
'g000uu2007', --Мумификатор
--т4
'g000uu2008', --Длань Мортис

--легионы
'g004uu6120', --Ведьмино отродье
'g000uu0055', --Горгулья
'g000uu0069', --Манкуб
'g000uu0052', --Одержимый
'g000uu0062', --Сектант
'g000uu0057', --Черт
'g000uu7605', --Скульптор лжи
--т2
'g000uu0053', --Берсеркер
'g000uu0067', --Ведьма
'g000uu0063', --Темный колдун
--+
'g000uu0058', --Демон
'g000uu7577', --Сатир
'g004uu6101', --Дьяволенок
'g000uu7572', --Апатитовая горгулья
'g000uu0056', --Мраморная горгулья
--т3
'g000uu0171', --Подражатель

--кланы
'g000uu0036', --Гном
'g000uu0043', --Йети
'g000uu0026', --Метатель топоров
'g004uu5039', --Снежный волк
'g000uu0033', --Травница
'g000uu0029', --Холмовой великан
'g000uu7627', --Советник Витара
--т2
'g000uu0027', --Арбалетчик
'g000uu0037', --Воин
'g000uu0034', --Посвященная
--+
'g000uu0030', --Горный великан
'g000uu7583', --Йамму
--т3
'g000uu0161', --Алхимик
'g000uu0035', --Друид
'g000uu7558', --Исса

--эльфы
'g000uu8029', --Грифон
'g000uu8031', --Дух
'g000uu8014', --Кентавр-копейщик
'g000uu8025', --Послушник леса
'g000uu8018', --Разведчик
'g003uu8037', --Священное древо
'g000uu7629', --Благородный эльф
--т2
'g000uu8015', --Кентавр-латник
'g000uu8016', --Кентавр-странник
'g000uu8032', --Оракул
'g000uu8019', --Охотник
'g000uu8022', --Сторож
'g000uu8026', --Чанелер
--+
'g000uu8030', --Владыка Небес
'g003uu8038', --Энт-целитель
--т3
'g000uu8033', --Лесная Дева
'g003uu8039', --Древо жизни

--т5
'g000uu8235', --Сильфида

}
	
	end
end


template = {
	name = nametemp,
	description = 'ПРАВИЛА:\n- финалка в первый день\n- игрок выходит из города\n- второй игрок нападает\n- без воров и жезловиков\nСпасибо за поддержку! Карта Тинькофф: 2200700846776804',
	minSize = 48,
	maxSize = 48,
	maxPlayers = 2,
	startingGold = 650,
	startingNativeMana = 0,
	roads = 100,
	forest = 60,

forbiddenUnits = unitsorr(),

forbiddenItems = {
},
	
	getContents = getTemplateContents
}