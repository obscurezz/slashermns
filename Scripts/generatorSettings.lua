--[[ Settings for Disciples 2 random scenario generator ]]--
settings = {
	iterations = 10000,
	maxTemplateCustomParameters = 5,
	enableParameterForest = false,
	enableParameterRoads = false,
	enableParameterGold = false,
	enableParameterMana = false,

	-- These units will be ignored by generator, they will never appear.
	forbiddenUnits = {

------------------------------------------------------------------------
-- ИСКЛЮЧЕНО ДЛЯ ВСЕХ ШАБЛОНОВ 

-- ничто
'g001uu7599', --ничто
'g000uu7626', --ничто
'g000uu7599', --ничто

--бафферы
'g000uu0033', --травница
'g000uu0034', --посвященная
'g000uu0035', --друид
'g000uu0160', --архидруид
'g000uu7558', --исса
'g000uu7559', --хэйса
'g000uu7605', --скульптор лжи
'g001uu7592', --торхот
'g000uu7592', --торхот(лидер)
'g003uu8037', --священное древо
'g000uu8287', --священное древо(лидер)
'g003uu8038', --энт целитель
'g000uu8288', --энт целитель(лидер)
'g003uu8039', --древо жизни
'g000uu8289', --древо жизни(лидер)

-- вторые формы призывателей
'g070uu9003', --Повелитель волков
'g070uu9002', --Демиург
'g070uu9001', --Магистр стихий
'g070uu9000', --Теневидец

-- Боссы с огромным кол-вом опыта (лидеры и солдаты)
'g000uu6002', -- Падший 9950
'g000uu6102', -- Падший
'g000uu6010', -- Гидра 2570
'g000uu6110', -- Гидра
'g000uu6011', -- Командор легиона 2790
'g000uu6111', -- Командор легиона
'g000uu7584', -- Небесный страж 1800
'g000uu8001', -- Небирос 9995
'g000uu8002', -- Множество 9995
'g000uu8003', -- Дева битвы 9995
'g000uu8006', -- Провидец эльфов 3465
'g000uu8007', -- Вестник Мортис призыватель 6750
'g000uu8008', -- Падший инквизитор 2175
'g000uu8050', -- Стражник Императора 3360
'g000uu8150', -- Стражник Императора
'g000uu8204', -- Повелитель теней л. призыватель 1600
'g000uu8203', -- Повелитель теней
'g000uu8206', -- Повелительница стихий л. призыватель 650
'g000uu8205', -- Повелительница стихий
'g000uu8303', -- Черная вдова л. призыватель 1085
'g001uu8303', -- Черная вдова
'g000uu8307', -- Мертворожденная 4740
'g001uu8307', -- Мертворожденная
'g001uu7584', -- Небесный страж 1800
'g000uu6014', -- Магистр-оккультист л. призыватель 1085
'g000uu6114', -- Магистр-оккультист 
'g000uu7585', -- Мастер культа л. 1600
'g001uu7585', -- Мастер культа
'g000uu8298', -- Избранник Богов л. 1200
'g001uu8298', -- Избранник Богов
'g000uu8245', -- Покровитель хилер 800

-- Все призыватели-лидеры
'g000uu6013', -- Оккультист л.
'g000uu8191', -- Магистр стихий л. призыватель
'g000uu8238', -- Демиург л. призыватель
'g000uu8242', -- Хозяин масок л. призыватель
'g000uu7598', -- Теневидец л.
'g000uu6007', -- Темный эльф-жрец л. призыватель

-- Водные лидеры
'g000uu5127', -- Кракен
'g000uu5129', -- Морской змей
'g000uu7522', -- Наяда
'g000uu8138', -- Никса
'g000uu5126', -- Русалка
'g000uu8230', -- Чудище
'g000uu7536', -- Элементаль воды

-------------------------------------------------------------------------
-- РЕКОМЕНДАЦИИ ПО ИСКЛЮЧЕНИЮ ЮНИТОВ В ПВП-ШАБЛОНАХ (СКОПИРОВАТЬ В ФАЙЛ ШАБЛОНА)

--[[

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
'g000uu8223', -- Верховный некромант л. бафер
'g000uu8219', -- Верховный некромант
'g000uu6107', -- Темный эльф-жрец
'g000uu7619', -- Слуга культа
'g000uu8044', -- Темный Эльф Гаст л.

]]

},

-------------------------------------------------------------------------
-- РЕКОМЕНДАЦИИ ПО ИСКЛЮЧЕНИЮ ПРЕДМЕТОВ В ПВП-ШАБЛОНАХ (СКОПИРОВАТЬ В ФАЙЛ ШАБЛОНА) 

forbiddenItems = { 

--[[

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

]]

},

	-- Landmark identifiers. Landmarks are used as blocking the path and decorations.
	landmarks = {
		-- Landmarks that look good on Empire terrain
		human = {
			-- Empire houses
			'g000mg0099',
			'g000mg0100',
			'g000mg0101',
			'g000mg0102',
			'g000mg8064',
			'g000mg8080',
			'g000mg8177',
			-- Statues, monuments
			'g000mg0042',
			'g000mg0043',
			'g000mg0044',
			-- Nude woman statue :)
			'g000mg8123',
			-- Neutral houses
			'g000mg0091',
			'g000mg0092',
			'g000mg0093',
			'g000mg0094',
			'g000mg0095',
			'g000mg0096',
			'g000mg0097',
			'g000mg0098',
			'g000mg8020',
			'g000mg8081',
			'g000mg8164',
			'g000mg8165',
			-- Tents, carts
			'g000mg0115',
			'g000mg0116',
			'g000mg0117',
			'g000mg0118',
			'g000mg0119',
			'g000mg8040',
			'g000mg8042',
			'g000mg8043',
			'g000mg8044',
			'g000mg8045',
			'g000mg8046',
			'g000mg8047',
			'g000mg8048',
			'g000mg8049',
			'g000mg8050',
			'g000mg8051',
			'g000mg8052',
			'g000mg8053',
			'g000mg8061',
			'g000mg8062',
			'g000mg8063',
			-- Well
			'g000mg0070',
			'g000mg0083',
			'g000mg0084',
			-- Extra
			'g000mg8229', -- дом
			

		},
		-- Landmarks that look good on Mountain Clans terrain
		dwarf = {
			-- Clan snowy houses
			'g000mg0033',
			'g000mg0034',
			'g000mg0035',
			'g000mg0104',
			'g000mg0105',
			'g000mg0106',
			'g000mg8103',
			'g000mg8104',
			'g000mg8105',
			-- Glaciers, ice
			'g000mg0036',
			'g000mg0037',
			'g000mg0038',
			'g000mg0039',
			'g000mg0040',
			-- Clans statues
			'g000mg0045',
			'g000mg0049',
			'g000mg0050',
			-- Well
			'g000mg0070',
			'g000mg0083',
			-- Extra
			'g000mg0002',
			'g000mg0103',
			'g000mg8172', --камень-снег
			'g000mg8173', --камень-снег
			'g000mg8174', --камень-снег
			'g000mg8175', --камень-снег
			'g000mg8176', --камень-снег
			'g000mg8194', --новый дом-снег
			'g000mg8195', --новый дом-снег
			'g000mg8198', --новый дом-снег
			'g000mg8199', --новый дом-снег
			'g000mg8194', --новый дом-снег
			'g000mg8194', --новый дом-снег
			'g000mg8223', --замёрз фонтан
			'g000mg8200', -- статуя волк
			'g000mg8201', -- статуя волк
			
		},
		-- Landmarks that look good on Undead Hordes terrain
		undead = {
			-- Undead houses
			'g000mg0111',
			'g000mg0112',
			'g000mg0113',
			'g000mg0114',
			'g000mg8026',
			'g000mg8027',
			'g000mg8059',
			'g000mg8072',
			'g000mg8073',
			'g000mg8074',
			'g000mg8077',
			'g000mg8106',
			-- Dragon corpse
			'g000mg8146',
			-- Acid pools
			'g000mg0065',
			-- Spider caves
			'g000mg0120',
			'g000mg0121',
			-- Extra
			'g000mg0077',
			'g000mg8147', -- статуя дракон-скелет
			'g000mg8150', -- темные эльфы
			'g000mg8151', -- темные эльфы
			'g000mg8152', -- темные эльфы
			'g000mg8153', -- темные эльфы
			'g000mg8220', -- темная башня
			
		},
		-- Landmarks that look good on Legions of the Damned terrain
		heretic = {
			-- Legions houses
			'g000mg0107',
			'g000mg0108',
			'g000mg0109',
			'g000mg0110',
			-- Spikes
			'g000mg8078',
			'g000mg8140',
			'g000mg8143',
			'g000mg8144',
			'g000mg8145',
			'g000mg0004',
			'g000mg0005',
			'g000mg8001',
			'g000mg8003',
			-- Lava craters
			'g000mg0022',
			'g000mg0023',
			'g000mg0024',
			'g000mg0052',
			'g000mg0053',
			'g000mg0054',
			-- Statues
			'g000mg8139',
			-- Extra
			'g000mg8210', -- новое здание
			'g000mg8211', -- новое здание
			'g003mg0002', -- сгоревший дом
			'g003mg0003', -- сгоревший дом
			'g003mg0004', -- сгоревший дом
			'g003mg0005', -- сгоревший дом
			'g003mg0021', -- камень высокий
			'g000mg8231', -- дом
			'g000mg8232', -- дом
			'g000mg8233', -- дом
			'g000mg8234', -- дом
			'g000mg8235', -- дом
			
		},
		-- Landmarks that look good on Elven Alliance terrain
		elf = {
			-- Elven Houses
			'g000mg0028',
			'g000mg0029',
			'g000mg0030',
			'g000mg0130',
			'g000mg0131',
			'g000mg0134',
			'g000mg0145',
			'g000mg0146',
			'g000mg0147',
			'g000mg0148',
			'g000mg8005',
			'g000mg8006',
			'g000mg8007',
			'g000mg8008',
			'g000mg8009',
			'g000mg8011',
			'g000mg8012',
			'g000mg8013',
			'g000mg8014',
			'g000mg8015',
			'g000mg8067',
			'g000mg8068',
			'g000mg8069',
			-- Extra
			'g000mg8217', -- корни
			'g000mg8218', -- корни
			'g000mg8226', -- дом
			
		},
		-- Landmarks that look good on neutral terrain
		neutral  = {
			-- Spider caves
			'g000mg0120',
			'g000mg0121',
			-- Ruins
			'g000mg0001',
			'g000mg8107',
			-- Forts
			'g000mg0003',
			'g000mg8093',
			-- Cemeteries
			'g000mg0025',
			'g000mg0026',
			'g000mg0027',
			'g000mg0031',
			'g000mg0032',
			'g000mg0132',
			'g000mg0133',
			'g000mg8148',
			'g000mg8149',
			-- Statues, monuments
			'g000mg0151',
			'g000mg8125',
			'g000mg8126',
			'g000mg8127',
			'g000mg8128',
			'g000mg8129',
			'g000mg8130',
			'g000mg8166',
			'g000mg0042',
			
			-- Skeletons, don't use too much, they become annoying and ugly really fast
			'g000mg0086',
			'g000mg0087', --
			'g000mg0088', --
			'g000mg0089', --
			'g000mg0090', --
			-- Neutral houses
			'g000mg0091',
			'g000mg0092',
			'g000mg0093',
			'g000mg0094',
			'g000mg0095',
			'g000mg0096',
			'g000mg0097',
			'g000mg0098',
			'g000mg8020',
			'g000mg8081',
			'g000mg8164',
			'g000mg8165',
			-- Tents, carts
			'g000mg0115',
			'g000mg0116',
			'g000mg0117',
			'g000mg0118',
			'g000mg0119',
			'g000mg8040',
			'g000mg8042',
			'g000mg8043',
			'g000mg8044',
			'g000mg8045',
			'g000mg8046',
			'g000mg8047',
			'g000mg8048',
			'g000mg8049',
			'g000mg8050',
			'g000mg8051',
			'g000mg8052',
			'g000mg8053',
			'g000mg8061',
			'g000mg8062',
			'g000mg8062',
			'g000mg8063',
			-- Towers
			--'g000mg0149', --!!! убрал башни
			--'g000mg0150', --!!! убрал башни
			'g000mg8019',
			'g000mg8021',
			'g000mg8022',
			'g000mg8023',
			'g000mg8065',
			'g000mg8066',
			'g000mg8070',
			'g000mg8071',
			'g000mg8133',
			-- Crappy goblin-made towers
			'g000mg8131',
			'g000mg8132',
			-- Bottomless pits, remove them if they are looking bad
			'g000mg0186',
			'g000mg0187',
			-- Well
			'g000mg0070',
			'g000mg0083',
			'g000mg0084',
			'g000mg8124',
			-- Extra
			'g000mg0122', -- скелет 3x3
			'g000mg0123', -- скелет 3x3
			'g000mg0124', -- скелет 3x3
			'g000mg0126',
			'g000mg8010',
			'g000mg0129',
			'g000mg0127', -- скелет лежит 1x1
			'g000mg0128', -- скелет лежит 1x1
			'g000mg8057', -- болото
			'g000mg8058', -- болото
			'g000mg8202', -- болото
			'g000mg8202', -- болото
			'g000mg8185', -- новый алтарь!
			'g000mg8217', -- алтарь1
			'g000mg8207', -- алтарь2
			'g000mg8216', -- алтарь3
			'g000mg8217', -- корни
			'g000mg8218', -- корни
			'g000mg8147', -- статуя дракон-скелет
			
		},
		-- Landmarks that are visually resemble mountains
		mountain = {
			'g000mg0138',
			'g000mg0139',
			'g000mg0140',
			'g000mg0141',
			'g000mg0142',
			'g000mg0143',
			'g000mg0144',
			-- Volcano
			'g000mg8004',
			-- Runic mountains, remove if too annoying
			'g000mg8101',
			'g000mg8102',

		},
	},
	
	-- Hints for scenario generator which ruin should be used for land and water.
	-- Names are from IsoStill.ff and IsoCmon.ff
	-- Do not include looted images here!
	ruins = {
		-- Land ruin images are mandatory, water is optional (for now)
		land = {
			'g000ru0000000',
			'g000ru0000001',
			'g000ru0000002',
			'g000ru0000003',
			'g000ru0000004',
			'g000ru0000005',
			'g000ru0000006',
			'g000ru0000007',
			--'g000ru0000008', -- Mountain Clans snowy mountain fortress, too specific
			'g000ru0000010',
			'g000ru0000011',
			'g000ru0000012',
			'g000ru0000013',
			'g000ru0000015',
			'g000ru0000016',
			'g000ru0000017',
			--'g000ru0000018', -- Snowy fort, too specific
			'g000ru0000020',
			'g000ru0000021',
			'g000ru0000022',
		},
		
		water = {
			'g000ru0000009',
			'g000ru0000014',
			'g000ru0000019',
		},
	},
	
	-- Since merchants, mages, trainers and mercenaries can be placed on water
	-- we need additional hints for them too
	-- Hints for land are mandatory, water is optional (for now)
	merchants = {
		land = {
			'g000si0000merh00',
			'g000si0000merh01',
			'g000si0000merh02',
			'g000si0000merh03',
			'g000si0000merh04',
			'g000si0000merh05',
			'g000si0000merh06',
			'g000si0000merh07',
		},
	},
	
	mages = {
		land = {
			'g000si0000mage00',
			'g000si0000mage01',
			'g000si0000mage02',
			'g000si0000mage03',
		},
	},
	
	trainers = {
		land = {
			'G000SI0000TRAI00',
			'G000SI0000TRAI01',
			'G000SI0000TRAI02',
			'G000SI0000TRAI03',
		},
	},

	resourceMarkets = {
        land = {
            'G000SI0000RMKT00',
        },
    },
	mercenaries = {
		land = {
			-- You can use upper case
			'G000SI0000MERC00',
			'G000SI0000MERC01',
			'G000SI0000MERC02',
			'G000SI0000MERC03',
			'G000SI0000MERC04',
		},
	},
}
