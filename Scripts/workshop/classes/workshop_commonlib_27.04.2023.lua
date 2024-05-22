
-- ����� �������� ���������� ��������, ����� �������� workshopEnabled = true
-- ��� ���������� ����� workshopEnabled = false
workshopEnabled = true

-- ������ ����

----------------------------
-- ��� ������ ������� �� ����
----------------------------
require('workshop_enums')

if not workshopEnabled then
	return nil
end

require('workshop_player_settings_class')

local player1 = WorkshopPlayer:new(nil)
local player2 = WorkshopPlayer:new(nil)
local player3 = WorkshopPlayer:new(nil)
local player4 = WorkshopPlayer:new(nil)
local player5 = WorkshopPlayer:new(nil)
local player6 = WorkshopPlayer:new(nil)
local player7 = WorkshopPlayer:new(nil)
local player8 = WorkshopPlayer:new(nil)
local player9 = WorkshopPlayer:new(nil)

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
-- ������ ����� ���-�� ������
----------------------------

-- ���� ����� ���������� ��������� ��� �������
-- � workshop_example.txt �������� ������ �������� ��� ���� �������

-- ���� � ���, ��� ��� ������ ���� (������) ��������� �������� ��������
-- ���� ���� ���������� player1, player2, player3, player4 � player5
-- �������� ����� (����� ����� player2) � ���������, ��� ��� ��������� ����� ���������� � ���� ������ � ������� set_race(value), ������� player2:set_race(Race.Undead)
-- ��� ������ ������ ����, ������ � info_player_settings.txt

-- ����� ����� ������� ������ ��� ������� (��� ��� ����� �������� �� ����� ��������)
-- � ���������� �������� �������� ��� ������, ��������:
-- player2:get_yourTerrainStatsBonus():set_baseNegotiate_Flat(15)
-- ��� ��� ������:
-- ������ ������ 2:�������� �� ����� ����������:����� � ������������� ��������� ����� � ������� 15
-- [�� �������� ��������� � ������]

-- � info_player_settings.txt ����� ����������, ����� ������� � ���� ������� ��������
-- ��� �� ����� �������� �������, ����� ������ ���� � ��� �� ��������

-- � �����, ��������� ������� ������ ������� �� info_player_settings.txt, info_unit_stats_settings.txt � info_special_settings.txt,
-- ����� ��������� ����, ����� � � ���� ������ ���� ������


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

