-- ��: 	!������ ���� ��������: �����, �����, �����, �����.

---------------
-- ���������

-- ����������� ��������� (<0.9 �����; 0.9-1.1 ������; >1.1 ������)
local kef = 1

-- ����������� �������� ���� ���������
local kr = 1.05

---------------
-- ��� �������

--����� ����� � ���� 1
function zoneMageResp1()
	return {
		{
			spells = { 	
						yn('g000ss0002'), -- ��������
						yn('g000ss0007'), -- ���������
						yn('g000ss0178'), -- ������� --��
		
						yn('g000ss0025'), -- ������ I: ���
						yn('g000ss0023'), -- ���� ������

						yn('g000ss0045'), -- tormentio
						yn('g000ss0044'), -- Menta minoris

						yn('g000ss0134'), -- ��������� ����
						yn('g000ss0064'), -- ��������

						yn('g000ss0101'), -- ����
						yn('g000ss0098'), -- ������ I: ��� �����
						
						yn('g000ss0183'), -- ����������
						yn('g000ss0197'), -- ��������������
						yn('g000ss0131'), -- ������������� �c�����
						
						yn('g000ss0029'), -- ������ ���������
						yn('g000ss0184'), -- �����.�����
						yn('g000ss0034'), -- ������������� ������ --���
						
						yn('g000ss0050'), -- Chronos
						yn('g000ss0185'), -- terebrare corde
						yn('g000ss0122'), -- ����������� �����

						yn('g000ss0186'), -- �������� �����
						yn('g000ss0069'), -- ��������� ��������
						yn('g000ss0124'), -- �������� �����������

						yn('g000ss0187'), -- ����������
						yn('g000ss0133'), -- ����� ����
						yn('g000ss0107'), -- ����� ������� --��
					
			},			
--�����			guard = guard2m()
		},
	}
end


--����� ����� � ���� 3
function zoneMageResp()
	return {
		{
			spells = {
						
						yn3('g000ss0013'), -- ������ ���� +15 ���� � ����
						yn3('g000ss0026'), -- ���� ������ +15 ���
						yn3('g000ss0089'), -- Preces -15 ���� � ����
						yn3('g000ss0074'), -- ����� ������
						yn3('g000ss0108'), -- ������ III: ��� �������

						yn3('g000ss0082'), -- ������������� ���������� +20%�� +5 ����� 1200
						yn3('g000ss0114'), -- �������

						yn3('g000ss0079'), -- ������ �� ������

						yn3('g000ss0207'), -- ����������� ����� -���� ����
						yn3('g000ss0208'), -- ����� -���� �����				

						yn3('g000ss0144'), -- ����������
						
			},			
--�����			guard = guard2m()
		},
		-- ����� �
		{
			spells = {

						yn3('g000ss0012'), -- ������ ����� + 15 �����
						yn3('g000ss0031'), -- ������ II: ���������
						yn3('g000ss0199'), -- Terra oblivionem -25����
						yn3('g000ss0073'), -- ������������� ������ +20% ��
						yn3('g000ss0111'), -- ���������� -15 ���� � ����

						yn3('g000ss0091'), -- Tempus status -33 ��� 1200
						yn3('g000ss0116'), -- ������������� ������� +50��
						
						yn3('g000ss0039'), -- �������������

						yn3('g000ss0206'), -- Dominatum ignis -���� �����
						yn3('g000ss0209'), -- �������� ����� -���� ������

						yn3('g000ss0145'), -- �����

			},			
--�����			guard = guard3m()
		}
	}
end

----------------------

-- ����� �1

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
					{ id = 'g000ig0001', min = 1, max = 1 }, --���
					{ id = 'g000ig0006', min = 1, max = 1 }, --���100
					orr({ id = 'g001ig0180', min = 2, max = 2 }, { id = 'g000ig0005', min = 1, max = 1 }), --2���25/���50
--					{ id = 'g001ig0431', min = 1, max = 1 }, --������75
					orr({ id = ExtraManaProject4(race), min = 1, max = 1 }, { id = 'g000ig7002', min = 1, max = 1 }), --���.��� / ������100
					orr3({ id = 'g001ig0530', min = 1, max = 1}, { id = 'g001ig0531', min = 1, max = 1}, { id = p05(), min = 1, max = 1}), -- ����� ����������� ���� (������) / ����� ����� (������) / ����. ����� 5%
					{ id = b15(), min = 1, max = 1 },
					{ id = e4(), min = 1, max = 1 },
				}
			}
		}
	}
	}
end

-- ����� 2
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
					{ id = 'g000ig0001', min = 1, max = 1 }, --���
					{ id = 'g000ig0006', min = 1, max = 1 }, --���100
					orr({ id = 'g000ig0006', min = 1, max = 1 }, { id = 'g000ig0005', min = 2, max = 2 }), --���100/2���50		
--					{ id = 'g001ig0432', min = 1, max = 1 }, --�������125
					orr3({ id = ExtraManaProject4(race), min = 1, max = 1 }, { id = ExtraHomeMana(race), min = 1, max = 1 }, { id = 'g000ig7003', min = 1, max = 1 }), -- ���.��� / ������ ��� / �������150
					orr3({ id = 'g001ig0529', min = 1, max = 1}, { id = 'g001ig0528', min = 1, max = 1}, { id = p05(), min = 1, max = 1}), -- ������� ���������� ���� (�����) / ������� ���� (������) / ����. ����� 5%
					orr({ id = b15(), min = 1, max = 1 }, { id = w15(), min = 1, max = 1 }), -- ����. �����15 / ����. ����
					{ id = pw5(), min = 1, max = 1 },
				}
			}
		}
	},
	}
end

-- ����� 3
function zoneTownsZone3()
	return {
	{
		tier = 1,
		stack = {
			subraceTypes = { Subrace.NeutralDragon, Subrace.Human, Subrace.Heretic, Subrace.Dwarf, Subrace.Elf }, -- Subrace.Undead, �����
			value = { min = 950*kef, max = 950*kef*kr },
			loot = {
				itemTypes = { Item.Scroll, Item.Orb },
				value = { min = 700, max = 800 },
				itemValue = { min = 700, max = 800 },
				items = {
					{ id = 'g000ig0001', min = 1, max = 1 }, --���
					{ id = 'g000ig0006', min = 2, max = 2 }, --���100
					orr({ id = 'g000ig0006', min = 1, max = 1 }, { id = 'g000ig0005', min = 2, max = 2 }), --���100/2���50
--					{ id = 'g001ig0433', min = 1, max = 1 }, --���������175					
					orr({ id = rmsb(), min = 1, max = 1 }, { id = 'g000ig7005', min = 1, max = 1 }), --����. ������� ��� ����� / �����250
					orr(orr({ id = 'g001ig0563', min = 1, max = 1}, { id = 'g001ig0035', min = 1, max = 1}), orr({ id = 'g001ig0019', min = 1, max = 1}, { id = 'g001ig0506', min = 1, max = 1})),	-- ���� �������������� +5 ���� / ������� ���� ��������� ���� +30�� / ����� ���� ���������� +10���� / �������� ������� +1�����	
					{ id = b30(), min = 1, max = 1 }, -- ����. �����30
					{ id = pw6(), min = 1, max = 1 },
				}
			}
		}
	}
	}
end

----------------------

-- ����� �1
function zoneMerch1() -- ������ 400
return {
	{
		goods = {
			itemTypes = { Item.Scroll },
			value = { min = 800, max = 800 },
			itemValue = { min = 400, max = 400 },
			items = {
				{ id = 'g000ig0001', min = 3, max = 4 },
				{ id = 'g000ig0006', min = 3, max = 4 },
				{ id = 'g001ig0378', min = 4, max = 5 }, --���75
				{ id = 'g000ig0005', min = 5, max = 7 },
				{ id = 'g001ig0180', min = 7, max = 10 },

				{ id = 'g000ig0002', min = 1, max = 2 }, --15�
				{ id = 'g000ig0014', min = 1, max = 1 }, --15�
				{ id = 'g000ig0011', min = 1, max = 2 }, --15�
				{ id = 'g000ig0008', min = 1, max = 1 }, --15�

				{ id = 'g000ig0021', min = 1, max = 2 }, -- ���� �
				{ id = 'g000ig0022', min = 1, max = 1 }, -- ���� �
				{ id = 'g000ig0023', min = 1, max = 1 }, -- ���� �
				{ id = 'g000ig0024', min = 1, max = 2 }, -- ���� �

				orr({ id = 'g001ig0125', min = 1, max = 1 }, { id = 'g001ig0036', min = 1, max = 1 }), --������/������

				{ id = d15(), min = 1, max = 1 }, -- ����. �������

				{ id = e2(), min = 1, max = 1},
				{ id = e2(), min = 1, max = 1},
				{ id = e4(), min = 1, max = 1},				
				
				orr({ id = 'g001ig0533', min = 1, max = 1 }, { id = 'g001ig0006', min = 1, max = 1 }), -- ����� ������ ����� (+2 ������) / ������� ���������� (-50 ���� �� ��� ��-��)
				orr({ id = 'g001ig0027', min = 1, max = 1 }, { id = 'g000ig0013', min = 1, max = 1 }), -- ���� ����� +5 ����� ��� / ������� ������������ +10 ���
				orr({ id = 'g001ig0130', min = 1, max = 1 }, { id = 'g001ig0561', min = 1, max = 1 }), -- ������� ����������� +20 / ������� �����������������
				
				{ id = 'g001ig0530', min = 1, max = 1 }, -- ����� ����������� ���� (���������)
				orr({ id = 'g001ig0531', min = 1, max = 1 }, { id = 'g001ig0497', min = 1, max = 1 }), -- ����� ����� (������) / ����� ���������� (������)
				orr({ id = 'g001ig0526', min = 1, max = 1 }, { id = 'g001ig0527', min = 1, max = 1 }), -- ����� ���������� (������) / ����� ���������� (��������)	

				orr(orr({ id = 'g000ig3001', min = 1, max = 1}, { id = 'g000ig2001', min = 1, max = 1}), orr({ id = 'g001ig0100', min = 1, max = 1}, { id = 'g001ig0101', min = 1, max = 1})), -- ������ ������ (��������) / ������ ������ (��������) | ��� ���� (��������) / ����� ���� (��������)				
				yn({ id = 'g001ig0611', min = 1, max = 1 }), -- ���� ������������ (��������)
				yn({ id = 'g001ig0421', min = 1, max = 1 }), -- ������ ����� (��������)
				yn({ id = 'g001ig0610', min = 1, max = 1 }), -- ����� ����� (��������)
				yn({ id = 'g002ig0001', min = 1, max = 1 }), -- �������� ������ (��������)
				yn({ id = 'g001ig0609', min = 1, max = 1 }), -- ��������� ������ (��������)
				yn({ id = 'g001ig0418', min = 1, max = 1 }), -- ���� ������ ������ (��������)

				yn({ id = 'g000ig2002', min = 1, max = 1 }), -- ��.����
				yn({ id = 'g000ig3002', min = 1, max = 1 }), -- �.����
				yn({ id = 'g001ig0182', min = 1, max = 1 }), -- ������. �����
				yn({ id = 'g000ig3017', min = 1, max = 1 }), -- ����. ����.
				yn({ id = 'g001ig0048', min = 1, max = 1 }), -- ������ ������� (��������)
				yn({ id = 'g001ig0487', min = 1, max = 1 }), -- ������ ������ ������� (��������)650
				yn({ id = 'g001ig0559', min = 1, max = 1 }), -- ���� ������������ ��� (��������) 700
				yn({ id = 'g001ig0557', min = 1, max = 1 }), -- ��� �������������� (��������) 700
				yn({ id = 'g001ig0558', min = 1, max = 1 }), -- ��� ��������� (��������) 700
				yn({ id = 'g001ig0594', min = 1, max = 1 }), -- ��� ������������� (��������) 700
				
				yn({ id = 'g001ig0426', min = 1, max = 1 }), -- ������ �������� (��������)
				yn({ id = 'g001ig0104', min = 1, max = 1 }), -- ��� �������
				yn({ id = 'g000ig3022', min = 1, max = 1 }), -- �.�����650
				yn({ id = 'g000ig4003', min = 1, max = 1 }), -- ����� �����
				yn({ id = 'g001ig0605', min = 1, max = 1 }), -- ����� ����������600		
				yn({ id = 'g000ig3020', min = 1, max = 1 }), -- ����� ��������500
				
				--������
				orr(orr({ id = 'g001ig0105', min = 1, max = 1 }, { id = 'g001ig0107', min = 1, max = 1 }), orr({ id = 'g001ig0108', min = 1, max = 1 }, { id = 'g001ig0106', min = 1, max = 1 })), -- �������� ������ / ������ ������ / ������ ������ / ������ ���������
				orr({ id = 'g001ig0113', min = 1, max = 1 }, { id = 'g001ig0110', min = 1, max = 1 }), -- ������ ������ / �����	

				--�����
				orr(orr({ id = 'g001ig0383', min = 1, max = 1 }, { id = 'g001ig0387', min = 1, max = 1 }), orr({ id = 'g000ig6001', min = 1, max = 1 }, { id = 'g000ig6003', min = 1, max = 1 })), -- ����� ������ ������� (����� ���) / ����� ��������� (�������� �� ����) / ����� ����� (15 �����) / ����� ��������+30��
				orr(orr({ id = 'g001ig0394', min = 1, max = 1 }, { id = 'g000ig6012', min = 1, max = 1 }), orr({ id = 'g001ig0395', min = 1, max = 1 }, { id = 'g001ig0399', min = 1, max = 1 })), -- ����� �������� �������+10����� / ����� ��������+10��� / ����� ���������� ������+10����� / ����� �������-10���

				--�����
				yn({ id = 'g001ig0458', min = 1, max = 1}), -- ����� ��������� ��������� 100
				yn({ id = 'g000ig9031', min = 1, max = 1}), -- ����� ����� 100
				yn({ id = 'g000ig9022', min = 1, max = 1}), -- ����� ����� 100
				yn({ id = 'g001ig0302', min = 1, max = 1}), -- ����� ������ 100
				yn({ id = 'g001ig0189', min = 1, max = 1}), -- ����� ����� 100
				yn({ id = 'g001ig0178', min = 1, max = 1}), -- ����� ������ 100
				yn({ id = 'g001ig0472', min = 1, max = 1}), -- ����� �������� ������� 100
				yn({ id = 'g001ig0473', min = 1, max = 1}), -- ����� ������������ ������� 100
				yn({ id = 'g001ig0470', min = 1, max = 1}), -- ����� ���������� 100
				yn({ id = 'g001ig0192', min = 1, max = 1}), -- ����� ����� 100
				yn({ id = 'g000ig9033', min = 1, max = 1}), -- ����� ���� 100	
				yn({ id = 'g001ig0133', min = 1, max = 1 }), -- ����� ����� I +15�����-1 200
				yn({ id = 'g001ig0446', min = 1, max = 1 }), -- ����� ���������� I +20����-1 200
				yn({ id = 'g000ig9017', min = 1, max = 1 }), -- ����� �������������� 30���-��� 200
				yn({ id = 'g001ig0471', min = 1, max = 1 }), -- ����� �������� 40�����-1 200
				yn({ id = 'g001ig0464', min = 1, max = 1 }), -- ����� ���������� ������� I -15�����-1 200
				yn({ id = 'g001ig0450', min = 1, max = 1 }), -- ����� ����� I +20����-1 200	

				--�����
				yn({ id = 'g000ig1001', min = 1, max = 1 }), -- ����� ������400
				yn({ id = 'g001ig0051', min = 1, max = 1 }), -- ����� ������400
				yn({ id = 'g000ig1007', min = 1, max = 1 }), -- ����� ����400
				yn({ id = 'g000ig1005', min = 1, max = 1 }), -- ����� ��������400
				yn({ id = 'g000ig1003', min = 1, max = 1 }), -- ����� ��������400
				yn({ id = 'g001ig0370', min = 1, max = 1 }), -- ����� ������������ �����600
				yn({ id = 'g001ig0369', min = 1, max = 1 }), -- ����� ������� �����600

				--�����
				orr3({ id = 'g001ig0184', min = 1, max = 1 }, { id = 'g000ig9109', min = 1, max = 1 }, { id = 'g000ig9120', min = 1, max = 1 }), -- �������� �������������� 400 / �������� ������� ��������� II 450 / �������� ���� ������ 500
				
				--������
				orr(orr({ id = 'g000ig5021', min = 1, max = 1}, { id = 'g000ig5003', min = 1, max = 1}), orr({ id = 'g001ig0250', min = 1, max = 1}, { id = 'g000ig5023', min = 1, max = 1})), -- ������ �.���, ����, �.�����, �.������
				orr(orr({ id = 'g001ig0248', min = 1, max = 1}, { id = 'g000ig5045', min = 1, max = 1}), orr({ id = 'g000ig5064', min = 1, max = 1}, { id = 'g000ig5101', min = 1, max = 1})), -- ������ ����. ����, tormentio-�����, ��������, ����
				orr({ id = 'g000ig5007', min = 1, max = 1 }, { id = 'g000ig5029', min = 1, max = 1 }), -- ��. ��������� / ���. ���������
			}
		},
--�����			guard = guard1(),
	}
}
end

-- ����� �2
function zoneMerch2() -- ������ 550
return {
	{
		goods = {
			itemTypes = { Item.Scroll },
			value = { min = 1100, max = 1100 },
			itemValue = { min = 550, max = 550 },
			items = {
				{ id = 'g000ig0001', min = 5, max = 6 },
				{ id = 'g000ig0006', min = 5, max = 6 },
				{ id = 'g001ig0378', min = 6, max = 7}, --���75
				{ id = 'g000ig0005', min = 7, max = 10 },
				{ id = 'g001ig0180', min = 7, max = 10 },
				
				{ id = 'g000ig0002', min = 1, max = 1 }, --15�
				{ id = 'g000ig0014', min = 1, max = 2 }, --15�
				{ id = 'g000ig0011', min = 1, max = 1 }, --15�
				{ id = 'g000ig0008', min = 1, max = 2 }, --15�

				{ id = 'g000ig0021', min = 1, max = 1 }, -- ���� �
				{ id = 'g000ig0022', min = 1, max = 2 }, -- ���� �
				{ id = 'g000ig0023', min = 1, max = 2 }, -- ���� �
				{ id = 'g000ig0024', min = 1, max = 1 }, -- ���� �

				orr({ id = 'g001ig0125', min = 1, max = 1 }, { id = 'g001ig0036', min = 1, max = 1 }), --������/������
				
				{ id = d15(), min = 1, max = 1 }, -- ����. �������
				
				{ id = e4(), min = 1, max = 1},
				{ id = e4(), min = 1, max = 1},
				{ id = pw5(), min = 1, max = 1},

				orr({ id = 'g001ig0534', min = 1, max = 1 }, { id = 'g001ig0519', min = 1, max = 1 }), -- �������� ������������ ������� (����� �����) / ����� ��������� (-10 ����)				
				orr({ id = 'g000ig0004', min = 1, max = 1 }, { id = 'g001ig0028', min = 1, max = 1 }), -- ������� ��������� / ���� ������ 5�� ���
				orr({ id = 'g000ig0016', min = 1, max = 1 }, { id = 'g001ig0029', min = 1, max = 1 }), -- ������� ���� +10����� / ���� ���� +5����� ���
				
				orr({ id = 'g000ig4006', min = 1, max = 1 }, { id = 'g001ig0529', min = 1, max = 1 }), -- ����� �.�. (�����) / ������� ���������� ����
				orr({ id = 'g001ig0494', min = 1, max = 1 }, { id = 'g001ig0528', min = 1, max = 1 }), -- ����� ��������� (������) / ������� ���� (������)
				orr({ id = 'g001ig0495', min = 1, max = 1 }, { id = 'g001ig0525', min = 1, max = 1 }), -- ����� �������� (������) / ������� �������� (���������)			

				yn({ id = 'g001ig0417', min = 1, max = 1 }), -- ���� �������� ������������ (��������) 800
				yn({ id = 'g001ig0045', min = 1, max = 1 }), -- ����.����800
				yn({ id = 'g000ig3003', min = 1, max = 1 }), -- ���.����800
				yn({ id = 'g001ig0042', min = 1, max = 1 }), -- ����� ������800
				yn({ id = 'g001ig0047', min = 1, max = 1 }), -- ���.����800		
				yn({ id = 'g001ig0196', min = 1, max = 1 }), -- ���.���800
				yn({ id = 'g001ig0582', min = 1, max = 1 }), -- ������ ���� (��������)800
				yn({ id = 'g001ig0416', min = 1, max = 1 }), -- ���� ����������� ������ (��������) 800
				yn({ id = 'g001ig0589', min = 1, max = 1 }), -- ��� ��������� (��������) 800
				yn({ id = 'g001ig0040', min = 1, max = 1 }), -- ���.����1000
				yn({ id = 'g001ig0657', min = 1, max = 1 }), -- ����� ������ (��������) 700
				
				yn({ id = 'g001ig0420', min = 1, max = 1 }), -- ������ ���� (��������)800
				yn({ id = 'g001ig0424', min = 1, max = 1 }), -- ����� ������ (��������) 750
				yn({ id = 'g001ig0422', min = 1, max = 1 }), -- �������� ������ (��������)700
				yn({ id = 'g000ig2006', min = 1, max = 1 }), -- ����� �������800
				yn({ id = 'g001ig0427', min = 1, max = 1 }), -- ��������� ������ (��������)600
				yn({ id = 'g001ig0423', min = 1, max = 1 }), -- ���� ��������� (��������)700
				yn({ id = 'g001ig0156', min = 1, max = 1 }), -- �.��������800
				yn({ id = 'g002ig0002', min = 1, max = 1 }), -- ������������ �������� (��������) 700
				yn({ id = 'g001ig0602', min = 1, max = 1 }), -- ������ ����� (��������)800
				
				orr({ id = 'g001ig0114', min = 1, max = 1 }, { id = 'g001ig0111', min = 1, max = 1 }), -- ������ ��� 500 / ������ ��� 500
				orr({ id = 'g001ig0115', min = 1, max = 1 }, { id = 'g001ig0112', min = 1, max = 1 }), -- ������ ���. �������1100 / ������ �����800 

				--�����
				orr(orr({ id = 'g001ig0406', min = 1, max = 1 }, { id = 'g001ig0392', min = 1, max = 1 }), orr({ id = 'g001ig0380', min = 1, max = 1 }, { id = 'g000ig6021', min = 1, max = 1 })), -- ����� ���������+���� / ����� ������ ������ (40 ����) / ����� ���� ������+����� / ����� ��� ����+���
				orr(orr({ id = 'g001ig0401', min = 1, max = 1 }, { id = 'g001ig0404', min = 1, max = 1 }), orr({ id = 'g001ig0403', min = 1, max = 1 }, { id = 'g000ig6019', min = 1, max = 1 })), -- ����� ��������� �����-15���� / ����� ��������-15����� / ����� ���������� ����+15�������� / ����� ������+�������

				--�����
				orr(orr({ id = 'g001ig0056', min = 1, max = 1 }, { id = 'g001ig0054', min = 1, max = 1 }), orr({ id = 'g001ig0055', min = 1, max = 1 }, { id = 'g001ig0053', min = 1, max = 1 })), -- ����� ������ ���� / ������� / ����� / ����
				yn({ id = 'g001ig0058', min = 1, max = 1 }), -- ����� ������ �� ����� ������ 400
				yn({ id = 'g001ig0057', min = 1, max = 1 }), -- ����� ������ �� ����� ������ 400				
				yn({ id = 'g001ig0187', min = 1, max = 1 }), -- ����� ������� 80���� 400
				yn({ id = 'g001ig0453', min = 1, max = 1 }), -- ����� ������ ����� 60���-���� 400
				yn({ id = 'g001ig0176', min = 1, max = 1 }), -- ����� ���������� II 40-1 400
				yn({ id = 'g001ig0456', min = 1, max = 1 }), -- ����� ������� 80 400
				yn({ id = 'g001ig0496', min = 1, max = 1 }), -- ����� ������� 80 400
				yn({ id = 'g000ig9042', min = 1, max = 1 }), -- ����� ������������� ���������� I -33����-1 400
				yn({ id = 'g001ig0475', min = 1, max = 1 }), -- ����� �������� �������� I-10�����-��� 400
				yn({ id = 'g000ig9018', min = 1, max = 1 }), -- ����� ��������������� 55��� ��� 400
				yn({ id = 'g001ig0134', min = 1, max = 1 }), -- ����� ����� II +40����-1 400
				yn({ id = 'g001ig0191', min = 1, max = 1 }), -- ����� ������� 70 400
				yn({ id = 'g001ig0474', min = 1, max = 1 }), -- ����� ����� 80����-1 400
				yn({ id = 'g001ig0461', min = 1, max = 1 }), -- ����� ��������� ���������� I -33���� ��� 400
				yn({ id = 'g001ig0479', min = 1, max = 1 }), -- ����� ���������� ������� II -30�����-1 400
				yn({ id = 'g001ig0454', min = 1, max = 1 }), -- ����� ������ 75��� 2x2 400
				yn({ id = 'g001ig0295', min = 1, max = 1 }), -- ����� ���������� 50-1 400

				--�����
				yn({ id = 'g001ig0289', min = 1, max = 1 }), -- ����� ���.���700
				yn({ id = 'g000ig1006', min = 1, max = 1 }), -- ����� ��������700
				yn({ id = 'g000ig1008', min = 1, max = 1 }), -- ����� �����700
				yn({ id = 'g001ig0293', min = 1, max = 1 }), -- ����� ���.����700
				yn({ id = 'g001ig0292', min = 1, max = 1 }), -- ����� ����.����700
				yn({ id = 'g001ig0361', min = 1, max = 1 }), -- ����� �����700
				yn({ id = 'g001ig0357', min = 1, max = 1 }), -- ����� �����������700			

				--�����
				orr5({ id = 'g000ig9128', min = 1, max = 1}, { id = 'g001ig0259', min = 1, max = 1}, { id = 'g001ig0063', min = 1, max = 1}, { id = 'g000ig9116', min = 1, max = 1}, { id = 'g000ig9140', min = 1, max = 1}), -- �������� ������ 800 / �������� ������� ��������� III 600 / �������� ������� 800 / �������� ������ ����� 800 / �������� ������ �������� 800

				--������
				orr(orr({ id = 'g000ig5050', min = 1, max = 1}, { id = 'g001ig0253', min = 1, max = 1}), orr({ id = 'g001ig0255', min = 1, max = 1}, { id = 'g001ig0256', min = 1, max = 1})), -- ������ "Chronos"-���, �����.�����-����, ����.�����+���, ����������+����			
				orr(orr({ id = 'g000ig5103', min = 1, max = 1}, { id = 'g000ig5030', min = 1, max = 1}), orr({ id = 'g000ig5104', min = 1, max = 1}, { id = 'g001ig0085', min = 1, max = 1})), -- ������ "������ II: ���" / ������ "������ �������"+7x7����� / ������ "��������"-25��� / ������ "�����"		
				orr({ id = 'g000ig5007', min = 1, max = 1 }, { id = 'g000ig5029', min = 1, max = 1 }), -- ��. ��������� / ���. ���������
			}
		},
--�����		guard = guard2(),
	},
}
end

-- ����� �3
function zoneMerchZone3() -- ������ 700
return {
	{
		goods = {
			itemTypes = { Item.Scroll },
			value = { min = 1400, max = 1400 },
			itemValue = { min = 700, max = 700 },
			items = {
				{ id = 'g000ig0001', min = 5, max = 6 },
				{ id = 'g000ig0006', min = 5, max = 6 },
				{ id = 'g001ig0378', min = 6, max = 7 }, --���75
				{ id = 'g000ig0005', min = 7, max = 10 },
				{ id = 'g000ig0018', min = 1, max = 1 },

				{ id = 'g000ig0012', min = 1, max = 2 }, --���30
				{ id = 'g000ig0015', min = 1, max = 2 }, --����30
				{ id = 'g000ig0003', min = 1, max = 1 }, --������30
				yn({ id = 'g000ig0009', min = 1, max = 1 }), --��������30

				yn({ id = 'g000ig0002', min = 1, max = 2 }), --������15
				yn({ id = 'g000ig0014', min = 1, max = 2 }), --�����15
				yn({ id = 'g000ig0011', min = 1, max = 2 }), --���15
				yn({ id = 'g000ig0008', min = 1, max = 2 }), --��������15
				
				yn({ id = 'g000ig0021', min = 1, max = 2 }), -- ���� ������
				yn({ id = 'g000ig0022', min = 1, max = 2 }), -- ���� ����
				yn({ id = 'g000ig0023', min = 1, max = 2 }), -- ���� �����
				yn({ id = 'g000ig0024', min = 1, max = 2 }), -- ���� �����
				
				yn({ id = 'g001ig0125', min = 1, max = 1 }), -- ���� ������
				yn({ id = 'g001ig0036', min = 1, max = 1 }), -- ���� ������

				{ id = pw5(), min = 1, max = 1},
				{ id = pw5(), min = 1, max = 1},
				{ id = pw6(), min = 1, max = 1},

				orr({ id = 'g001ig0019', min = 1, max = 1 }, { id = 'g001ig0506', min = 1, max = 1 }), -- ��� ����� ���� ���������� +10���� / �������� ������� +1�����
				{ id = p15(), min = 1, max = 1},

				yn({ id = 'g001ig0591', min = 1, max = 1 }), -- ��� ��������� (��������) 900
				yn({ id = 'g000ig2004', min = 1, max = 1 }), -- ���.����1200
				yn({ id = 'g000ig9137', min = 1, max = 1 }), -- ����.�����1200
				yn({ id = 'g000ig3019', min = 1, max = 1 }), -- ������ �������� (��������) 1150
				yn({ id = 'g001ig0071', min = 1, max = 1 }), -- ���������� ����� (��������) 1000
				yn({ id = 'g001ig0488', min = 1, max = 1 }), -- ������ ������������ ������ (��������) 1000
				yn({ id = 'g001ig0590', min = 1, max = 1 }), -- ��� �������� (��������) 1200
				yn({ id = 'g001ig0603', min = 1, max = 1 }), -- ���� ����� (��������) 1000

				yn({ id = 'g001ig0585', min = 1, max = 1 }), -- ������ ��������� (��������)1400
				yn({ id = 'g001ig0060', min = 1, max = 1 }), -- ������ ������ (��������) 1200				
				yn({ id = 'g001ig0410', min = 1, max = 1 }), -- ����������� ������ (��������)1500
				yn({ id = 'g000ig2005', min = 1, max = 1 }), -- ������������� ������� (��������)1800			
				
				yn({ id = 'g001ig0597', min = 1, max = 1 }), -- ������ ��������� (��������)1000
				yn({ id = 'g001ig0419', min = 1, max = 1 }), -- ���� ������� (��������)1000
				yn({ id = 'g001ig0430', min = 1, max = 1 }), -- ���� ������ (��������)850
				yn({ id = 'g001ig0539', min = 1, max = 1 }), -- ������� ��� (��������)900
				yn({ id = 'g001ig0116', min = 1, max = 1 }), -- �.����.����1200
				yn({ id = 'g000ig3005', min = 1, max = 1 }), -- �.���.�����1200				
				yn({ id = 'g000ig7010', min = 1, max = 1 }), -- �.���.���1800
				yn({ id = 'g001ig0038', min = 1, max = 1 }), -- �.���.����1550

				orr({ id = 'g001ig0501', min = 1, max = 1 }, { id = 'g000ig1010', min = 1, max = 1 }), -- ���� �������� (���) 900 / ���������� ������ 700
				orr({ id = 'g000ig8003', min = 1, max = 1 }, { id = 'g001ig0606', min = 1, max = 1 }), -- ������ �������� 700 | ������ ������ ������ 1000

				--�����
				orr3({ id = 'g000ig6020', min = 1, max = 1 }, { id = 'g000ig6014', min = 1, max = 1 }, { id = 'g001ig0391', min = 1, max = 1 }), -- ����� �����-15���-10���� / ����� ������+15����� / ����� �������+60��
				orr3({ id = 'g000ig6016', min = 1, max = 1 }, { id = 'g000ig6018', min = 1, max = 1 }, { id = 'g001ig0097', min = 1, max = 1 }), -- ����� ����=40��� / ����� �������-���� / ����� ����+����
				
				--�����
				yn({ id = 'g001ig0478', min = 1, max = 1 }), -- ����� �������������� 40����� ����. 500
				yn({ id = 'g001ig0467', min = 1, max = 1 }), -- ����� ���� 66 2x2 500
				yn({ id = 'g000ig9024', min = 1, max = 1 }), -- ����� ����� 45���� 500
				yn({ id = 'g000ig9020', min = 1, max = 1 }), -- ����� ������� +25������� 500
				yn({ id = 'g000ig9021', min = 1, max = 1 }), -- ����� ���������� III 60 700
				yn({ id = 'g000ig9016', min = 1, max = 1 }), -- ����� �������� ��������� 80 700
				yn({ id = 'g001ig0203', min = 1, max = 1 }), -- ����� ��������� ���������� II 50 700
				yn({ id = 'g001ig0466', min = 1, max = 1 }), -- ����� ������� ������ 110���� 700
				yn({ id = 'g001ig0457', min = 1, max = 1 }), -- ����� ����������� 110���� 700
				yn({ id = 'g001ig0183', min = 1, max = 1 }), -- ����� �������� �������� II -20����� ��� 700
				yn({ id = 'g001ig0480', min = 1, max = 1 }), -- ����� ���� ����110 800
				yn({ id = 'g001ig0059', min = 1, max = 1 }), -- ����� ������ �� ������ 800
				yn({ id = 'g000ig9025', min = 1, max = 1 }), -- ����� �������� 60 ���� ��� 900
				yn({ id = 'g001ig0459', min = 1, max = 1 }), -- ����� ������������� 75 ������� 900
				yn({ id = 'g000ig9014', min = 1, max = 1 }), -- ����� ��������� ���������� 50 1000
				
				--�����				
				yn({ id = 'g000ig1002', min = 1, max = 1 }), -- ����� ������700
				yn({ id = 'g001ig0362', min = 1, max = 1 }), -- ����� �����800
				yn({ id = 'g001ig0363', min = 1, max = 1 }), -- ����� ������750
				yn({ id = 'g001ig0374', min = 1, max = 1 }), -- ����� ��������� ���������800
				yn({ id = 'g001ig0364', min = 1, max = 1 }), -- ����� ����� �������800
				yn({ id = 'g001ig0358', min = 1, max = 1 }), -- ����� ����800
				yn({ id = 'g001ig0375', min = 1, max = 1 }), -- ����� ��������1000
				yn({ id = 'g001ig0291', min = 1, max = 1 }), -- �������� ����������1500
				yn({ id = 'g001ig0290', min = 1, max = 1 }), -- ���� ��������������1500
				yn({ id = 'g001ig0052', min = 1, max = 1 }), -- ����� �������1500
				yn({ id = 'g000ig1017', min = 1, max = 1 }), -- ����� ��������1500

				--�����
				orr5({id = 'g000ig9130', min = 1, max = 1}, {id = 'g000ig9136', min = 1, max = 1}, {id = 'g001ig0185', min = 1, max = 1}, {id = 'g000ig9123', min = 1, max = 1}, {id = 'g001ig0202', min = 1, max = 1}), -- �������� ���� 1000 / �������� ���� 1600 / �������� ������������� 1800 / �������� ������ 1000 / �������� ������� ��������� IV 1000

				--������
				orr(orr({ id = 'g000ig5110', min = 1, max = 1}, { id = 'g000ig5109', min = 1, max = 1}), orr({ id = 'g001ig0165', min = 1, max = 1}, { id = 'g000ig5108', min = 1, max = 1})), -- ������ "���������" / ������ "���������� ������"-40��� / ������ "��������"-����� / ������ "������ III: ��� �������"
				orr(orr({ id = 'g000ig5089', min = 1, max = 1}, { id = 'g000ig5026', min = 1, max = 1}), orr({ id = 'g000ig5013', min = 1, max = 1}, { id = 'g000ig5012', min = 1, max = 1})), -- ������ "Preces"-����.���� / ������ "���� ������"+��� / ������ "������ ����"+����.���� / ������ "������ �����"+����� 
			}
		},
--�����		guard = guard3(),
	},

	-- ������ �����
	
	{
		goods = {
			itemTypes = { Item.Scroll },
			value = { min = 1400, max = 1400 },
			itemValue = { min = 700, max = 700 },
			items = {
				{ id = 'g000ig0001', min = 5, max = 6 },
				{ id = 'g000ig0006', min = 5, max = 6 },
				{ id = 'g001ig0378', min = 6, max = 7 }, --���75
				{ id = 'g000ig0005', min = 7, max = 10 },
				{ id = 'g000ig0018', min = 1, max = 1 },

				{ id = 'g000ig0012', min = 1, max = 1 }, --���30
				{ id = 'g000ig0015', min = 1, max = 1 }, --����30
				{ id = 'g000ig0003', min = 1, max = 2 }, --������30
				yn({ id = 'g000ig0009', min = 1, max = 1 }), --��������30			

				yn({ id = 'g000ig0002', min = 1, max = 2 }), --������15
				yn({ id = 'g000ig0014', min = 1, max = 2 }), --�����15
				yn({ id = 'g000ig0011', min = 1, max = 2 }), --���15
				yn({ id = 'g000ig0008', min = 1, max = 2 }), --��������15
				
				yn({ id = 'g000ig0021', min = 1, max = 2 }), -- ���� ������
				yn({ id = 'g000ig0022', min = 1, max = 2 }), -- ���� ����
				yn({ id = 'g000ig0023', min = 1, max = 2 }), -- ���� �����
				yn({ id = 'g000ig0024', min = 1, max = 2 }), -- ���� �����
				
				yn({ id = 'g001ig0125', min = 1, max = 1 }), -- ���� ������
				yn({ id = 'g001ig0036', min = 1, max = 1 }), -- ���� ������

				{ id = pw5(), min = 1, max = 1},
				{ id = pw5(), min = 1, max = 1},
				{ id = pw6(), min = 1, max = 1},

				orr({ id = 'g001ig0563', min = 1, max = 1 }, { id = 'g001ig0035', min = 1, max = 1 }), -- ���� �������������� +5 ���� / ������� ���� ��������� ���� ��� +30��
				{ id = p15(), min = 1, max = 1},

				yn({ id = 'g001ig0197', min = 1, max = 1 }), -- �����.�����950
				yn({ id = 'g000ig3004', min = 1, max = 1 }), -- ���.����1200
				yn({ id = 'g001ig0124', min = 1, max = 1 }), -- ����.����1200
				yn({ id = 'g000ig9035', min = 1, max = 1 }), -- ����� ������ (��������) 1200
				yn({ id = 'g001ig0415', min = 1, max = 1 }), -- ���� ���� ������ (��������) 1150
				yn({ id = 'g001ig0612', min = 1, max = 1 }), -- ������ �������� ���� (��������) 1000
				yn({ id = 'g001ig0413', min = 1, max = 1 }), -- ����� �������� (��������) 1200

				yn({ id = 'g001ig0411', min = 1, max = 1 }), -- ����� ���������� (��������)1400
				yn({ id = 'g001ig0604', min = 1, max = 1 }), -- ������ ����� (��������)1300
				yn({ id = 'g001ig0046', min = 1, max = 1 }), -- ����� ������� (��������)1400
				yn({ id = 'g001ig0102', min = 1, max = 1 }), -- ������ ���������� (��������)1800
				
				yn({ id = 'g001ig0597', min = 1, max = 1 }), -- ������ ��������� (��������)1000
				yn({ id = 'g001ig0419', min = 1, max = 1 }), -- ���� ������� (��������)1000
				yn({ id = 'g001ig0430', min = 1, max = 1 }), -- ���� ������ (��������)850
				yn({ id = 'g001ig0539', min = 1, max = 1 }), -- ������� ��� (��������)900
				yn({ id = 'g001ig0116', min = 1, max = 1 }), -- �.����.����1200
				yn({ id = 'g000ig3005', min = 1, max = 1 }), -- �.���.�����1200				
				yn({ id = 'g000ig7010', min = 1, max = 1 }), -- �.���.���1800
				yn({ id = 'g001ig0038', min = 1, max = 1 }), -- �.���.����1550

				orr({ id = 'g001ig0501', min = 1, max = 1 }, { id = 'g000ig1010', min = 1, max = 1 }), -- ���� �������� (���) 900 / ���������� ������ 700
				orr({ id = 'g000ig8003', min = 1, max = 1 }, { id = 'g001ig0606', min = 1, max = 1 }), -- ������ �������� 700 | ������ ������ ������ 1000

				--�����
				orr3({ id = 'g000ig6011', min = 1, max = 1 }, { id = 'g001ig0398', min = 1, max = 1 }, { id = 'g001ig0400', min = 1, max = 1 }), -- ����� ���������� ��������=40��� / ����� �������+15��� / ����� ������ ������-����
				orr3({ id = 'g000ig6015', min = 1, max = 1 }, { id = 'g000ig6017', min = 1, max = 1 }, { id = 'g000ig6009', min = 1, max = 1 }), -- ����� ����������+20��+5����� / ����� �������� �����+���� / ����� �����+�����
				
				--�����
				yn({ id = 'g001ig0469', min = 1, max = 1 }), -- ����� ������ 55����� 500
				yn({ id = 'g001ig0304', min = 1, max = 1 }), -- ����� ���� 60 ��� 500
				yn({ id = 'g001ig0468', min = 1, max = 1 }), -- ����� ������� 50���� 2������ 500
				yn({ id = 'g001ig0443', min = 1, max = 1 }), -- ����� ����� II 25 600
				yn({ id = 'g001ig0462', min = 1, max = 1 }), -- ����� ������������� ���������� II 50 700
				yn({ id = 'g001ig0455', min = 1, max = 1 }), -- ����� �������� 100��� 2������� 700
				yn({ id = 'g001ig0489', min = 1, max = 1 }), -- ����� ��������� 110 ���� 700
				yn({ id = 'g001ig0131', min = 1, max = 1 }), -- ����� ����� III +����60 700
				yn({ id = 'g000ig9028', min = 1, max = 1 }), -- ����� ����� 110���� 700
				yn({ id = 'g001ig0136', min = 1, max = 1 }), -- ����� ����� III 35 800
				yn({ id = 'g001ig0303', min = 1, max = 1 }), -- ����� �������� ����100 800
				yn({ id = 'g001ig0477', min = 1, max = 1 }), -- ����� �������� 85 ��� 900
				yn({ id = 'g000ig9027', min = 1, max = 1 }), -- ����� ������� 99 2x2 900
				yn({ id = 'g000ig9032', min = 1, max = 1 }), -- ����� ������ 90 ������� 900

				--�����				
				yn({ id = 'g000ig1002', min = 1, max = 1 }), -- ����� ������700
				yn({ id = 'g001ig0362', min = 1, max = 1 }), -- ����� �����800
				yn({ id = 'g001ig0363', min = 1, max = 1 }), -- ����� ������750
				yn({ id = 'g001ig0374', min = 1, max = 1 }), -- ����� ��������� ���������800
				yn({ id = 'g001ig0364', min = 1, max = 1 }), -- ����� ����� �������800
				yn({ id = 'g001ig0358', min = 1, max = 1 }), -- ����� ����800
				yn({ id = 'g001ig0375', min = 1, max = 1 }), -- ����� ��������1000
				yn({ id = 'g001ig0291', min = 1, max = 1 }), -- �������� ����������1500
				yn({ id = 'g001ig0290', min = 1, max = 1 }), -- ���� ��������������1500
				yn({ id = 'g001ig0052', min = 1, max = 1 }), -- ����� �������1500
				yn({ id = 'g000ig1017', min = 1, max = 1 }), -- ����� ��������1500

				--�����
				orr5({id = 'g000ig9130', min = 1, max = 1}, {id = 'g000ig9136', min = 1, max = 1}, {id = 'g001ig0185', min = 1, max = 1}, {id = 'g000ig9123', min = 1, max = 1}, {id = 'g001ig0202', min = 1, max = 1}), -- �������� ���� 1000 / �������� ���� 1600 / �������� ������������� 1800 / �������� ������ 1000 / �������� ������� ��������� IV 1000

				--������
				orr(orr({ id = 'g000ig5110', min = 1, max = 1}, { id = 'g000ig5109', min = 1, max = 1}), orr({ id = 'g001ig0165', min = 1, max = 1}, { id = 'g000ig5108', min = 1, max = 1})), -- ������ "���������" / ������ "���������� ������"-40��� / ������ "��������"-����� / ������ "������ III: ��� �������"
				orr(orr({ id = 'g000ig5089', min = 1, max = 1}, { id = 'g000ig5026', min = 1, max = 1}), orr({ id = 'g000ig5013', min = 1, max = 1}, { id = 'g000ig5012', min = 1, max = 1})), -- ������ "Preces"-����.���� / ������ "���� ������"+��� / ������ "������ ����"+����.���� / ������ "������ �����"+����� 


				
			}
		},
--�����		guard = guard3(),
	},
	
}
end


----------------------

-- ����� ���� 0
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
-- ������ �
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

-- ����� ���� 1
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


-- ����� ���� 2
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

-- ����� ���� 3
local valueRuinZone3 = { min = 900*kef, max = 900*kef*kr }
local goldRuinZone3 = { min = 500, max = 550 }

function zoneRuinZone3()
return {
	{
		gold = goldRuinZone3,
		loot = {
				itemTypes = { Item.Armor }, -- 12 ������
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
				itemTypes = { Item.Weapon }, -- 9 ������
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
				itemTypes = { Item.Jewel, Item.Talisman }, -- 7 + 4 ������
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
				itemTypes = { Item.Banner }, -- 8 ������
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

-- ��������� ����
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

-- ��������� �1
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

-- ��������� �2
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

-- ��������� �3
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

-- ����� ��� �������� ���� 2
function unitsMercen0(race)
local unitsm = {}
local i = 1

if race == Race.Human then
unitsm[i] = { id = 'g003uu5001', level = 1, unique = false } i = i + 1 -- ���� ���������
unitsm[i] = { id = 'g000uu0001', level = 1, unique = false } i = i + 1 -- ������
unitsm[i] = orr3({ id = 'g000uu0003', level = 3, unique = true }, { id = 'g000uu0005', level = 3, unique = true }, { id = 'g000uu0154', level = 3, unique = true }) i = i + 1 -- ��������� ������ / ���������� / �������
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu7595', level = 2, unique = true } i = i + 1 end -- ������ 1300
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g003uu5002', level = 2, unique = true } i = i + 1 end -- ����������
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu0009', level = 2, unique = true } i = i + 1 end -- ���������
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu7561', level = 2, unique = true } i = i + 1 end -- �����
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu0012', level = 2, unique = true } i = i + 1 end -- ����
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu0016', level = 2, unique = true } i = i + 1 end -- ��������
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu2014', level = 2, unique = true } i = i + 1 end -- ����������
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu0004', level = 2, unique = true } i = i + 1 end -- ������� �� �����
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu2029', level = 2, unique = true } i = i + 1 end -- ��������
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu0007', level = 2, unique = true } i = i + 1 end -- ��������
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu0002', level = 2, unique = true } i = i + 1 end -- ������
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu8310', level = 2, unique = true } i = i + 1 end -- ��������

elseif race == Race.Dwarf then
unitsm[i] = { id = 'g000uu0036', level = 1, unique = false } i = i + 1 -- ����
unitsm[i] = { id = 'g004uu5039', level = 1, unique = false } i = i + 1 -- ������� ����
unitsm[i] = orr3({ id = 'g000uu0038', level = 3, unique = true }, { id = 'g000uu0038', level = 3, unique = true }, { id = 'g000uu0162', level = 3, unique = true }) i = i + 1 -- ������� / ������� / �������� �����
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu0030', level = 2, unique = true } i = i + 1 end -- ������ �������
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu7583', level = 2, unique = true } i = i + 1 end -- ����� 1500
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu0027', level = 2, unique = true } i = i + 1 end -- ����������
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g001uu7571', level = 2, unique = true } i = i + 1 end -- ����� ����
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu0037', level = 2, unique = true } i = i + 1 end -- ����
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g004uu8005', level = 2, unique = true } i = i + 1 end -- ����
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu0034', level = 2, unique = true } i = i + 1 end -- �����������

elseif race == Race.Undead then
unitsm[i] = { id = 'g000uu0086', level = 1, unique = false } i = i + 1 -- ����
unitsm[i] = { id = 'g001uu7539', level = 1, unique = false } i = i + 1 -- �������
unitsm[i] = orr3({ id = 'g000uu0091', level = 3, unique = true }, { id = 'g000uu0088', level = 3, unique = true }, { id = 'g000uu0085', level = 3, unique = true }) i = i + 1 -- ���� ���� / ������-���� / ���� ���
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu0094', level = 2, unique = true } i = i + 1 end -- ������ ����
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g001uu7564', level = 2, unique = true } i = i + 1 end -- ���� 900
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g001uu7563', level = 2, unique = true } i = i + 1 end -- ��������
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g001uu7565', level = 2, unique = true } i = i + 1 end -- ������ ���������
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu7542', level = 2, unique = true } i = i + 1 end -- ����������
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu0087', level = 2, unique = true } i = i + 1 end -- �����
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu0081', level = 2, unique = true } i = i + 1 end -- ������
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu0079', level = 2, unique = true } i = i + 1 end -- �������
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu0090', level = 2, unique = true } i = i + 1 end -- ��������
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g003uu5013', level = 2, unique = true } i = i + 1 end -- ���������

elseif race == Race.Heretic then
unitsm[i] = { id = 'g000uu0052', level = 1, unique = false } i = i + 1 -- ���������
unitsm[i] = orr3({ id = 'g000uu0054', level = 3, unique = true }, { id = 'g000uu0054', level = 3, unique = true }, { id = 'g000uu2003', level = 3, unique = true }) i = i + 1 -- ������ ������� / ������ ������� / ��������
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu7577', level = 2, unique = true } i = i + 1 end -- ����� 1500
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu0058', level = 2, unique = true } i = i + 1 end -- �����
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu7572', level = 2, unique = true } i = i + 1 end -- ���������� ��������
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu0056', level = 2, unique = true } i = i + 1 end -- ��������� ��������
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu0053', level = 2, unique = true } i = i + 1 end -- ���������
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu0067', level = 2, unique = true } i = i + 1 end -- ������
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g004uu6101', level = 2, unique = true } i = i + 1 end -- ����������
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu0063', level = 2, unique = true } i = i + 1 end -- ������ ������

elseif race == Race.Elf then
unitsm[i] = { id = 'g000uu8014', level = 1, unique = false } i = i + 1 -- �������-��������
unitsm[i] = { id = 'g000uu8036', level = 1, unique = false } i = i + 1 -- ��� �����
unitsm[i] = orr3({ id = 'g001uu7579', level = 3, unique = true }, { id = 'g000uu8017', level = 3, unique = true }, { id = 'g000uu8021', level = 3, unique = true }) i = i + 1 -- �������-�������� / �������-������ / ������
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu8030', level = 2, unique = true } i = i + 1 end -- ������� ����� 1300
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g003uu8038', level = 2, unique = true } i = i + 1 end -- ���-��������
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu8015', level = 2, unique = true } i = i + 1 end -- �������-������
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu8016', level = 2, unique = true } i = i + 1 end -- �������-��������
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu8032', level = 2, unique = true } i = i + 1 end -- ������
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu8019', level = 2, unique = true } i = i + 1 end -- �������
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu8022', level = 2, unique = true } i = i + 1 end -- ������
if math.random(0,2) ~= 1 then unitsm[i] = { id = 'g000uu8026', level = 2, unique = true } i = i + 1 end -- �������

end

return unitsm
end


-- ������� � ���� 2
function zoneMercenZone2(race)
return {
	{
		units = unitsMercen0(race),
--�����		guard = guard2n(),
	},
	}
end



-- ����� ��� �������� 1 ���� 3
function unitsMercen1()
local unitsm = {}
local i = 1

unitsm[i] = orr({ id = 'g000uu7629', level = 1, unique = false }, { id = 'g000uu7628', level = 1, unique = false }) i = i + 1 -- ����-���� ���� / ��������� ��������

if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu2030', level = 3, unique = true } i = i + 1 end -- ��������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu2009', level = 3, unique = true } i = i + 1 end -- ������ � ����
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0157', level = 4, unique = true } i = i + 1 end -- ������� ����������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g001uu7543', level = 4, unique = true } i = i + 1 end -- ��������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0152', level = 4, unique = true } i = i + 1 end -- ����� ���

if math.random(0,1) == 1 then unitsm[i] = { id = 'g006uu1128', level = 3, unique = true } i = i + 1 end -- ������ ����
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu7568', level = 3, unique = true } i = i + 1 end -- �����������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0190', level = 1, unique = true } i = i + 1 end -- ��� �������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0040', level = 4, unique = true } i = i + 1 end -- ������ �������

if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu2012', level = 3, unique = true } i = i + 1 end -- ������� �������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8023', level = 3, unique = true } i = i + 1 end -- ��������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8028', level = 3, unique = true } i = i + 1 end -- �����
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu2013', level = 4, unique = true } i = i + 1 end -- ��������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g001uu8240', level = 4, unique = true } i = i + 1 end -- ��������� �������

if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu2003', level = 3, unique = true } i = i + 1 end -- ��������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0171', level = 3, unique = true } i = i + 1 end -- �����������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0166', level = 4, unique = true } i = i + 1 end -- �����������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0059', level = 3, unique = true } i = i + 1 end -- �����

if math.random(0,1) == 1 then unitsm[i] = { id = 'g003uu5012', level = 3, unique = true } i = i + 1 end -- ���-�����
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0082', level = 3, unique = true } i = i + 1 end -- ���������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0177', level = 4, unique = true } i = i + 1 end -- ������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g003uu5014', level = 4, unique = true } i = i + 1 end -- ��� �������� �����

return unitsm
end


-- ����� ��� �������� 2 ���� 3
function unitsMercen2()
local unitsm = {}
local i = 1

unitsm[i] = orr({ id = 'g000uu7629', level = 1, unique = false }, { id = 'g000uu7628', level = 1, unique = false }) i = i + 1 -- ����-���� ���� / ��������� ��������

if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu2015', level = 3, unique = true } i = i + 1 end -- ����� ��������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g001uu7560', level = 1, unique = true } i = i + 1 end -- ��������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0014', level = 4, unique = true } i = i + 1 end -- �����
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu2031', level = 4, unique = true } i = i + 1 end -- �������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu2010', level = 4, unique = true } i = i + 1 end -- ���� ����������

if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0164', level = 4, unique = true } i = i + 1 end -- ���������� ������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8201', level = 1, unique = true } i = i + 1 end -- ������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0041', level = 3, unique = true } i = i + 1 end -- �����
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu2011', level = 4, unique = true } i = i + 1 end -- ��������� ���

if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8020', level = 3, unique = true } i = i + 1 end -- �������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8024', level = 3, unique = true } i = i + 1 end -- �������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8151', level = 1, unique = true } i = i + 1 end -- �����
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu7578', level = 4, unique = true } i = i + 1 end -- ������

if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu7605', level = 1, unique = true } i = i + 1 end -- ��������� ���
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0064', level = 3, unique = true } i = i + 1 end -- ���������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu2004', level = 4, unique = true } i = i + 1 end -- ���������� ���
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu8254', level = 4, unique = true } i = i + 1 end -- ������������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g001uu7574', level = 3, unique = true } i = i + 1 end -- ���������� ��������

if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu2007', level = 3, unique = true } i = i + 1 end -- �����������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0178', level = 4, unique = true } i = i + 1 end -- �����
if math.random(0,1) == 1 then unitsm[i] = { id = 'g001uu8314', level = 4, unique = true } i = i + 1 end -- ������� ������
if math.random(0,1) == 1 then unitsm[i] = { id = 'g000uu0089', level = 4, unique = true } i = i + 1 end -- ������-������

return unitsm
end

-- ������� � ���� 3
function zoneMercenZone3()
return {
	{
		units = unitsMercen1(),
--�����		guard = guard2n(),
	},
-- ������ ������
	{
		units = unitsMercen2(),
--�����		guard = guard2n(),
	},
	
	}
end

----------------------

-- ������� ����
function bags0()
return {
	count = 1,
	loot = {
		itemTypes = { Item.Valuable },
		value = { min = 250, max = 250 }, 
		itemValue = { min = 250, max = 250 },
			items = {
				orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --���/���100
				orr({ id = 'g001ig0180', min = 2, max = 2 }, { id = 'g000ig0005', min = 1, max = 1 }), --2���25/���50
				{ id = d15(), min = 1, max = 1 },
			}
	}
}
end


-- ������� �1
function bags1()
return {
	count = 1,
	loot = {
		itemTypes = { Item.Valuable },
		value = { min = 500, max = 500 }, 
		itemValue = { min = 250, max = 500 },
			items = {
				orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --���/���100
				orr({ id = 'g001ig0180', min = 3, max = 3 }, { id = 'g001ig0378', min = 1, max = 1 }), --3���25/���75
				{ id = e2(), min = 1, max = 1 },
			}
	}
}
end

-- ������� �2
function bags2()
return {
	count = 1,
	loot = {
		itemTypes = { Item.Valuable },
		value = { min = 750, max = 750 }, 
		itemValue = { min = 250, max = 750 },
			items = {
				orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --���/���100
				orr({ id = 'g000ig0005', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --2���50/���100
				{ id = e4(), min = 1, max = 1 },
			}
		}
}
end

-- ������� �3
function bags3()
return {
	count = 3,
	loot = {
		itemTypes = { Item.Valuable },
		value = { min = 3000, max = 3000 },
		itemValue = { min = 500, max = 1000 },
			items = {
				{ id = 'g000ig0001', min = 2, max = 2 }, --���
				{ id = 'g000ig0006', min = 2, max = 2 }, --���100
				{ id = 'g000ig0018', min = 1, max = 1 }, --���200
				{ id = pw5(), min = 1, max = 1 },
				{ id = pw5(), min = 1, max = 1 },
				{ id = pw5(), min = 1, max = 1 },					
			}
		}
	}
end

----------------------
-- ��� �������
----------------------

-- ���� ��� �� ���� 50%
function yn(what)
	local radn = math.random(0,1)
	if radn == 0 then
	return what
	elseif radn == 1 then
	return ""
	end
end

-- ���� ��� �� ���� 66%
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

-- ��� / ���
function orr(what, what2)
	local radn = math.random(0,1)
	if radn == 0 then
	return what
	elseif radn == 1 then
	return what2
	end
end

-- ��� / ��� 3
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

-- ��� / ��� 5
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

-- ������� ������
function getPlayerSubRace(race)
	if race == Race.Human then return Subrace.Human
	elseif race == Race.Dwarf then return Subrace.Dwarf
	elseif race == Race.Undead then return Subrace.Undead
	elseif race == Race.Heretic then return Subrace.Heretic
	elseif race == Race.Elf then return Subrace.Elf
	end
end

-- ������ ��� �����
function ExtraHomeMana(race)
	
	shmn = 'g001ig0146' -- ��� ���� �����
	sdw = 'g001ig0148' -- ��� ���� ���
	sun = 'g001ig0149' -- ��� ���� ������
	shr = 'g001ig0147' -- ��� ���� �����������
	self = 'g001ig0150' -- ��� ������� �������� 
	
	if race == Race.Human then return shmn
	elseif race == Race.Dwarf then return sdw
	elseif race == Race.Undead then return sun
	elseif race == Race.Heretic then return shr
	elseif race == Race.Elf then return self
	end
end

-- ������ ����� ��� �����
function ExtraSmallHomeMana(race)
	
	shmn = 'g001ig0481' -- ��� ���� �����
	sdw = 'g001ig0483' -- ��� ���� ���
	sun = 'g001ig0484' -- ��� ���� ������
	shr = 'g001ig0482' -- ��� ���� �����������
	self = 'g001ig0485' -- ��� ������� �������� 
	
	if race == Race.Human then return shmn
	elseif race == Race.Dwarf then return sdw
	elseif race == Race.Undead then return sun
	elseif race == Race.Heretic then return shr
	elseif race == Race.Elf then return self
	end
end

-- ��� ����� ��� � ��-��� �� ������ �� ����. �����
function ExtraSmallManaProject4(race)
	
	shmn = orr('g001ig0484','g001ig0482') -- ��� ���� ������ \ ��� ���� �����������
	sdw = orr('g001ig0484','g001ig0482') -- ��� ���� ������ \ ��� ���� �����������
	sun = orr('g001ig0481','g001ig0483') -- ��� ���� ����� \ ��� ���� ���
	shr = orr('g001ig0481','g001ig0483') -- ��� ���� ����� \ ��� ���� ���
	self = orr('g001ig0484','g001ig0483') -- ��� ���� ������ \ ��� ���� ���
	
	if race == Race.Human then return shmn
	elseif race == Race.Dwarf then return sdw
	elseif race == Race.Undead then return sun
	elseif race == Race.Heretic then return shr
	elseif race == Race.Elf then return self
	end
end


-- ��� ��� � ��-��� �� ������ �� ����. �����
function ExtraManaProject4(race)
	
	shmn = orr('g001ig0149','g001ig0147') -- ��� ���� ������ \ ��� ���� �����������
	sdw = orr('g001ig0149','g001ig0147') -- ��� ���� ������ \ ��� ���� �����������
	sun = orr('g001ig0146','g001ig0148') -- ��� ���� ����� \ ��� ���� ���
	shr = orr('g001ig0146','g001ig0148') -- ��� ���� ����� \ ��� ���� ���
	self = orr('g001ig0149','g001ig0148') -- ��� ���� ������ \ ��� ���� ���
	
	if race == Race.Human then return shmn
	elseif race == Race.Dwarf then return sdw
	elseif race == Race.Undead then return sun
	elseif race == Race.Heretic then return shr
	elseif race == Race.Elf then return self
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

-- ��������� ������� ��� �����
function rmsb()
	local radn = math.random(0,4)
	if radn == 0 then
	return 'g001ig0277' --�����
	elseif radn == 1 then
	return 'g001ig0281' --���
	elseif radn == 2 then
	return 'g001ig0278' --������.
	elseif radn == 3 then
	return 'g001ig0279' --���
	elseif radn == 4 then
	return 'g001ig0280' --������
	end
end

-- ��������� ����� �� 30
function b30()
	local radn = math.random(0,3)
	if radn == 0 then
	return 'g000ig0003' --������
	elseif radn == 1 then
	return 'g000ig0015' --�����
	elseif radn == 2 then
	return 'g000ig0012' --���
	elseif radn == 3 then
	return 'g000ig0009' --��������
	end
end

-- ��������� ����� �� 15
function b15()
	local radn = math.random(0,3)
	if radn == 0 then
	return 'g000ig0002' --������
	elseif radn == 1 then
	return 'g000ig0014' --�����
	elseif radn == 2 then
	return 'g000ig0011' --���
	elseif radn == 3 then
	return 'g000ig0008' --��������
	end
end

-- ��������� ����� ���� �� ������
function w15()
	local radn = math.random(0,3)
	if radn == 0 then
	return 'g000ig0021' --������
	elseif radn == 1 then
	return 'g000ig0022' --����
	elseif radn == 2 then
	return 'g000ig0023' --�����
	elseif radn == 3 then
	return 'g000ig0024' --�����
	end
end
-- ��������� ����� ���� �� ����� � ���� �����
function d15()
	local radn = math.random(0,3)
	if radn == 0 then
	return 'g001ig0329' -- ������� ������ �� ����
	elseif radn == 1 then
	return 'g001ig0351' --������� ������ �� ����������
	elseif radn == 2 then
	return 'g001ig0343' --������� ������ �� ���������
	elseif radn == 3 then
	return 'g001ig0341' -- ������� ������ �� �������
	end
end

-- ��������� ������� 200-375 + ������ ����� (��-�� �1)
function e2()
	local radn = math.random(0,5)
	if radn == 0 then
	return 'g001ig0560' -- ����� ����������� 25�������
	elseif radn == 1 then
	return 'g001ig0547' -- ����� ����������� ������� +10����
	elseif radn == 2 then
	return 'g001ig0490' -- ����� ������������ +25��
	elseif radn == 3 then
	return 'g001ig0329' -- ������� ������ �� ����
	elseif radn == 4 then
	return 'g001ig0351' --������� ������ �� ����������
	elseif radn == 5 then
	return 'g001ig0343' --������� ������ �� ���������
	end
end

-- ��������� ������� 400-500 + ���.����
function e4()
	local radn = math.random(0,5)
	if radn == 0 then
	return 'g001ig0562' -- ����� �������� +20����
	elseif radn == 1 then
	return 'g001ig0491' -- ����� ��������� ����� +25����
	elseif radn == 2 then
	return 'g001ig0355' -- ����� ��������� ����� +��������
	elseif radn == 3 then
	return 'g001ig0127' -- ������� ��������� ���� +50������
	elseif radn == 4 then
	return 'g001ig0128' -- ������� ������ �� ������
	elseif radn == 5 then
	return 'g001ig0341' -- ������� ������ �� �������
	end
end

-- ��������� ����� ���� 500
function pw5()
	local radn = math.random(0,6)
	if radn == 0 then
	return 'g001ig0332' -- ����� ����� �������� ����-��
	elseif radn == 1 then
	return 'g001ig0334' -- ������� ��������������� ����-��������
	elseif radn == 2 then
	return 'g001ig0328' -- ������� ������� ����� ����-�����
	elseif radn == 3 then
	return 'g001ig0330' -- ������� ���������� ����-����
	elseif radn == 4 then
	return 'g001ig0346' -- ������� ������������� ����-����������	
	elseif radn == 5 then
	return 'g001ig0344' -- ������� �������������� ����-����������	
	elseif radn == 6 then
	return 'g001ig0346' -- ������� ������������� ����-����������	
	end
end

-- ��������� ����� ���� 600
function pw6()
	local radn = math.random(0,8)
	if radn == 0 then
	return 'g001ig0354' -- ������ ������ ��� ����-����������
	elseif radn == 1 then
	return 'g001ig0320' -- ����� ���������� ������ ����-����
	elseif radn == 2 then
	return 'g001ig0325' -- ����� ������������ ����-�����
	elseif radn == 3 then
	return 'g001ig0326' -- ����� ��������� ����-������
	elseif radn == 4 then
	return 'g001ig0323' -- ����� ������� � �������� ����-�����	
	elseif radn == 5 then
	return 'g001ig0322' -- ����� �������� ����� ����-�����	
	elseif radn == 6 then
	return 'g001ig0321' -- ����� ���������� ��������� ����-������	
	elseif radn == 7 then
	return 'g001ig0352' -- ������� �������� ������� ����-�����������	
	elseif radn == 8 then
	return 'g001ig0534' -- �������� ������������ ������� (����� �����)
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

-- ��������� �����-������� �� 15% �� 1200
function p15()
	local radn = math.random(0,4)
	if radn == 0 then
	return 'g001ig0308' -- ����� ���������� +15�����
	elseif radn == 1 then
	return 'g001ig0314' -- ������� �������� +15����
	elseif radn == 2 then
	return 'g001ig0310' -- ������� ���������� +15���
	elseif radn == 3 then
	return 'g001ig0522' -- ����� ����� +�������������
	elseif radn == 4 then
	return 'g001ig0513' -- ����� �������� ���� +5�����
	end
end

-- �-�� 0 ��� ������ 1 400
function ruin01()
	local radn = math.random(0,10)
	if radn == 0 then
	return 'g001ig0309' -- ������� ������ +5���
	elseif radn == 1 then
	return 'g001ig0313' -- ������� ����������������� +5����
	elseif radn == 2 then
	return 'g001ig0307' -- ����� ��������� +5�����
	elseif radn == 3 then
	return 'g001ig0315' -- ����� �������� +5��	
	elseif radn == 4 then
	return 'g001ig0493' -- ����� ������������ ����� +����
	elseif radn == 5 then
	return 'g001ig0495' -- ����� �������� +������
	elseif radn == 6 then
	return 'g001ig0494' -- ����� ��������� +������
	elseif radn == 7 then
	return 'g001ig0428' -- ������� ���������� ������� (��������)
	elseif radn == 8 then
	return 'g001ig0111' -- ������ ��������
	elseif radn == 9 then
	return 'g001ig0609' -- ��������� ������ (��������)
	elseif radn == 10 then
	return 'g002ig0001' -- �������� ������ (��������)
	end
end

-- �-�� 0 ��� ������ 2 �400 �500
function ruin02()
	local radn = math.random(0,10)
	if radn == 0 then
	return 'g000ig3017' -- ������ ���������� (��������)
	elseif radn == 1 then
	return 'g001ig0182' -- ���������� ����� (��������)
	elseif radn == 2 then
	return 'g000ig2002' -- ������ ���� (��������)
	elseif radn == 3 then
	return 'g001ig0048' -- ������ ������� (��������)
	elseif radn == 4 then
	return 'g000ig1005' -- ����� ��������	
	elseif radn == 5 then
	return 'g001ig0051' -- ����� ������������
	elseif radn == 6 then
	return 'g000ig1001' -- ����� ������
	elseif radn == 7 then
	return 'g000ig1007' -- ����� ����
	elseif radn == 8 then
	return 'g000ig1003' -- ����� ��������
	elseif radn == 9 then
	return 'g001ig0114' -- ������� ������
	elseif radn == 10 then
	return 'g001ig0426' -- ������ �������� (��������)
	end
end

-- �-�� 1 ��� ������ 600 + ������400-500
function ruin1()
	local radn = math.random(0,10)
	if radn == 0 then
	return 'g001ig0582' -- ������ ���� (��������)
	elseif radn == 1 then
	return 'g000ig3002' -- ����������� ���� (��������)
	elseif radn == 2 then
	return 'g001ig0487' -- ������ ������ ������� (��������)
	elseif radn == 3 then
	return 'g001ig0605' -- ����� ����������
	elseif radn == 4 then
	return 'g000ig3022' -- ����� ���������� (��������)
	elseif radn == 5 then
	return 'g001ig0427' -- ��������� ������ (��������)
	elseif radn == 6 then
	return 'g001ig0370' -- ����� ������������ �����
	elseif radn == 7 then
	return 'g001ig0369' -- ����� ������� �����
	elseif radn == 8 then
	return 'g000ig9120' -- �������� ���� ������
	elseif radn == 9 then
	return 'g001ig0184' -- �������� ��������������
	elseif radn == 10 then
	return 'g000ig9109' -- �������� ������� ��������� II

	end
end

-- ����� �� ������
function CapSpell(race)
	sphmn = orr(orr('g000ss0002','g000ss0003'),orr('g000ss0004','g000ss0009')) -- ��������\����\������\�������� ������
	spdw = orr(orr('g000ss0021','g000ss0023'),orr('g000ss0024','g000ss0025')) -- ������� ���\���� ������\�����\������ I: ���
	spun = orr(orr('g000ss0061','g000ss0062'),orr('g000ss0065','g000ss0064')) -- ������ I: ������\���\��������\��������
	sphr = orr(orr('g000ss0041','g000ss0042'),orr('g000ss0043','g000ss0044')) -- Incantare Hellhound\Incantare Hellhound Illudere\Ignis mare\Menta minoris
	spelf = orr(orr('g000ss0097','g000ss0098'),orr('g000ss0101','g000ss0106')) -- ���������\������ I: ��� �����\����\��������
	
	if race == Race.Human then return sphmn
	elseif race == Race.Dwarf then return spdw
	elseif race == Race.Undead then return spun
	elseif race == Race.Heretic then return sphr
	elseif race == Race.Elf then return spelf
	end
end

-- ������ ��������
function TalismanHome(race)
	sphmn = 'g000ig9101' -- �������� �������
	spdw = 'g001ig0265' -- �������� �������
	spun = 'g001ig0264' -- �������� ��������
	sphr = 'g001ig0267' -- �������� �������
	spelf = 'g001ig0266' -- �������� ������� �����
	
	if race == Race.Human then return sphmn
	elseif race == Race.Dwarf then return spdw
	elseif race == Race.Undead then return spun
	elseif race == Race.Heretic then return sphr
	elseif race == Race.Elf then return spelf
	end
end

-- ��������� �������
function rsub()
	local radn = math.random(0,4)
	if radn == 0 then
	return {Subrace.Human, Subrace.Neutral, Subrace.NeutralHuman, Subrace.NeutralGreenSkin, Subrace.NeutralDragon, Subrace.NeutralMarsh, Subrace.NeutralBarbarian, Subrace.NeutralWolf} --����
	elseif radn == 1 then
	return {Subrace.Elf, Subrace.Neutral, Subrace.NeutralElf, Subrace.NeutralGreenSkin, Subrace.NeutralDragon, Subrace.NeutralMarsh, Subrace.NeutralBarbarian, Subrace.NeutralWolf} --�����
	elseif radn == 2 then
	return {Subrace.Heretic, Subrace.Neutral, Subrace.NeutralGreenSkin, Subrace.NeutralDragon, Subrace.NeutralMarsh, Subrace.NeutralBarbarian, Subrace.NeutralWolf} --������
	elseif radn == 3 then
	return {Subrace.Dwarf, Subrace.Neutral, Subrace.NeutralGreenSkin, Subrace.NeutralDragon, Subrace.NeutralMarsh, Subrace.NeutralBarbarian, Subrace.NeutralWolf} --�����
	elseif radn == 4 then
	return {Subrace.Undead, Subrace.Neutral, Subrace.NeutralGreenSkin, Subrace.NeutralDragon, Subrace.NeutralMarsh, Subrace.NeutralBarbarian, Subrace.NeutralWolf} --������
	end
end

-- ������� ������ �� ������
function NoUndead()
	local radn = math.random(0,3)
	if radn == 0 then
	return {Subrace.Human, Subrace.Neutral, Subrace.NeutralHuman, Subrace.NeutralGreenSkin, Subrace.NeutralDragon, Subrace.NeutralMarsh, Subrace.NeutralBarbarian, Subrace.NeutralWolf} --����
	elseif radn == 1 then
	return {Subrace.Elf, Subrace.Neutral, Subrace.NeutralElf, Subrace.NeutralGreenSkin, Subrace.NeutralDragon, Subrace.NeutralMarsh, Subrace.NeutralBarbarian, Subrace.NeutralWolf} --�����
	elseif radn == 2 then
	return {Subrace.Heretic, Subrace.Neutral, Subrace.NeutralGreenSkin, Subrace.NeutralDragon, Subrace.NeutralMarsh, Subrace.NeutralBarbarian, Subrace.NeutralWolf} --������
	elseif radn == 3 then
	return {Subrace.Dwarf, Subrace.Neutral, Subrace.NeutralGreenSkin, Subrace.NeutralDragon, Subrace.NeutralMarsh, Subrace.NeutralBarbarian, Subrace.NeutralWolf} --�����
	end
end

----------------------
-- ������ ���� ���� 0
---------------------

function z0Stacks1()
return {  -- 140*2
		subraceTypes = { Subrace.NeutralGreenSkin, Subrace.NeutralWolf },
		count = 2,
		value = { min = 280*kef, max = 280*kef*kr },
		loot = {
			items = {
				{ id = 'g001ig0180', min = 1, max = 1 }, --���25
				{ id = 'g000ig7001', min = 1, max = 1 }, --������50
				{ id = rmss(), min = 1, max = 1 }, --����. ���. ��� �����
				orr({ id = 'g000ig0021', min = 1, max = 1 }, { id = 'g000ig0024', min = 1, max = 1 }), --����/����
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
				{ id = 'g000ig0005', min = 1, max = 1 }, --���50
				{ id = 'g001ig0431', min = 1, max = 1 }, --������75
				orr({ id = 'g000ig0011', min = 1, max = 1 }, { id = 'g000ig0008', min = 1, max = 1 }), --���15/��������15
				orr({ id = 'g000ig0023', min = 1, max = 1 }, { id = 'g000ig0022', min = 1, max = 1 }), --�����/����		
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
				{ id = 'g001ig0378', min = 1, max = 1}, --���75
				orr({ id = 'g000ig0014', min = 1, max = 1 }, { id = 'g000ig0002', min = 1, max = 1 }), --�����15/������15
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
				orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --���/���100
				orr({ id = ExtraSmallManaProject4(race), min = 1, max = 1 }, { id = rmss(), min = 1, max = 1 }), --����. ���. ���. ���. / ���� ��� ��� �����
				{ id = b15(), min = 1, max = 1 }, -- ����. �����15
				{ id = d15(), min = 1, max = 1 }, -- ����. �������				
			}
		}
}
end

--------------
-- ������ ���� 1
--------------

function z1Stacks1(race)
return {  --200xp*2
		subraceTypes = { Subrace.NeutralGreenSkin, Subrace.NeutralWolf },
		count = 2,
		value = { min = 400*kef, max = 400*kef*kr },
		loot = {
			items = {
				{ id = 'g001ig0378', min = 2, max = 2 }, --���75
				{ id = 'g001ig0431', min = 1, max = 1 }, --������75
				{ id = ExtraSmallManaProject4(race), min = 1, max = 1 }, --����. ���. ���. ��� �����
				orr({ id = 'g000ig0011', min = 1, max = 1 }, { id = 'g000ig0008', min = 1, max = 1 }), --���15/��������15
				{ id = w15(), min = 1, max = 1 }, --����. ����
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
					orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --���/���100
					orr({ id = 'g000ig0014', min = 1, max = 1 }, { id = 'g000ig0002', min = 1, max = 1 }), --�����15/������15
					orr({ id = 'g000ig0021', min = 1, max = 1 }, { id = 'g000ig0024', min = 1, max = 1 }), --����/����
					{ id = 'g000ig7002', min = 1, max = 1 }, --������100
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
					orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --���/���100
					{ id = 'g001ig0378', min = 1, max = 1 }, --���75
					orr({ id = 'g000ig0022', min = 1, max = 1 }, { id = 'g000ig0023', min = 1, max = 1 }), --����/�����
					{ id = rms(), min = 1, max = 1 }, --����. ��� �����
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
					{ id = 'g000ig0006', min = 1, max = 1 }, --���100
					orr({ id = 'g001ig0533', min = 1, max = 1 },{ id = 'g001ig0026', min = 1, max = 1 }), -- ����� ������ ����� / ���� ����������� +10����� ���
					{ id = b15(), min = 1, max = 1 }, --����. �����15
					orr({ id = 'g001ig0125', min = 1, max = 1 }, { id = 'g001ig0036', min = 1, max = 1 }), --������/������					
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
					{ id = 'g000ig0006', min = 1, max = 1 }, --���100
					{ id = 'g001ig0432', min = 1, max = 1 }, --�������125
					{ id = d15(), min = 1, max = 1 }, --����.����					
				}
			}
}
end

------------------
-- ������ ���� 2
------------------

function z2Stacks1()
return { -- 300xp*2
		subraceTypes = rsub(),
		count = 2,
		value = { min = 600*kef, max = 600*kef*kr}, 
		loot = {
			items = {
				{ id = 'g000ig0006', min = 1, max = 1 }, --���100
				{ id = 'g001ig0378', min = 1, max = 1 }, --���75
				{ id = 'g001ig0432', min = 1, max = 1 }, --�������125
				{ id = rms(), min = 1, max = 1 }, --����. ��� �����				
				{ id = b15(), min = 1, max = 1 }, --����. �����15				
				orr({ id = 'g001ig0128', min = 1, max = 1 }, { id = d15(), min = 1, max = 1 }), --������/���.����
			}
		},
	}	
end

function z2Stacks2()
return { -- 400��*2
		subraceTypes = rsub(),
		count = 2,
		value = { min = 800*kef, max = 800*kef*kr },
		loot = {
			itemTypes = { Item.Orb },
			value = { min = 800, max = 800 },
			itemValue = { min = 400, max = 400 },
			items = {
				orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --���/���100
				{ id = 'g000ig0006', min = 1, max = 1 }, --���100
				orr({ id = 'g001ig0125', min = 1, max = 1 }, { id = 'g001ig0036', min = 1, max = 1 }), --������/������
				{ id = 'g000ig7003', min = 1, max = 1 }, --�������150
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
				{ id = 'g000ig0001', min = 1, max = 1 }, --���
				{ id = 'g000ig0006', min = 1, max = 1 }, --���100
				{ id = 'g001ig0125', min = 1, max = 1 }, --������
				{ id = rms(), min = 1, max = 1 }, --����. ��� �����				
			}
		}
	}
end

function z2Stacks4() 
return { -- 550��*1
		subraceTypes = NoUndead(),
		count = 1,
		value = { min = 550*kef, max = 550*kef*kr },
		loot = {
			items = {
				orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --���/���100
				orr({ id = 'g001ig0516', min = 1, max = 1 }, { id = 'g001ig0523', min = 1, max = 1 }), --����� ���������� ������(-10������)/����� �������(+10�����)
				{ id = w15(), min = 1, max = 1 }, --����. ����
				{ id = 'g001ig0036', min = 1, max = 1 }, --������
			}
		},
}
end

function z2Stacks5()
return { -- 600��*1
		subraceTypes = NoUndead(),
		count = 1,
		value = { min = 600*kef, max = 600*kef*kr },
		loot = {
			itemTypes = { Item.PotionPermanent },
			value = { min = 500, max = 600 },
			itemValue = { min = 500, max = 600 },
			items = {
				{ id = 'g000ig0006', min = 1, max = 1 }, --���100
				{ id = 'g001ig0433', min = 1, max = 1 }, --���������175
				{ id = b15(), min = 1, max = 1 }, --����. �����15
			}
		},
}
end

--------------------
-- ������ ���� 3
--------------------

function z3Stacks1(zshm)
return { -- 600xp
		subraceTypes = rsub(),
		count = 1,
		value = { min = 600*kef, max = 600*kef*kr},
		loot = {
			items = {
				orr(orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), orr({ id = 'g000ig0006', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 })), --���25%/���100-75%
				orr({ id = 'g001ig0180', min = 2, max = 2 }, { id = 'g000ig0005', min = 1, max = 1 }), --2���25/���50
				orr({ id = zshm, min = 1, max = 1 }, { id = 'g001ig0433', min = 1, max = 1 }), --��� ����� / ���������175
				orr({ id = b15(), min = 1, max = 1 }, { id = w15(), min = 1, max = 1 }), --����.�����15/����.����
			}
		},
	}
end

function z3Stacks2(zb30)
return { -- 700��
		subraceTypes = rsub(),
		count = 1,
		value = { min = 700*kef, max = 700*kef*kr },
		loot = {
			items = {
				orr(orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), orr({ id = 'g000ig0006', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 })), --���25%/���100-75%
				orr({ id = 'g001ig0180', min = 2, max = 2 }, { id = 'g000ig0005', min = 1, max = 1 }), --2���25/���50				
				{ id = zb30, min = 1, max = 1 }, --�����30
				orr(orr({ id = 'g001ig0125', min = 1, max = 1 }, { id = 'g001ig0036', min = 1, max = 1 }), orr({ id = d15(), min = 1, max = 1 }, orr({ id = b15(), min = 1, max = 1 }, { id = w15(), min = 1, max = 1 }))), -- ������/������ | d15/b15|w15
			}
		}
}
end

function z3Stacks3(zusil200)
return { -- 750��
		subraceTypes = rsub(),
		count = 1,
		value = { min = 750*kef, max = 750*kef*kr },
		loot = {
			itemTypes = { Item.Orb },
			value = { min = 450, max = 600 },
			itemValue = { min = 450, max = 600 },
				items = {
					orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }), --���/���100
					orr({ id = 'g001ig0180', min = 3, max = 3 }, { id = 'g001ig0378', min = 1, max = 1 }), --3���25/���75				
					{ id = zusil200, min = 1, max = 1 }, --��������200				
				}
		}
}
end

function z3Stacks4(zusil500, Scroll34)
return { -- 800��
		subraceTypes = NoUndead(),
		count = 1,
		value = { min = 800*kef, max = 800*kef*kr },
		loot = {
--			itemTypes = { Item.Scroll },
--			value = { min = 700, max = 700 },
--			itemValue = { min = 700, max = 700 },
			items = {
				orr(orr({ id = 'g001ig0378', min = 2, max = 2 }, { id = 'g001ig0378', min = 2, max = 2 }), orr({ id = 'g000ig0001', min = 1, max = 1 }, { id = 'g000ig0018', min = 1, max = 1 })), -- ���75-50%/���-25%/����-25%
				orr({ id = 'g000ig0006', min = 1, max = 1 }, { id = 'g000ig0005', min = 2, max = 2 }), --���100/2���50
				{ id = zusil500, min = 1, max = 1 }, --��������500					
				{ id = Scroll34, min = 1, max = 1 }, --������ �3/�4			
			}
		}
}
end

function z3Stacks5(zperm)
return { -- 850��
		subraceTypes = NoUndead(),
		count = 1,
		value = { min = 850*kef, max = 850*kef*kr },
		loot = {
			items = {
				orr(orr({ id = 'g000ig0006', min = 1, max = 1 }, { id = 'g000ig0001', min = 1, max = 1 }), orr({ id = 'g000ig0018', min = 1, max = 1 }, { id = 'g000ig0018', min = 1, max = 1 })), -- ���100-25%/���25%/����-50%
				orr({ id = 'g001ig0378', min = 1, max = 1 }, { id = 'g000ig0005', min = 2, max = 2 }), --2���75/3���50		
				{ id = zperm, min = 1, max = 1 }, --�����400					
				orr(orr({ id = rms(), min = 1, max = 1 }, { id = 'g000ig7004', min = 1, max = 1 }), orr({ id = b15(), min = 1, max = 1 }, { id = w15(), min = 1, max = 1 })), -- ��.���/������200/b15/w15
			}
		}
}
end

function z3StacksX()
return { -- 1100��
		subraceTypes = { Subrace.NeutralDragon, Subrace.Human, Subrace.Heretic, Subrace.Dwarf, Subrace.Elf }, -- Subrace.Undead, �����
		count = 1,
		value = { min = 1100*kef, max = 1100*kef*kr },
		loot = {
			items = {
				{ id = 'g000ig0001', min = 1, max = 1 }, --���
				orr({ id = 'g001ig0378', min = 2, max = 2 }, { id = 'g000ig0006', min = 1, max = 1 }), --���75/���100				
				orr({ id = 'g001ig0152', min = 1, max = 1 }, { id = 'g000ig0018', min = 1, max = 1 }), -- ������� ����������/����
				{ id = p15(), min = 1, max = 1 }, --����� 1200
				orr({ id = 'g001ig0151', min = 1, max = 1 }, { id = 'g000ig7008', min = 1, max = 1 }), -- ��� ����������/������� ��������-400
			}
		}
}
end
	
-------------------------

-- ������ ��������

function guard1() -- ����1 --����� 250-375
return {
	value = { min = 230*kef, max = 230*kef*kr },
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
	value = { min = 400*kef, max = 400*kef*kr },
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
	value = { min = 400*kef, max = 400*kef*kr },
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
	value = { min = 400*kef, max = 400*kef*kr },
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
	value = { min = 750*kef, max = 750*kef*kr },
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
	value = { min = 750*kef, max = 750*kef*kr },
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
	value = { min = 750*kef, max = 750*kef*kr },
	loot = {
		items = {
				{ id = 'g000ig0001', min = 1, max = 1 }, --���
				{ id = b15(), min = 1, max = 1 }, --����. ����� �� 15
		},
	}
}
end

-- ������� ������ �2-�0
function zoneGuardZone0()
return {
	subraceTypes = { Subrace.NeutralDragon, Subrace.Human, Subrace.Heretic, Subrace.Dwarf, Subrace.Elf }, -- Subrace.Undead, �����
	value = { min = 1000*kef, max = 1000*kef*kr }, --
	loot = {
		value = { min = 600, max = 740 },
		itemValue = { min = 600, max = 740 },
		itemTypes = { Item.PotionPermanent },
		items = {
			{ id = 'g000ig0001', min = 2, max = 2 },
			{ id = 'g000ig0006', min = 2, max = 2 },
			orr({ id = 'g001ig0151', min = 1, max = 1 }, { id = 'g000ig7006', min = 1, max = 1 }), -- ��� ����������/������-300
			{ id = p05(), min = 1, max = 1},
			orr3({id = b15(), min = 1, max = 1}, {id = w15(), min = 1, max = 1}, {id = d15(), min = 1, max = 1}),
		}
	}
}
end


----------------------

-- ������� �������

-- ������ ������� � ��������� ����� 0
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
			garrison = { -- �������
				subraceTypes = { getPlayerSubRace(playerRace) },
				value = { min = 50, max = 50 }, 
				loot = {
					itemTypes = { Item.Weapon, Item.Armor, Item.Jewel, Item.TravelItem },
					value = { min = 300, max = 300 },
					itemValue = { min = 300, max = 300 },				
					items = {
						{ id = 'g000ig0001', min = 3, max = 3}, --���
						{ id = 'g000ig0006', min = 4, max = 4}, --���100
						{ id = 'g001ig0378', min = 5, max = 5}, --���75
						{ id = 'g000ig0005', min = 6, max = 6}, -- ���50
						{ id = 'g001ig0180', min = 7, max = 7}, -- ���25

						{ id = 'g000ig0002', min = 1, max = 1 }, --15
						{ id = 'g000ig0014', min = 1, max = 1 }, --15
						{ id = 'g000ig0011', min = 1, max = 1 }, --15
						{ id = 'g000ig0008', min = 1, max = 1 }, --15
						{ id = b15(), min = 1, max = 1}, -- ����. �����15
						{ id = b15(), min = 1, max = 1}, -- ����. �����15

						{ id = 'g000ig0021', min = 1, max = 1 }, -- ����
						{ id = 'g000ig0022', min = 1, max = 1 }, -- ����
						{ id = 'g000ig0023', min = 1, max = 1 }, -- ����
						{ id = 'g000ig0024', min = 1, max = 1 }, -- ����
						{ id = w15(), min = 1, max = 1}, -- ����. ����
						{ id = w15(), min = 1, max = 1}, -- ����. ����

						orr({ id = 'g001ig0125', min = 1, max = 1 }, { id = 'g001ig0036', min = 1, max = 1 }), --������/������
						orr({ id = 'g001ig0355', min = 1, max = 1 }, { id = 'g001ig0128', min = 1, max = 1 }), --��������/���� ������
						
						{ id = d15(), min = 1, max = 1}, -- ����. �������
						{ id = d15(), min = 1, max = 1}, -- ����. �������
						
						orr(orr({ id = 'g001ig0458', min = 1, max = 1}, { id = 'g000ig9031', min = 1, max = 1}), orr({ id = 'g000ig9022', min = 1, max = 1}, { id = 'g001ig0302', min = 1, max = 1})), -- 25 ����� ��������� ��������� / ����� ����� | ����� ����� / ����� ������
						orr(orr({ id = 'g001ig0189', min = 1, max = 1}, { id = 'g001ig0178', min = 1, max = 1}), orr({ id = 'g001ig0472', min = 1, max = 1}, { id = 'g001ig0473', min = 1, max = 1})), -- 50 ����� ����� / ����� ������ | ����� �������� ������� / ����� ������������ �������
		
						{ id = ExtraManaProject4(playerRace), min = 1, max = 1 }, --���.���
												
						orr(orr({ id = 'g000ig5021', min = 1, max = 1}, { id = 'g000ig5003', min = 1, max = 1}), orr({ id = 'g001ig0250', min = 1, max = 1}, { id = 'g000ig5023', min = 1, max = 1})), -- ������ �.���, ����, �.�����, �.������
						orr(orr({ id = 'g001ig0248', min = 1, max = 1}, { id = 'g000ig5045', min = 1, max = 1}), orr({ id = 'g000ig5064', min = 1, max = 1}, { id = 'g000ig5101', min = 1, max = 1})), -- ������ ����. ����, tormentio-�����, ��������, ���� 
						
						orr3({id = 'g000ig9105', min = 1, max = 1}, {id = 'g000ig9131', min = 1, max = 1}, {id = TalismanHome(playerRace), min = 1, max = 1}), -- �������� ������ / �������� ����� / ������ �����
						
						-- �����
						orr5({id = 'g001ig0532', min = 1, max = 1}, {id = 'g000ig5009', min = 1, max = 1}, {id = 'g000ig5041', min = 1, max = 1}, {id = 'g001ig0006', min = 1, max = 1}, {id = 'g001ig0130', min = 1, max = 1}), -- ����� ��������� +1���� / ������ "�������� ������" / ������ "Incantare Hellhound" / ������� ���������� / ������� �����������
						
						
					}
				},
			},
			spells = {
				CapSpell(playerRace)
			}			
		}
	}
end

-- ������� ���� 1
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

-- ������� ���� 2
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

-- ������� ���� 3
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
			z3Stacks1('g001ig0146'), z3Stacks1('g001ig0148'), z3Stacks1('g001ig0149'), z3Stacks1('g001ig0147'), z3Stacks1('g001ig0150'), -- ��� �����/���/������/������/�������
			z3Stacks2('g000ig0003'), z3Stacks2('g000ig0009'), z3Stacks2('g000ig0015'), z3Stacks2('g000ig0012'), -- �����30 �������/��������/����/��������
			z3Stacks3('g001ig0560'), z3Stacks3('g001ig0547'), z3Stacks3('g001ig0490'), z3Stacks3('g001ig0128'), -- ����� ����������� 25�������/����� ����������� ������� +10����/����� ������������ +25��/������� ������ �� ������ 
			z3Stacks4('g001ig0562', orr('g000ig5091', 'g000ig5055')), -- ����� �������� +20���� � ������ "Tempus status" -33��� / ������ "Tortio menta" -33��������
			z3Stacks4('g001ig0491', orr('g000ig5039', 'g001ig0586')), -- ����� ��������� ����� +25���� � ������ "�������������" / ������ "������������� -20 ����
			z3Stacks4('g001ig0355', orr('g000ig5079', 'g000ig5096')), -- ����� ��������� ����� +�������� � ������ "������ �� ������" / ������ "������������� �������" +35����
			z3Stacks4('g001ig0127', orr('g000ig5012', 'g000ig5013')), -- ������� ��������� ���� +50������ � ������ "������ �����" +15 ����� / ������ "������ ����" +15���� � ����
			z3Stacks5('g001ig0315'), z3Stacks5('g001ig0307'), z3Stacks5('g001ig0309'), z3Stacks5('g001ig0313'), -- ����� ��������/����� ���������/������� ������/������� �����������������+5����
			z3StacksX(), -- �����+15
		},
		bags = bags3(),
	}
end

-------------------------------------------------


-- ������� ���: ������ ������� � ������ (������� 2 � 5)

local z0 = 2 
local z1 = 2
local z2 = 2
local zc = 4.5

function getZones(races)
	local zones = {}

	zones[1] = getPlayerZone0(0, races[1], z0) -- �������
	zones[2] = getPlayerZone1(1, races[1], z1) -- ������
	zones[3] = getTreasureZone2(2, races[1], z2) -- �����

	zones[4] = getPlayerZone0(11, races[2], z0) -- �.�����
	zones[5] = getPlayerZone1(12, races[2], z1) -- ����������
	zones[6] = getTreasureZone2(5, races[2], z2) -- �����

	zones[7] = getPlayerZone0(8, races[3], z0) -- ���������
	zones[8] = getPlayerZone1(7, races[3], z1) -- �������
	zones[9] = getTreasureZone2(6, races[3], z2) -- �����
	
	zones[10] = getPlayerZone0(9, races[4], z0) -- ���������
	zones[11] = getPlayerZone1(10, races[4], z1) -- �.�������
	zones[12] = getTreasureZone2(3, races[4], z2) -- �����
	
	zones[13] = getTreasureZone3(4, zc) -- ������


	return zones
end

----------------------

-- �������: ������ ������� � ��������� ����� ������:
function getZoneConnections()
	return {

--�� �2-�����
--{from = 2, to = 4, guard = zoneGuardZone()},	
--{from = 5, to = 4, guard = zoneGuardZone()},
--{from = 6, to = 4, guard = zoneGuardZone()},
--{from = 3, to = 4, guard = zoneGuardZone()},

--�� �2-�0 (������ �������� �������, �������� �����)
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

-- ������ �������� ����������� �������� ��� ���������� - ��
function getTemplateContents(races)
	local contents = {}
	
	contents.zones = getZones(races)
	contents.connections = getZoneConnections()

	return contents
end

-- ������
template = {
	name = 'Bladerunner 1.3c',
	description = '������ ���� � ������, �� ������ ��������: �����, ������, �����, �����. ������� �� ���������! ����� ��������: 2200700846776804',
	minSize = 72,
	maxSize = 72,
	maxPlayers = 4,
	startingGold = 800,
	startingNativeMana = 150,
	roads = 40,
	forest = 25,

forbiddenUnits = {

-- �����������


-- ����������� �����-������ � �� ������ �����
'g000uu0021', --�������
'g000uu8248', --�������
'g000uu0020', --��������
'g000uu0019', --������ �� ������
'g000uu0022', --��������
'g000uu0023', --���
'g000uu5300', --���
'g000uu0044', --����������� �����
'g000uu0045', --�������
'g000uu0046', --������
'g000uu8249', --������
'g000uu0047', --����������
'g000uu0048', --���
'g000uu5301', --���
'g000uu0070', --������
'g000uu0071', --��������
'g000uu0072', --����������
'g000uu8250', --����������
'g000uu0073', --���������
'g000uu0074', --���
'g000uu5302', --���
'g000uu0096', --������ ������
'g000uu0097', --���������
'g000uu8252', --���������
'g000uu0098', --�������� �����
'g000uu8253', --�������� �����
'g000uu0099', --������
'g000uu0100', --���
'g000uu5303', --���
'g000uu8251', --������
'g000uu8010', --������
'g000uu8009', --������ ����
'g000uu8011', --����� ����
'g000uu8012', --������
'g000uu8013', --���
'g000uu5304', --���

-- ����������� �����-�������
'g001uu0021', --�������
'g001uu0020', --��������
'g001uu0019', --������ �� ������
'g001uu0022', --��������
'g001uu0023', --���
'g001uu0045', --�������
'g001uu0044', --����������� �����
'g001uu0046', --������
'g070uu0003', --������
'g001uu0047', --����������
'g001uu0048', --���
'g001uu0072', --����������
'g070uu0004', --����������
'g001uu0071', --��������
'g001uu0070', --������
'g001uu0073', --���������
'g001uu0074', --���
'g001uu0098', --�������� �����
'g070uu0001', --���������
'g001uu0097', --���������
'g001uu0096', --������ ������
'g001uu0099', --������
'g001uu0100', --���
'g001uu8010', --������
'g070uu0002', --������
'g001uu8009', --������ ����
'g001uu8011', --����� ����
'g001uu8012', --������
'g001uu8013', --���

-- ����������� �����������-������� � ������� ���-��� �����
'g000uu8185', -- ������� ������
'g001uu7598', -- ���������
'g001uu8242', -- X����� �����
'g000uu0164', -- ���������� ������

-- ����������� �������-������� � ������� ���-��� ����� 
'g000uu0017', -- ��������
'g000uu8035', -- ��������
'g002uu8039', -- �������
'g000uu7570', -- �������
'g000uu7569', -- �����
'g000uu8264', -- ������
'g000uu0151', -- ���������������
'g000uu0013', -- ���������
'g000uu8214', -- ���������
'g000uu8034', -- ��������� ����������
'g000uu0150', -- ��������
'g003uu8039', -- ����� �����
'g003uu8038', -- ��� ��������
'g000uu8235', -- ��������
'g000uu2002', -- ��������
'g003uu8037', -- ��������� �����

-- ����������� ������ � ������ �������������� 20%
'g000uu5236', -- ����
'g000uu5117', -- ������
'g000uu5101', -- ����������
'g000uu8308', -- ������� �������
'g000uu5130', -- ���������
'g000uu7556', -- ������-����
'g000uu7533', -- �����
'g000uu7510', -- ����� ��� �����
'g000uu7616', -- ���� ����� �����
'g000uu6004', -- ������� ��� �.
'g000uu5201', -- ������ �.
'g000uu7539', -- �������
'g000uu7592', -- ������
'g000uu7516', -- ��� ����� �.
'g000uu5262', -- ������� �.
'g000uu7614', -- �������� ��� �����
'g000uu7553', -- �������-�����

--��� ����������� ������� � ������� ���-��� ����� (������ � �������)
'g000uu8287', -- ��.������ �.
'g000uu8288', -- ��� �������� �.
'g000uu7519', -- ������� �.
'g000uu8215', -- ��������� �.
'g000uu8262', -- �������� �.
'g000uu8289', -- ����� ����� �
'g000uu7521', -- �������� �.
'g000uu5006', -- ������� ������
'g000uu8222', -- ����� �. �����
'g000uu8218', -- �����
'g000uu7544', -- ��������������
'g000uu8213', -- ������-�����
'g001uu8262', -- ��������
'g000uu2021', -- �����������
'g000uu6107', -- ������ ����-����
'g000uu7619', -- ����� ������
'g000uu8044', -- ������ ���� ���� �.


-------------�����

'g000uu8266', -- �������--
'g000uu8265', -- ���� �������--
'g001uu0171', -- �������
'g000uu8217', -- ���������� ������ �.
'g000uu8216', -- ���������� ������
'g000uu8269', -- �������� ������ �.
'g001uu8269', -- �������� ������
'g000uu5022', -- ������ ������
'g000uu5122', -- ������ ������ �.
'g000uu8144', -- ������ ���� ���� �.
'g000uu2007', -- �����������
'g000uu2008', -- ����� ������

},

forbiddenItems = {

-----------�����������
-- ��������
'g000ig6008', --����� �����������
'g000ig6017', --����� �������� �����
'g000ig6018', --����� �������
'g000ig5092', --������ "terra illudere"
'g000ig0019', --������� ��������������
'g000ig0020', --������� ����������
'g000ig0017', --������� ������������
'g001ig0126', --������� ����������
'g001ig0129', --����� ����������50
'g001ig0020', --������� ���� ����������
'g001ig0035', --������� ���� ��������� ����
'g000ig5051', --������ "sanctuera"
'g000ig5083', --������ "���� ���"
'g000ig5095', --������ "�������"
'g000ig8005', --����������� ������
'g000ig9006', --����� ����������
'g000ig9039', --����� �����
'g001ig0596', --�������

-- �������� �� �����/��� �����
'g000ig5032', --������ "����� ��������"
'g000ig5053', --������ "Paraseus"
'g000ig5094', --������ "������ ������"
'g000ig6004', --����� �����������
'g000ig6005', --����� �������
'g001ig0390', --����� �����
'g001ig0389', --����� ����������������
'g001ig0513', --����� �������� ����

-- �٨
'g001ig0575', --������ "����������� �����

-------------�����

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
'g000ig2007', --������ �������--
'g001ig0275', --����� �����������������--
'g000ig1011', --������ ������������
'g001ig0044', --������ ������ (��������)

--������ �� ����
'g000ig5027', --������ ������������
'g000ig5006', --������ "���������"--
'g000ig5100', --������ "��������"--
'g000ig5113', --������ "�����"--
'g000ig5099', --������ "����������"--
'g001ig0094', --������ "�����������" �����������
'g000ig5120', --������ "����������" �����������

--����� ����� (����)
'g001ig0386', -- ����� ���� ������
'g001ig0317', --����� ����������� ������� +15 �������� (����� 600 �����)

--���
'g000ig9125', --�������� ������� --�2 �������� �� �� ���� (����� ��-�� �-� �1 - ����� 400)
'g000ig9129', --�������� ���������� ����� (����� ��-�� �-� �1)

--���.�����
'g000ig3008', --���� ������� (������ ��)

--������
'g001ig0195', --������ "����������" (��� ������� �� �����)
'g001ig0439', --������ "Et seminibus discordiae - ��������� ��������� �� 1 � ������� 5x5 (�� ��� ���������)
'g001ig0440', --������ "��������� �������� ����� ���������
'g001ig0092', --������ "������� ����" �� 400 � ����� ����� ����
'g000ig5057', --������ "�erum Facies" ������ �� ��������� �� 700 � ����� ����� ����
'g000ig5118', --������ "����������" ��������� ����� ���������� �� 3 � ������� 5�5.
'g000ig5057', --������ "�erum Facies" ������ �� ���������.
--�� ���� �4+
'g000ig5090', --Potentia Ignis
'g000ig5056', --Sinestra ignis
'g000ig5086', --���� ����
'g000ig5112', --������
'g000ig5077', --�������� �������
'g000ig5093', --����� ������
'g000ig5105', --���������
'g000ig5081', --���� ������
'g000ig5060', --Deus talonis
'g000ig5019', --����������
'g000ig5080', --�����������

},
	
	getContents = getTemplateContents
}