-- ������ "Outrunner_and_Outcross"

-- ����		|�����1		|�����2
-------------------------------------
-- C������ 	|�������	|���������	|
-- ���� �1	|������	|�������	|
-- ���� �2	|����� 		|�����		|
-- ���� �3 	|�����	 	|�����		|
-- ����� �4	|		 ������			|
-------------------------------------
-- ��: 		!������ ���� ��������: �����, �����, �����, �����.

---------------
-- ���������

-- ����� ����� (1 - ��� ���� ����� ������; 2 - ��� ������������ ����)
local gmode = 1

-- ����������� ��������� (0.6-0.8 �����; 0.8-1 ������; >1 ������)
local kef = 0.92


---------------
-- ��� �������

--����� ����� � ���� 2
function zoneMageResp()
	return {
		{
--			spellTypes = {Spell.Boost, Spell.Lower},
--			value = { min = 1200, max = 1210 },
--			spellLevel = { min = 2, max = 2 },
			spells = { 	yn('g000ss0007'), -- ���������
						yn('g000ss0002'), -- ��������
						yn('g000ss0024'), -- �����
						yn('g000ss0023'), -- ���� ������
						yn('g000ss0043'), -- ignis mare
						yn('g000ss0045'), -- tormentio
						yn('g000ss0062'), -- ���
						yn('g000ss0064'), -- ��������
						yn('g000ss0097'), -- ���������
						yn('g000ss0101'), -- ����
						
						yn('g000ss0183'), -- ����������
						yn('g000ss0197'), -- ��������������
						
						yn('g000ss0184'), -- �����.�����
						yn('g000ss0029'), -- ������ ���������

						yn('g000ss0185'), -- terebrare corde
						yn('g000ss0050'), -- Chronos

						yn('g000ss0069'), -- ��������� ��������
						yn('g000ss0186'), -- �������� �����

						yn('g000ss0187'), -- ����������
						yn('g000ss0104'), -- ��������

						yn('g000ss0153'), -- ��������� �������
						yn('g000ss0133'), -- ����� ����
						
						
			},			
			guard = gmm({}, guard2m())
		}
	}
end


--����� ����� � ���� 3
function zoneMageZone34()
	return {
		{
--			spellTypes = {Spell.Boost, Spell.Lower},
--			value = { min = 1200, max = 1210 },
--			spellLevel = { min = 2, max = 2 },
			spells = { 	yn('g000ss0012'), -- ������ ����� + 15 �����
						yn('g000ss0013'), -- ������ ���� +15 ���� � ����
						yn('g000ss0031'), -- ������ II: ���������
						yn('g000ss0026'), -- ���� ������ +15 ���
						yn('g000ss0089'), -- Preces -15 ���� � ����
						yn('g000ss0199'), -- Terra oblivionem -25����
						yn('g000ss0073'), -- ������������� ������ +20% ��
						yn('g000ss0074'), -- ����� ������
						yn('g000ss0111'), -- ���������� -15 ���� � ����
						yn('g000ss0108'), -- ������ III: ��� �������

						yn('g000ss0082'), -- ������������� ���������� +20%�� +5 ����� 1200
						yn('g000ss0039'), -- �������������
						yn('g000ss0091'), -- Tempus status -33 ��� 1200
						yn('g000ss0079'), -- ������ �� ������
						yn('g000ss0116'), -- ������������� ������� +50��
						
						yn('g000ss0206'), -- Dominatum ignis -���� �����
						yn('g000ss0209'), -- �������� ����� -���� ������
						yn('g000ss0207'), -- ����������� ����� -���� ����
						yn('g000ss0208'), -- ����� -���� �����

						yn('g000ss0144'), -- ����������
					
			},			
			guard = guard3m()
		}
	}
end


----------------------

-- ����� �1

local tierTowerResp0 = 1
local valueTowerResp0 = { min = 250*kef, max = 263*kef }

function zoneTownsResp0()
	return {
	{
		tier = tierTowerResp0,
		stack = {
			value = valueTowerResp0,
			loot = {
				itemTypes = { Item.Weapon, Item.Armor, Item.TravelItem },
				value = { min = 300, max = 300 },
				itemValue = { min = 300, max = 300 },
				items = {
					{ id = 'g000ig0001', min = 1, max = 1 }, --���
					{ id = 'g000ig0006', min = 1, max = 1 }, -- ���100
					orr({ id = 'g001ig0180', min = 2, max = 2 }, { id = 'g000ig0005', min = 1, max = 1 }), -- ���25*2/��� 50
					gmm({ id = 'g000ig7001', min = 1, max = 1 }, { id = 'g000ig7002', min = 1, max = 1 }), -- ������50/������100	
					orr({ id = 'g001ig0530', min = 1, max = 1 }, { id = rms(), min = 1, max = 1 }), -- ����� ����������� ���� (������) / ����.��� �����
					{ id = b15(), min = 1, max = 1 }, -- ����. �����15
				}
			}
		}
	}
	}
end

-- ����� �2
local tierTowerResp = 2
local valueTowerResp = { min = 380*kef, max = 400*kef }

function zoneTownsResp()
	return {
	{
		tier = tierTowerResp,
		stack = {
			value = valueTowerResp,
			loot = {
				itemTypes = { Item.Jewel, Item.Armor, Item.Weapon },
				value = { min = 500, max = 690 },
				itemValue = { min = 500, max = 690 },
				items = {
					{ id = 'g000ig0001', min = 1, max = 1 }, --���
					{ id = 'g000ig0006', min = 1, max = 1 }, -- ���100
					{ id = 'g001ig0378', min = 1, max = 2 }, -- ���75
					gmm({ id = 'g000ig7002', min = 1, max = 1 },{ id = 'g000ig7005', min = 1, max = 1 }), --������100/�������150
					orr({ id = 'g001ig0524', min = 1, max = 1 },{ id = rcry(), min = 1, max = 1 }), -- ����� ����������� (�����)|| ��.��������
					orr({ id = 'g000ig0024', min = 1, max = 1 },{ id = 'g000ig0023', min = 1, max = 1 }), -- ���� ����/�����
					yn({ id = 'g000ig0002', min = 1, max = 1 }), --15
					yn({ id = 'g000ig0014', min = 1, max = 1 }), --15
					yn({ id = 'g000ig0011', min = 1, max = 1 }), --15
					{ id = w15(), min = 1, max = 1}, -- ����. ����
				}
			}
		}
	}
	}
end


-- ����� �3
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
				itemTypes = { Item.Weapon, Item.Armor },
				value = { min = 700, max = 840 },
				itemValue = { min = 700, max = 840 },
				items = {
					{ id = 'g000ig0001', min = 1, max = 1 },
					{ id = 'g000ig0006', min = 2, max = 2 },
					orr({ id = rms(), min = 1, max = 1 }, { id = p05(), min = 1, max = 1}), -- ����.��� ����� / ����. �����-������� �� 5%
					gmm({ id = 'g000ig7003', min = 1, max = 1 }, { id = 'g000ig7004', min = 1, max = 1 }), --�������150/������� ������200
					orr(orr({ id = 'g001ig0461', min = 1, max = 1 },{ id = 'g000ig9020', min = 1, max = 1 }), orr({ id = 'g001ig0183', min = 1, max = 1 },{ id = 'g000ig9014', min = 1, max = 1 })), -- ����� �����-33����-2-�� / �������+25���-���� | ����� ������� / ����� �����
					orr({ id = 'g001ig0128', min = 1, max = 1 },{ id = 'g001ig0125', min = 1, max = 1 }), -- ���� ������/������
					yn({ id = 'g000ig0002', min = 1, max = 1 }), --15
					yn({ id = 'g000ig0014', min = 1, max = 1 }), --15
					yn({ id = 'g000ig0011', min = 1, max = 1 }), --15
					yn({ id = 'g000ig0008', min = 1, max = 1 }), --15
				}
			}
		}
	},
	}
end

-- ����� �4
function zoneTownsZone5()
	return {
	{
		tier = 1,
		stack = {
			subraceTypes = { Subrace.NeutralDragon, Subrace.Human, Subrace.Heretic, Subrace.Dwarf, Subrace.Elf }, -- Subrace.Undead, �����
			value = { min = 1705*kef, max = 1790*kef }, -- ���� 1550*10%
			loot = {
--				itemTypes = { Item.Banner },
--				value = { min = 700, max = 740 },
--				itemValue = { min = 700, max = 740 },
				items = {
					{ id = 'g000ig0001', min = 2, max = 2 },
					{ id = 'g000ig0006', min = 2, max = 2 }, -- ���100
					{ id = rms(), min = 1, max = 1 }, -- ����.��� �����
					gmm({ id = 'g000ig7004', min = 1, max = 1 },{ id = 'g000ig7005', min = 1, max = 1 }), -- ������� ������200/�����250
					orr(orr({ id = 'g000ig1004', min = 1, max = 1}, { id = 'g000ig1002', min = 1, max = 1}), orr({ id = 'g000ig1008', min = 1, max = 1}, { id = 'g000ig1006', min = 1, max = 1})), -- ����� �����, ����� ������������, ����� �������, ����� ��������		
					orr(orr({ id = 'g000ig9040', min = 1, max = 1 },{ id = 'g000ig9007', min = 1, max = 1 }), orr({ id = 'g001ig0462', min = 1, max = 1 },{ id = 'g001ig0176', min = 1, max = 1 })), -- ����� ����� / �������� | ��������� ����� / ����������
					orr({ id = 'g000ig0018', min = 1, max = 1 },{ id = 'g001ig0128', min = 1, max = 1 }), -- ���200/���� ������
					yn({ id = 'g000ig0012', min = 1, max = 1 }), --���30
					yn({ id = 'g000ig0015', min = 1, max = 1 }), --����30
					yn({ id = 'g000ig0003', min = 1, max = 1 }), --������30
				}
			}
		}
	}
	}
end

----------------------

-- ����� �� �����
function zoneMerchRespZ0() -- ������ �1
return {
	{
		goods = {
			itemTypes = { Item.Scroll },
			value = { min = 200, max = 200 },
			itemValue = { min = 200, max = 200 },
			items = {
				{ id = 'g000ig0001', min = 3, max = 4 },
				{ id = 'g000ig0006', min = 3, max = 4 },
				{ id = 'g001ig0378', min = 4, max = 5 }, --���75
				{ id = 'g000ig0005', min = 5, max = 7 },
				{ id = 'g001ig0180', min = 7, max = 10 },

				{ id = 'g000ig0002', min = 1, max = 2 }, --15
				{ id = 'g000ig0014', min = 1, max = 2 }, --15
				{ id = 'g000ig0011', min = 1, max = 2 }, --15
				{ id = 'g000ig0008', min = 1, max = 2 }, --15

				yn({ id = 'g000ig0021', min = 1, max = 2 }), -- ����
				yn({ id = 'g000ig0022', min = 1, max = 2 }), -- ����
				yn({ id = 'g000ig0023', min = 1, max = 2 }), -- ����
				yn({ id = 'g000ig0024', min = 1, max = 2 }), -- ����
				
--				yn({ id = 'g001ig0125', min = 1, max = 1 }), -- ���� ������
--				yn({ id = 'g001ig0036', min = 1, max = 1 }), -- ���� ������
				
--				yn({ id = d15(), min = 1, max = 2}), -- ����. �������
--				yn({ id = d15(), min = 1, max = 2}), -- ����. �������
--				yn({ id = d15(), min = 1, max = 2}), -- ����. �������
--				yn({ id = d15(), min = 1, max = 2}), -- ����. �������

				orr({ id = 'g001ig0534', min = 1, max = 1 }, { id = 'g001ig0519', min = 1, max = 1 }), -- ������� ������� ����������� (-75 �������) / ����� ��������� (-10 ����)
				orr({ id = 'g001ig0533', min = 1, max = 1 }, { id = 'g001ig0532', min = 1, max = 1 }), -- ����� ������ ����� (+2 ������) / ����� ��������� (+1 �����)

				--������
				orr({ id = 'g001ig0105', min = 1, max = 1 }, { id = 'g001ig0107', min = 1, max = 1 }), -- �������� ������ (�����) / ������ ������ (������)
				orr({ id = 'g001ig0108', min = 1, max = 1 }, { id = 'g001ig0106', min = 1, max = 1 }), -- ������ ������ (����) / ������ ��������� (�����)

				yn({ id = 'g000ig3001', min = 1, max = 1 }), -- ������
				yn({ id = 'g000ig2001', min = 1, max = 1 }), -- �.������
				yn({ id = 'g001ig0418', min = 1, max = 1 }), -- ���� ������ ������ (��������)
				yn({ id = 'g001ig0611', min = 1, max = 1 }), -- ���� ������������ (��������)300		
				yn({ id = 'g001ig0100', min = 1, max = 1 }), -- ��� ���� (��������) 300		
				
				yn({ id = 'g000ig3008', min = 1, max = 1 }), -- ���� ����.
				yn({ id = 'g001ig0428', min = 1, max = 1 }), -- ������� ���������� ������� (��������)
				yn({ id = 'g001ig0101', min = 1, max = 1 }), -- ����� ���� (��������)
				yn({ id = 'g000ig4008', min = 1, max = 1 }), -- ������� �����
				
				--�����
				orr(orr({ id = 'g001ig0383', min = 1, max = 1 }, { id = 'g001ig0387', min = 1, max = 1 }), orr({ id = 'g000ig6001', min = 1, max = 1 }, { id = 'g001ig0392', min = 1, max = 1 })), -- ����� ������ ������� (����� ���) / ����� ��������� (�������� �� ����) / ����� ����� (15 �����) /  ����� ������ ������ (30 ����)
				
				orr(orr({ id = 'g001ig0301', min = 1, max = 1}, { id = 'g001ig0300', min = 1, max = 1}), orr({ id = 'g001ig0302', min = 1, max = 1}, { id = 'g001ig0299', min = 1, max = 1})), -- 25 ����� ����.���� / ���� | ����� / �����
				orr(orr({ id = 'g001ig0187', min = 1, max = 1}, { id = 'g001ig0190', min = 1, max = 1}), orr({ id = 'g001ig0188', min = 1, max = 1}, { id = 'g001ig0189', min = 1, max = 1})), -- 50 ����� ���.���� / ������ | ������ / ���������
				yn({ id = 'g000ig9024', min = 1, max = 1 }), -- ����� ����������
				yn({ id = 'g000ig9017', min = 1, max = 1 }), -- ����� �����.
				yn({ id = 'g000ig9034', min = 1, max = 1 }), -- ����� �����
				yn({ id = 'g000ig9013', min = 1, max = 1 }), -- ����� ��������
				yn({ id = 'g000ig9033', min = 1, max = 1 }), -- ����� ��� 100
				yn({ id = 'g001ig0478', min = 1, max = 1 }), -- ����� ������
				yn({ id = 'g001ig0453', min = 1, max = 1 }), -- ����� ������ �����
				yn({ id = 'g001ig0467', min = 1, max = 1 }), -- ����� ���� ������

				--�����
				orr(orr({ id = 'g001ig0260', min = 1, max = 1}, { id = 'g001ig0269', min = 1, max = 1}), orr({ id = 'g001ig0261', min = 1, max = 1}, { id = 'g001ig0268', min = 1, max = 1})), -- ��������, ������, �������, �����
				
				--������
				orr(orr({ id = 'g000ig5021', min = 1, max = 1}, { id = 'g000ig5003', min = 1, max = 1}), orr({ id = 'g001ig0250', min = 1, max = 1}, { id = 'g000ig5023', min = 1, max = 1})), -- ������ �.���, ����, �.�����, �.������
				orr(orr({ id = 'g001ig0248', min = 1, max = 1}, { id = 'g000ig5045', min = 1, max = 1}), orr({ id = 'g000ig5064', min = 1, max = 1}, { id = 'g000ig5101', min = 1, max = 1})), -- ������ ����. ����, tormentio-�����, ��������, ���� 
				
				
			}
		},
			guard = gmm({}, guard0()),
	}
}
end

-- ����� �1
function zoneMerchRespZ() -- ������ �1+�1
return {
	{
		goods = {
			itemTypes = { Item.Scroll },
			value = { min = 400, max = 400 },
			itemValue = { min = 200, max = 200 },
			items = {
				{ id = 'g000ig0001', min = 3, max = 4 },
				{ id = 'g000ig0006', min = 3, max = 4 },
				{ id = 'g001ig0378', min = 4, max = 5}, --���75
				{ id = 'g000ig0005', min = 5, max = 7 },
				{ id = 'g001ig0180', min = 7, max = 10 },

				yn({ id = 'g000ig0002', min = 1, max = 1 }), --15
				yn({ id = 'g000ig0014', min = 1, max = 1 }), --15
				yn({ id = 'g000ig0011', min = 1, max = 1 }), --15
				yn({ id = 'g000ig0008', min = 1, max = 1 }), --15

				yn({ id = 'g000ig0021', min = 1, max = 2 }), -- ����
				yn({ id = 'g000ig0022', min = 1, max = 2 }), -- ����
				yn({ id = 'g000ig0023', min = 1, max = 2 }), -- ����
				yn({ id = 'g000ig0024', min = 1, max = 2 }), -- ����

				yn({ id = 'g001ig0125', min = 1, max = 1 }), -- ���� ������
				yn({ id = 'g001ig0036', min = 1, max = 1 }), -- ���� ������
				
				yn({ id = d15(), min = 1, max = 1}), -- ����. �������
				yn({ id = d15(), min = 1, max = 1}), -- ����. �������
				yn({ id = d15(), min = 1, max = 1}), -- ����. �������
				yn({ id = d15(), min = 1, max = 1}), -- ����. �������
			
				orr({ id = 'g001ig0027', min = 1, max = 1 }, { id = 'g001ig0563', min = 1, max = 1 }), -- ���� ����� / ���� ��������������
				orr({ id = 'g001ig0548', min = 1, max = 1 }, { id = 'g001ig0561', min = 1, max = 1 }), -- ����� ����� (���� 10) / ������� �����������������
				orr({ id = 'g001ig0528', min = 1, max = 1 }, { id = 'g001ig0530', min = 1, max = 1 }), -- ������� ���� (������) / ����� ����������� ���� (���������)

				yn({ id = 'g000ig2002', min = 1, max = 1 }), -- ��.����
				yn({ id = 'g000ig3002', min = 1, max = 1 }), -- �.����
				yn({ id = 'g001ig0182', min = 1, max = 1 }), -- ������. �����
				yn({ id = 'g000ig3017', min = 1, max = 1 }), -- ����. ����.
				
				yn({ id = 'g001ig0421', min = 1, max = 1 }), -- ������ ����� (��������)
				yn({ id = 'g001ig0610', min = 1, max = 1 }), -- ����� ����� (��������)
				yn({ id = 'g001ig0099', min = 1, max = 1 }), -- ��������
				yn({ id = 'g000ig4001', min = 1, max = 1 }), -- ����� ����
				yn({ id = 'g000ig4002', min = 1, max = 1 }), -- ����� ����
				yn({ id = 'g000ig4003', min = 1, max = 1 }), -- ����� �����				
				yn({ id = 'g000ig4004', min = 1, max = 1 }), -- ����� ����				
				--������
				orr({ id = 'g001ig0113', min = 1, max = 1 }, { id = 'g001ig0110', min = 1, max = 1 }), -- ������ ������ / �����	

				--�����
				orr(orr({ id = 'g001ig0394', min = 1, max = 1 }, { id = 'g000ig6012', min = 1, max = 1 }), orr({ id = 'g001ig0395', min = 1, max = 1 }, { id = 'g001ig0399', min = 1, max = 1 })), -- ����� �������� �������+10����� / ����� ��������+10��� / ����� ���������� ������+10����� / ����� �������-10���
				
				yn({ id = 'g001ig0471', min = 1, max = 1 }), -- ����� ������ ��������
				yn({ id = 'g001ig0470', min = 1, max = 1 }), -- ����� ����� ����
				yn({ id = 'g000ig9016', min = 1, max = 1 }), -- �.��������� 200
				yn({ id = 'g001ig0458', min = 1, max = 1 }), -- ����� ���������
				yn({ id = 'g001ig0456', min = 1, max = 1 }), -- ����� ������� ���
				yn({ id = 'g001ig0466', min = 1, max = 1 }), -- ����� ������� �������
				yn({ id = 'g001ig0489', min = 1, max = 1 }), -- ����� ���������
				yn({ id = 'g001ig0469', min = 1, max = 1 }), -- ����� �������� �����

				yn({ id = 'g000ig1001', min = 1, max = 1 }), -- ����� ������400
				yn({ id = 'g001ig0051', min = 1, max = 1 }), -- ����� ������400
				yn({ id = 'g000ig1007', min = 1, max = 1 }), -- ����� ����400
				yn({ id = 'g000ig1005', min = 1, max = 1 }), -- ����� ��������400

				--�����
				orr(orr({ id = 'g001ig0274', min = 1, max = 1}, { id = 'g001ig0270', min = 1, max = 1}), orr({ id = 'g001ig0063', min = 1, max = 1}, { id = 'g001ig0263', min = 1, max = 1})), -- ������, ������, ���������, �����

				--������
				orr({ id = 'g000ig5007', min = 1, max = 1 }, { id = 'g000ig5029', min = 1, max = 1 }), -- ��. ��������� / ���. ���������
				
			}
		},
			guard = gmm({}, guard1()),
	}
}
end

-- ����� �2
function zoneMerchResp() -- ������ �1+�2
return {
	{
		goods = {
			itemTypes = { Item.Scroll },
			value = { min = 600, max = 600 },
			itemValue = { min = 200, max = 400 },
			items = {
				{ id = 'g000ig0001', min = 5, max = 6 },
				{ id = 'g000ig0006', min = 5, max = 6 },
				{ id = 'g001ig0378', min = 6, max = 7}, --���75
				{ id = 'g000ig0005', min = 7, max = 10 },
				{ id = 'g001ig0180', min = 7, max = 10 },
				
				yn({ id = 'g000ig0002', min = 1, max = 2 }), --15
				yn({ id = 'g000ig0014', min = 1, max = 2 }), --15
				yn({ id = 'g000ig0011', min = 1, max = 2 }), --15
				{ id = 'g000ig0008', min = 1, max = 1 }, --��������15

				{ id = 'g000ig0021', min = 1, max = 2 }, -- ����
				{ id = 'g000ig0022', min = 1, max = 2 }, -- ����
				{ id = 'g000ig0023', min = 1, max = 2 }, -- ����
				{ id = 'g000ig0024', min = 1, max = 2 }, -- ����
				
				yn({ id = 'g001ig0125', min = 1, max = 1 }), -- ���� ������
				{ id = 'g001ig0036', min = 1, max = 1 }, -- ���� ������

				yn({ id = d15(), min = 1, max = 1}), -- ����. �������
				yn({ id = d15(), min = 1, max = 1}), -- ����. �������
				yn({ id = d15(), min = 1, max = 1}), -- ����. �������
				yn({ id = d15(), min = 1, max = 1}), -- ����. �������
				
				orr({ id = 'g000ig0004', min = 1, max = 1 }, { id = 'g001ig0028', min = 1, max = 1 }), -- ������� ��������� / ���� ������
				orr({ id = 'g001ig0328', min = 1, max = 1 }, { id = 'g001ig0330', min = 1, max = 1 }), -- ������� ������� ����� (�����) / ������� ���������� (�������)
				orr({ id = 'g001ig0531', min = 1, max = 1 }, { id = 'g001ig0525', min = 1, max = 1 }), -- ����� ����� (������) / ������� �������� (���������)
				
				yn({ id = 'g001ig0047', min = 1, max = 1 }), -- ���.����800
				yn({ id = 'g001ig0197', min = 1, max = 1 }), -- �����.�����950
				yn({ id = 'g001ig0487', min = 1, max = 1 }), -- ������ ������ ������� (��������)650
				yn({ id = 'g001ig0558', min = 1, max = 1 }), -- ��� ��������� (��������) 700
				yn({ id = 'g001ig0417', min = 1, max = 1 }), -- ���� �������� ������������ (��������)
				yn({ id = 'g001ig0045', min = 1, max = 1 }), -- ����.����800
				yn({ id = 'g000ig3003', min = 1, max = 1 }), -- ���.����800
				yn({ id = 'g001ig0594', min = 1, max = 1 }), -- ��� ������������� (��������)
				
				yn({ id = 'g001ig0104', min = 1, max = 1 }), -- ��� �������
				yn({ id = 'g000ig3022', min = 1, max = 1 }), -- �.�����650
				orr({ id = 'g000ig4006', min = 1, max = 1 }, { id = 'g001ig0497', min = 1, max = 1 }), -- ����� �.�. / ����� ����������
				yn({ id = 'g001ig0420', min = 1, max = 1 }), -- ������ ���� (��������)800
				yn({ id = 'g001ig0424', min = 1, max = 1 }), -- ����� ������ (��������)
				yn({ id = 'g001ig0422', min = 1, max = 1 }), -- �������� ������ (��������)
				
				orr({ id = 'g001ig0114', min = 1, max = 1 }, { id = 'g000ig8003', min = 1, max = 1 }), -- ������ ��� 500 / ������ �������� 700

				--�����
				orr(orr({ id = 'g001ig0404', min = 1, max = 1 }, { id = 'g001ig0401', min = 1, max = 1 }), orr({ id = 'g001ig0398', min = 1, max = 1 }, { id = 'g000ig6011', min = 1, max = 1 })), -- ����� ��������-15����� / ����� ��������� �����-15����� / ����� �������+15��� / ����� ���������� ��������50�����
				
				yn({ id = 'g000ig9019', min = 1, max = 1 }), -- �.����� 225-300
				yn({ id = 'g000ig9016', min = 1, max = 1 }), -- �.���������
				yn({ id = 'g001ig0297', min = 1, max = 1 }), -- �.�����
				yn({ id = 'g000ig9036', min = 1, max = 1 }), -- �.��������
				yn({ id = 'g001ig0294', min = 1, max = 1 }), -- ����� �������
				yn({ id = 'g001ig0183', min = 1, max = 1 }), -- ����� �������
				yn({ id = 'g001ig0475', min = 1, max = 1 }), -- ����� ��������� ������
				yn({ id = 'g001ig0468', min = 1, max = 1 }), -- ����� �������
				yn({ id = 'g001ig0480', min = 1, max = 1 }), -- ����� ��������� �����
				
				yn({ id = 'g001ig0289', min = 1, max = 1 }), -- ����� ���.���700
				yn({ id = 'g000ig1006', min = 1, max = 1 }), -- ����� ��������700
				yn({ id = 'g001ig0145', min = 1, max = 1 }), -- ����� �����700
				yn({ id = 'g000ig1008', min = 1, max = 1 }), -- ����� �����700
				yn({ id = 'g001ig0370', min = 1, max = 1 }), -- ����� ������������ �����600
				yn({ id = 'g001ig0357', min = 1, max = 1 }), -- ����� �����������

				--�����
				orr({ id = 'g000ig9138', min = 1, max = 1 }, { id = 'g000ig9108', min = 1, max = 1 }), -- �������� ������� ������ / �������� �������-������

				--������
				yn({ id = 'g000ig5029', min = 1, max = 1 }), -- ��. ���. ���������
				yn({ id = 'g000ig5007', min = 1, max = 1 }), -- ��. ���������
				orr(orr({ id = 'g000ig5021', min = 1, max = 1}, { id = 'g000ig5003', min = 1, max = 1}), orr({ id = 'g001ig0250', min = 1, max = 1}, { id = 'g000ig5023', min = 1, max = 1})), -- ������ �.���, ����, �.�����, �.������
				
			}
		},
		guard = gmm({}, guard2()),
	},
	
		{
		goods = {
			itemTypes = { Item.Scroll },
			value = { min = 600, max = 600 },
			itemValue = { min = 200, max = 400 },
			items = {
				{ id = 'g000ig0001', min = 5, max = 6 },
				{ id = 'g000ig0006', min = 5, max = 6 },
				{ id = 'g001ig0378', min = 6, max = 7}, --���75
				{ id = 'g000ig0005', min = 7, max = 10 },
				{ id = 'g001ig0180', min = 7, max = 10 },
				
				yn({ id = 'g000ig0002', min = 1, max = 2 }), --15
				yn({ id = 'g000ig0014', min = 1, max = 2 }), --15
				{ id = 'g000ig0011', min = 1, max = 2 }, --���15
				yn({ id = 'g000ig0008', min = 1, max = 1 }), --15

				{ id = 'g000ig0021', min = 1, max = 2 }, -- ����
				{ id = 'g000ig0022', min = 1, max = 2 }, -- ����
				{ id = 'g000ig0023', min = 1, max = 2 }, -- ����
				{ id = 'g000ig0024', min = 1, max = 2 }, -- ����

				{ id = 'g001ig0125', min = 1, max = 1 }, -- ���� ������
				yn({ id = 'g001ig0036', min = 1, max = 1 }), -- ���� ������

				yn({ id = d15(), min = 1, max = 1}), -- ����. �������
				yn({ id = d15(), min = 1, max = 1}), -- ����. �������
				yn({ id = d15(), min = 1, max = 1}), -- ����. �������
				yn({ id = d15(), min = 1, max = 1}), -- ����. �������
				
				orr({ id = 'g000ig0016', min = 1, max = 1 }, { id = 'g001ig0564', min = 1, max = 1 }), -- ������� ���� / ���� ��������
				orr({ id = 'g001ig0344', min = 1, max = 1 }, { id = 'g001ig0346', min = 1, max = 1 }), -- ������� �������������� (����������) / ������� ������������� (����������)
				orr({ id = 'g001ig0526', min = 1, max = 1 }, { id = 'g001ig0527', min = 1, max = 1 }), -- ����� ���������� (������) / ����� ���������� (��������)

				yn({ id = 'g001ig0040', min = 1, max = 1 }), -- ���.����1000
				yn({ id = 'g001ig0042', min = 1, max = 1 }), -- ����� ������
				yn({ id = 'g001ig0196', min = 1, max = 1 }), -- ���.���800
				yn({ id = 'g001ig0582', min = 1, max = 1 }), -- ������ ���� (��������)800
				yn({ id = 'g001ig0559', min = 1, max = 1 }), -- ���� ������������ ��� (��������) 700
				yn({ id = 'g001ig0557', min = 1, max = 1 }), -- ��� �������������� (��������) 700
				yn({ id = 'g001ig0416', min = 1, max = 1 }), -- ���� ����������� ������ (��������) 800
				yn({ id = 'g001ig0589', min = 1, max = 1 }), -- ��� ��������� (��������)

				yn({ id = 'g000ig2006', min = 1, max = 1 }), -- ����� �������
				yn({ id = 'g000ig3020', min = 1, max = 1 }), -- ����� ��������
				orr({ id = 'g000ig4006', min = 1, max = 1 }, { id = 'g001ig0497', min = 1, max = 1 }), -- ����� �.�. / ����� ����������
				yn({ id = 'g000ig3022', min = 1, max = 1 }), -- �.�����650
				yn({ id = 'g001ig0423', min = 1, max = 1 }), -- ���� ��������� (��������)
				yn({ id = 'g001ig0430', min = 1, max = 1 }), -- ���� ������ (��������)

				orr({ id = 'g001ig0111', min = 1, max = 1 }, { id = 'g000ig1010', min = 1, max = 1 }), -- ������ ��� 500 / ���������� ������ 700

				--�����
				orr(orr({ id = 'g001ig0122', min = 1, max = 1 }, { id = 'g001ig0391', min = 1, max = 1 }), orr({ id = 'g000ig6003', min = 1, max = 1 }, { id = 'g001ig0120', min = 1, max = 1 })), -- ����� ����� ������30����� / ����� �������+30�� / ����� ��������+30�� / ����� ����������� �����30�����
				
				yn({ id = 'g000ig9016', min = 1, max = 1 }), -- �.���������
				yn({ id = 'g000ig9019', min = 1, max = 1 }), -- �.�����
				yn({ id = 'g001ig0295', min = 1, max = 1 }), -- �.�����
				yn({ id = 'g001ig0157', min = 1, max = 1 }), -- �.����
				yn({ id = 'g001ig0476', min = 1, max = 1 }), -- ����� �������
				yn({ id = 'g001ig0454', min = 1, max = 1 }), -- ����� �����������
				yn({ id = 'g001ig0464', min = 1, max = 1 }), -- ����� ���������
				yn({ id = 'g001ig0457', min = 1, max = 1 }), -- ����� �����
				yn({ id = 'g001ig0446', min = 1, max = 1 }), -- ����� ����������� ������

				yn({ id = 'g001ig0293', min = 1, max = 1 }), -- ����� ���.����700
				yn({ id = 'g001ig0292', min = 1, max = 1 }), -- ����� ����.����700
				yn({ id = 'g001ig0141', min = 1, max = 1 }), -- ����� �����700
				yn({ id = 'g000ig1003', min = 1, max = 1 }), -- ����� ��������
				yn({ id = 'g001ig0361', min = 1, max = 1 }), -- ����� �����700
				yn({ id = 'g001ig0358', min = 1, max = 1 }), -- ����� ����

				--�����
				orr({ id = 'g000ig9102', min = 1, max = 1 }, { id = 'g000ig9105', min = 1, max = 1 } ), -- �������� ������ / �������� ������������

				--������
				yn({ id = 'g000ig5029', min = 1, max = 1 }), -- ���. ���������
				yn({ id = 'g000ig5007', min = 1, max = 1 }), -- ��. ���������
				orr(orr({ id = 'g001ig0248', min = 1, max = 1}, { id = 'g000ig5045', min = 1, max = 1}), orr({ id = 'g000ig5064', min = 1, max = 1}, { id = 'g000ig5101', min = 1, max = 1})), -- ������ ����. ����, tormentio-�����, ��������, ����  
				
			}
		},
		guard = gmm({}, guard2()),
	},

}
end

-- ����� �3
function zoneMerchZone34() -- ������ �3
return {
	{
		goods = {
			itemTypes = { Item.Scroll },
			value = { min = 550, max = 550 },
			itemValue = { min = 550, max = 550 },
			items = {
				{ id = 'g000ig0001', min = 5, max = 6 },
				{ id = 'g000ig0006', min = 5, max = 6 },
				{ id = 'g001ig0378', min = 6, max = 7}, --���75
				{ id = 'g000ig0005', min = 7, max = 10 },
				{ id = 'g000ig0018', min = 1, max = 2 },

				yn({ id = 'g000ig0012', min = 1, max = 2 }), --���30
				yn({ id = 'g000ig0015', min = 1, max = 2 }), --����30
				yn({ id = 'g000ig0003', min = 1, max = 2 }), --������30

				{ id = 'g000ig0002', min = 1, max = 2 }, --������15
				yn({ id = 'g000ig0014', min = 1, max = 2 }), --�����15
				yn({ id = 'g000ig0011', min = 1, max = 2 }), --���15
				yn({ id = 'g000ig0008', min = 1, max = 2 }), --��������15
				
				{ id = 'g000ig0021', min = 1, max = 2 }, -- ���� ������
				yn({ id = 'g000ig0022', min = 1, max = 2 }), -- ���� ����
				yn({ id = 'g000ig0023', min = 1, max = 2 }), -- ���� �����
				{ id = 'g000ig0024', min = 1, max = 2 }, -- ���� �����
				
				yn({ id = 'g001ig0128', min = 1, max = 1 }), -- ���� ������
				yn({ id = 'g001ig0125', min = 1, max = 2 }), -- ���� ������
				yn({ id = 'g001ig0036', min = 1, max = 1 }), -- ���� ������

				yn({ id = d15(), min = 1, max = 1}), -- ����. �������
				yn({ id = d15(), min = 1, max = 1}), -- ����. �������
				yn({ id = d15(), min = 1, max = 1}), -- ����. �������
				yn({ id = d15(), min = 1, max = 1}), -- ����. �������
				
				orr({ id = 'g001ig0127', min = 1, max = 1 }, { id = 'g000ig0018', min = 1, max = 1 }), -- ������� ��������� ���� / �������� ����
				orr({ id = 'g001ig0340', min = 1, max = 1 }, { id = 'g001ig0338', min = 1, max = 1 }), -- ������� ������������ (�����������) / ������� ��������������� (�������)
				orr({ id = 'g001ig0523', min = 1, max = 1 }, { id = 'g001ig0548', min = 1, max = 1 }), -- ����� ������� (���� 10) / ����� ����� (10 ����)

				yn({ id = 'g000ig3004', min = 1, max = 1 }), -- ���.����1200
				yn({ id = 'g000ig2004', min = 1, max = 1 }), -- ���.����1200
				yn({ id = 'g001ig0124', min = 1, max = 1 }), -- ����.����1200
				yn({ id = 'g000ig9137', min = 1, max = 1 }), -- ����.�����1200
				yn({ id = 'g000ig9035', min = 1, max = 1 }), -- ����� ������ (��������)
				yn({ id = 'g000ig3019', min = 1, max = 1 }), -- ������ �������� (��������)
				yn({ id = 'g001ig0071', min = 1, max = 1 }), -- ���������� ����� (��������)
				yn({ id = 'g001ig0612', min = 1, max = 1 }), -- ������ �������� ���� (��������)
				yn({ id = 'g001ig0488', min = 1, max = 1 }), -- ������ ������������ ������ (��������)
				yn({ id = 'g001ig0413', min = 1, max = 1 }), -- ����� �������� (��������) 1200
				yn({ id = 'g001ig0415', min = 1, max = 1 }), -- ���� ���� ������ (��������) 1150
				yn({ id = 'g001ig0591', min = 1, max = 1 }), -- ��� ��������� (��������)
				yn({ id = 'g001ig0590', min = 1, max = 1 }), -- ��� �������� (��������)
				yn({ id = 'g001ig0060', min = 1, max = 1 }), -- ������ ������ (��������)
				
				yn({ id = 'g000ig2006', min = 1, max = 1 }), -- �.�����800
				yn({ id = 'g001ig0156', min = 1, max = 1 }), -- �.��������800
				yn({ id = 'g000ig3022', min = 1, max = 1 }), -- �.�����650
				yn({ id = 'g000ig4006', min = 1, max = 1 }), -- ����� �.�.
				yn({ id = 'g001ig0597', min = 1, max = 1 }), -- ������ ��������� (��������)
				yn({ id = 'g001ig0427', min = 1, max = 1 }), -- ��������� ������ (��������)
				yn({ id = 'g001ig0539', min = 1, max = 1 }), -- ������� ��� (��������)
				yn({ id = 'g001ig0605', min = 1, max = 1 }), -- ����� ����������

				orr({ id = 'g001ig0501', min = 1, max = 1 }, { id = 'g001ig0606', min = 1, max = 1 }), -- ���� �������� (���) 900 | ������ ������ ������ 1000

				--�����
				orr(orr({ id = 'g000ig6020', min = 1, max = 1 }, { id = 'g001ig0380', min = 1, max = 1 }), orr({ id = 'g000ig6021', min = 1, max = 1 }, { id = 'g001ig0393', min = 1, max = 1 })), -- ����� �����-15���-10����� / ����� ���� ������-����� / ����� ��� ����-���2 / ����� ������� ����+50��
				
				yn({ id = 'g000ig9029', min = 1, max = 1 }), -- ����� �����75
				yn({ id = 'g000ig9041', min = 1, max = 1 }), -- ����� �������
				yn({ id = 'g000ig9018', min = 1, max = 1 }), -- ����� �����
				yn({ id = 'g000ig9038', min = 1, max = 1 }), -- ����� ������
				yn({ id = 'g000ig9042', min = 1, max = 1 }), -- ����� ������
				yn({ id = 'g001ig0455', min = 1, max = 1 }), -- ����� ��������� ����������
				yn({ id = 'g001ig0472', min = 1, max = 1 }), -- ����� ������
				yn({ id = 'g001ig0473', min = 1, max = 1 }), -- ����� ����� �����
				yn({ id = 'g001ig0474', min = 1, max = 1 }), -- ����� ������� ���������
				yn({ id = 'g001ig0479', min = 1, max = 1 }), -- ����� ����
				yn({ id = 'g001ig0062', min = 1, max = 1 }), -- ����� �����
				yn({ id = 'g001ig0477', min = 1, max = 1 }), -- ����� ���������
				yn({ id = 'g001ig0181', min = 1, max = 1 }), -- ����� ����������
				orr(orr({ id = 'g001ig0056', min = 1, max = 1 }, { id = 'g001ig0054', min = 1, max = 1 }), orr({ id = 'g001ig0055', min = 1, max = 1 }, { id = 'g001ig0053', min = 1, max = 1 })), -- ����� ������ ���� / ������� / ����� / ����
				
				yn({ id = 'g000ig1002', min = 1, max = 1 }), -- ����� ������700
				yn({ id = 'g001ig0362', min = 1, max = 1 }), -- ����� �����
				yn({ id = 'g001ig0364', min = 1, max = 1 }), -- ����� ����� �������
				yn({ id = 'g001ig0587', min = 1, max = 1 }), -- ����� �������
				yn({ id = 'g001ig0363', min = 1, max = 1 }), -- ����� ������
				yn({ id = 'g001ig0372', min = 1, max = 1 }), -- ����� �����
				yn({ id = 'g001ig0374', min = 1, max = 1 }), -- ����� ��������� ���������

				--�����
				orr({ id = 'g000ig9109', min = 1, max = 1 }, { id = 'g000ig9127', min = 1, max = 1 } ), -- �������� ������� / �������� ����� (����� ���)

				--������
--				orr({ id = 'g000ig5107', min = 1, max = 1}, { id = 'g001ig0084', min = 1, max = 1}), -- �������� ���� / ����������
				orr(orr({ id = 'g001ig0252', min = 1, max = 1}, { id = 'g001ig0253', min = 1, max = 1}), orr({ id = 'g001ig0255', min = 1, max = 1}, { id = 'g001ig0256', min = 1, max = 1})), -- ������ ����������-����, �����.�����-����, ����.�����+���, ����������+���� 
				orr({ id = 'g000ig5007', min = 1, max = 1 }, { id = 'g000ig5029', min = 1, max = 1 }), -- ��. ��������� / ���. ���������
				
			}
		},
		guard = gmm({}, guard3()),
	},
	
}
end

-- �������� �4 (��������)
function itemsMerchZone5()
return {
				{ id = 'g000ig0001', min = 5, max = 6 },
				{ id = 'g000ig0006', min = 5, max = 6 },
				{ id = 'g001ig0378', min = 2, max = 3 }, --���75
				{ id = 'g000ig0018', min = 1, max = 2 },

				yn({ id = 'g000ig0012', min = 1, max = 2 }), --���30
				yn({ id = 'g000ig0015', min = 1, max = 2 }), --����30
				yn({ id = 'g000ig0003', min = 1, max = 2 }), --������30

				yn({ id = 'g000ig0002', min = 1, max = 1 }), --15
				{ id = 'g000ig0014', min = 1, max = 1 }, --�����15
				yn({ id = 'g000ig0011', min = 1, max = 1 }), --15
				yn({ id = 'g000ig0008', min = 1, max = 1 }), --15
				
				yn({ id = 'g000ig0021', min = 1, max = 1 }), -- ����
				{ id = 'g000ig0022', min = 1, max = 1 }, -- ���� ����
				{ id = 'g000ig0023', min = 1, max = 1 }, -- ���� �����
				yn({ id = 'g000ig0024', min = 1, max = 1 }), -- ����				

				yn({ id = 'g001ig0128', min = 1, max = 1 }), -- ���� ������
				yn({ id = 'g001ig0125', min = 1, max = 1 }), -- ���� ������
				yn({ id = 'g001ig0036', min = 1, max = 1 }), -- ���� ������

				yn({ id = 'g001ig0411', min = 1, max = 1 }), -- ����� ���������� (��������)
				yn({ id = 'g001ig0604', min = 1, max = 1 }), -- ������ ����� (��������)
				yn({ id = 'g001ig0585', min = 1, max = 1 }), -- ������ ��������� (��������)
				yn({ id = 'g001ig0046', min = 1, max = 1 }), -- ����� ������� (��������)
				yn({ id = 'g001ig0410', min = 1, max = 1 }), -- ����������� ������ (��������)
				yn({ id = 'g001ig0102', min = 1, max = 1 }), -- ������ ���������� (��������)
				yn({ id = 'g000ig2005', min = 1, max = 1 }), -- ������������� ������� (��������)
				
				yn({ id = 'g001ig0419', min = 1, max = 1 }), -- ���� ������� (��������)1000
				yn({ id = 'g001ig0116', min = 1, max = 1 }), -- �.����.����1200
				yn({ id = 'g000ig7010', min = 1, max = 1 }), -- �.���.���1800
				yn({ id = 'g001ig0038', min = 1, max = 1 }), -- �.���.����1550
				yn({ id = 'g000ig3005', min = 1, max = 1 }), -- �.���.�����1200
--				yn({ id = 'g001ig0596', min = 1, max = 1 }), -- ������� (��������)

				yn({ id = 'g001ig0115', min = 1, max = 1 }), -- ������ ������1100
				yn({ id = 'g001ig0112', min = 1, max = 1 }), -- ������ �����800

				--�����
				orr({ id = 'g001ig0097', min = 1, max = 1 }, { id = 'g000ig6019', min = 1, max = 1 }), -- ����� ���� / ����� ������ 
				
				yn({ id = 'g000ig9014', min = 1, max = 1 }), -- ����� �����
				yn({ id = 'g001ig0296', min = 1, max = 1 }), -- ����� ����������
				yn({ id = 'g000ig9007', min = 1, max = 1 }), -- ����� ��������
				yn({ id = 'g001ig0496', min = 1, max = 1 }), -- ����� �����
				yn({ id = 'g001ig0443', min = 1, max = 1 }), -- ����� ������� ������
				yn({ id = 'g000ig9027', min = 1, max = 1 }), -- ����� �����
				yn({ id = 'g000ig9004', min = 1, max = 1 }), -- ����� �����������
				
				--�����
				orr(orr({ id = 'g000ig9037', min = 1, max = 1 }, { id = 'g000ig9132', min = 1, max = 1 }), orr({ id = 'g001ig0066', min = 1, max = 1 }, { id = 'g000ig9141', min = 1, max = 1 })), -- �������� �������� / �������� ������� ����� | �������� ���������� ������ / �������� ��������� �����
				
				yn({ id = 'g000ig5029', min = 1, max = 1 }), -- ���. ���������
				yn({ id = 'g000ig5110', min = 1, max = 1 }), -- ������ "���������" 

}
end

-- ����� �4
function zoneMerchZone5() -- ������ �2+�3
return {
	{
		goods = {
			itemTypes = { Item.Scroll },
			value = { min = 950, max = 950 },
			itemValue = { min = 400, max = 550 },
			items = itemsMerchZone5()
		}
	}
	}
end

----------------------

-- ����� ���� 0
local valueRuinRespZ0 = { min = 165*kef, max = 175*kef }
local goldRuinRespZ0 = { min = 200, max = 220 } 

function zoneRuinRespZ0()
return {
	{
		gold = goldRuinRespZ0,
		loot = {
				items = {
					{id = ruin0(), min = 1, max = 1},
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
				orr(orr({ id = 'g000ig3001', min = 1, max = 1}, { id = 'g000ig2001', min = 1, max = 1}), orr({ id = 'g001ig0100', min = 1, max = 1}, { id = 'g001ig0101', min = 1, max = 1})), -- ������ ������ (��������) / ������ ������ (��������) | ��� ���� (��������) / ����� ���� (��������)
			},
		},
		guard = {
			value = valueRuinRespZ0
		}
	},
}
end

-- ����� ���� 1
local valueRuinRespZ = { min = 230*kef, max = 240*kef }
local goldRuinRespZ = { min = 250, max = 275 } 

function zoneRuinRespZ()
return {
	{
		gold = goldRuinRespZ,
		loot = {
			items = {
				orr(orr({ id = 'g001ig0418', min = 1, max = 1}, { id = 'g001ig0428', min = 1, max = 1}), orr({ id = 'g001ig0421', min = 1, max = 1}, { id = 'g001ig0611', min = 1, max = 1})), -- ���� ������ ������ (��������) / ������� ���������� ������� (��������) | ������ ����� (��������) / ���� ������������ (��������)
			},
		},
		guard = {
			value = valueRuinRespZ
		}
	},
	{
		gold = goldRuinRespZ,
		loot = {
				itemTypes = { Item.Jewel, Item.Talisman },
				value = { min = 400, max = 400 },
				itemValue = { min = 400, max = 400 }
		},
		guard = {
			value = valueRuinRespZ
		}
	},
}
end


-- ����� ���� 2
local valueRuinResp = { min = 400*kef, max = 420*kef }
local goldRuinResp = { min = 300, max = 330 } 

function zoneRuinResp()
return {
	{
		gold = goldRuinResp,
		loot = {
				itemTypes = { Item.Armor, Item.TravelItem },
				value = { min = 500, max = 690 },
				itemValue = { min = 500, max = 690 }
		},
		guard = {
			value = valueRuinResp
		}
	},

	{
		gold = goldRuinResp,
		loot = {
				itemTypes = { Item.Weapon, Item.Banner },
				value = { min = 400, max = 540 },
				itemValue = { min = 400, max = 540 }
		},
		guard = {
			value = valueRuinResp
		}
	}	
	}
end

-- ����� ���� 3
local valueRuinZone = { min = 800*kef, max = 840*kef }
local goldRuinZone = { min = 350, max = 385 }

function zoneRuinZone34()
return {
	{
		gold = goldRuinZone,
		loot = {
				itemTypes = { Item.Jewel, Item.Weapon, Item.Armor },
				value = { min = 800, max = 1090 },
				itemValue = { min = 800, max = 1090 }
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
				value = { min = 600, max = 750 },
				itemValue = { min = 600, max = 750 }
		},
		guard = {
			subraceTypes = NoUndead(),
			value = valueRuinZone
		}
	},
	
}
end

-- ����� ���� 4
local valueRuinZone5 = { min = 1600*kef, max = 1700*kef }
local goldRuinZone5 = { min = 400, max = 440 }

function zoneRuinZone5()
return {
	{
		gold = goldRuinZone5,
		loot = {
				itemTypes = { Item.Weapon, Item.Jewel }, -- 5 + 2 ������
				value = { min = 1150, max = 1340 },
				itemValue = { min = 1150, max = 1340 }
		},
		guard = {
			subraceTypes = NoUndead(),
			value = valueRuinZone5
		}
	},
	{
		gold = goldRuinZone5,
		loot = {
				itemTypes = { Item.Armor }, -- 7 ������
				value = { min = 1150, max = 1340 },
				itemValue = { min = 1150, max = 1340 }
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
				orr(orr({ id = 'g001ig0312', min = 1, max = 1}, { id = 'g001ig0310', min = 1, max = 1}), orr({ id = 'g001ig0314', min = 1, max = 1}, { id = 'g001ig0356', min = 1, max = 1})), -- ������� ����������� 15��������, ������� ���������� 15���, ������� �������� 15����, ����� ���������� ����-����
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

-- ��������� ����
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

-- ��������� �1
function getMinesRespZ2(race)
	local mines = {
		gold = 1,
	}
	if race == Race.Human then
		mines.runicMana = 1
	elseif race == Race.Dwarf then
		mines.lifeMana = 1
	elseif race == Race.Undead then
		mines.infernalMana = 1
	elseif race == Race.Heretic then
		mines.deathMana = 1
	elseif race == Race.Elf then
		mines.infernalMana = 1
	end
	return mines		
end

-- ��������� �2
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

-- ��������� �3
function getMinesZone34(race)
	local mines = {
		gold = 1,
	}
	if race == Race.Human then
		mines.lifeMana = 1
		mines.groveMana = 1
		mines.infernalMana = 1
		mines.deathMana = 1
	elseif race == Race.Dwarf then
		mines.runicMana = 1
		mines.groveMana = 1
		mines.deathMana = 1
		mines.infernalMana = 1
	elseif race == Race.Undead then
		mines.deathMana = 1
		mines.groveMana = 1
		mines.runicMana = 1
		mines.lifeMana = 1
	elseif race == Race.Heretic then
		mines.infernalMana = 1
		mines.groveMana = 1
		mines.runicMana = 1
		mines.lifeMana = 1
	elseif race == Race.Elf then
		mines.groveMana = 1
		mines.runicMana = 1
		mines.lifeMana = 1
		mines.deathMana = 1
	end

	return mines		

end

-- ��������� �4
function getMinesZone5(race, race2)
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

----------------


-- ����� ��� �������� (���������)
function unitsMercen12()
local unitsm = {}
local i = 1

unitsm[i] = { id = 'g000uu5030', level = 1, unique = false } i = i + 1 -- ���������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0092', level = 1, unique = true } i = i + 1 end -- ���������

if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu7595', level = 2, unique = true } i = i + 1 end -- ������ 1300
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu7628', level = 1, unique = true } i = i + 1 end -- ��������� ��������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0009', level = 2, unique = true } i = i + 1 end -- ���������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8311', level = 3, unique = true } i = i + 1 end -- �����
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu2030', level = 3, unique = true } i = i + 1 end -- ��������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0003', level = 3, unique = true } i = i + 1 end -- ��������� ������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0005', level = 3, unique = true } i = i + 1 end -- ����������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu2009', level = 3, unique = true } i = i + 1 end -- ������ � ����
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu2015', level = 3, unique = true } i = i + 1 end -- ����� ��������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0153', level = 3, unique = true } i = i + 1 end -- ������-������������

if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu7583', level = 2, unique = true } i = i + 1 end -- ����� 1500
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0032', level = 3, unique = true } i = i + 1 end -- ������� ������� 1300
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu7610', level = 1, unique = true } i = i + 1 end -- ������� �����
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu7609', level = 1, unique = true } i = i + 1 end -- ��������������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8201', level = 1, unique = true } i = i + 1 end -- ������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0034', level = 2, unique = true } i = i + 1 end -- �����������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0038', level = 3, unique = true } i = i + 1 end -- �������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0162', level = 3, unique = true } i = i + 1 end -- �������� �����
if math.random(0,1) == 1 then unitsm[i] = { id = 'g006uu1128', level = 3, unique = true } i = i + 1 end -- ������ ����
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu7568', level = 3, unique = true } i = i + 1 end -- �����������

if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8030', level = 2, unique = true } i = i + 1 end -- ������� ����� 1300
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8015', level = 2, unique = true } i = i + 1 end -- �������-������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu2012', level = 3, unique = true } i = i + 1 end -- ������� �������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8017', level = 3, unique = true } i = i + 1 end -- �������-������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8020', level = 3, unique = true } i = i + 1 end -- �������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8023', level = 3, unique = true } i = i + 1 end -- ��������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8024', level = 3, unique = true } i = i + 1 end -- �������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8028', level = 3, unique = true } i = i + 1 end -- �����

if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu7577', level = 2, unique = true } i = i + 1 end -- ����� 1500
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu7605', level = 1, unique = true } i = i + 1 end -- ��������� ���
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8199', level = 1, unique = true } i = i + 1 end -- ���� �����
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0063', level = 2, unique = true } i = i + 1 end -- ������ ������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0058', level = 2, unique = true } i = i + 1 end -- �����
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu7572', level = 2, unique = true } i = i + 1 end -- ���������� ��������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu2003', level = 3, unique = true } i = i + 1 end -- ��������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0054', level = 3, unique = true } i = i + 1 end -- ������ �������

if math.random(0,1) == 1 then unitsm[i] = { id = 'g001uu7564', level = 2, unique = true } i = i + 1 end -- ���� 900
if math.random(0,1) == 1 then unitsm[i] = { id = 'g001uu7563', level = 2, unique = true } i = i + 1 end -- ��������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g001uu7616', level = 1, unique = true } i = i + 1 end -- ����-�����
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8043', level = 1, unique = true } i = i + 1 end -- ����� ��������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0081', level = 2, unique = true } i = i + 1 end -- ������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu7542', level = 2, unique = true } i = i + 1 end -- ����������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0085', level = 3, unique = true } i = i + 1 end -- ���� ���
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0091', level = 3, unique = true } i = i + 1 end -- ���� ����
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu2007', level = 3, unique = true } i = i + 1 end -- �����������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0088', level = 3, unique = true } i = i + 1 end -- ������-����

--if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0011', level = 1, unique = true } i = i + 1 end -- ����������
--if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0006', level = 1, unique = true } i = i + 1 end -- ������
--if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0009', level = 2, unique = true } i = i + 1 end -- ���������
--if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0002', level = 2, unique = true } i = i + 1 end -- ������
--if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0004', level = 2, unique = true } i = i + 1 end -- ������� �� �����
--if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu2014', level = 2, unique = true } i = i + 1 end -- ����������
--if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu7562', level = 3, unique = true } i = i + 1 end -- ��������
--if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0010', level = 3, unique = true } i = i + 1 end -- ���
--if math.random(0,1) == 1 then unitsm[i] = { id = 'g003uu5003', level = 3, unique = true } i = i + 1 end -- ���������

--if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0036', level = 1, unique = true } i = i + 1 end -- ����
--if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0027', level = 2, unique = true } i = i + 1 end -- ����������
--if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0029', level = 1, unique = true } i = i + 1 end -- �������� �������
--if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0037', level = 2, unique = true } i = i + 1 end -- ����
--if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0041', level = 3, unique = true } i = i + 1 end -- �����
--if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8031', level = 1, unique = true } i = i + 1 end -- ���
--if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8018', level = 1, unique = true } i = i + 1 end -- ���������
--if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8026', level = 2, unique = true } i = i + 1 end -- �������
--if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8016', level = 2, unique = true } i = i + 1 end -- �������-��������

--if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0086', level = 1, unique = true } i = i + 1 end -- ����
--if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0055', level = 1, unique = true } i = i + 1 end -- ��������
--if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0057', level = 1, unique = true } i = i + 1 end -- ����
--if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0053', level = 2, unique = true } i = i + 1 end -- ���������

--if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0078', level = 1, unique = true } i = i + 1 end -- ����������
--if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0093', level = 1, unique = true } i = i + 1 end -- �������
--if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0090', level = 2, unique = true } i = i + 1 end -- ��������

--if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8169', level = 1, unique = true } i = i + 1 end -- �.����700
--if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8168', level = 1, unique = true } i = i + 1 end -- �.����700
--if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8171', level = 1, unique = true } i = i + 1 end -- ����.����700
--if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8170', level = 1, unique = true } i = i + 1 end -- ����.���700
--if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu5031', level = 1, unique = true } i = i + 1 end -- �����
--if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu5018', level = 1, unique = true } i = i + 1 end -- ������.�
--if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8196', level = 1, unique = true } i = i + 1 end -- ������.��.
--if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu5013', level = 1, unique = true } i = i + 1 end -- ���
--if math.random(0,1) == 1 then unitsm[i] = { id = 'g001uu7547', level = 1, unique = true } i = i + 1 end -- �����
--if math.random(0,1) == 1 then unitsm[i] = { id = 'g001uu7550', level = 1, unique = true } i = i + 1 end -- ������
--if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8199', level = 1, unique = true } i = i + 1 end -- �.�����
--if math.random(0,1) == 1 then unitsm[i] = { id = 'g001uu8309', level = 1, unique = true } i = i + 1 end -- �������


return unitsm
end

-- ������� � ���� 2
function zoneMercenZone12()
return {
	{
		units = unitsMercen12(),
		guard = gmm({}, guard2n()),
		}
	}
end


-- ����� ��� �������� (��������)
function unitsMercen()
local unitsm = {}
local i = 1

unitsm[i] = { id = 'g000uu7629', level = 1, unique = false } i = i + 1 -- ����������� ����
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0092', level = 1, unique = true } i = i + 1 end -- ���������

if math.random(0,1) == 1 then unitsm[i] = { id = 'g001uu7571', level = 2, unique = true } i = i + 1 end -- �.����
if math.random(0,1) == 1 then unitsm[i] = { id = 'g001uu8279', level = 1, unique = true } i = i + 1 end -- �.����
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu5032', level = 1, unique = true } i = i + 1 end -- ����� ��������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g002uu0025', level = 1, unique = true } i = i + 1 end -- ��.�����
if math.random(0,1) == 1 then unitsm[i] = { id = 'g002uu5026', level = 1, unique = true } i = i + 1 end -- ��.����

if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0157', level = 4, unique = true } i = i + 1 end -- ������� ����������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0014', level = 4, unique = true } i = i + 1 end -- �����
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8306', level = 1, unique = true } i = i + 1 end -- ���������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g001uu7560', level = 1, unique = true } i = i + 1 end -- ��������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu2031', level = 4, unique = true } i = i + 1 end -- �������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g001uu7543', level = 4, unique = true } i = i + 1 end -- ��������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu2010', level = 4, unique = true } i = i + 1 end -- ���� ����������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0152', level = 4, unique = true } i = i + 1 end -- ����� ���

if math.random(0,1) == 1 then unitsm[i] = { id = 'g001uu7579', level = 3, unique = true } i = i + 1 end -- �������-��������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu2013', level = 4, unique = true } i = i + 1 end -- ��������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8212', level = 3, unique = true } i = i + 1 end -- �����������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8151', level = 1, unique = true } i = i + 1 end -- �����
if math.random(0,1) == 1 then unitsm[i] = { id = 'g001uu8240', level = 4, unique = true } i = i + 1 end -- ��������� �������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu7578', level = 4, unique = true } i = i + 1 end -- ������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8052', level = 5, unique = true } i = i + 1 end -- �������

if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0040', level = 4, unique = true } i = i + 1 end -- ������ �������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0190', level = 1, unique = true } i = i + 1 end -- ��� �������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g001uu7613', level = 1, unique = true } i = i + 1 end -- ���������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu2011', level = 4, unique = true } i = i + 1 end -- ��������� ���
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8218', level = 1, unique = true } i = i + 1 end -- �����
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu6106', level = 1, unique = true } i = i + 1 end -- ��������� ������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0165', level = 5, unique = true } i = i + 1 end -- ������

if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0171', level = 3, unique = true } i = i + 1 end -- �����������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8192', level = 4, unique = true } i = i + 1 end -- �������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0166', level = 4, unique = true } i = i + 1 end -- �����������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8254', level = 4, unique = true } i = i + 1 end -- ������������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0061', level = 4, unique = true } i = i + 1 end -- ���������� �������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g001uu7574', level = 3, unique = true } i = i + 1 end -- ���������� ��������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0060', level = 4, unique = true } i = i + 1 end -- �����

if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0178', level = 4, unique = true } i = i + 1 end -- �����
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0177', level = 4, unique = true } i = i + 1 end -- ������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g001uu8314', level = 4, unique = true } i = i + 1 end -- ������� ������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g003uu5014', level = 4, unique = true } i = i + 1 end -- ��� �������� �����
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8174', level = 1, unique = true } i = i + 1 end -- ������� �������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g001uu7598', level = 3, unique = true } i = i + 1 end -- ���������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0089', level = 4, unique = true } i = i + 1 end -- ������-������


if math.random(0,1) == 1 then unitsm[i] = { id = 'g001uu8255', level = 1, unique = true } i = i + 1 end -- ����-����
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu7589', level = 1, unique = true } i = i + 1 end -- ������������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g001uu8260', level = 1, unique = true } i = i + 1 end -- ����������

return unitsm
end

-- ������� � ���� 3
function zoneMercenZone()
return {
	{
		units = unitsMercen(),
		guard = gmm({}, guard3n()),
		}
	}
end

----------------------

-- ������� ����
function bagsResp00()
return {
	count = 1,
	loot = {
		itemTypes = { Item.Valuable },
		value = { min = 250, max = 375 }, 
		itemValue = { min = 250, max = 375 },
			items = {
				{ id = 'g000ig0006', min = 1, max = 1 }, --���100
				orr({ id = 'g001ig0180', min = 2, max = 2 }, { id = 'g000ig0005', min = 1, max = 1 }), --2�����/���50
				{ id = d15(), min = 1, max = 1 },
			}
	}
}
end


-- ������� �1
function bagsResp0()
return {
	count = 1,
	loot = {
		itemTypes = { Item.Valuable },
		value = { min = 500, max = 625 }, 
		itemValue = { min = 250, max = 625 },
			items = {
				orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --���/���100
				orr({ id = 'g001ig0180', min = 3, max = 3 }, { id = 'g001ig0378', min = 1, max = 1 }), --2-3�����/���75
				{ id = b15(), min = 1, max = 1 },
			}
	}
}
end

-- ������� �2
function bagsResp()
return {
	count = 1,
	loot = {
		itemTypes = { Item.Valuable },
		value = { min = 750, max = 875 }, 
		itemValue = { min = 250, max = 875 },
			items = {
				orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --���/���100
				orr({ id = 'g000ig0006', min = 1, max = 1 }, { id = 'g000ig0005', min = 2, max = 2 }), --���100/2���50
				{ id = w15(), min = 1, max = 1 },
			}
		}
}
end

-- ������� �3
function bagsZone34()
return {
	count = 1,
	loot = {
		itemTypes = { Item.Valuable },
		value = { min = 1000, max = 1000 },
		itemValue = { min = 500, max = 1000 },
			items = {
				orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --���/���100
				orr({ id = 'g000ig0005', min = 3, max = 3 }, { id = 'g001ig0378', min = 1, max = 1 }), --3���50/2���75
				orr(orr({ id = 'g001ig0128', min = 1, max = 1 }, { id = 'g001ig0560', min = 1, max = 1 }), orr({ id = 'g001ig0355', min = 1, max = 1 }, { id = 'g001ig0547', min = 1, max = 1 })), --���� ������/�����������, ����� ��������� ����� /����� ����������� �������
			}
		}
	}
end

-- ������� �4
function bagsZone5()
return {
	count = 1,
	loot = {
		itemTypes = { Item.Valuable },
		value = { min = 1000, max = 1000 },
		itemValue = { min = 500, max = 1000 },
			items = {
				{ id = 'g000ig0001', min = 1, max = 1 }, --���
				{ id = 'g000ig0018', min = 1, max = 1 }, --���200
				-- orr(orr({ id = 'g001ig0128', min = 1, max = 1 }, { id = 'g001ig0560', min = 1, max = 1 }), orr({ id = 'g001ig0125', min = 1, max = 1 }, { id = 'g001ig0547', min = 1, max = 1 })), --���� ������/�����������, ���� �����/����� ����������� �������
				{ id = p05(), min = 1, max = 1 },
		}
	}
}
end

----------------------
-- ��� �������
----------------------

-- ���� ��� �� ����
function yn(what)
	local radn = math.random(0,1)
	if radn == 0 then
	return what
	elseif radn == 1 then
	return ""
	end
end

-- ��� / ���
function orr(what, what2)
	local radn = math.random(0,1)
	if radn == 0 then
	return what
	elseif radn == 1 then
	return what2
	end
end

-- ����� �����
function gmm(outrun, classic)
	if gmode == 1 then
	return outrun
	elseif gmode == 2 then
	return classic
	end
end

-- ������� ������
function getPlayerSubRace(race)
	if race == Race.Human then return Subrace.Human
	elseif race == Race.Dwarf then return Subrace.Dwarf
	elseif race == Race.Undead then return Subrace.Undead
	elseif race == Race.Heretic then return Subrace.Heretic
	elseif race == Race.Elf then return Subrace.Elf
	end
end

-- ��� ��� � ��-��� �� ������ �� ����. �����
function ExtraMana(race)
	
	shmn = orr('g001ig0149','g001ig0150') -- ��� ���� ������ \ ��� ���� ������� ��������
	sdw = orr('g001ig0150','g001ig0147') -- ��� ���� ������� �������� \ ��� ���� �����������
	sun = orr('g001ig0146','g001ig0148') -- ��� ���� ����� \ ��� ���� ���
	shr = orr('g001ig0146','g001ig0148') -- ��� ���� ����� \ ��� ���� ���
	self = orr('g001ig0146','g001ig0148') -- ��� ���� ����� \ ��� ���� ���
	
	if race == Race.Human then return shmn
	elseif race == Race.Dwarf then return sdw
	elseif race == Race.Undead then return sun
	elseif race == Race.Heretic then return shr
	elseif race == Race.Elf then return self
	end
end

-- ��������� ��������
function rcry()
	local radn = math.random(0,4)
	if radn == 0 then
	return 'g000ig9002' --�����
	elseif radn == 1 then
	return 'g000ig9015' --���
	elseif radn == 2 then
	return 'g000ig9005' --���
	elseif radn == 3 then
	return 'g000ig9003' --���
	elseif radn == 4 then
	return 'g000ig9010' --������
	end
end

-- ��������� ����� ��� �����
function rmss()
	local radn = math.random(0,4)
	if radn == 0 then
	return 'g001ig0481' --�����
	elseif radn == 1 then
	return 'g001ig0485' --���
	elseif radn == 2 then
	return 'g001ig0482' --������.
	elseif radn == 3 then
	return 'g001ig0483' --���
	elseif radn == 4 then
	return 'g001ig0484' --������
	end
end


-- ��������� ��� �����
function rms()
	local radn = math.random(0,4)
	if radn == 0 then
	return 'g001ig0146' --�����
	elseif radn == 1 then
	return 'g001ig0150' --���
	elseif radn == 2 then
	return 'g001ig0147' --������.
	elseif radn == 3 then
	return 'g001ig0148' --���
	elseif radn == 4 then
	return 'g001ig0149' --������
	end
end

-- ��������� ����� �� 15
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

-- ��������� ����� ���� �� ������
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

-- ��������� ����� ���� �� ����� � ���� �����
function d15()
	local radn = math.random(0,7)
	if radn == 0 then
	return 'g001ig0349' -- ������� ������ �� ����������
	elseif radn == 1 then
	return 'g001ig0329' -- ������� ������ �� �������
	elseif radn == 2 then
	return 'g001ig0327' -- ������� ������ �� ������
	elseif radn == 3 then
	return 'g001ig0335' -- ������� ������ �� ����������
	elseif radn == 4 then
	return 'g001ig0337' -- ������� ������ �� ��������
	elseif radn == 5 then
	return 'g001ig0351' -- ������� ������ �� �����������
	elseif radn == 6 then
	return 'g001ig0331' -- ������� ������ �� ���
	elseif radn == 7 then
	return 'g001ig0341' -- ������� ������ �� ������
	end
end


-- ��������� �����-������� �� 5% �� 400
function p05()
	local radn = math.random(0,4)
	if radn == 0 then
	return 'g001ig0309' -- ������� ������ +5���
	elseif radn == 1 then
	return 'g001ig0313' -- ������� ����������������� +5����
	elseif radn == 2 then
	return 'g001ig0311' -- ������� ������������ +5��������
	elseif radn == 3 then
	return 'g001ig0315' -- ����� �������� +5��
	elseif radn == 4 then
	return 'g001ig0307' -- ����� ��������� +5�����
	end
end

-- ��������� �����-������� �� ��� ���� 0
function ruin0()
	local radn = math.random(0,4)
	if radn == 0 then
	return 'g001ig0309' -- ������� ������ +5���
	elseif radn == 1 then
	return 'g001ig0313' -- ������� ����������������� +5����
	elseif radn == 2 then
	return 'g001ig0307' -- ����� ��������� +5�����
	elseif radn == 3 then
	return 'g001ig0523' -- ����� ������� (���� 10)
	elseif radn == 4 then
	return 'g001ig0533' -- ����� ������ ����� (+2 ������)	
	end
end


-- ����� �� ������
function CapSpell(race)
	sphmn = orr(orr('g000ss0002','g000ss0003'),orr('g000ss0004','g000ss0009')) -- ��������\����\������\�������� ������
	spdw = orr(orr('g000ss0021','g000ss0023'),orr('g000ss0024','g000ss0025')) -- ������� ���\���� ������\�����\������ I: ���
	spun = orr(orr('g000ss0061','g000ss0062'),orr('g000ss0063','g000ss0064')) -- ������ I: ������\���\������� ����\��������
	sphr = orr(orr('g000ss0041','g000ss0042'),orr('g000ss0043','g000ss0044')) -- Incantare Hellhound\Incantare Hellhound Illudere\Ignis mare\Menta minoris
	spelf = orr(orr('g000ss0097','g000ss0098'),orr('g000ss0101','g000ss0106')) -- ���������\������ I: ��� �����\����\��������
	
	if race == Race.Human then return sphmn
	elseif race == Race.Dwarf then return spdw
	elseif race == Race.Undead then return spun
	elseif race == Race.Heretic then return sphr
	elseif race == Race.Elf then return spelf
	end
end

-- ������ �� ������
function NoUndead()
	return {Subrace.Human, Subrace.Heretic, Subrace.Dwarf, Subrace.Elf, Subrace.Neutral, Subrace.NeutralHuman, Subrace.NeutralElf, Subrace.NeutralGreenSkin, Subrace.NeutralDragon, Subrace.NeutralMarsh, Subrace.NeutralWater, Subrace.NeutralBarbarian, Subrace.NeutralWolf}
end

-- ����� �������
function PredBarb(vmin, vmax, vlmin, vlmax)
return { 
-- �����: 90 ������, 110 ������, 135 ����-����, 485 ������, 775 �������� �����, 985 ������, 1775 �������� ������
-- ������: 165 �������, 175 ������, 220 �����, 270 ���.���

		count = 1,
			subraceTypes = { Subrace.NeutralBarbarian, Subrace.NeutralMarsh, Subrace.Human, Subrace.Undead, Subrace.Heretic, Subrace.Dwarf, Subrace.Elf },
			value = { min = vmin*kef, max = vmax*kef },
			loot = {
				itemTypes = { Item.Scroll, Item.Orb },
				value = { min = vlmin, max = vlmin },
				itemValue = { min = vlmin, max = vlmin },
				items = {
					{ id = 'g000ig0006', min = 1, max = 1 }, --���100
				}
			}
}
end

-- ����� ����
function PredSkin(omin, omax, olmin, olmax)
return { -- 70 ���/c����, 90 ���������, 110 �����, 190! - ����� 310! - ������
		count = 1,
			subraceTypes = { Subrace.NeutralGreenSkin, Subrace.Human, Subrace.Undead, Subrace.Heretic, Subrace.Dwarf, Subrace.Elf },
			value = { min = omin*kef, max = omax*kef },
			loot = {
				itemTypes = { Item.PotionHeal, Item.PotionRevive },
				value = { min = olmin, max = olmax },
				itemValue = { min = 50, max = 250 },
				items = {
					orr({ id = b15(), min = 1, max = 1 }, { id = w15(), min = 1, max = 1}), -- ����. �����15 /  ����. ����
				}
			}
}
end

----------------------
-- ������ ����
---------------------

function zoneStacksRespZ00()
return {  -- 175*3
		count = 3,
		value = { min = 525*kef, max = 550*kef },
		loot = {
			items = {
				{ id = 'g000ig0005', min = 1, max = 1 }, -- ���50
				{ id = 'g000ig7001', min = 1, max = 1 }, --������50
				{ id = rmss(), min = 1, max = 1 }, --����.���.��� �����				
				{ id = 'g000ig0014', min = 1, max = 1 }, -- �����15
				{ id = 'g000ig0002', min = 1, max = 1 }, --������15
				{ id = d15(), min = 1, max = 1}, -- ����. �������
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
				{ id = 'g001ig0378', min = 1, max = 1}, --���75
				{ id = 'g000ig0005', min = 1, max = 1 }, -- ���50
				{ id = rmss(), min = 1, max = 1 }, --����.���.��� �����
				orr({ id = 'g000ig0021', min = 1, max = 1 }, { id = 'g000ig0024', min = 1, max = 1 }), --����/����
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
			value = { min = 200, max = 200 },
			itemValue = { min = 100, max = 100 },		
			items = {
				orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --���/���100
				{ id = 'g000ig0011', min = 1, max = 1 }, --���15
			}
		}
}
end

--------------
-- ������ �1
--------------

function Pred1RespZ0()
return {  --200xp*2 -- ����� 100 / 150
		count = 2,
			value = { min = 400*kef, max = 420*kef },
			loot = {
				itemTypes = { Item.Orb },
				value = { min = 260, max = 310 },
				itemValue = { min = 110, max = 150 },
				items = {
					{ id = b15(), min = 1, max = 1}, -- ����. �����15				
					{ id = 'g000ig0005', min = 1, max = 1 }, -- ���50
					{ id = rmss(), min = 1, max = 1 }, --����.���.��� �����
					{ id = d15(), min = 1, max = 1}, -- ����. �������	
				}
			}
}
end

function Pred1RespZ01()
return { --250xp*2 -- ������ �1+�1
		count = 2,
			value = { min = 500*kef, max = 525*kef }, 
			loot = {
				itemTypes = { Item.Scroll },
				value = { min = 400, max = 400 },
				itemValue = { min = 200, max = 200 },
				items = {
					{ id = 'g000ig0006', min = 1, max = 1}, --���100
					{ id = 'g000ig0005', min = 1, max = 1 }, -- ���50
					orr({ id = 'g000ig0022', min = 1, max = 1 }, { id = 'g000ig0023', min = 1, max = 1 }), --����/�����
					{ id = rmss(), min = 1, max = 1 }, --����.���.��� �����
				}
			}
}
end

function Pred1RespZ02() 
return { --300xp*1 -- �����75
		count = 1,
			subraceTypes = NoUndead(),
			value = { min = 300*kef, max = 315*kef }, 
			loot = {
				items = {
					{ id = 'g000ig0001', min = 1, max = 1 }, --���
					{ id = 'g000ig0005', min = 1, max = 1 }, -- ���50
					{ id = 'g001ig0431', min = 1, max = 1 }, --������75
					{ id = b15(), min = 1, max = 1}, -- ����. �����15
				}
			}
}
end

function Pred1RespZ03() 
return { --300xp*1  / -- ���� ������/����� ���������
		count = 1,
			subraceTypes = NoUndead(),
			value = { min = 300*kef, max = 315*kef }, 
			loot = {
				items = {
					orr({ id = 'g001ig0128', min = 1, max = 1 },{ id = 'g001ig0532', min = 1, max = 1 }), -- ���� ������/����� ���������
					{ id = 'g000ig0006', min = 1, max = 1}, --���100
					{ id = rmss(), min = 1, max = 1 }, --����.���.��� �����
					{ id = 'g000ig0021', min = 1, max = 1 }, --����
				}
			}
}
end

function Pred1RespZD() 
return { --350xp*1 -- �������� 200-275
		count = 1,
			subraceTypes = NoUndead(),
			value = { min = 350*kef, max = 370*kef }, 
			loot = {
				itemTypes = { Item.Talisman },
				value = { min = 200, max = 290 },
				itemValue = { min = 200, max = 290 },
				items = {
					{ id = 'g000ig0001', min = 1, max = 1 }, --���
					{ id = 'g001ig0378', min = 1, max = 1}, --���75
					orr({ id = 'g000ig0021', min = 1, max = 1 }, { id = 'g000ig0024', min = 1, max = 1 }), --����/����
				}
			}
}
end


------------------
-- ������ �2
------------------

function zoneStacksResp1()
return { -- 300xp*2
		count = 2,
		value = { min = 600*kef, max = 630*kef}, 
		loot = {
			items = {
				{ id = 'g000ig0006', min = 1, max = 1 }, --���100
				{ id = 'g000ig0005', min = 1, max = 1 }, --���50
				orr({ id = 'g000ig0022', min = 1, max = 1 }, { id = 'g000ig0023', min = 1, max = 1 }), --����/�����
				{ id = 'g000ig0011', min = 1, max = 1 }, --���15
				{ id = 'g000ig7002', min = 1, max = 1 }, --������100
				{ id = d15(), min = 1, max = 1}, -- ����. �������
			}
		},
	}	
end

function Pred1Resp01()
return { -- 350��*2
			count = 2,
			value = { min = 700*kef, max = 735*kef },
			loot = {
				items = {
					orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --���/���100
					{ id = 'g000ig0005', min = 1, max = 1 }, --���50
					orr({ id = 'g000ig0021', min = 1, max = 1 }, { id = 'g000ig0024', min = 1, max = 1 }), --����/����
					{ id = 'g000ig0014', min = 1, max = 1 }, --�����15
					{ id = 'g000ig7002', min = 1, max = 1 }, --������100
					{ id = d15(), min = 1, max = 1 }, --����. �������
				}
			}
}
end

function zoneStacksResp()
return { -- 400xp*2 / ������ �1+�1
		count = 2,
		value = { min = 800*kef, max = 840*kef}, 
		loot = {
			itemTypes = { Item.Scroll },
			value = { min = 400, max = 400 }, -- ������ �1+�1
			itemValue = { min = 200, max = 200 },
			items = {
				{ id = 'g001ig0150', min = 1, max = 1 }, -- ��� ���
				{ id = 'g000ig0006', min = 1, max = 1 }, --���100
				{ id = 'g000ig0008', min = 1, max = 1 }, --��������15
				orr({ id = 'g001ig0125', min = 1, max = 1 }, { id = 'g001ig0036', min = 1, max = 1 }), --������/������
			}
		},
	}
end

function Pred1Resp1() 
return { -- 450��*2 -- ����� 200*2
			count = 2,
			value = { min = 900*kef, max = 945*kef },
			loot = {
				itemTypes = { Item.Orb },
				value = { min = 400, max = 400 },
				itemValue = { min = 200, max = 200 },
				items = {
					{ id = 'g001ig0146', min = 1, max = 1 }, -- ��� �����
					orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --���/���100
					orr({ id = 'g000ig0022', min = 1, max = 1 }, { id = 'g000ig0023', min = 1, max = 1 }), --����/�����
					{ id = 'g000ig0002', min = 1, max = 1 }, --������15
				}
			}
}
end

function Pred1Resp2()
return { -- 500��*2 -- ������ �1+�2
			count = 2,
			value = { min = 1000*kef, max = 1050*kef },
			loot = {
				itemTypes = { Item.Scroll },
				value = { min = 600, max = 600 },
				itemValue = { min = 200, max = 400 },
				items = {
					{ id = 'g001ig0147', min = 1, max = 1 }, -- ��� ������
					{ id = 'g000ig0001', min = 1, max = 1 }, --���
					{ id = 'g000ig0005', min = 1, max = 1 }, --���100
					orr({ id = 'g000ig0021', min = 1, max = 1 }, { id = 'g000ig0024', min = 1, max = 1 }), --�������/����
				}
			}
}
end

function Pred1Resp3()
return { -- 500��*2 -- ����� 225-250
			count = 2,
			value = { min = 1000*kef, max = 1050*kef },
			loot = {
				itemTypes = { Item.Orb },
				value = { min = 450, max = 540 }, -- 2 ����� 
				itemValue = { min = 225, max = 290 },
				items = {
					{ id = 'g001ig0148', min = 1, max = 1 }, -- ��� ���
					{ id = 'g000ig0005', min = 1, max = 1 }, --���100
					{ id = 'g001ig0378', min = 1, max = 1}, --���75
					{ id = b15(), min = 1, max = 1}, -- ����. �����15
				}
			}
}
end

function Pred1Resp4()
return { -- 500��*2 -- ������� -75 ������� / ��+25%
			count = 2,
			value = { min = 1000*kef, max = 1050*kef },
			loot = {
				items = {
					{ id = 'g001ig0149', min = 1, max = 1 }, -- ��� ������
					orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --���/���100
					{ id = 'g000ig7002', min = 1, max = 1 }, --������100
					orr({ id = 'g001ig0534', min = 1, max = 1 },{ id = 'g001ig0355', min = 1, max = 1 }), -- ������� ������� �����������(-75 �������)/����� ��������� �����
					{ id = b15(), min = 1, max = 1}, -- ����. �����15
					{ id = w15(), min = 1, max = 1 }, --����. ���� ����.
				}
			}
}
end

function Pred1Resp5()
return { -- 550��*1 -- ����� 200
			count = 1,
			subraceTypes = NoUndead(),
			value = { min = 550*kef, max = 580*kef },
			loot = {
				itemTypes = { Item.Wand },
				value = { min = 200, max = 200 }, 
				itemValue = { min = 200, max = 200 },			
				items = {
					{ id = 'g001ig0378', min = 1, max = 1}, --���75
					{ id = w15(), min = 1, max = 1 }, --����. ���� ����.
				}
			}
}
end

function Pred1RespD()
return { -- 650��*1 -- ���� 600 / ����. �����-������� �� 5%
			count = 1,
			subraceTypes = NoUndead(),
			value = { min = 650*kef, max = 680*kef },
			loot = {
				items = {
					{ id = 'g000ig0001', min = 1, max = 1 }, --���
					{ id = 'g000ig0005', min = 1, max = 1 }, --���100
					{ id = 'g001ig0125', min = 1, max = 1 }, --������
					orr({ id = 'g001ig0531', min = 1, max = 1}, { id = p05(), min = 1, max = 1 }), -- ����� ����� (������) / ����. �����-������� �� 5%
				}
			}
}
end

--------------------
-- ������ �3
--------------------

function zoneStacksZone34()
return { -- 600xp*4
		count = 4,
		value = { min = 2400*kef, max = 2520*kef},
		loot = {
			items = {
				{ id = rms(), min = 1, max = 1 }, --����. ��� �����
				{ id = 'g000ig0001', min = 1, max = 1 }, --���
				{ id = 'g000ig0006', min = 1, max = 1 }, --���100
				{ id = 'g001ig0378', min = 1, max = 1}, --���75
				orr({ id = 'g000ig0022', min = 1, max = 1 }, { id = 'g000ig0023', min = 1, max = 1 }), --����/�����
				orr({ id = 'g000ig0021', min = 1, max = 1 }, { id = 'g000ig0024', min = 1, max = 1 }), --����/����
				{ id = 'g000ig0002', min = 1, max = 1 }, --������15
				{ id = b15(), min = 1, max = 1 }, --��.�����15
				orr({ id = 'g000ig0011', min = 1, max = 1 }, { id = 'g000ig0008', min = 1, max = 1 }), --15���/��������
				{ id = 'g001ig0432', min = 1, max = 1 }, --�������125
				{ id = 'g001ig0127', min = 1, max = 1 }, --50��
				{ id = 'g001ig0125', min = 1, max = 1 }, --������
			}
		},
	}
end

function Pred1Zone1()
return { -- 700��*2 -- ������ �2+�2
			count = 2,
			value = { min = 1400*kef, max = 1470*kef },
			loot = {
				itemTypes = { Item.Scroll },
				value = { min = 800, max = 800 },
				itemValue = { min = 400, max = 400 },
				items = {
					{ id = rms(), min = 1, max = 1 }, --����. ��� �����
					orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --���/���100
					{ id = 'g000ig0006', min = 1, max = 1 }, --���100
					orr({ id = 'g000ig0021', min = 1, max = 1 }, { id = 'g000ig0024', min = 1, max = 1 }), --����/����
					orr({ id = 'g000ig0002', min = 1, max = 1 }, { id = 'g000ig0014', min = 1, max = 1 }), --15������/�����
					{ id = 'g001ig0128', min = 1, max = 1 }, --������
				}
			}
}
end

function Pred1Zone2()
return { -- 800��*2 -- �����375-400
			count = 2,
			value = { min = 1600*kef, max = 1680*kef },
				loot = {
					itemTypes = { Item.Orb },
					value = { min = 775, max = 840 }, -- ����� 375, 400
					itemValue = { min = 375, max = 440 },
					items = {
						{ id = rms(), min = 1, max = 1 }, --����. ��� �����
						{ id = 'g000ig0001', min = 1, max = 1 }, --���
						{ id = 'g000ig0006', min = 1, max = 1 }, --���100
						orr({ id = 'g000ig0011', min = 1, max = 1 }, { id = 'g000ig0008', min = 1, max = 1 }), --15���/��������
						orr({ id = 'g000ig0022', min = 1, max = 1 }, { id = 'g000ig0023', min = 1, max = 1 }), --����/�����
						{ id = 'g000ig0012', min = 1, max = 1 }, --���30
					}
				}
}
end

function Pred1Zone3()
return { -- 900��*2 -- ������� ���� 350-500
			count = 2,
			value = { min = 1800*kef, max = 1890*kef },
				loot = {
					itemTypes = { Item.PotionBoost },
					value = { min = 850, max = 1090 }, -- ������� 350-425-500
					itemValue = { min = 350, max = 540 },
					items = {
						orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --���/���100
						{ id = 'g000ig0018', min = 1, max = 1 }, -- ����
						{ id = b15(), min = 1, max = 1}, -- ����. �����15
						orr({ id = 'g001ig0125', min = 1, max = 1 }, { id = 'g001ig0036', min = 1, max = 1 }), --������/������
						{ id = 'g000ig0015', min = 1, max = 1 }, --�����30
					}
				}
}
end

function Pred1Zone4()
return { -- 1000��*2 -- �����/������ 400*2
			count = 2,
			subraceTypes = NoUndead(),			
			value = { min = 2000*kef, max = 2100*kef },
				loot = {
					itemTypes = { Item.Scroll, Item.Orb },
					value = { min = 800, max = 800 },
					itemValue = { min = 400, max = 400 },
					items = {
						{ id = 'g000ig0001', min = 1, max = 1 }, --���
						orr({ id = 'g000ig0018', min = 1, max = 1 }, { id = 'g001ig0519', min = 1, max = 1 }), --����/����� ��������� (-10 ����) 500
						{ id = 'g001ig0128', min = 1, max = 1 }, --������
						orr({ id = 'g000ig0011', min = 1, max = 1 }, { id = 'g000ig0002', min = 1, max = 1 }), --15���/������
						{ id = 'g000ig0003', min = 1, max = 1 }, --30������
						{ id = 'g001ig0432', min = 1, max = 1 }, --�������125
 					}
				}
}
end

function Pred1ZoneD() 
return { --1300��*1 --������ �3 + �����
			count = 1,
			subraceTypes = NoUndead(),
			value = { min = 1300*kef, max = 1360*kef },
				loot = {
					itemTypes = { Item.Scroll },
					value = { min = 550, max = 550 },
					itemValue = { min = 550, max = 550 },
					items = {
						{ id = 'g000ig0001', min = 1, max = 1 }, --���
						{ id = 'g000ig0018', min = 1, max = 1 }, -- ����
						orr({ id = 'g000ig0003', min = 1, max = 1 }, { id = 'g000ig0015', min = 1, max = 1 }), --30������/�����
						orr({ id = p05(), min = 1, max = 1}, { id = 'g001ig0529', min = 1, max = 1 }), -- ����. �����-������� �� 5% / ������� ���������� ���� (�����)
					}
				}
		}
end


--------------------
-- ������ �4 (�����)
--------------------

function zoneStacksZone5()
return { -- 1200��*4
		count = 4,
		value = { min = 4800*kef, max = 5050*kef},
		loot = {
			items = {
				{ id = rms(), min = 1, max = 1 }, --����. ��� �����
				{ id = 'g000ig0001', min = 1, max = 1 }, --���
				orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --���/���100				
				{ id = 'g000ig0006', min = 2, max = 2 }, --���100
				{ id = 'g000ig0015', min = 1, max = 1 }, --�����30
				{ id = 'g000ig0012', min = 1, max = 1 }, --���30
				{ id = 'g000ig7003', min = 1, max = 1 }, --�������150
				{ id = 'g000ig0018', min = 1, max = 1 }, --����
				{ id = 'g001ig0547', min = 1, max = 1 }, --����15
				{ id = 'g001ig0127', min = 1, max = 1 }, --��50
				{ id = 'g001ig0355', min = 1, max = 1 }, --����.����
			}
		},
}
end


local Pred1Zone5Value = { min = 1600*kef, max = 1680*kef } -- 1600

function Pred1Zone51()
return { -- �����
			count = 1,
			subraceTypes = NoUndead(),
			value = Pred1Zone5Value,
				loot = {
					items = {
						{ id = rms(), min = 1, max = 1 }, --����. ��� �����
						orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --���/���100
						{ id = 'g000ig0015', min = 1, max = 1 }, --�����30
						{ id = 'g001ig0125', min = 1, max = 1 }, -- ������
						orr(orr({ id = 'g001ig0128', min = 1, max = 1 }, { id = 'g001ig0560', min = 1, max = 1 }), orr({ id = 'g001ig0125', min = 1, max = 1 }, { id = 'g001ig0547', min = 1, max = 1 })), --���� ������/�����������, ���� �����/����� ����������� �������
					}
				}
}
end

function Pred1Zone52()
return { -- ������ �3
			count = 1,
			subraceTypes = NoUndead(),
			value = Pred1Zone5Value,
				loot = {
					itemTypes = { Item.Scroll },
					value = { min = 550, max = 550 },
					itemValue = { min = 550, max = 550 }, 
					items = {
					orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --���/���100
						{ id = 'g001ig0378', min = 1, max = 1}, --���75
						{ id = 'g000ig0012', min = 1, max = 1 }, --���30
						{ id = 'g001ig0036', min = 1, max = 1 }, --������
					}
				}
}
end

function Pred1Zone53()
return { -- �����400-800
			count = 1,
			subraceTypes = NoUndead(),
			value = Pred1Zone5Value,
				loot = {
					itemTypes = { Item.Orb },
					value = { min = 450, max = 740 }, -- ����� 450-700
					itemValue = { min = 450, max = 740 }, 
					items = {
					orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --���/���100
						{ id = 'g001ig0378', min = 1, max = 1}, --���75
						{ id = 'g000ig7003', min = 1, max = 1 }, --�������150
						{ id = 'g001ig0128', min = 1, max = 1 }, --������
					}
				}
}
end
	
function Pred1Zone5D() 
return { --2000��*1 -- �����500*2
			count = 1,
			subraceTypes = NoUndead(),
			value = { min = 2000*kef, max = 2100*kef },
				loot = {
					itemTypes = { Item.PotionPermanent }, -- 2 ����� 500-700
					value = { min = 1000, max = 1240 },
					itemValue = { min = 500, max = 740 }, 
					items = {
						{ id = 'g000ig0001', min = 1, max = 1 }, --���
						{ id = 'g000ig0006', min = 1, max = 2 }, --���100
						{ id = 'g001ig0152', min = 1, max = 1 }, --���300
						
					}
				}
}
end
	
-------------------------

-- ������ ��������
function guard0() -- ����0
return {
	value = { min = 150*kef, max = 165*kef },
	loot = {
		itemTypes = { Item.Valuable },
		value = { min = 250, max = 250 },
		itemValue = { min = 250, max = 250 },
		items = {
			{ id = 'g001ig0180', min = 1, max = 2}, -- ���25
		},
	}
}
end

function guard1() -- ����1 --����� 250-375
return {
	value = { min = 200*kef, max = 220*kef },
	loot = {
		itemTypes = { Item.Valuable },
		value = { min = 250, max = 400 },
		itemValue = { min = 250, max = 400 },
		items = {
			{ id = 'g000ig0005', min = 1, max = 1}, -- ���50
		},
	}
}
end

function guard2() -- ����2 --����� 375-500
return {
	value = { min = 300*kef, max = 330*kef },
	loot = {
		itemTypes = { Item.Valuable },
		value = { min = 375, max = 525 },
		itemValue = { min = 375, max = 525 },
		items = {
			{ id = 'g001ig0378', min = 1, max = 1}, -- ���75
		},
	}
}
end

function guard2n() -- ����2 ���.
return {
	value = { min = 350*kef, max = 385*kef },
	loot = {
		items = {
			{ id = 'g000ig0006', min = 1, max = 1}, -- ���100
			{ id = b15(), min = 1, max = 1 }, --����. ����� �� 15
		},
	}
}
end

function guard2m() -- ����2 �����
return {
	value = { min = 350*kef, max = 385*kef },
	loot = {
		items = {
			orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --���/���100
			{ id = w15(), min = 1, max = 1 }, --����. ���� ����.
		},
	}
}
end

function guard3m() -- ����3 �����
return {
	value = { min = 850*kef, max = 890*kef },
	loot = {
		items = {
			orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --���/���100
			orr({ id = 'g001ig0432', min = 1, max = 1 }, { id = rms(), min = 1, max = 1 }), --�������125/����. ��� �����			
			{ id = b15(), min = 1, max = 1}, -- ����. �����15
			{ id = w15(), min = 1, max = 1}, -- ����. ����
		},
	},
}
end

function guard3() -- ����3 --����� 500-625
return { 
	value = { min = 400*kef, max = 440*kef },
	loot = {
		itemTypes = { Item.Valuable },
		value = { min = 500, max = 650 },
		itemValue = { min = 500, max = 650 },
		items = {
			{ id = 'g000ig0006', min = 1, max = 1}, --���100
		},
	}
}
end

function guard3n() -- ����3 ���.
return {
	value = { min = 600*kef, max = 660*kef },
	loot = {
		items = {
				{ id = 'g000ig0001', min = 1, max = 1 }, --���
				{ id = b15(), min = 1, max = 1 }, --����. ����� �� 15
		},
	}
}
end

------------------

-- ������� ������ ������� ����� ������ 2-4
function zoneGuardZone0()
return {
	subraceTypes = { Subrace.NeutralDragon, Subrace.Human, Subrace.Heretic, Subrace.Dwarf, Subrace.Elf }, -- Subrace.Undead, �����
	value = { min = 1615*kef, max = 1695*kef }, --
	loot = {
		value = { min = 500, max = 740 },
		itemValue = { min = 500, max = 740 },
		itemTypes = { Item.PotionPermanent },
		items = {
			{ id = 'g000ig0001', min = 2, max = 2 },
			{ id = 'g000ig0006', min = 2, max = 2 },
			{ id = rms(), min = 1, max = 1 }, --����. ��� �����			
			orr({ id = 'g000ig7005', min = 1, max = 1 }, { id = rms(), min = 1, max = 1 }), --�����/����. ��� �����
--			orr({ id = 'g001ig0125', min = 1, max = 1 }, { id = 'g001ig0036', min = 1, max = 1 }), --������/������
			orr({ id = 'g000ig0018', min = 1, max = 1 }, { id = 'g001ig0128', min = 1, max = 1 }), --����/�.������
			{ id = p05(), min = 1, max = 1}, -- ����. �����-������� �� 5%
		}
	}
}
end

-- ������� ������ ������� ����� ������ 3-4
function zoneGuardZone()
return {
	subraceTypes = { Subrace.NeutralDragon, Subrace.Human, Subrace.Heretic, Subrace.Dwarf, Subrace.Elf }, -- Subrace.Undead, �����
	value = { min = 1700*kef, max = 1780*kef }, --
	loot = {
		value = { min = 500, max = 740 },
		itemValue = { min = 500, max = 740 },
		itemTypes = { Item.PotionPermanent },
		items = {
			{ id = 'g000ig0001', min = 2, max = 2 },
			{ id = 'g000ig0006', min = 2, max = 2 },
			{ id = rms(), min = 1, max = 1 }, --����. ��� �����			
			orr({ id = 'g000ig7004', min = 1, max = 1 }, { id = rms(), min = 1, max = 1 }), --������200/����. ��� �����
			orr({ id = 'g001ig0125', min = 1, max = 1 }, { id = 'g001ig0036', min = 1, max = 1 }), --������/������
			orr({ id = 'g000ig0018', min = 1, max = 1 }, { id = 'g001ig0128', min = 1, max = 1 }), --����/�.������
			{ id = p05(), min = 1, max = 1}, -- ����. �����-������� �� 5%
		}
	}
}
end

-- �� ������� ����� ������ �����-������� -- �� ������������
function zoneGuardZoneR()
return {
	subraceTypes = { Subrace.NeutralDragon, Subrace.Human, Subrace.Heretic, Subrace.Dwarf, Subrace.Elf }, -- Subrace.Undead, �����
	value = { min = 2700*kef, max = 2800*kef },
	loot = {
		value = { min = 1450, max = 1800 },
		itemValue = { min = 1450, max = 1800 },
		itemTypes = { Item.Weapon, Item.Armor, Item.Jewel, Item.Banner },
		items = {
			{ id = 'g000ig0001', min = 2, max = 2 },
			{ id = 'g000ig0006', min = 2, max = 2 },
			{ id = 'g000ig0018', min = 1, max = 1 }, --����
			orr({ id = 'g001ig0090', min = 1, max = 1 }, { id = 'g001ig0282', min = 1, max = 1 }), --������/�.��� �����
			orr({ id = 'g000ig6015', min = 1, max = 1 }, { id = 'g000ig6014', min = 1, max = 1 }), --����� ����������/����� ������
			orr(orr({ id = 'g001ig0172', min = 1, max = 1 },{ id = 'g001ig0181', min = 1, max = 1 }), orr({ id = 'g000ig9004', min = 1, max = 1 },{ id = 'g000ig9008', min = 1, max = 1 })), -- ����� �.���� / ������  | ����������� / �������� 
			orr({ id = 'g000ig0008', min = 2, max = 3 }, { id = 'g000ig0002', min = 2, max = 3 }), --15��������/������
		}
	}
}
end

----------------------


-- ������� �������

-- ������ ������� � ��������� ����� 0
function getPlayerZone00(zoneId, playerRace, zoneSize)
	return {
		id = zoneId,
		type = Zone.PlayerStart,
		race = playerRace,
		size = zoneSize,
		mines = getMinesRespZ(playerRace),
		ruins = zoneRuinRespZ0(),
		bags = bagsResp00(),
		stacks = {zoneStacksRespZ00(), zoneStacksRespZ001(), zoneStacksRespZ002(), PredSkin(135, 145, 100, 100), PredSkin(145, 155, 100, 100)},
		merchants = zoneMerchRespZ0(),

		capital = {
			garrison = { -- �������
				subraceTypes = { getPlayerSubRace(playerRace) },
				value = { min = 50, max = 50 },
				loot = {
--					itemTypes = { Item.PotionBoost },
--					value = { min = 1500, max = 1500 },
--					itemValue = { min = 150, max = 250 },
					items = {
						{ id = 'g000ig0001', min = 4, max = 4}, --���
						{ id = 'g000ig0006', min = 4, max = 4}, --���100
						{ id = 'g001ig0378', min = 3, max = 3}, --���75
						{ id = 'g000ig0005', min = 5, max = 5}, -- ���50
						{ id = 'g001ig0180', min = 6, max = 6}, -- ���25

						{ id = b15(), min = 1, max = 1}, -- ����. �����15
						{ id = b15(), min = 1, max = 1}, -- ����. �����15
						{ id = b15(), min = 1, max = 1}, -- ����. �����15
						{ id = b15(), min = 1, max = 1}, -- ����. �����15
						{ id = b15(), min = 1, max = 1}, -- ����. �����15
						{ id = 'g000ig0011', min = 1, max = 1 }, --���15

						{ id = w15(), min = 1, max = 1}, -- ����. ����
						{ id = w15(), min = 1, max = 1}, -- ����. ����
						{ id = w15(), min = 1, max = 1}, -- ����. ����
						{ id = w15(), min = 1, max = 1}, -- ����. ����
						{ id = 'g000ig0021', min = 1, max = 1 }, --����
						
						{ id = d15(), min = 1, max = 1}, -- ����. �������
						{ id = d15(), min = 1, max = 1}, -- ����. �������
						
--						orr(orr({ id = 'g001ig0301', min = 1, max = 1}, { id = 'g001ig0300', min = 1, max = 1}), orr({ id = 'g001ig0302', min = 1, max = 1}, { id = 'g001ig0299', min = 1, max = 1})), -- 25 ����� ����.���� / ���� | ����� / �����
						orr(orr({ id = 'g001ig0187', min = 1, max = 1}, { id = 'g001ig0190', min = 1, max = 1}), orr({ id = 'g001ig0188', min = 1, max = 1}, { id = 'g001ig0189', min = 1, max = 1})), -- 50 ����� ���.���� / ������ | ������ / ���������

						{ id = rcry(playerRace), min = 1, max = 1 }, --��������
						{ id = ExtraMana(playerRace), min = 1, max = 1 }, --���.���
												
						orr(orr({ id = 'g000ig5021', min = 1, max = 1}, { id = 'g000ig5003', min = 1, max = 1}), orr({ id = 'g001ig0250', min = 1, max = 1}, { id = 'g000ig5023', min = 1, max = 1})), -- ������ �.���, ����, �.�����, �.������
						orr(orr({ id = 'g001ig0248', min = 1, max = 1}, { id = 'g000ig5045', min = 1, max = 1}), orr({ id = 'g000ig5064', min = 1, max = 1}, { id = 'g000ig5101', min = 1, max = 1})), -- ������ ����. ����, tormentio-�����, ��������, ����  
					}
				},
			},
			spells = {
				CapSpell(playerRace)
			}			
		}
	}
end

-- ������ ������� � ��������� ���� 1
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
		stacks = {Pred1RespZ0(), Pred1RespZ01(), Pred1RespZ02(), Pred1RespZ03(), Pred1RespZD(), PredSkin(210, 220, 200, 225), PredBarb(220,230,100,200)},

	}
end

-- ����: ������ ������� � ��������� ���� 2
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
		stacks = {zoneStacksResp(), zoneStacksResp1(), Pred1Resp01(), Pred1Resp1(), Pred1Resp2(), Pred1Resp3(), Pred1Resp4(), Pred1Resp5(), Pred1RespD(), PredSkin(390, 400, 200, 250), PredBarb(480,484,210,400)},
		bags = bagsResp(),
	}
end

-- ������ ������� � ��������� ���� 3
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
		mages = zoneMageZone34(),
		mercenaries = zoneMercenZone(),
		stacks = {zoneStacksZone34(), Pred1Zone1(), Pred1Zone2(), Pred1Zone3(), Pred1Zone4(), Pred1ZoneD(), PredBarb(770,774,400,550) },
		bags = bagsZone34(),
	}
end

-- ������ ������� � ��������� ���� 4
function getTreasureZone5(zoneId, playerRace, playerRace2, zoneSizeTre)
	return {

		race = playerRace,
		race2 = playerRace2,
		
	id = zoneId,
		type = Zone.Treasure,  -- Junction -- Treasure
		size = zoneSizeTre,
		towns = zoneTownsZone5(),
		merchants = zoneMerchZone5(),
		ruins = zoneRuinZone5(),
		mines = getMinesZone5(playerRace, playerRace2),
		stacks = {zoneStacksZone5(), Pred1Zone51(), Pred1Zone52(), Pred1Zone53(), Pred1Zone5D(), PredBarb(1550,1600,550,600) },
		bags = bagsZone5(),
		--mages = zoneMageZone5(),
	}
end

-------------------------------------------------


-- ������� ���: ������ ������� � ������
function getZones(races)
	local zones = {}

	zones[1] = getPlayerZone00(0, races[1], 6) -- ������� 8 �1+�1+�2+�2(1)=50
	zones[2] = getPlayerZone0(1, races[1], 8) -- ������ 10 �1+�1+�2+�2(1)=50
	zones[3] = getPlayerZone(2, 14) -- ����� 21 �1+�2+�2+�1+�1+�6(3)=100
	zones[4] = getTreasureZone34(3, races[1], 12) -- ����� 19 �1+�1+�2+�1+�1+�5(2.5)=85
	zones[5] = getTreasureZone5(4, races[1], races[2], 10) -- ������ 14 �1+�1+�3+�3(1.5)=65
	zones[6] = getTreasureZone34(5, races[2], 12) -- ����� 19
	zones[7] = getPlayerZone(6, 14) -- ����� 21
	zones[8] = getPlayerZone0(7, races[2], 8) -- ������� 10
	zones[9] = getPlayerZone00(8, races[2], 6) -- ��������� 8
	return zones
end

----------------------

-- �������: ������ ������� � ��������� ����� ������:
function getZoneConnections()
	return {

{from = 4, to = 2, guard = zoneGuardZone0()}, 
{from = 4, to = 3, guard = zoneGuardZone()}, 	
	
{from = 4, to = 6, guard = zoneGuardZone0()}, 
{from = 4, to = 5, guard = zoneGuardZone()}, 

{from = 1, to = 0}, {from = 1, to = 0}, {from = 1, to = 0}, {from = 1, to = 0}, {from = 1, to = 0}, 
{from = 1, to = 0}, {from = 1, to = 0}, {from = 1, to = 0}, {from = 1, to = 0}, {from = 1, to = 0}, 
{from = 1, to = 0}, {from = 1, to = 0}, {from = 1, to = 0}, {from = 1, to = 0}, {from = 1, to = 0}, 

{from = 1, to = 2}, {from = 1, to = 2}, {from = 1, to = 2}, {from = 1, to = 2}, {from = 1, to = 2}, 
{from = 1, to = 2}, {from = 1, to = 2}, {from = 1, to = 2}, {from = 1, to = 2}, {from = 1, to = 2}, 
{from = 1, to = 2}, {from = 1, to = 2}, {from = 1, to = 2}, {from = 1, to = 2}, {from = 1, to = 2}, 

{from = 2, to = 3}, {from = 2, to = 3}, {from = 2, to = 3}, {from = 2, to = 3}, {from = 2, to = 3}, 
{from = 2, to = 3}, {from = 2, to = 3}, {from = 2, to = 3}, {from = 2, to = 3}, {from = 2, to = 3}, 
{from = 2, to = 3}, {from = 2, to = 3}, {from = 2, to = 3}, {from = 2, to = 3}, {from = 2, to = 3}, 

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

-- ������ �������� ����������� �������� ��� ���������� - ��
function getTemplateContents(races)
	local contents = {}
	
	contents.zones = getZones(races)
	contents.connections = getZoneConnections()

	return contents
end

-- ������
template = {
	name = gmm('Outrunner 2.3f', 'Outcross 2.3f'),
	description = gmm('������ ��� ���� 1 ������, 1 ����������, 1 �����. ������ ���� ������ ��������: �����, ������, �����, �����.', '������ ��� ������������ ����. ������ ���� ������ ��������: �����, ������, �����, �����.'),
	minSize = 72,
	maxSize = 72,
	maxPlayers = 2,
	startingGold = gmm(600,1100),
	startingNativeMana = gmm(100,300),
	roads = gmm(45,40), --45,41
	forest = gmm(40,40), --42,40

forbiddenUnits = {

'g000uu8266', -- �������--
'g000uu8265', -- ���� �������--
'g000uu8210', --��������� ��� �.--
'g000uu8209', --��������� ���--
--���
'g000uu8217', -- ���������� ������
'g000uu8269', -- �������� ������


},

forbiddenItems = {

'g001ig0414', --����������� ������� ������ (��������)--
'g000ig3015', --�������� ���� (��������)--
'g000ig3016', --��� ������ (��������)--
'g001ig0154', --����� ����������--
'g001ig0158', --��������� ����� (��������)--
'g000ig3021', --������ �������� (��������)--
'g001ig0023', --���� ���������������--
'g001ig0017', --����� ���� �����--
'g000ig9007', --����� ��������--
'g000ig9040', --����� �����--
'g001ig0296', --����� ����������--
'g000ig5006', -- ������ "���������"--
'g000ig5100', --������ "��������"--
'g000ig5113', -- ������ "�����"--
'g000ig5099', --������ "����������"--
'g000ig2007', --������ �������--
'g001ig0275', -- ����� �����������������--
'g000ig5027', --������ ������������
'g000ig1011', --������ ������������
'g001ig0044', --������ ������ (��������)
--���
'g001ig0195', --������ "����������" (��� ������� �� �����)
'g000ig9125', --�������� ������� --�2 �������� �� �� ���� (����� ��-�� ���� �1 - ����� 400)
'g001ig0048', --������ ������� (��������) (40% �����������, ������ �� ����) --����� �� ��� ����
'g001ig0092', --������ "������� ����" �� 400 � ����� ����� ����
'g001ig0562', -- ����� �������� (���� ����� �� �����)
'g000ig9129', -- �������� ���������� ����� (����� ��-�� ���� �1)
'g001ig0439', -- ������ "Et seminibus discordiae - ��������� ��������� �� 1 � ������� 5x5 (�� ��� ���������)

},
	
	getContents = getTemplateContents
}