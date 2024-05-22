
-- чтобы включить применение настроек, нужно написать workshopEnabled = true
-- для выключения пишем workshopEnabled = false
workshopEnabled = true

-- ЛИСТАЙ ВНИЗ

----------------------------
-- тут ничего трогать не надо
----------------------------
require('workshop_enums')

if not workshopEnabled then
	return nil
end

require('workshop_player_settings_class')

function Workshop_CreatePlayer()
	local p = WorkshopPlayer:new(nil)
	p:init()
	return p
end

local player1 = Workshop_CreatePlayer()
local player2 = Workshop_CreatePlayer()
local player3 = Workshop_CreatePlayer()
local player4 = Workshop_CreatePlayer()
local player5 = Workshop_CreatePlayer()
local player6 = Workshop_CreatePlayer()
local player7 = Workshop_CreatePlayer()
local player8 = Workshop_CreatePlayer()
local player9 = Workshop_CreatePlayer()

local playersArray = nil
function Workshop_GetPlayer(race)
	if playersArray == nil then
		playersArray = {}
		local players = {player1, player2, player3, player4, player5, player6, player7, player8, player9}
		for i=1, #players do
			if players[i]:get_race() ~= nil then
				playersArray[players[i]:get_race()] = players[i]
			end
		end
	end
	return playersArray[race]
end
----------------------------
-- дальше можно что-то менять
----------------------------

-- ниже можно выставлять настройки для игроков
-- в workshop_example.txt приведен пример настроек для двух игроков

-- суть в том, что для каждой расы (игрока) настройки задаются отдельно
-- выше есть переменные player1, player2, player3, player4 и player5
-- выбираем любую (пусть будет player2) и объявляем, что эти настройки будут относиться к расе Нежити с помощью set_race(value), написав player2:set_race(Race.Undead)
-- как задать другие расы, смотри в info_player_settings.txt

-- далее можно выбрать нужный тип бонусов (или при каких условиях их можно получить)
-- и установить желаемое значение для бонуса, например:
-- player2:get_yourTerrainStatsBonus():set_baseNegotiate_Flat(15)
-- что это значит:
-- отряды игрока 2:получают на своей территории:бонус к сопротивлению действиям воров в размере 15
-- [не забываем двоеточия и скобки]

-- в info_player_settings.txt можно посмотреть, какие условия и типы бонусов доступны
-- там же более подробно описано, какие бонусы есть и как их задавать

-- в итоге, аккуратно копируя нужные команды из info_player_settings.txt, info_unit_stats_settings.txt и info_special_settings.txt,
-- можно объяснить игре, какие и у кого должны быть бонусы


-- {Race.Human, Race.Undead, Race.Heretic, Race.Dwarf, Race.Elf, Race.Neutral}

player1:set_race(Race.Human)
player2:set_race(Race.Undead)

player1:get_constantStatsBonus():set_Attack1CritDamage_Flat(15)
player1:get_constantStatsBonus():set_Attack2CritDamage_Flat(15)

player1:get_perLostHPStatsBonus():set_Attack1CritDamage_Flat(-0.25)
player1:get_perLostHPStatsBonus():set_Attack2CritDamage_Flat(-0.25)
player1:get_perLostHPStatsBonus():set_Attack1CritPower_Flat(-0.5)
player1:get_perLostHPStatsBonus():set_Attack1CritPower_Flat(-0.5)
player1:get_perLostHPStatsBonus():set_baseArmor_Flat(0.25)
player1:get_perLostHPStatsBonus():set_baseAttackInitiative_Percent(0.2)

player1:get_perLostHPStatsBonus():set_FastRetreat(0.0125)

player2:get_specialSettings():set_neutralsSelectTargetsRandomly(true)

