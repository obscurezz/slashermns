-- template: freedom
-- author: obscure

-- 0 1 2
-- 7 8 3
-- 6 5 4

----------
-- vars describe subrace types
local t0Subrace = { Subrace.NeutralGreenSkin, Subrace.NeutralElf, Subrace.NeutralWolf, Subrace.NeutralHuman, Subrace.Neutral }
local t1Subrace = { Subrace.NeutralGreenSkin, Subrace.NeutralMarsh, Subrace.NeutralWolf, Subrace.NeutralElf, Subrace.NeutralHuman, Subrace.NeutralBarbarian, Subrace.Neutral }
local t2Subrace = { Subrace.NeutralMarsh, Subrace.Heretic, Subrace.NeutralElf, Subrace.Human, Subrace.Elf, Subrace.NeutralHuman, Subrace.NeutralBarbarian, Subrace.NeutralGreenSkin, Subrace.Undead, Subrace.Dwarf, Subrace.Neutral }
local t3Subrace = { Subrace.Dwarf, Subrace.Undead, Subrace.NeutralMarsh, Subrace.Heretic, Subrace.NeutralElf, Subrace.Human, Subrace.Elf, Subrace.NeutralHuman, Subrace.NeutralBarbarian, Subrace.NeutralDragon, Subrace.Neutral }
local GOsubrace = { Subrace.NeutralDragon }
-- end
----------

----------
-- functions generates reward for town or ruins
function rewardGenerator(objectType, objectDefinition)

	local rewardTable = { }
	local rewardRandomFlag = nil

    local startRuinPermanent = {'g001ig0311', 'g001ig0313', 'g001ig0534', 'g001ig0309', 'g001ig0033', 'g001ig0533', 'g001ig0307', 'g001ig0315'}

    local t1Movement = {'g000ig5022', 'g000ig5100'}
    local t1Vision = {'g000ig5006',  'g000ig5068', 'g001ig0072'}
    local t2Movement = {'g001ig0389', 'g000ig5006', 'g001ig0390'}
    local t2Vision = {'g000ig6007', 'g000ig6006', 'g000ig5030'}

	local t1Artifacts = {'g001ig0582', 'g001ig0611', 'g001ig0418', 'g000ig2001', 'g001ig0100', 'g001ig0182', 'g000ig3001', 'g001ig0048'}
	local t1Banners = {'g000ig1001', 'g001ig0051', 'g001ig0369', 'g000ig1003', 'g001ig0587', 'g000ig1005', 'g000ig1007'}
	local t1Jewels = {'g001ig0421', 'g001ig0101', 'g001ig0493', 'g001ig0497', 'g000ig4005', 'g001ig0495', 'g000ig4002', 'g000ig4004', 'g001ig0494', 'g000ig4008', 'g001ig0428', 'g000ig4006', 'g000ig4001', 'g000ig4003'}
	local t1Orbs = {'g001ig0191', 'g001ig0190', 'g000ig9024', 'g001ig0304', 'g000ig9017', 'g001ig0302', 'g001ig0467', 'g001ig0456', 'g000ig9036', 'g001ig0470', 'g001ig0295', 'g001ig0457', 'g001ig0188', 'g001ig0469', 'g001ig0466', 'g001ig0187', 'g001ig0301', 'g001ig0478', 'g000ig9013', 'g001ig0299', 'g001ig0303', 'g001ig0446', 'g001ig0297', 'g001ig0448', 'g001ig0453', 'g001ig0300', 'g000ig9031', 'g001ig0192', 'g000ig9033', 'g001ig0458', 'g001ig0471', 'g001ig0489', 'g000ig9034', 'g000ig9022', 'g001ig0468', 'g001ig0189'}
	local t1Talismans = {'g001ig0260', 'g000ig9101', 'g001ig0269', 'g001ig0271', 'g001ig0267', 'g001ig0275', 'g001ig0273', 'g001ig0264', 'g001ig0266', 'g001ig0272', 'g001ig0268', 'g001ig0262', 'g001ig0265', 'g001ig0261'}
	local t1Travel = {'g001ig0108', 'g001ig0110', 'g001ig0105', 'g001ig0107', 'g001ig0109', 'g001ig0106', 'g001ig0113'}
	
	local t2Artifacts = {'g001ig0559', 'g001ig0047', 'g000ig3003', 'g000ig3002', 'g001ig0042', 'g001ig0071', 'g000ig2002', 'g001ig0557', 'g001ig0417', 'g001ig0040', 'g000ig9137', 'g000ig2003', 'g001ig0558', 'g000ig3019', 'g000ig3017', 'g001ig0197', 'g001ig0173', 'g001ig0196', 'g001ig0124', 'g001ig0594', 'g001ig0591', 'g001ig0612', 'g001ig0041', 'g001ig0488', 'g001ig0592', 'g001ig0487', 'g001ig0416', 'g001ig0589', 'g001ig0045'}
	local t2Banners = {'g001ig0588', 'g000ig1002', 'g000ig1008', 'g001ig0289', 'g001ig0142', 'g001ig0293', 'g001ig0145', 'g001ig0361', 'g001ig0140', 'g001ig0364', 'g000ig1006', 'g001ig0370', 'g001ig0292', 'g001ig0357', 'g000ig1004', 'g001ig0141', 'g001ig0143', 'g001ig0139', 'g001ig0374', 'g001ig0365', 'g001ig0358'}
	local t2Jewels = {'g000ig4007', 'g000ig3020', 'g001ig0420', 'g001ig0104', 'g001ig0427', 'g001ig0422', 'g001ig0423', 'g001ig0605', 'g001ig0099', 'g000ig3022'}
	local t2Orbs = {'g001ig0294', 'g001ig0157', 'g001ig0443', 'g000ig9010', 'g001ig0455', 'g001ig0476', 'g001ig0477', 'g001ig0461', 'g001ig0473', 'g001ig0472', 'g001ig0055', 'g000ig9005', 'g001ig0450', 'g000ig9029', 'g001ig0058', 'g000ig9016', 'g001ig0054', 'g001ig0459', 'g000ig9038', 'g000ig9020', 'g001ig0454', 'g001ig0056', 'g001ig0183', 'g000ig9042', 'g000ig9002', 'g001ig0475', 'g001ig0057', 'g000ig9015', 'g000ig9003', 'g001ig0479', 'g001ig0474', 'g001ig0053'}
	local t2Talismans = {'g000ig9138', 'g000ig9113', 'g001ig0184', 'g000ig9107', 'g001ig0063', 'g001ig0258', 'g000ig9114', 'g000ig9115', 'g000ig9129', 'g001ig0186', 'g001ig0259', 'g001ig0274', 'g001ig0082'}
	local t2Travel = {'g001ig0111', 'g000ig8003', 'g001ig0114', 'g000ig1010'}
	
	local t3Artifacts = {'g001ig0046', 'g000ig3006', 'g001ig0174', 'g001ig0158', 'g000ig3004', 'g000ig9035', 'g001ig0415', 'g001ig0604', 'g001ig0411', 'g000ig2004', 'g001ig0585', 'g001ig0410', 'g001ig0060', 'g001ig0590', 'g001ig0413'}
	local t3Banners = {'g000ig1016', 'g001ig0052', 'g001ig0367', 'g001ig0375', 'g001ig0372', 'g000ig1017', 'g001ig0359', 'g001ig0500', 'g001ig0363', 'g001ig0373', 'g000ig1015', 'g001ig0362', 'g001ig0290', 'g001ig0291'}
	local t3Jewels = {'g001ig0419', 'g001ig0597', 'g000ig2006', 'g001ig0116', 'g001ig0430', 'g001ig0037', 'g001ig0156', 'g001ig0424', 'g001ig0425', 'g001ig0539', 'g001ig0429'}
	local t3Orbs = {'g000ig9014', 'g001ig0447', 'g001ig0462', 'g001ig0059'}
	local t3Talismans = {'g000ig9037', 'g001ig0066', 'g001ig0067', 'g000ig9105', 'g000ig9124', 'g000ig9116', 'g001ig0202', 'g000ig9133', 'g001ig0201', 'g000ig9128', 'g000ig9110', 'g001ig0064', 'g000ig9103', 'g000ig9132', 'g000ig9127', 'g000ig9109', 'g000ig9108', 'g000ig9102', 'g001ig0298', 'g000ig9106'}
	local t3Travel = {'g001ig0115', 'g001ig0112', 'g000ig8004', 'g001ig0606'}
	
	local t4Artifacts = {'g000ig2005', 'g001ig0179', 'g001ig0039', 'g001ig0102', 'g001ig0412'}
	local t4Banners = {'g001ig0144', 'g001ig0366', 'g001ig0153', 'g001ig0360'}
	local t4Jewels = {'g000ig3005', 'g000ig7010', 'g001ig0596', 'g001ig0038'}
	
	local t5Artifacts = {'g001ig0414', 'g001ig0043', 'g000ig3018', 'g000ig3021', 'g000ig3015', 'g001ig0414', 'g000ig3016'}
	
	local wands = { 'g000ig6020', 'g001ig0122', 'g001ig0119', 'g000ig6014', 'g000ig6021', 'g001ig0121', 'g001ig0118', 'g000ig6002', 'g000ig6011', 'g001ig0120', 'g000ig6005', 'g000ig6007', 'g000ig6003', 'g000ig6012', 'g000ig6006' }
	
	local smallValuable = {'g000ig7001', 'g001ig0431', 'g000ig7002', 'g001ig0432'}
	local smallMana = {'g001ig0481', 'g001ig0482', 'g001ig0483', 'g001ig0484', 'g001ig0485', 'g001ig0486'}
	local mediumValuable = {'g000ig7003', 'g001ig0433', 'g000ig7004', 'g000ig7005'}
	local mediumMana = {'g001ig0146', 'g001ig0147', 'g001ig0148', 'g001ig0149', 'g001ig0150', 'g001ig0151'}
	local bigValuable = {'g000ig7007', 'g000ig7006', 'g000ig7008', 'g000ig7009'}
	local bigMana = {'g001ig0282', 'g001ig0277', 'g001ig0278', 'g001ig0279', 'g001ig0280', 'g001ig0281'}
	
	local potionLow = { 'g000ig0011', 'g000ig0008', 'g000ig0014', 'g000ig0002', 'g000ig0022', 'g000ig0021', 'g000ig0023', 'g000ig0024', 'g001ig0125', 'g001ig0127', 'g001ig0547' }
	local potionProtect = { 'g001ig0560', 'g001ig0345', 'g001ig0349', 'g001ig0329', 'g001ig0343', 'g001ig0327', 'g001ig0335', 'g001ig0337', 'g001ig0353', 'g001ig0351', 'g001ig0331' }
	local potionHigh = { 'g000ig0003', 'g001ig0490', 'g000ig0015', 'g000ig0012', 'g000ig0009', 'g001ig0562', 'g001ig0491', 'g001ig0128', 'g001ig0355' }
	
	local scrolls = {'g001ig0091', 'g000ig5097', 'g000ig5105', 'g000ig5067', 'g000ig5049', 'g001ig0095', 'g000ig5084', 'g001ig0084', 'g000ig5118', 'g000ig5098', 'g000ig5003', 'g000ig5070', 'g000ig5064', 'g001ig0250', 'g001ig0073', 'g001ig0254', 'g000ig5028', 'g000ig5013', 'g000ig5048', 'g000ig5063', 'g000ig5099', 'g001ig0248', 'g001ig0194', 'g000ig5088', 'g000ig5029', 'g000ig5007', 'g000ig5025', 'g001ig0103', 'g001ig0256', 'g000ig5069', 'g000ig5043', 'g000ig5065', 'g000ig5101', 'g000ig5024', 'g000ig5104', 'g001ig0072', 'g000ig5102', 'g000ig5106', 'g000ig5021', 'g001ig0252', 'g000ig5022', 'g001ig0247', 'g001ig0253', 'g000ig5041', 'g000ig5044', 'g000ig5020', 'g000ig5042', 'g000ig5061', 'g000ig5107', 'g000ig5062', 'g001ig0568', 'g000ig5050', 'g000ig5045', 'g000ig5002', 'g000ig5004', 'g001ig0255', 'g000ig5026', 'g001ig0407', 'g000ig5023'}
	
	local permanent = {'g000ig0004', 'g001ig0130', 'g000ig0013', 'g000ig0016', 'g000ig0007', 'g000ig0010', 'g001ig0017', 'g001ig0033', 'g001ig0083', 'g001ig0083', 'g001ig0030', 'g001ig0029', 'g001ig0026', 'g001ig0022', 'g001ig0028', 'g001ig0027', 'g001ig0317', 'g001ig0548'}
    
    local protection = {'g001ig0454', 'g001ig0056', 'g001ig0054', 'g001ig0055', 'g001ig0053', 'g001ig0058', 'g001ig0057'}
    
    if objectType == 'town' and objectDefinition == 'startT1' then
		table.insert(rewardTable, { id = 'g001ig0180', min = 3, max = 4 })
		table.insert(rewardTable, { id = 'g000ig0001', min = 1, max = 1 })

        for i = 1,2 do
            x = math.random(1, #t1Artifacts)
            table.insert(rewardTable, { id = t1Artifacts[x], min = 1, max = 1})
            table.remove(t1Artifacts, x)
        end

        for i = 1,2 do
            x = math.random(1, #potionLow)
            table.insert(rewardTable, { id = potionLow[x], min = 1, max = 2})
            table.remove(potionLow, x)
        end

        table.insert(rewardTable, { id = 'g001ig0151', min = 1, max = 1})
	elseif objectType == 'town' and objectDefinition == 'startT2' then
		table.insert(rewardTable, { id = 'g000ig0005', min = 2, max = 2 })
		table.insert(rewardTable, { id = 'g000ig0001', min = 1, max = 1 })
		table.insert(rewardTable, { id = t2Jewels[math.random(#t2Jewels)], min = 1, max = 1})
		table.insert(rewardTable, { id = t1Banners[math.random(#t1Banners)], min = 1, max = 1})
        table.insert(rewardTable, { id = 'g000ig5009', min = 1, max = 1 })

        for i = 1,2 do
            x = math.random(1, #potionLow)
            table.insert(rewardTable, { id = potionLow[x], min = 1, max = 2})
            table.remove(potionLow, x)
        end
        
        table.insert(rewardTable, { id = potionProtect[math.random(#potionProtect)], min = 1, max = 1})
        table.insert(rewardTable, { id = 'g001ig0282', min = 1, max = 1})
        table.insert(rewardTable, { id = 'g001ig0194', min = 1, max = 1})
	elseif objectType == 'town' and objectDefinition == 'bufferT3' then
		table.insert(rewardTable, { id = 'g000ig0006', min = 1, max = 2 })
		table.insert(rewardTable, { id = 'g000ig0001', min = 1, max = 2 })

        for i = 1,2 do
            x = math.random(1, #potionLow)
            table.insert(rewardTable, { id = potionLow[x], min = 2, max = 2})
            table.remove(potionLow, x)
        end

		table.insert(rewardTable, { id = potionHigh[math.random(#potionHigh)], min = 1, max = 1})
        table.insert(rewardTable, { id = 'g001ig0282', min = 1, max = 1})
        table.insert(rewardTable, { id = 'g000ig5085', min = 1, max = 1})
        table.insert(rewardTable, { id = 'g000ig5030', min = 1, max = 1})
        table.insert(rewardTable, { id = 'g000ig0020', min = 1, max = 1})
		
		rewardRandomFlag = math.random(0,2)
		if rewardRandomFlag == 0 then
			table.insert(rewardTable, { id = t1Banners[math.random(#t1Banners)], min = 1, max = 1})
			table.insert(rewardTable, { id = t2Travel[math.random(#t2Travel)], min = 1, max = 1})
			table.insert(rewardTable, { id = t2Jewels[math.random(#t2Jewels)], min = 1, max = 1})
		elseif rewardRandomFlag == 1 then
			table.insert(rewardTable, { id = t1Travel[math.random(#t2Travel)], min = 1, max = 1})
			table.insert(rewardTable, { id = t2Jewels[math.random(#t2Jewels)], min = 1, max = 1})
			table.insert(rewardTable, { id = t2Banners[math.random(#t1Banners)], min = 1, max = 1})
		elseif rewardRandomFlag == 2 then
			table.insert(rewardTable, { id = t2Banners[math.random(#t2Banners)], min = 1, max = 1})
			table.insert(rewardTable, { id = t2Travel[math.random(#t2Travel)], min = 1, max = 1})
			table.insert(rewardTable, { id = t1Jewels[math.random(#t1Jewels)], min = 1, max = 1})
		end
		rewardRandomFlag = nil
	elseif objectType == 'town' and objectDefinition == 'bigT2' then
		table.insert(rewardTable, { id = 'g000ig0005', min = 1, max = 2 })
		table.insert(rewardTable, { id = 'g000ig0006', min = 1, max = 1 })
		table.insert(rewardTable, { id = 'g000ig7002', min = 1, max = 1 })
		table.insert(rewardTable, { id = 'g001ig0151', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g000ig5030', min = 1, max = 1 })

        for i = 1,2 do
            x = math.random(1, #t1Orbs)
            table.insert(rewardTable, { id = t1Orbs[x], min = 1, max = 2})
            table.remove(t1Orbs, x)
        end

		table.insert(rewardTable, { id = potionLow[math.random(#potionLow)], min = 1, max = 1})
	elseif objectType == 'town' and objectDefinition == 'bigT4' then
		table.insert(rewardTable, { id = 'g000ig0006', min = 2, max = 2 })
		table.insert(rewardTable, { id = 'g000ig0001', min = 2, max = 2 })
		table.insert(rewardTable, { id = 'g001ig0152', min = 1, max = 1 })
		table.insert(rewardTable, { id = t2Orbs[math.random(#t2Orbs)], min = 1, max = 1})
        table.insert(rewardTable, { id = 'g000ig5068', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g000ig9043', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g000ig0017', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g000ig0019', min = 1, max = 1 })

        for i = 1,2 do
            x = math.random(1, #potionLow)
            table.insert(rewardTable, { id = potionLow[x], min = 2, max = 2})
            table.remove(potionLow, x)
        end

        for i = 1,2 do
            x = math.random(1, #potionHigh)
            table.insert(rewardTable, { id = potionHigh[x], min = 2, max = 2})
            table.remove(potionHigh, x)
        end

		table.insert(rewardTable, { id = bigValuable[math.random(#bigValuable)], min = 1, max = 1})
        table.insert(rewardTable, { id = 'g001ig0288', min = 1, max = 1 })
		
		rewardRandomFlag = math.random(0,1)
		if rewardRandomFlag == 0 then
			table.insert(rewardTable, { id = t2Banners[math.random(#t2Banners)], min = 1, max = 1})
			table.insert(rewardTable, { id = t3Artifacts[math.random(#t3Artifacts)], min = 1, max = 1})
            table.insert(rewardTable, { id = wands[math.random(#wands)], min = 1, max = 1})
		elseif rewardRandomFlag == 1 then
			table.insert(rewardTable, { id = t3Banners[math.random(#t3Banners)], min = 1, max = 1})
			table.insert(rewardTable, { id = t2Artifacts[math.random(#t2Artifacts)], min = 1, max = 1})
            table.insert(rewardTable, { id = wands[math.random(#wands)], min = 1, max = 1})
		end
		rewardRandomFlag = nil
    elseif objectType == 'town' and objectDefinition == 'bigT1' then
		table.insert(rewardTable, { id = 'g000ig0005', min = 1, max = 1 })
		table.insert(rewardTable, { id = 'g000ig0006', min = 1, max = 1 })
		table.insert(rewardTable, { id = t2Orbs[math.random(#t2Orbs)], min = 1, max = 1})

		for i = 1,2 do
            x = math.random(1, #potionLow)
            table.insert(rewardTable, { id = potionLow[x], min = 1, max = 1})
            table.remove(potionLow, x)
        end

	elseif objectType == 'town' and objectDefinition == 'centerT4' then
		table.insert(rewardTable, { id = 'g000ig0006', min = 2, max = 2 })
		table.insert(rewardTable, { id = 'g000ig0001', min = 2, max = 2 })
		table.insert(rewardTable, { id = 'g001ig0152', min = 1, max = 1 })
		table.insert(rewardTable, { id = t3Orbs[math.random(#t3Orbs)], min = 1, max = 1})
        table.insert(rewardTable, { id = 'g000ig5068', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g000ig9043', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g000ig0017', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g000ig0019', min = 1, max = 1 })

		for i = 1,3 do
            x = math.random(1, #potionLow)
            table.insert(rewardTable, { id = potionLow[x], min = 2, max = 2})
            table.remove(potionLow, x)
        end

        for i = 1,2 do
            x = math.random(1, #potionHigh)
            table.insert(rewardTable, { id = potionHigh[x], min = 2, max = 2})
            table.remove(potionHigh, x)
        end

		table.insert(rewardTable, { id = wands[math.random(#wands)], min = 1, max = 1})
		table.insert(rewardTable, { id = t3Travel[math.random(#t3Travel)], min = 1, max = 1})
		table.insert(rewardTable, { id = bigMana[math.random(#bigMana)], min = 1, max = 1})
	elseif objectType == 'town' and objectDefinition == 'centerT5' then
		table.insert(rewardTable, { id = 'g000ig0006', min = 2, max = 3 })
		table.insert(rewardTable, { id = 'g000ig0001', min = 2, max = 2 })
		table.insert(rewardTable, { id = 'g001ig0152', min = 1, max = 2 })
        table.insert(rewardTable, { id = 'g000ig0020', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g000ig0017', min = 1, max = 1 })
        
		for i = 1,3 do
            x = math.random(1, #potionLow)
            table.insert(rewardTable, { id = potionLow[x], min = 2, max = 2})
            table.remove(potionLow, x)
        end

        for i = 1,2 do
            x = math.random(1, #potionHigh)
            table.insert(rewardTable, { id = potionHigh[x], min = 2, max = 2})
            table.remove(potionHigh, x)
        end

		for i = 1,2 do
            x = math.random(1, #potionProtect)
            table.insert(rewardTable, { id = potionProtect[x], min = 1, max = 2})
            table.remove(potionProtect, x)
        end

		table.insert(rewardTable, { id = bigValuable[math.random(#bigValuable)], min = 1, max = 1})
        table.insert(rewardTable, { id = mediumMana[math.random(#mediumMana)], min = 1, max = 1})
		
		rewardRandomFlag = math.random(0,3)
		if rewardRandomFlag == 0 then
			table.insert(rewardTable, { id = t4Artifacts[math.random(#t4Artifacts)], min = 1, max = 1})
			table.insert(rewardTable, { id = t3Banners[math.random(#t2Banners)], min = 1, max = 1})
		elseif rewardRandomFlag == 1 then
			table.insert(rewardTable, { id = t3Jewels[math.random(#t3Jewels)], min = 1, max = 1})
			table.insert(rewardTable, { id = t4Artifacts[math.random(#t4Artifacts)], min = 1, max = 1})
		elseif rewardRandomFlag == 2 then
			table.insert(rewardTable, { id = t3Banners[math.random(#t3Banners)], min = 1, max = 1})
			table.insert(rewardTable, { id = t4Jewels[math.random(#t4Jewels)], min = 1, max = 1})
		elseif rewardRandomFlag == 3 then
			table.insert(rewardTable, { id = t3Jewels[math.random(#t3Jewels)], min = 1, max = 1})
			table.insert(rewardTable, { id = t4Banners[math.random(#t4Banners)], min = 1, max = 1})
		end
		rewardRandomFlag = nil
    elseif objectType == 'town' and objectDefinition == 'centerT2' then
        table.insert(rewardTable, { id = 'g000ig0005', min = 1, max = 2 })
		table.insert(rewardTable, { id = 'g000ig0006', min = 1, max = 1 })

        for i = 1,2 do
            x = math.random(1, #potionLow)
            table.insert(rewardTable, { id = potionLow[x], min = 1, max = 2})
            table.remove(potionLow, x)
        end

        table.insert(rewardTable, { id = t2Orbs[math.random(#t2Orbs)], min = 1, max = 1})
	elseif objectType == 'ruins' and objectDefinition == 'startArtifact' then
		table.insert(rewardTable, { id = t2Artifacts[math.random(#t2Artifacts)], min = 1, max = 1})
	elseif objectType == 'ruins' and objectDefinition == 'startJewel' then
		table.insert(rewardTable, { id = t1Jewels[math.random(#t1Jewels)], min = 1, max = 1})
    elseif objectType == 'ruins' and objectDefinition == 'startTravel' then
		table.insert(rewardTable, { id = t1Travel[math.random(#t1Travel)], min = 1, max = 1})
    elseif objectType == 'ruins' and objectDefinition == 'startPermanent' then
		table.insert(rewardTable, { id = startRuinPermanent[math.random(#startRuinPermanent)], min = 1, max = 1})
	elseif objectType == 'ruins' and objectDefinition == 'bufferTravel' then
		table.insert(rewardTable, { id = t2Travel[math.random(#t2Travel)], min = 1, max = 1})
    elseif objectType == 'ruins' and objectDefinition == 'bufferBanner' then
		table.insert(rewardTable, { id = t2Banners[math.random(#t2Banners)], min = 1, max = 1})
	elseif objectType == 'ruins' and objectDefinition == 'bufferArtifactJewel' then
		rewardRandomFlag = math.random(0,1)
		if rewardRandomFlag == 0 then
			table.insert(rewardTable, { id = t3Artifacts[math.random(#t3Artifacts)], min = 1, max = 1})
		elseif rewardRandomFlag == 1 then
			table.insert(rewardTable, { id = t3Jewels[math.random(#t3Jewels)], min = 1, max = 1})
		end
		rewardRandomFlag = nil
	elseif objectType == 'ruins' and objectDefinition == 'bigBanner' then
		table.insert(rewardTable, { id = t2Banners[math.random(#t2Banners)], min = 1, max = 1})
	elseif objectType == 'ruins' and objectDefinition == 'bigJewel' then
		table.insert(rewardTable, { id = t3Jewels[math.random(#t3Jewels)], min = 1, max = 1})
	elseif objectType == 'ruins' and objectDefinition == 'bigArtifact' then
		table.insert(rewardTable, { id = t3Artifacts[math.random(#t3Artifacts)], min = 1, max = 1})
    elseif objectType == 'ruins' and objectDefinition == 'bigControl' then
        table.insert(rewardTable, { id = t5Artifacts[math.random(#t5Artifacts)], min = 1, max = 1})
	elseif objectType == 'ruins' and objectDefinition == 'centerJewelT4' then
		table.insert(rewardTable, { id = t4Jewels[math.random(#t4Jewels)], min = 1, max = 1})
	elseif objectType == 'ruins' and objectDefinition == 'centerArtifactT4' then
		table.insert(rewardTable, { id = t4Artifacts[math.random(#t4Artifacts)], min = 1, max = 1})
	elseif objectType == 'ruins' and objectDefinition == 'centerTravel' then
		table.insert(rewardTable, { id = t3Travel[math.random(#t3Travel)], min = 1, max = 1})
	elseif objectType == 'ruins' and objectDefinition == 'centerControl' then
		table.insert(rewardTable, { id = t5Artifacts[math.random(#t5Artifacts)], min = 1, max = 1})
	elseif objectType == 'ruins' and objectDefinition == 'centerBannerT4' then
		table.insert(rewardTable, { id = t4Banners[math.random(#t4Banners)], min = 1, max = 1})
	elseif objectType == 'guard' and objectDefinition == 'merchGuardT2' then
		table.insert(rewardTable, { id = 'g000ig0001', min = 1, max = 1 })
		table.insert(rewardTable, { id = 'g000ig0005', min = 1, max = 2 })

		for i = 1,3 do
            x = math.random(1, #potionLow)
            table.insert(rewardTable, { id = potionLow[x], min = 1, max = 1})
            table.remove(potionLow, x)
        end

		table.insert(rewardTable, { id = potionProtect[math.random(#potionProtect)], min = 1, max = 1})
		table.insert(rewardTable, { id = smallMana[math.random(#smallMana)], min = 1, max = 1})
		table.insert(rewardTable, { id = mediumValuable[math.random(#mediumValuable)], min = 1, max = 1})
        table.insert(rewardTable, { id = protection[math.random(#protection)], min = 1, max = 1})
	elseif objectType == 'guard' and objectDefinition == 'merchGuardT3' then
		table.insert(rewardTable, { id = 'g000ig0001', min = 1, max = 1 })
		table.insert(rewardTable, { id = 'g000ig0006', min = 1, max = 2 })
		table.insert(rewardTable, { id = potionLow[math.random(#potionLow)], min = 1, max = 2})
		table.insert(rewardTable, { id = potionHigh[math.random(#potionHigh)], min = 1, max = 2})
		table.insert(rewardTable, { id = potionProtect[math.random(#potionProtect)], min = 1, max = 1})
		table.insert(rewardTable, { id = mediumMana[math.random(#mediumMana)], min = 1, max = 1})
		table.insert(rewardTable, { id = mediumValuable[math.random(#mediumValuable)], min = 1, max = 1})
		table.insert(rewardTable, { id = smallValuable[math.random(#smallValuable)], min = 1, max = 1})
        table.insert(rewardTable, { id = protection[math.random(#protection)], min = 1, max = 1})
	elseif objectType == 'guard' and objectDefinition == 'merchGuardT4' then
		table.insert(rewardTable, { id = 'g000ig0001', min = 2, max = 2 })
		table.insert(rewardTable, { id = 'g000ig0018', min = 1, max = 2 })
		table.insert(rewardTable, { id = 'g000ig0005', min = 2, max = 2 })
		table.insert(rewardTable, { id = potionHigh[math.random(#potionHigh)], min = 2, max = 2})
		table.insert(rewardTable, { id = potionLow[math.random(#potionLow)], min = 1, max = 1})

		for i = 1,2 do
            x = math.random(1, #potionProtect)
            table.insert(rewardTable, { id = potionProtect[x], min = 1, max = 1})
            table.remove(potionProtect, x)
        end

		table.insert(rewardTable, { id = bigMana[math.random(#bigMana)], min = 1, max = 1})
		table.insert(rewardTable, { id = bigValuable[math.random(#bigValuable)], min = 1, max = 1})	
        table.insert(rewardTable, { id = protection[math.random(#protection)], min = 1, max = 1})
	elseif objectType == 'guard' and objectDefinition == 'otherGuard' then
		table.insert(rewardTable, { id = 'g000ig0001', min = 1, max = 1 })
		table.insert(rewardTable, { id = 'g000ig0006', min = 1, max = 2 })
		table.insert(rewardTable, { id = potionLow[math.random(#potionLow)], min = 1, max = 1})
		table.insert(rewardTable, { id = potionHigh[math.random(#potionHigh)], min = 1, max = 1})
		table.insert(rewardTable, { id = mediumValuable[math.random(#mediumValuable)], min = 1, max = 1})
		table.insert(rewardTable, { id = t3Talismans[math.random(#t3Talismans)], min = 1, max = 1})
        table.insert(rewardTable, { id = permanent[math.random(#permanent)], min = 1, max = 1})
        table.insert(rewardTable, { id = protection[math.random(#protection)], min = 1, max = 1})
	elseif objectType == 'guard' and objectDefinition == 'townT1' then
		table.insert(rewardTable, { id = 'g000ig0006', min = 1, max = 1 })
		table.insert(rewardTable, { id = potionLow[math.random(#potionLow)], min = 1, max = 1})
		table.insert(rewardTable, { id = smallValuable[math.random(#smallValuable)], min = 1, max = 1})
		table.insert(rewardTable, { id = 'g000ig0005', min = 1, max = 1 })
	elseif objectType == 'guard' and objectDefinition == 'townT2' then
		table.insert(rewardTable, { id = 'g000ig0001', min = 1, max = 1 })
		table.insert(rewardTable, { id = potionLow[math.random(#potionLow)], min = 1, max = 1})
		table.insert(rewardTable, { id = smallValuable[math.random(#smallValuable)], min = 1, max = 1})
		table.insert(rewardTable, { id = 'g000ig0005', min = 1, max = 2 })
		table.insert(rewardTable, { id = smallMana[math.random(#smallMana)], min = 1, max = 1})
        table.insert(rewardTable, { id = t1Movement[math.random(#t1Movement)], min = 1, max = 1})
	elseif objectType == 'guard' and objectDefinition == 'townT3' then
		table.insert(rewardTable, { id = 'g000ig0001', min = 1, max = 1 })
		table.insert(rewardTable, { id = 'g000ig0006', min = 1, max = 2 })
		table.insert(rewardTable, { id = potionLow[math.random(#potionLow)], min = 1, max = 1})
		table.insert(rewardTable, { id = potionHigh[math.random(#potionHigh)], min = 1, max = 1})
		table.insert(rewardTable, { id = mediumValuable[math.random(#mediumValuable)], min = 1, max = 1})
		table.insert(rewardTable, { id = t2Orbs[math.random(#t2Orbs)], min = 1, max = 1})
		table.insert(rewardTable, { id = scrolls[math.random(#scrolls)], min = 1, max = 1})
        table.insert(rewardTable, { id = t1Vision[math.random(#t1Vision)], min = 1, max = 1})
	elseif objectType == 'guard' and objectDefinition == 'townT4' then

		for i = 1,2 do
            x = math.random(1, #scrolls)
            table.insert(rewardTable, { id = scrolls[x], min = 1, max = 1})
            table.remove(scrolls, x)
        end

		table.insert(rewardTable, { id = 'g000ig0001', min = 2, max = 2 })
		table.insert(rewardTable, { id = 'g000ig0006', min = 1, max = 2 })
		table.insert(rewardTable, { id = bigMana[math.random(#bigMana)], min = 1, max = 1})
		table.insert(rewardTable, { id = t2Orbs[math.random(#t2Orbs)], min = 1, max = 1})
		table.insert(rewardTable, { id = potionHigh[math.random(#potionHigh)], min = 1, max = 1})
        table.insert(rewardTable, { id = permanent[math.random(#permanent)], min = 1, max = 1})
	elseif objectType == 'guard' and objectDefinition == 'townT5' then

		for i = 1,2 do
            x = math.random(1, #scrolls)
            table.insert(rewardTable, { id = scrolls[x], min = 1, max = 1})
            table.remove(scrolls, x)
        end

		table.insert(rewardTable, { id = 'g000ig0001', min = 2, max = 2 })
		table.insert(rewardTable, { id = t3Orbs[math.random(#t3Orbs)], min = 1, max = 1})
		table.insert(rewardTable, { id = bigValuable[math.random(#bigValuable)], min = 1, max = 1})
		table.insert(rewardTable, { id = bigMana[math.random(#bigMana)], min = 1, max = 1})
		table.insert(rewardTable, { id = 'g000ig0018', min = 1, max = 2 })
		table.insert(rewardTable, { id = potionHigh[math.random(#potionHigh)], min = 1, max = 2})
        table.insert(rewardTable, { id = t2Vision[math.random(#t2Vision)], min = 1, max = 1})
	elseif objectType == 'guard' and objectDefinition == 'guardStartBuffer' then
		table.insert(rewardTable, { id = scrolls[math.random(#scrolls)], min = 1, max = 1})
		table.insert(rewardTable, { id = mediumValuable[math.random(#mediumValuable)], min = 1, max = 1})
		table.insert(rewardTable, { id = mediumMana[math.random(#mediumMana)], min = 1, max = 1})
		table.insert(rewardTable, { id = 'g000ig0001', min = 1, max = 1 })
		table.insert(rewardTable, { id = 'g000ig0006', min = 2, max = 2 })
        table.insert(rewardTable, { id = t1Movement[math.random(#t1Movement)], min = 1, max = 1})

		for i = 1,3 do
            x = math.random(1, #potionLow)
            table.insert(rewardTable, { id = potionLow[x], min = 1, max = 1})
            table.remove(potionLow, x)
        end

        table.insert(rewardTable, { id = permanent[math.random(#permanent)], min = 1, max = 1})
	elseif objectType == 'guard' and objectDefinition == 'guardStartTreasure' then

		for i = 1,2 do
            x = math.random(1, #scrolls)
            table.insert(rewardTable, { id = scrolls[x], min = 1, max = 1})
            table.remove(scrolls, x)
        end

		table.insert(rewardTable, { id = 'g000ig0001', min = 2, max = 2 })
		table.insert(rewardTable, { id = 'g000ig0018', min = 1, max = 2 })
		table.insert(rewardTable, { id = t3Orbs[math.random(#t3Orbs)], min = 1, max = 1})
		table.insert(rewardTable, { id = bigValuable[math.random(#bigValuable)], min = 1, max = 1})
		table.insert(rewardTable, { id = mediumValuable[math.random(#mediumValuable)], min = 1, max = 1})
		table.insert(rewardTable, { id = t3Artifacts[math.random(#t3Artifacts)], min = 1, max = 1})
        table.insert(rewardTable, { id = t2Movement[math.random(#t2Movement)], min = 1, max = 1})
	elseif objectType == 'guard' and objectDefinition == 'guardBufferBig' then
		table.insert(rewardTable, { id = scrolls[math.random(#scrolls)], min = 1, max = 1})
		table.insert(rewardTable, { id = t2Orbs[math.random(#t2Orbs)], min = 1, max = 1})
		table.insert(rewardTable, { id = 'g000ig0001', min = 1, max = 1 })
		table.insert(rewardTable, { id = 'g000ig0006', min = 2, max = 2 })
		table.insert(rewardTable, { id = mediumValuable[math.random(#mediumValuable)], min = 1, max = 1})
		table.insert(rewardTable, { id = smallValuable[math.random(#smallValuable)], min = 1, max = 1})
		table.insert(rewardTable, { id = mediumMana[math.random(#mediumMana)], min = 1, max = 1})
        table.insert(rewardTable, { id = t2Movement[math.random(#t2Movement)], min = 1, max = 1})
	elseif objectType == 'guard' and objectDefinition == 'guardBigTreasure' then
		table.insert(rewardTable, { id = scrolls[math.random(#scrolls)], min = 1, max = 1})
		table.insert(rewardTable, { id = t2Orbs[math.random(#t2Orbs)], min = 1, max = 1})
		table.insert(rewardTable, { id = 'g000ig0001', min = 1, max = 1 })
		table.insert(rewardTable, { id = 'g000ig0006', min = 2, max = 2 })
		table.insert(rewardTable, { id = mediumValuable[math.random(#mediumValuable)], min = 1, max = 1})
		table.insert(rewardTable, { id = smallValuable[math.random(#smallValuable)], min = 1, max = 1})
		table.insert(rewardTable, { id = mediumMana[math.random(#mediumMana)], min = 1, max = 1})
		table.insert(rewardTable, { id = t3Travel[math.random(#t3Travel)], min = 1, max = 1})
        table.insert(rewardTable, { id = permanent[math.random(#permanent)], min = 1, max = 1})
	elseif objectType == 'guard' and objectDefinition == 'guardBufferTreasure' then

		for i = 1,2 do
            x = math.random(1, #scrolls)
            table.insert(rewardTable, { id = scrolls[x], min = 1, max = 1})
            table.remove(scrolls, x)
        end

		table.insert(rewardTable, { id = 'g000ig0001', min = 2, max = 2 })
		table.insert(rewardTable, { id = 'g000ig0018', min = 1, max = 2 })
		table.insert(rewardTable, { id = t3Orbs[math.random(#t3Orbs)], min = 1, max = 1})
		table.insert(rewardTable, { id = bigValuable[math.random(#bigValuable)], min = 1, max = 1})
		table.insert(rewardTable, { id = mediumValuable[math.random(#mediumValuable)], min = 1, max = 1})
		table.insert(rewardTable, { id = t3Jewels[math.random(#t3Jewels)], min = 1, max = 1})

    elseif objectType == 'merchant' and objectDefinition == 'T1' then
        table.insert(rewardTable, { id = 'g000ig0006', min = 5, max = 5 })
        table.insert(rewardTable, { id = 'g000ig0001', min = 5, max = 5 })
        table.insert(rewardTable, { id = 'g000ig0005', min = 5, max = 5 })
        table.insert(rewardTable, { id = 'g001ig0378', min = 5, max = 5 })
        table.insert(rewardTable, { id = 'g000ig0002', min = 3, max = 3 })
        table.insert(rewardTable, { id = 'g000ig0011', min = 3, max = 3 })
        table.insert(rewardTable, { id = 'g000ig0008', min = 3, max = 3 })
        table.insert(rewardTable, { id = 'g000ig0014', min = 3, max = 3 })
        table.insert(rewardTable, { id = 'g000ig0003', min = 3, max = 3 })
        table.insert(rewardTable, { id = 'g000ig0015', min = 3, max = 3 })
        table.insert(rewardTable, { id = 'g000ig0009', min = 3, max = 3 })
        table.insert(rewardTable, { id = 'g000ig0012', min = 3, max = 3 })
        table.insert(rewardTable, { id = 'g000ig0021', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g000ig0022', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g000ig0023', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g000ig0024', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g001ig0125', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g001ig0036', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g000ig3008', min = 1, max = 1 })
        
        for i = 1,5 do
            x = math.random(1, #scrolls)
            table.insert(rewardTable, { id = scrolls[x], min = 1, max = 1})
            table.remove(scrolls, x)
        end

        for i = 1,3 do
            x = math.random(1, #t1Orbs)
            table.insert(rewardTable, { id = t1Orbs[x], min = 1, max = 1})
            table.remove(t1Orbs, x)
        end

        table.insert(rewardTable, { id = t2Orbs[math.random(#t2Orbs)], min = 1, max = 1})
        table.insert(rewardTable, { id = 'g001ig0107', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g001ig0109', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g001ig0106', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g001ig0108', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g001ig0105', min = 1, max = 1 })

        for i = 1,2 do
            x = math.random(1, #t1Artifacts)
            table.insert(rewardTable, { id = t1Artifacts[x], min = 1, max = 1})
            table.remove(t1Artifacts, x)
        end

        table.insert(rewardTable, { id = t2Artifacts[math.random(#t2Artifacts)], min = 1, max = 1})

        for i = 1,2 do
            x = math.random(1, #t1Banners)
            table.insert(rewardTable, { id = t1Banners[x], min = 1, max = 1})
            table.remove(t1Banners, x)
        end

        table.insert(rewardTable, { id = t1Jewels[math.random(#t1Jewels)], min = 1, max = 1})

        for i = 1,4 do
            x = math.random(1, #t1Talismans)
            table.insert(rewardTable, { id = t1Talismans[x], min = 1, max = 1})
            table.remove(t1Talismans, x)
        end

        for i = 1,2 do
            x = math.random(1, #protection)
            table.insert(rewardTable, { id = protection[x], min = 1, max = 1})
            table.remove(protection, x)
        end
        
    elseif objectType == 'merchant' and objectDefinition == 'T2' then
        table.insert(rewardTable, { id = 'g000ig0006', min = 5, max = 5 })
        table.insert(rewardTable, { id = 'g000ig0001', min = 5, max = 5 })
        table.insert(rewardTable, { id = 'g001ig0378', min = 5, max = 5 })
        table.insert(rewardTable, { id = 'g000ig5002', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g000ig5024', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g000ig5049', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g000ig5050', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g000ig5088', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g001ig0250', min = 1, max = 1 })

        for i = 1,2 do
            x = math.random(1, #t2Talismans)
            table.insert(rewardTable, { id = t2Talismans[x], min = 1, max = 1})
            table.remove(t2Talismans, x)
        end

        table.insert(rewardTable, { id = t3Talismans[math.random(#t3Talismans)], min = 1, max = 1})

        for i = 1,2 do
            x = math.random(1, #t2Artifacts)
            table.insert(rewardTable, { id = t2Artifacts[x], min = 1, max = 1})
            table.remove(t2Artifacts, x)
        end

        for i = 1,2 do
            x = math.random(1, #t3Artifacts)
            table.insert(rewardTable, { id = t3Artifacts[x], min = 1, max = 1})
            table.remove(t3Artifacts, x)
        end

        table.insert(rewardTable, { id = t3Banners[math.random(#t3Banners)], min = 1, max = 1})
        table.insert(rewardTable, { id = t2Banners[math.random(#t2Banners)], min = 1, max = 1})
        table.insert(rewardTable, { id = t3Jewels[math.random(#t3Jewels)], min = 1, max = 1})

        for i = 1,2 do
            x = math.random(1, #t2Travel)
            table.insert(rewardTable, { id = t2Travel[x], min = 1, max = 1})
            table.remove(t2Travel, x)
        end

        for i = 1,2 do
            x = math.random(1, #t2Orbs)
            table.insert(rewardTable, { id = t2Orbs[x], min = 1, max = 1})
            table.remove(t2Orbs, x)
        end

        for i = 1,2 do
            x = math.random(1, #t3Orbs)
            table.insert(rewardTable, { id = t3Orbs[x], min = 1, max = 1})
            table.remove(t3Orbs, x)
        end

        for i = 1,5 do
            x = math.random(1, #scrolls)
            table.insert(rewardTable, { id = scrolls[x], min = 1, max = 1})
            table.remove(scrolls, x)
        end

        for i = 1,3 do
            x = math.random(1, #permanent)
            table.insert(rewardTable, { id = permanent[x], min = 1, max = 1})
            table.remove(permanent, x)
        end

        for i = 1,5 do
            x = math.random(1, #potionLow)
            table.insert(rewardTable, { id = potionLow[x], min = 2, max = 3})
            table.remove(potionLow, x)
        end

        for i = 1,2 do
            x = math.random(1, #protection)
            table.insert(rewardTable, { id = protection[x], min = 1, max = 1})
            table.remove(protection, x)
        end

    elseif objectType == 'merchant' and objectDefinition == 'T3' then
        table.insert(rewardTable, { id = 'g000ig0006', min = 10, max = 10 })
        table.insert(rewardTable, { id = 'g000ig0001', min = 5, max = 5 })
        table.insert(rewardTable, { id = 'g000ig5021', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g000ig5101', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g000ig5003', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g000ig5120', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g000ig5111', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g000ig5028', min = 1, max = 1 })
        
        for i = 1,5 do
            x = math.random(1, #potionLow)
            table.insert(rewardTable, { id = potionLow[x], min = 2, max = 3})
            table.remove(potionLow, x)
        end

        for i = 1,5 do
            x = math.random(1, #potionHigh)
            table.insert(rewardTable, { id = potionHigh[x], min = 1, max = 2})
            table.remove(potionHigh, x)
        end

        for i = 1,3 do
            x = math.random(1, #protection)
            table.insert(rewardTable, { id = protection[x], min = 1, max = 1})
            table.remove(protection, x)
        end

        for i = 1,5 do
            x = math.random(1, #scrolls)
            table.insert(rewardTable, { id = scrolls[x], min = 1, max = 1})
            table.remove(scrolls, x)
        end

        table.insert(rewardTable, { id = t3Artifacts[math.random(#t3Artifacts)], min = 1, max = 1})
        
        for i = 1,3 do
            x = math.random(1, #t4Artifacts)
            table.insert(rewardTable, { id = t4Artifacts[x], min = 1, max = 1})
            table.remove(t4Artifacts, x)
        end

        for i = 1,2 do
            x = math.random(1, #t3Banners)
            table.insert(rewardTable, { id = t3Banners[x], min = 1, max = 1})
            table.remove(t3Banners, x)
        end

        table.insert(rewardTable, { id = t4Banners[math.random(#t4Banners)], min = 1, max = 1})
        
        for i = 1,2 do
            x = math.random(1, #t3Jewels)
            table.insert(rewardTable, { id = t3Jewels[x], min = 1, max = 1})
            table.remove(t3Jewels, x)
        end

        for i = 1,3 do
            x = math.random(1, #t2Orbs)
            table.insert(rewardTable, { id = t2Orbs[x], min = 1, max = 1})
            table.remove(t2Orbs, x)
        end

        for i = 1,3 do
            x = math.random(1, #t3Orbs)
            table.insert(rewardTable, { id = t3Orbs[x], min = 1, max = 1})
            table.remove(t3Orbs, x)
        end

    elseif objectType == 'merchant' and objectDefinition == 'buffer' then
        table.insert(rewardTable, { id = 'g000ig0006', min = 3, max = 3 })
        table.insert(rewardTable, { id = 'g000ig0001', min = 3, max = 3 })
        table.insert(rewardTable, { id = 'g000ig0005', min = 3, max = 3 })
        table.insert(rewardTable, { id = 'g001ig0378', min = 3, max = 3 })
        table.insert(rewardTable, { id = 'g000ig0003', min = 3, max = 3 })
        table.insert(rewardTable, { id = 'g000ig0015', min = 3, max = 3 })
        table.insert(rewardTable, { id = 'g000ig0009', min = 3, max = 3 })
        table.insert(rewardTable, { id = 'g000ig0012', min = 3, max = 3 })
        table.insert(rewardTable, { id = 'g000ig0021', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g000ig0022', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g000ig0023', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g000ig0024', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g001ig0125', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g001ig0036', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g000ig0002', min = 3, max = 3 })
        table.insert(rewardTable, { id = 'g000ig0011', min = 3, max = 3 })
        table.insert(rewardTable, { id = 'g000ig0008', min = 3, max = 3 })
        table.insert(rewardTable, { id = 'g000ig0014', min = 3, max = 3 })
        table.insert(rewardTable, { id = 'g001ig0610', min = 1, max = 1 })

        for i = 1,2 do
            x = math.random(1, #t1Talismans)
            table.insert(rewardTable, { id = t1Talismans[x], min = 1, max = 1})
            table.remove(t1Talismans, x)
        end

        for i = 1,2 do
            x = math.random(1, #t2Talismans)
            table.insert(rewardTable, { id = t2Talismans[x], min = 1, max = 1})
            table.remove(t2Talismans, x)
        end

        for i = 1,2 do
            x = math.random(1, #t2Artifacts)
            table.insert(rewardTable, { id = t2Artifacts[x], min = 1, max = 1})
            table.remove(t2Artifacts, x)
        end

        for i = 1,2 do
            x = math.random(1, #t2Banners)
            table.insert(rewardTable, { id = t2Banners[x], min = 1, max = 1})
            table.remove(t2Banners, x)
        end

        for i = 1,3 do
            x = math.random(1, #permanent)
            table.insert(rewardTable, { id = permanent[x], min = 1, max = 1})
            table.remove(permanent, x)
        end
        
        table.insert(rewardTable, { id = t2Jewels[math.random(#t2Jewels)], min = 1, max = 1})
        table.insert(rewardTable, { id = 'g001ig0525', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g001ig0561', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g001ig0523', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g001ig0524', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g001ig0526', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g001ig0530', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g001ig0527', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g001ig0531', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g001ig0529', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g001ig0528', min = 1, max = 1 })
    
	end

	return rewardTable
end
-- end
----------

----------
-- function describes big zone mercenary
function getMercenary(mercenaryGuard)
    local mercenaryUnits = { }
    local i = 1

	--нейтралы
	if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g001uu7594', level = 5, unique = true } i = i + 1 end --инеит
	if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu8275', level = 5, unique = true } i = i + 1 end --медуза
	if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g001uu7575', level = 1, unique = true } i = i + 1 end --изумрудный дракон
	if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g001uu7576', level = 1, unique = true } i = i + 1 end --медный дракон
	if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu8266', level = 1, unique = true } i = i + 1 end --дроттар	
	--демоны
	if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu0173', level = 4, unique = true } i = i + 1 end --суккуб
	if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu2004', level = 4, unique = true } i = i + 1 end --истязатель душ
	if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu8254', level = 4, unique = true } i = i + 1 end --искоренитель
	if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu7605', level = 4, unique = true } i = i + 1 end --скульптор лжи
	--нежить
	if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu2008', level = 4, unique = true } i = i + 1 end --длань мортис
	if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g001uu8314', level = 4, unique = true } i = i + 1 end --клеврет смерти
	if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g003uu5014', level = 4, unique = true } i = i + 1 end --хан каменной пасти
	if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g001uu7592', level = 4, unique = true } i = i + 1 end --торхот
	--империя
	if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu2031', level = 4, unique = true } i = i + 1 end --эмиссар
	if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu7570', level = 4, unique = true } i = i + 1 end --епископ
	if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g001uu8312', level = 4, unique = true } i = i + 1 end --игнар	
	if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu7628', level = 4, unique = true } i = i + 1 end --имперский гвардеец
	--кланы
	if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu7559', level = 4, unique = true } i = i + 1 end --хэйсса
	if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu0163', level = 4, unique = true } i = i + 1 end --отшельник
	if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu0040', level = 4, unique = true } i = i + 1 end --старый ветеран
	if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu7627', level = 4, unique = true } i = i + 1 end --советник вотана
	--эльфы
	if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu2013', level = 4, unique = true } i = i + 1 end --налетчик
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu8214', level = 4, unique = true } i = i + 1 end --дриолисса
    if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g001uu8240', level = 4, unique = true } i = i + 1 end --штормовой кентавр
	if math.random(0,1) == 1 then mercenaryUnits[i] = { id = 'g000uu7629', level = 4, unique = true } i = i + 1 end --благородный эльф

    return {
        units = mercenaryUnits,
        guard = mercenaryGuard
    }
end
-- end
----------

----------
-- function describes creating neutral stacks from t0 to t5
function getStack(tier, stackCount, itemTypesTable, itemValuesTable)

    local stackSubraces = { }

    if (tier == 0) then
        stackSubraces = t0Subrace
    elseif (tier == 1) then
        stackSubraces = t1Subrace
    elseif (tier == 2) then
        stackSubraces = t1Subrace
    elseif (tier > 2 and tier < 4) then
        stackSubraces = t2Subrace
    elseif (tier >= 4) then
        stackSubraces = t3Subrace
    end

    local t1Items = { { id = 'g001ig0180', min = stackCount * 1, max = stackCount * 1.5 }, { id = 'g000ig0005', min = stackCount * 1, max = stackCount * 2 }, { id = 'g000ig0006', min = stackCount * 0.8, max = stackCount * 1.3 } }
    local t2Items = { { id = 'g001ig0180', min = stackCount * 1, max = stackCount * 1.5 }, { id = 'g000ig0005', min = stackCount * 1, max = stackCount * 2 }, { id = 'g000ig0001', min = stackCount * 0.4, max = stackCount * 0.6 }, { id = 'g001ig0378', min = stackCount * 0.7, max = stackCount * 1 } } 
    local t3Items = { { id = 'g000ig0005', min = stackCount * 1.5, max = stackCount * 2 }, { id = 'g000ig0001', min = stackCount * 0.5, max = stackCount * 0.7 }, { id = 'g000ig0006', min = stackCount * 0.6, max = stackCount * 0.9 }, { id = 'g001ig0378', min = stackCount * 0.7, max = stackCount * 1 } }
    local t4Items = { { id = 'g001ig0378', min = stackCount * 1, max = stackCount * 1.5 }, { id = 'g000ig0001', min = stackCount * 0.5, max = stackCount * 1 }, { id = 'g000ig0006', min = stackCount * 0.8, max = stackCount * 1.2 }, { id = 'g000ig0018', min = stackCount * 0.5, max = stackCount * 1 } }
    local t5Items = { { id = 'g000ig0001', min = stackCount * 0.5, max = stackCount * 1 }, { id = 'g000ig0006', min = stackCount * 1, max = stackCount * 2 }, { id = 'g000ig0018', min = stackCount * 0.5, max = stackCount * 1 } }

    local stackItems = { }

    if (tier == 1) then
        stackItems = t1Items
    elseif (tier == 2) then
        stackItems = t2Items
    elseif (tier == 3) then
        stackItems = t3Items
    elseif (tier == 4) then
        stackItems = t4Items
    elseif (tier == 5) then
        stackItems = t5Items
    end

    local stackItemsValue = { }

    if (tier == 1) then
        stackItemsValue.min = 250 * stackCount
        stackItemsValue.max = 400 * stackCount
    elseif (tier == 2) then
        stackItemsValue.min = (250 * stackCount * tier)
        stackItemsValue.max = (400 * stackCount * tier)
    elseif (tier > 2) then
        stackItemsValue.min = (250 * stackCount * tier * 0.8) + 150
        stackItemsValue.max = (350 * stackCount * tier * 0.8) + 100
    end
    
    local experienceValue = { }
    
    if (tier == 0) then
        experienceValue.min = 120 * stackCount
        experienceValue.max = 160 * stackCount
    elseif (tier == 1) then
        experienceValue.min = 200 * stackCount * 1.12
        experienceValue.max = 240 * stackCount * 1.12
    elseif (tier == 2) then
        experienceValue.min = 200 * stackCount * tier * 0.92
        experienceValue.max = 240 * stackCount * tier * 0.92
    elseif (tier > 2) then
        experienceValue.min = 220 * stackCount * tier * 1.14
        experienceValue.max = 240 * stackCount * tier * 1.14
    end

    return {
        count = stackCount,
        value = experienceValue,
        subraceTypes = stackSubraces,
        loot = {
            items = stackItems,
            value = stackItemsValue,
            itemTypes = itemTypesTable,
            itemValue = itemValuesTable
        }
    }

end
-- end
----------

----------
-- function describes creating guards for zones, merchants, towns, etc
function getGuard(tier, itemsTable, subR)

    -- local stackSubraces = { }

    -- if (tier == 1) then
    --     stackSubraces = t1Subrace
    -- elseif (tier == 2) then
    --     stackSubraces = t1Subrace
    -- elseif (tier == 3) then
    --     stackSubraces = t2Subrace
    -- elseif (tier == 4) then
    --     stackSubraces = t3Subrace
    -- elseif (tier == 5) then
    --     stackSubraces = t3Subrace
    -- elseif (tier == 6) then
    --     stackSubraces = GOsubrace
    -- end

    local experienceValue = { }
    
    if (tier == 1) then
        experienceValue.min = 200 * 1.1
        experienceValue.max = 240 * 1.1
    elseif (tier == 2) then
        experienceValue.min = 210 * tier * 0.92
        experienceValue.max = 240 * tier * 0.92
    elseif (tier == 3) then
        experienceValue.min = 210 * tier
        experienceValue.max = 240 * tier
    elseif (tier == 4) then
        experienceValue.min = 210 * tier * 1.1
        experienceValue.max = 240 * tier * 1.1
    elseif (tier == 5) then
        experienceValue.min = 210 * tier * 1.16
        experienceValue.max = 240 * tier * 1.16
    elseif (tier == 6) then
        experienceValue.min = 230 * tier * 1.26
        experienceValue.max = 250 * tier * 1.26
    end

    return {
        subraceTypes = subR,
        value = experienceValue,
        loot = {
            items = itemsTable
        }
    }

end
-- end
----------

--local merchGuardT2 = getGuard(2, rewardGenerator('guard', 'merchGuardT2'))
--local merchGuardT3 = getGuard(3, rewardGenerator('guard', 'merchGuardT3'))
--local merchGuardT4 = getGuard(4, rewardGenerator('guard', 'merchGuardT4'))

----------
-- function describes creating neutral towns from t1 to t5
function getNeutralTown(townTier, itemsTable, townGuard)

    local experienceValue = { }
    
    if (townTier == 1) then
        experienceValue.min = 210
        experienceValue.max = 240
    elseif (townTier == 2) then
        experienceValue.min = 210 * townTier * 0.9
        experienceValue.max = 240 * townTier * 0.9
    elseif (townTier == 2 or townTier == 3) then
        experienceValue.min = 210 * townTier * 1.12
        experienceValue.max = 240 * townTier * 1.12
    elseif (townTier == 4) then
        experienceValue.min = 210 * townTier * 1.27
        experienceValue.max = 240 * townTier * 1.27
    elseif (townTier == 5) then
        experienceValue.min = 210 * townTier * 1.5
        experienceValue.max = 240 * townTier * 1.5
    end

    local townSubraces = { }

    if (townTier == 1) then
        townSubraces = t1Subrace
    elseif (townTier == 2) then
        townSubraces = t1Subrace
    elseif (townTier == 3) then
        townSubraces = t2Subrace
    elseif (townTier > 3) then
        townSubraces = t3Subrace
    end

    return {
        tier = townTier,
        garrison = {
            subraceTypes = townSubraces,
            value = experienceValue,
            loot = {
                items = itemsTable,
            }
        },
        stack = townGuard
    }

end
-- end
----------

----------
-- function describes creating ruins from t1 to t5
function getRuins(tier, ruinsGold, ruinsGuard, itemsTable)

    return {
        gold = ruinsGold,
        guard = ruinsGuard,
        loot = {
            items = itemsTable,
        }
    }

end
-- end
----------

----------
-- function to create mage tower

function getMageTower(tier, merchGuard)
    local t1SpellSet = {'g000ss0043','g000ss0044','g000ss0045','g000ss0024','g000ss0002','g000ss0097','g000ss0021','g000ss0004','g000ss0062','g000ss0178','g000ss0099','g000ss0065','g000ss0003','g000ss0023','g000ss0100','g000ss0064','g000ss0106','g000ss0063','g000ss0181','g000ss0101','g000ss0179','g000ss0022','g000ss0041','g000ss0025','g000ss0061','g000ss0098', 'g000ss0188', 'g000ss0009'}
    local t2SpellSet = {'g000ss0050','g000ss0049','g000ss0185','g000ss0026','g000ss0007','g000ss0070','g000ss0028','g000ss0187','g000ss0104','g000ss0184','g000ss0069','g000ss0183','g000ss0186','g000ss0102','g000ss0126','g000ss0006','g000ss0046','g000ss0008','g000ss0066','g000ss0103', 'g000ss0030', 'g000ss0029', 'g000ss0068'}
    local t3SpellSet = {'g000ss0089','g000ss0109','g000ss0033','g000ss0014','g000ss0072','g000ss0034','g000ss0085','g000ss0111','g000ss0150','g000ss0012','g000ss0013', 'g000ss0052', 'g000ss0199', 'g000ss0200', 'g000ss0197', 'g000ss0110', 'g000ss0201', 'g000ss0198', 'g000ss0073'}

    local spellsSet = { }

    if tier == 1 then
        for i = 1,6 do
            x = math.random(1, #t1SpellSet)
            spellsSet[i] = t1SpellSet[x]
            table.remove(t1SpellSet, x)
        end

        for i = 7,9 do
            x = math.random(1, #t2SpellSet)
            spellsSet[i] = t2SpellSet[x]
            table.remove(t2SpellSet, x)
        end

    elseif tier == 2 then
        for i = 1,4 do
            x = math.random(1, #t1SpellSet)
            spellsSet[i] = t1SpellSet[x]
            table.remove(t1SpellSet, x)
        end

        for i = 5,8 do
            x = math.random(1, #t2SpellSet)
            spellsSet[i] = t2SpellSet[x]
            table.remove(t2SpellSet, x)
        end

        for i = 9,11 do
            x = math.random(1, #t3SpellSet)
            spellsSet[i] = t3SpellSet[x]
            table.remove(t3SpellSet, x)
        end

    elseif tier == 3 then
        for i = 1,5 do
            x = math.random(1, #t2SpellSet)
            spellsSet[i] = t2SpellSet[x]
            table.remove(t2SpellSet, x)
        end

        for i = 6,10 do
            x = math.random(1, #t3SpellSet)
            spellsSet[i] = t3SpellSet[x]
            table.remove(t3SpellSet, x)
        end

    end



    return { spells = spellsSet, guard = merchGuard }
end
-- end
----------

local bigZone0Id = 0
local bigZone4Id = 4
local treasureZone8Id = 8

local startZone2Id = 2
local startZone6Id = 6

local bufferZone1Id = 1
local bufferZone3Id = 3
local bufferZone5Id = 5
local bufferZone7Id = 7

function getZones(races, scenarioSize)

	local bigZoneSize = 16000
	local startingZoneSize = 12000
	local bufferZoneSize = 7000
    local treasureZoneSize = 16000

	local zones = {}


	zones[1] = getBigZone(bigZone0Id, bigZoneSize, scenarioSize)

	zones[2] = getBufferZone(bufferZone1Id, races[1], bufferZoneSize, scenarioSize)

	zones[3] = getStartingZone(startZone2Id, races[1], startingZoneSize, scenarioSize)

	zones[4] = getBufferZone(bufferZone3Id, races[2], bufferZoneSize, scenarioSize)	

	zones[5] = getBigZone(bigZone4Id, bigZoneSize, scenarioSize)

	zones[6] = getBufferZone(bufferZone5Id, races[2], bufferZoneSize, scenarioSize)

	zones[7] = getStartingZone(startZone6Id, races[2], startingZoneSize, scenarioSize)

	zones[8] = getBufferZone(bufferZone7Id, races[1], bufferZoneSize, scenarioSize)

    zones[9] = getTreasureZone(treasureZone8Id, treasureZoneSize, scenarioSize)

	return zones
end

function getStartingMines(race, scenarioSize)
    local zoneMines = { }
    
    if scenarioSize == 72 then
        zoneMines.gold = 2
    elseif scenarioSize == 96 then
        zoneMines.gold = 3
    end

    if race == Race.Human then
        zoneMines.lifeMana = 2
    elseif race == Race.Dwarf then
        zoneMines.runicMana = 2
    elseif race == Race.Undead then
        zoneMines.deathMana = 2
    elseif race == Race.Heretic then
        zoneMines.infernalMana = 2
    elseif race == Race.Elf then
        zoneMines.groveMana = 2
    end
    
    return zoneMines
end

----------
-- mines in the buffer zone
function getBufferZoneMinesLeft(race, scenarioSize)
    local sizeCoef = 0
    local zoneMines = { }
    
    if scenarioSize == 72 then
        sizeCoef = 1
    elseif scenarioSize == 96 then
        sizeCoef = 2
    end

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

function getBufferZoneMinesRight(race, scenarioSize)
    local sizeCoef = 0
    local zoneMines = { }
    
    if scenarioSize == 72 then
        sizeCoef = 1
    elseif scenarioSize == 96 then
        sizeCoef = 2
    end

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

function getNativeSubraces(race)
    if race == Race.Human then
        return { Subrace.Human }
    end
    
    if race == Race.Dwarf then
        return { Subrace.Dwarf }
    end
    
    if race == Race.Heretic then    
        return { Subrace.Heretic }
    end
    
    if race == Race.Undead then    
        return { Subrace.Undead }
    end
    
    if race == Race.Elf then    
        return { Subrace.Elf }
    end

    return { Subrace.Neutral }
end

function getPlayerSubRace(race) -- субраса игрока
	if race == Race.Human then return Subrace.Human
	elseif race == Race.Dwarf then return Subrace.Dwarf
	elseif race == Race.Undead then return Subrace.Undead
	elseif race == Race.Heretic then return Subrace.Heretic
	elseif race == Race.Elf then return Subrace.Elf
	end
end

function getStartingZone(zoneId, playerRace, zoneSize, scenarioSize)
    local startingItems = {
        {id = 'g000ig0005', min = 4, max = 4},
        {id = 'g000ig0006', min = 2, max = 2},
        {id = 'g000ig0001', min = 2, max = 2},
        {id = 'g001ig0072', min = 1, max = 1},
        {id = 'g001ig0454', min = 1, max = 1},
        {id = 'g000ig5084', min = 2, max = 2},
        {id = 'g001ig0532', min = 2, max = 2},
        {id = 'g000ig0002', min = 1, max = 1},
        {id = 'g000ig0021', min = 1, max = 1},
        {id = 'g000ig0022', min = 1, max = 1},
        {id = 'g000ig0023', min = 1, max = 1},
        {id = 'g000ig0024', min = 1, max = 1},
        {id = 'g001ig0036', min = 1, max = 1},
        {id = 'g001ig0407', min = 1, max = 1},
        {id = 'g001ig0486', min = 3, max = 3},
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

    if playerRace == Race.Human then
        table.insert(startingItems, {id = 'g000ig9101', min = 1, max = 1})
    elseif playerRace == Race.Dwarf then
        table.insert(startingItems, {id = 'g001ig0265', min = 1, max = 1})
    elseif playerRace == Race.Heretic then
        table.insert(startingItems, {id = 'g001ig0267', min = 1, max = 1})
    elseif playerRace == Race.Undead then
        table.insert(startingItems, {id = 'g001ig0264', min = 1, max = 1})
    elseif playerRace == Race.Elf then
        table.insert(startingItems, {id = 'g001ig0266', min = 1, max = 1})
    end
    
    local zoneStacks = { }

    if scenarioSize == 72 then
        zoneStacks = {
            getStack(0, 3, { }, { }),
            getStack(1, 3, { Item.Valuable }, { min = 250, max = 500 }),
            getStack(1, 3, { Item.PotionHeal, Item.PotionBoost, Item.Orb }, { min = 50, max = 250 }),
            getStack(1, 1, { Item.Scroll, Item.PotionBoost, Item.PotionHeal }, { min = 150, max = 350 }),
            getStack(2, 3, { Item.Valuable, Item.PotionBoost }, { min = 200, max = 500 }),
            getStack(2, 2, { Item.PotionBoost, Item.Orb, Item.Valuable }, { min = 150, max = 450 }),
            getStack(3, 1, { Item.Valuable, Item.PotionHeal, Item.PotionBoost, Item.TravelItem }, { min = 250, max = 750 }),
            getStack(3, 1, { Item.Valuable, Item.PotionBoost }, { min = 250, max = 1000 })
        }
    elseif scenarioSize == 96 then
        zoneStacks = {
            getStack(0, 5, { }, { }),
            getStack(1, 4, { Item.Valuable }, { min = 250, max = 500 }),
            getStack(1, 3, { Item.PotionHeal, Item.PotionBoost, Item.Orb }, { min = 50, max = 250 }),
            getStack(1, 3, { Item.Scroll, Item.PotionBoost, Item.PotionHeal }, { min = 150, max = 350 }),
            getStack(2, 3, { Item.Valuable, Item.PotionBoost }, { min = 200, max = 500 }),
            getStack(2, 3, { Item.PotionBoost, Item.Orb, Item.Valuable }, { min = 150, max = 450 }),
            getStack(3, 1, { Item.Valuable, Item.PotionBoost, Item.TravelItem }, { min = 250, max = 750 }),
            getStack(3, 1, { Item.Valuable, Item.PotionBoost }, { min = 250, max = 1000 })
        }
    end

    local zoneBags = { }

    if scenarioSize == 72 then
        zoneBags = {
            count = 9,
            loot = {
                itemTypes = { Item.Valuable, Item.PotionHeal, Item.Scroll, Item.Orb },
                value = { min = 1000, max = 1300 },
                items = {
                    { id = 'g000ig0001', min = 2, max = 3 },
                    { id = 'g001ig0378', min = 1, max = 2 },
                    { id = 'g000ig5007', min = 1, max = 1 },
                    { id = 'g000ig0008', min = 2, max = 2 },
                    { id = 'g000ig9005', min = 0, max = 1 },
                    { id = 'g000ig9002', min = 0, max = 1 },
                    { id = 'g000ig9015', min = 0, max = 1 },
                    { id = 'g000ig9003', min = 0, max = 1 },
                    { id = 'g000ig9010', min = 0, max = 1 },
                    { id = 'g000ig0014', min = 1, max = 2 },
                    { id = 'g000ig0009', min = 1, max = 2 },
                    { id = 'g000ig0011', min = 1, max = 2 },
                    { id = 'g000ig0002', min = 1, max = 2 },

                },
                itemValue = { min = 50, max = 200}
            }
        }
    elseif scenarioSize == 96 then
        zoneBags = {
            count = 13,
            loot = {
                itemTypes = { Item.Valuable, Item.PotionHeal, Item.Scroll, Item.Orb },
                value = { min = 1500, max = 1800 },
                items = {
                    { id = 'g000ig0001', min = 3, max = 4 },
                    { id = 'g001ig0378', min = 1, max = 3 },
                    { id = 'g000ig5007', min = 1, max = 2 },
                    { id = 'g000ig0008', min = 2, max = 3 },
                    { id = 'g000ig9005', min = 0, max = 1 },
                    { id = 'g000ig9002', min = 0, max = 1 },
                    { id = 'g000ig9015', min = 0, max = 1 },
                    { id = 'g000ig9003', min = 0, max = 1 },
                    { id = 'g000ig9010', min = 0, max = 1 },
                    { id = 'g000ig0014', min = 1, max = 3 },
                    { id = 'g000ig0009', min = 1, max = 3 },
                    { id = 'g000ig0011', min = 1, max = 3 },
                    { id = 'g000ig0002', min = 1, max = 3 },
                },
                itemValue = { min = 50, max = 200}
            }
        }
    end

    local zoneRuins = { }

    if scenarioSize == 72 then
        zoneRuins = {
            getRuins(1, { min = 340, max = 400 }, getGuard(1, { }, t0Subrace), rewardGenerator('ruins', 'startJewel')),
            getRuins(1, { min = 340, max = 400 }, getGuard(1, { }, t1Subrace), rewardGenerator('ruins', 'startPermanent')),
            getRuins(2, { min = 430, max = 510 }, getGuard(2, { }, t1Subrace), rewardGenerator('ruins', 'startArtifact'))
        }
    elseif scenarioSize == 96 then
        zoneRuins = {
            getRuins(1, { min = 340, max = 400 }, getGuard(1, { }, t0Subrace), rewardGenerator('ruins', 'startJewel')),
            getRuins(1, { min = 340, max = 400 }, getGuard(1, { }, t1Subrace), rewardGenerator('ruins', 'startPermanent')),
            getRuins(2, { min = 430, max = 510 }, getGuard(2, { }, t1Subrace), rewardGenerator('ruins', 'startArtifact')),
            getRuins(2, { min = 410, max = 480 }, getGuard(2, { }, t1Subrace), rewardGenerator('ruins', 'startTravel'))
        }
    end

    return {
		id = zoneId,
		type = Zone.PlayerStart,
		race = playerRace,
		size = zoneSize,
        border = Border.Water,

        capital = {            
            garrison = {
                subraceTypes = { getPlayerSubRace(playerRace) },
                value = { min = 50, max = 50 },
                loot = {
                    items = startingItems
                }
            },
            spells = {
                'g000ss0177', --откровение
            },
        },

        mines = getStartingMines(playerRace, scenarioSize),

        stacks = zoneStacks,

        ruins = zoneRuins,

        bags = zoneBags,
        
        merchants = {
            {
                goods = {
                    items = rewardGenerator('merchant', 'T1'),
                },
                guard = getGuard(2, rewardGenerator('guard', 'merchGuardT2'), t1Subrace)   
            }
        },
        
        towns = {
            getNeutralTown(1, rewardGenerator('town', 'startT1'), getGuard(1, rewardGenerator('guard', 'townT1'), t1Subrace)),
            getNeutralTown(2, rewardGenerator('town', 'startT2'), getGuard(2, rewardGenerator('guard', 'townT2'), t1Subrace))
        },

        mages = {
            getMageTower(1, getGuard(2, rewardGenerator('guard', 'merchGuardT2'), t1Subrace))
        },
    }
end

function getBufferZone(zoneId, playerRace, zoneSize, scenarioSize)
    local zoneMines = { }

    if zoneId == 1 or zoneId == 3 then
        zoneMines = getBufferZoneMinesLeft(playerRace, scenarioSize)
    elseif zoneId == 5 or zoneId == 7 then
        zoneMines = getBufferZoneMinesRight(playerRace, scenarioSize)
    end

    local zoneStacks = { }

    if scenarioSize == 72 then
        zoneStacks = {
            getStack(2, 2, { Item.PotionBoost, Item.Scroll, Item.PotionHeal }, { min = 50, max = 250 }),
            getStack(4, 1, { Item.PotionPermanent, Item.PotionBoost }, { min = 250, max = 600 }),
            getStack(3, 1, { Item.Valuable, Item.PotionBoost, Item.Orb, Item.PotionRevive }, { min = 150, max = 500 }),
            getStack(2, 2, { Item.PotionBoost, Item.Valuable, Item.PotionRevive }, { min = 150, max = 750 }),
            getStack(2, 2, { Item.Orb, Item.PotionBoost, Item.PotionHeal }, { min = 50, max = 350 }),
            getStack(4, 1, { Item.Talisman, Item.Valuable }, { min = 350, max = 650 }),
        }
    elseif scenarioSize == 96 then
        zoneStacks = {
            getStack(2, 3, { Item.PotionBoost, Item.Scroll, Item.PotionHeal }, { min = 50, max = 250 }),
            getStack(4, 1, { Item.PotionPermanent, Item.PotionBoost }, { min = 250, max = 600 }),
            getStack(3, 2, { Item.Valuable, Item.PotionBoost, Item.Orb, Item.PotionRevive }, { min = 150, max = 500 }),
            getStack(2, 3, { Item.PotionBoost, Item.Valuable, Item.PotionRevive }, { min = 150, max = 750 }),
            getStack(2, 3, { Item.Orb, Item.PotionBoost, Item.PotionHeal }, { min = 50, max = 350 }),
            getStack(4, 2, { Item.Talisman, Item.Valuable }, { min = 350, max = 650 }),
        }
    end

    local zoneRuins = { }

    if scenarioSize == 72 then
        zoneRuins = {
            getRuins(3, { min = 500, max = 570 }, getGuard(3, { }, t2Subrace), rewardGenerator('ruins', 'bufferArtifactJewel')),
            getRuins(2, { min = 410, max = 490 }, getGuard(2, { }, t1Subrace), rewardGenerator('ruins', 'bufferBanner')),
        }
    elseif scenarioSize == 96 then
        zoneRuins = {
            getRuins(3, { min = 500, max = 570 }, getGuard(3, { }, t2Subrace), rewardGenerator('ruins', 'bufferArtifactJewel')),
            getRuins(2, { min = 410, max = 490 }, getGuard(2, { }, t1Subrace), rewardGenerator('ruins', 'bufferTravel')),
            getRuins(2, { min = 410, max = 490 }, getGuard(2, { }, t1Subrace), rewardGenerator('ruins', 'bufferBanner')),
        }
    end

    local zoneBags = { }

    if scenarioSize == 72 then
        zoneBags = {           
            count = 5,
            loot = {
                itemTypes = { Item.Valuable, Item.PotionHeal, Item.PotionBoost, Item.Scroll },
                value = { min = 900, max = 1200 },
                items = {
                    { id = 'g000ig0001', min = 1, max = 2 },
                    { id = 'g000ig9005', min = 1, max = 1 },
                    { id = 'g000ig9002', min = 1, max = 1 },
                    { id = 'g000ig9015', min = 1, max = 1 },
                    { id = 'g000ig9003', min = 1, max = 1 },
                    { id = 'g000ig9010', min = 1, max = 1 },
                },
                itemValue = { min = 150, max = 350}
            }
        }
    elseif scenarioSize == 96 then
        zoneBags = {           
            count = 8,
            loot = {
                itemTypes = { Item.Valuable, Item.PotionHeal, Item.PotionBoost, Item.Scroll },
                value = { min = 1500, max = 1900 },
                items = {
                    { id = 'g000ig0001', min = 1, max = 3 },
                    { id = 'g000ig9005', min = 1, max = 1 },
                    { id = 'g000ig9002', min = 1, max = 1 },
                    { id = 'g000ig9015', min = 1, max = 1 },
                    { id = 'g000ig9003', min = 1, max = 1 },
                    { id = 'g000ig9010', min = 1, max = 1 },
                },
                itemValue = { min = 150, max = 350}
            }
        }
    end

	return {
		id = zoneId,
		type = Zone.Treasure,
		size = zoneSize,

        mines = zoneMines,
        
        stacks = zoneStacks, 

        bags = zoneBags,

        ruins = zoneRuins,

        merchants = {
            {
                goods = {
                    items = rewardGenerator('merchant', 'buffer'),
                },
                guard = getGuard(2, rewardGenerator('guard', 'merchGuardT2'), t1Subrace)
            }
        },

        towns = {
            getNeutralTown(3, rewardGenerator('town', 'bufferT3'), getGuard(3, rewardGenerator('guard', 'townT3'), t2Subrace))
        }
	}
end

function getTreasureZone(zoneId, zoneSize, scenarioSize)
    local zoneStacks = { }

    if scenarioSize == 72 then
        zoneStacks = {
            getStack(2, 2, { Item.PotionBoost, Item.Scroll, Item.PotionHeal }, { min = 50, max = 250 }),
            getStack(3, 2, { Item.Valuable, Item.PotionHeal }, { min = 250, max = 750 }),
            getStack(3, 2, { Item.PotionRevive, Item.PotionBoost }, { min = 250, max = 450 }),
            getStack(3, 1, { Item.Valuable, Item.Talisman, Item.PotionBoost }, { min = 450, max = 750 }),
            getStack(4, 2, { Item.PotionHeal, Item.PotionBoost, Item.Orb }, { min = 200, max = 700}),
            getStack(4, 2, { Item.Valuable }, { min = 500, max = 1000 }),
            getStack(4, 2, { Item.Scroll, Item.PotionBoost, Item.PotionHeal }, { min = 200, max = 500 }),
            getStack(4, 2, { Item.Wand, Item.Talisman, Item.Valuable }, { min = 500, max = 1000}),
            getStack(5, 1, { Item.TravelItem, Item.Armor, Item.PotionBoost }, { min = 450, max = 1200 }),
            getStack(5, 1, { Item.Weapon, Item.PotionBoost }, { min = 450, max = 1200 }),
        }
    elseif scenarioSize == 96 then
        zoneStacks = {
            getStack(2, 2, { Item.PotionBoost, Item.Scroll, Item.PotionHeal }, { min = 50, max = 250 }),
            getStack(3, 2, { Item.Valuable, Item.PotionHeal }, { min = 250, max = 750 }),
            getStack(3, 3, { Item.PotionRevive, Item.PotionBoost }, { min = 250, max = 450 }),
            getStack(3, 2, { Item.Valuable, Item.Talisman, Item.PotionBoost }, { min = 450, max = 750 }),
            getStack(4, 2, { Item.PotionHeal, Item.PotionBoost, Item.Orb }, { min = 200, max = 700}),
            getStack(4, 3, { Item.Valuable }, { min = 500, max = 1000 }),
            getStack(4, 2, { Item.Scroll, Item.PotionBoost, Item.PotionHeal }, { min = 200, max = 500 }),
            getStack(4, 2, { Item.Wand, Item.Talisman, Item.Valuable }, { min = 500, max = 1000}),
            getStack(5, 1, { Item.TravelItem, Item.Armor, Item.PotionBoost }, { min = 450, max = 1200 }),
            getStack(5, 1, { Item.Weapon, Item.PotionBoost }, { min = 450, max = 1200 }),
            getStack(5, 1, { Item.PotionPermanent, Item.PotionHeal, Item.PotionBoost }, { min = 250, max = 500 }),
        }
    end

    local zoneRuins = { }

    if scenarioSize == 72 then
        zoneRuins = {
            getRuins(4, { min = 600, max = 750 }, getGuard(4, { }, t3Subrace), rewardGenerator('ruins', 'centerArtifactT4')),
            getRuins(3, { min = 450, max = 550 }, getGuard(3, { }, t2Subrace), rewardGenerator('ruins', 'centerTravel')),
            getRuins(4, { min = 700, max = 800 }, getGuard(5, { }, t3Subrace), rewardGenerator('ruins', 'centerJewelT4')),
            getRuins(5, { min = 820, max = 1000 }, getGuard(6, { }, GOsubrace), rewardGenerator('ruins', 'centerControl')),
            getRuins(5, { min = 820, max = 1000 }, getGuard(6, { }, t3Subrace), rewardGenerator('ruins', 'centerBannerT4')),
        }
    elseif scenarioSize == 96 then
        zoneRuins = {
            getRuins(4, { min = 600, max = 750 }, getGuard(4, { }, t3Subrace), rewardGenerator('ruins', 'centerArtifactT4')),
            getRuins(3, { min = 450, max = 550 }, getGuard(3, { }, t2Subrace), rewardGenerator('ruins', 'centerTravel')),
            getRuins(4, { min = 700, max = 800 }, getGuard(4, { }, t3Subrace), rewardGenerator('ruins', 'centerArtifactT4')),
            getRuins(4, { min = 700, max = 800 }, getGuard(5, { }, t3Subrace), rewardGenerator('ruins', 'centerJewelT4')),
            getRuins(5, { min = 820, max = 1000 }, getGuard(6, { }, GOsubrace), rewardGenerator('ruins', 'centerControl')),
            getRuins(5, { min = 820, max = 1000 }, getGuard(6, { }, t3Subrace), rewardGenerator('ruins', 'centerBannerT4')),
        }
    end

    local zoneBags = { }

    if scenarioSize == 72 then
        zoneBags = {
            count = 10,
            loot = {
                itemTypes = { Item.Valuable, Item.PotionHeal, Item.PotionBoost, Item.Scroll },
                value = { min = 1800, max = 2200 },
                items = {
                    { id = 'g000ig0001', min = 2, max = 3 },
                    { id = 'g000ig0006', min = 2, max = 3 },
                    { id = 'g000ig0022', min = 1, max = 1 },
                    { id = 'g000ig0021', min = 1, max = 1 },
                    { id = 'g000ig0023', min = 1, max = 1 },
                    { id = 'g000ig0024', min = 1, max = 1 },
                    { id = 'g001ig0125', min = 1, max = 1 },
                    { id = 'g001ig0036', min = 1, max = 1 },
                    { id = 'g001ig0128', min = 1, max = 1 },                   
                },
                itemValue = { min = 150, max = 500 }
            }
        }
    elseif scenarioSize == 96 then
        zoneBags = {
            count = 13,
            loot = {
                itemTypes = { Item.Valuable, Item.PotionHeal, Item.PotionBoost, Item.Scroll },
                value = { min = 2400, max = 2800 },
                items = {
                    { id = 'g000ig0001', min = 3, max = 4 },
                    { id = 'g000ig0006', min = 3, max = 4 },
                    { id = 'g000ig0022', min = 1, max = 2 },
                    { id = 'g000ig0021', min = 1, max = 2 },
                    { id = 'g000ig0023', min = 1, max = 2 },
                    { id = 'g000ig0024', min = 1, max = 2 },
                    { id = 'g001ig0125', min = 1, max = 2 },
                    { id = 'g001ig0036', min = 1, max = 2 },
                    { id = 'g001ig0128', min = 1, max = 1 },                   
                },
                itemValue = { min = 150, max = 500 }
            }
        }
    end

    local zoneTowns = { }

    if scenarioSize == 72 then
        zoneTowns = {
            getNeutralTown(5, rewardGenerator('town', 'centerT5'), getGuard(5, rewardGenerator('guard', 'townT5'), t3Subrace)),
            getNeutralTown(4, rewardGenerator('town', 'centerT4'), getGuard(4, rewardGenerator('guard', 'townT4'), t3Subrace)),
        }
    elseif scenarioSize == 96 then
        zoneTowns = {
            getNeutralTown(5, rewardGenerator('town', 'centerT5'), getGuard(5, rewardGenerator('guard', 'townT5'), t3Subrace)),
            getNeutralTown(4, rewardGenerator('town', 'centerT4'), getGuard(4, rewardGenerator('guard', 'townT4'), t3Subrace)),
            getNeutralTown(2, rewardGenerator('town', 'centerT2'), getGuard(2, rewardGenerator('guard', 'townT2'), t1Subrace)),
        }
    end

    local zoneMerchants = { }

    if scenarioSize == 72 then
        zoneMerchants = {
            {
                goods = {
                    items = rewardGenerator('merchant', 'T3'),
                },
                guard = getGuard(4, rewardGenerator('guard', 'merchGuardT4'), t3Subrace)           
            }
        }
    elseif scenarioSize == 96 then
        zoneMerchants = {
            {
                goods = {
                    items = rewardGenerator('merchant', 'T2'),
                },
                guard = getGuard(3, rewardGenerator('guard', 'merchGuardT3'), t2Subrace)
            },
            {
                goods = {
                    items = rewardGenerator('merchant', 'T3'),
                },
                guard = getGuard(4, rewardGenerator('guard', 'merchGuardT4'), t3Subrace)            
            }
        }
    end

    return {
		id = zoneId,
		type = Zone.Treasure,
		size = zoneSize,
        border = Border.Water,

        mines = {
            gold = 2,
            lifeMana = 1,
            runicMana = 1,
            deathMana = 1,
            infernalMana = 1,
            groveMana = 1
        },

        mages = {
            getMageTower(2, getGuard(3, rewardGenerator('guard', 'merchGuardT3'), t2Subrace)),
            getMageTower(3, getGuard(4, rewardGenerator('guard', 'merchGuardT4'), t3Subrace))
        },

        merchants = zoneMerchants,

        ruins = zoneRuins,

        stacks = zoneStacks,

        bags = zoneBags,

        towns = zoneTowns
    }
end

function getBigZone(zoneId, zoneSize, scenarioSize)
    local zoneStacks = { }

    if scenarioSize == 72 then
        zoneStacks = {
            getStack(2, 3, { Item.Valuable, Item.PotionBoost }, { min = 150, max = 500 }),
            getStack(3, 2, { Item.PotionRevive, Item.Scroll, Item.PotionHeal }, { min = 50, max = 250 }),
            getStack(3, 3, { Item.Orb, Item.Valuable }, { min = 500, max = 750}),
            getStack(3, 2, { Item.PotionHeal, Item.PotionRevive, Item.PotionBoost }, { min = 200, max = 700 }),
            getStack(4, 3, { Item.Valuable, Item.PotionBoost }, { min = 450, max = 1000 }),
            getStack(4, 2, { Item.Jewel, Item.Wand, Item.Valuable }, { min = 500, max = 800 }),
            getStack(5, 2, { Item.Armor, Item.Weapon, Item.Valuable, Item.PotionBoost }, { min = 500, max = 1200 }),
            getStack(5, 1, { Item.Banner, Item.Valuable, Item.PotionBoost }, { min = 500, max = 1500 }),
        }
    elseif scenarioSize == 96 then
        zoneStacks = {
            getStack(2, 3, { Item.Valuable, Item.PotionBoost }, { min = 150, max = 500 }),
            getStack(3, 3, { Item.PotionRevive, Item.Scroll, Item.PotionHeal }, { min = 50, max = 250 }),
            getStack(3, 3, { Item.Orb, Item.Valuable }, { min = 500, max = 750}),
            getStack(3, 3, { Item.PotionHeal, Item.PotionRevive, Item.PotionBoost }, { min = 200, max = 700 }),
            getStack(4, 3, { Item.Valuable, Item.PotionBoost }, { min = 450, max = 1000 }),
            getStack(4, 2, { Item.Jewel, Item.Wand, Item.Valuable }, { min = 500, max = 800 }),
            getStack(5, 2, { Item.Armor, Item.Weapon, Item.Valuable, Item.PotionBoost }, { min = 500, max = 1200 }),
            getStack(5, 1, { Item.Banner, Item.Valuable, Item.PotionBoost }, { min = 500, max = 1500 }),
        }
    end

    local zoneRuins = { }

    if scenarioSize == 72 then
        zoneRuins = {
            getRuins(3, { min = 500, max = 570 }, getGuard(3, { }, t2Subrace), rewardGenerator('ruins', 'bigBanner')),
            getRuins(3, { min = 550, max = 620 }, getGuard(3, { }, t2Subrace), rewardGenerator('ruins', 'bigArtifact')),
            getRuins(4, { min = 700, max = 900 }, getGuard(4, { }, t3Subrace), rewardGenerator('ruins', 'bigJewel')),
            getRuins(5, { min = 820, max = 1000 }, getGuard(6, { }, GOsubrace), rewardGenerator('ruins', 'bigControl')),
        }
    elseif scenarioSize == 96 then
        zoneRuins = {
            getRuins(3, { min = 500, max = 570 }, getGuard(3, { }, t2Subrace), rewardGenerator('ruins', 'bigBanner')),
            getRuins(3, { min = 500, max = 570 }, getGuard(3, { }, t2Subrace), rewardGenerator('ruins', 'bigArtifact')),
            getRuins(3, { min = 500, max = 600 }, getGuard(3, { }, t2Subrace), rewardGenerator('ruins', 'bigArtifact')),
            getRuins(4, { min = 700, max = 900 }, getGuard(4, { }, t3Subrace), rewardGenerator('ruins', 'bigJewel')),
            getRuins(5, { min = 820, max = 1000 }, getGuard(6, { }, GOsubrace), rewardGenerator('ruins', 'bigControl')),
        }
    end

    local zoneBags = { }

    if scenarioSize == 72 then
        zoneBags = {
            count = 8,
            loot = {
                itemTypes = { Item.Valuable, Item.PotionHeal, Item.PotionBoost, Item.Scroll },
                value = { min = 1600, max = 1900 },
                items = {
                    { id = 'g000ig0001', min = 2, max = 3 },
                    { id = 'g000ig0006', min = 2, max = 3 },
                    { id = 'g000ig0022', min = 1, max = 1 },
                    { id = 'g000ig0021', min = 1, max = 1 },
                    { id = 'g000ig0023', min = 1, max = 1 },
                    { id = 'g000ig0024', min = 1, max = 1 },
                    { id = 'g001ig0125', min = 1, max = 1 },
                    { id = 'g001ig0036', min = 1, max = 1 },
                    { id = 'g001ig0128', min = 1, max = 1 },
                    
                },
                itemValue = { min = 150, max = 500 }
            }
        }
    elseif scenarioSize == 96 then
        zoneBags = {
            count = 10,
            loot = {
                itemTypes = { Item.Valuable, Item.PotionHeal, Item.PotionBoost, Item.Scroll },
                value = { min = 2000, max = 2300 },
                items = {
                    { id = 'g000ig0001', min = 3, max = 4 },
                    { id = 'g000ig0006', min = 3, max = 4 },
                    { id = 'g000ig0022', min = 1, max = 1 },
                    { id = 'g000ig0021', min = 1, max = 1 },
                    { id = 'g000ig0023', min = 1, max = 1 },
                    { id = 'g000ig0024', min = 1, max = 1 },
                    { id = 'g001ig0125', min = 1, max = 1 },
                    { id = 'g001ig0036', min = 1, max = 1 },
                    { id = 'g001ig0128', min = 1, max = 1 },
                    
                },
                itemValue = { min = 150, max = 500 }
            }
        }
    end

    local zoneTowns = { }

    if scenarioSize == 72 then
        zoneTowns = {
            getNeutralTown(2, rewardGenerator('town', 'bigT2'), getGuard(2, rewardGenerator('guard', 'townT2'), t1Subrace)),
            getNeutralTown(4, rewardGenerator('town', 'bigT4'), getGuard(4, rewardGenerator('guard', 'townT4'), t3Subrace))
        }
    elseif scenarioSize == 96 then
        zoneTowns = {
            getNeutralTown(1, rewardGenerator('town', 'bigT1'), getGuard(1, rewardGenerator('guard', 'townT1'), t1Subrace)),
            getNeutralTown(2, rewardGenerator('town', 'bigT2'), getGuard(2, rewardGenerator('guard', 'townT2'), t1Subrace)),
            getNeutralTown(4, rewardGenerator('town', 'bigT4'), getGuard(4, rewardGenerator('guard', 'townT4'), t3Subrace))
        }
    end

    local zoneMerchants = { }

    if scenarioSize == 72 then
        zoneMerchants = {
            {
                goods = {
                    items = rewardGenerator('merchant', 'T2'),
                },
                guard = getGuard(3, rewardGenerator('guard', 'merchGuardT3'), t2Subrace) 
            }
        }
    elseif scenarioSize == 96 then
        zoneMerchants = {
            {
                goods = {
                    items = rewardGenerator('merchant', 'T1'),
                },
                guard = getGuard(2, rewardGenerator('guard', 'merchGuardT2'), t1Subrace)   
            },
            {
                goods = {
                    items = rewardGenerator('merchant', 'T2'),
                },
                guard = getGuard(3, rewardGenerator('guard', 'merchGuardT3'), t2Subrace)
            }
        }
    end

    local zoneOthers = { }

    if zoneId == bigZone0Id then
        zoneOthers[1] = { getMercenary(getGuard(3, rewardGenerator('guard', 'otherGuard')), t2Subrace) }
        zoneOthers[2] = { }
    elseif zoneId == bigZone4Id then
        zoneOthers[1] = { }
        zoneOthers[2] = { { guard = getGuard(3, rewardGenerator('guard', 'otherGuard'), t2Subrace) } }
    end

    return {
        id = zoneId,
		type = Zone.Treasure,
		size = zoneSize,

        mines = {
            gold = 2,
            lifeMana = 1,
            runicMana = 1,
            deathMana = 1,
            infernalMana = 1,
            groveMana = 1
        },

        bags = zoneBags,

        stacks = zoneStacks,

        towns = zoneTowns,

        ruins = zoneRuins,

        merchants = zoneMerchants,

        mercenaries = zoneOthers[1],

        trainers = zoneOthers[2],

        mages = {
            getMageTower(2, getGuard(3, rewardGenerator('guard', 'merchGuardT3'), t2Subrace))
        },
    }
end

function getConnections(scenarioSize)
    -- local guardStartBuffer = getGuard(3, rewardGenerator('guard', 'guardStartBuffer'))
    -- local guardStartTreasure = getGuard(6, rewardGenerator('guard', 'guardStartTreasure'))
    -- local guardBufferBig = getGuard(4, rewardGenerator('guard', 'guardBufferBig'))
    -- local guardBigTreasure = getGuard(5, rewardGenerator('guard', 'guardBigTreasure'))
    -- local guardBufferTreasure = getGuard(6, rewardGenerator('guard', 'guardBufferTreasure'))

    local connections = { }

    if scenarioSize == 72 then
        connections = {
            { from = startZone2Id, to = bufferZone1Id, guard = getGuard(3, rewardGenerator('guard', 'guardStartBuffer'), {Subrace.Elf, Subrace.NeutralElf, Subrace.NeutralMarsh}) },
            { from = startZone2Id, to = bufferZone3Id, guard = getGuard(3, rewardGenerator('guard', 'guardStartBuffer'), {Subrace.NeutralBarbarian, Subrace.NeutralWolf}) },
            { from = startZone2Id, to = treasureZone8Id, guard = getGuard(6, rewardGenerator('guard', 'guardStartTreasure'), GOsubrace) },
            
            { from = startZone6Id, to = bufferZone5Id, guard = getGuard(3, rewardGenerator('guard', 'guardStartBuffer'), {Subrace.NeutralBarbarian, Subrace.NeutralWolf}) },
            { from = startZone6Id, to = bufferZone7Id, guard = getGuard(3, rewardGenerator('guard', 'guardStartBuffer'), {Subrace.Elf, Subrace.NeutralElf, Subrace.NeutralMarsh}) },
            { from = startZone6Id, to = treasureZone8Id, guard = getGuard(6, rewardGenerator('guard', 'guardStartTreasure'), GOsubrace) },
    
            { from = bufferZone1Id, to = bigZone0Id, guard = getGuard(4, rewardGenerator('guard', 'guardBufferBig'), t3Subrace) },
            { from = bufferZone7Id, to = bigZone0Id, guard = getGuard(4, rewardGenerator('guard', 'guardBufferBig'), t3Subrace) },
    
            { from = bufferZone3Id, to = bigZone4Id, guard = getGuard(4, rewardGenerator('guard', 'guardBufferBig'), t3Subrace) },
            { from = bufferZone5Id, to = bigZone4Id, guard = getGuard(4, rewardGenerator('guard', 'guardBufferBig'), t3Subrace) },
    
            { from = bigZone0Id, to = treasureZone8Id, guard = getGuard(5, rewardGenerator('guard', 'guardBigTreasure'), GOsubrace) },
            { from = bigZone4Id, to = treasureZone8Id, guard = getGuard(5, rewardGenerator('guard', 'guardBigTreasure'), GOsubrace) },
    
            { from = bufferZone1Id, to = treasureZone8Id, guard = getGuard(6, rewardGenerator('guard', 'guardBufferTreasure'), GOsubrace) },
            { from = bufferZone3Id, to = treasureZone8Id, guard = getGuard(6, rewardGenerator('guard', 'guardBufferTreasure'), GOsubrace) },
            { from = bufferZone5Id, to = treasureZone8Id, guard = getGuard(6, rewardGenerator('guard', 'guardBufferTreasure'), GOsubrace) },
            { from = bufferZone7Id, to = treasureZone8Id, guard = getGuard(6, rewardGenerator('guard', 'guardBufferTreasure'), GOsubrace) },
            
        }
    elseif scenarioSize == 96 then
        connections = {
            { from = startZone2Id, to = bufferZone1Id, guard = getGuard(3, rewardGenerator('guard', 'guardStartBuffer'), {Subrace.Elf, Subrace.NeutralElf, Subrace.NeutralMarsh}) },
            { from = startZone2Id, to = bufferZone1Id, guard = getGuard(3, rewardGenerator('guard', 'guardStartBuffer'), {Subrace.Elf, Subrace.NeutralElf, Subrace.NeutralMarsh}) },
            { from = startZone2Id, to = bufferZone3Id, guard = getGuard(3, rewardGenerator('guard', 'guardStartBuffer'), {Subrace.NeutralBarbarian, Subrace.NeutralWolf}) },
            { from = startZone2Id, to = bufferZone3Id, guard = getGuard(3, rewardGenerator('guard', 'guardStartBuffer'), {Subrace.NeutralBarbarian, Subrace.NeutralWolf}) },
            { from = startZone2Id, to = treasureZone8Id, guard = getGuard(6, rewardGenerator('guard', 'guardStartTreasure'), GOsubrace) },
            { from = startZone2Id, to = treasureZone8Id, guard = getGuard(6, rewardGenerator('guard', 'guardStartTreasure'), GOsubrace) },
            
            { from = startZone6Id, to = bufferZone5Id, guard = getGuard(3, rewardGenerator('guard', 'guardStartBuffer'), {Subrace.NeutralBarbarian, Subrace.NeutralWolf}) },
            { from = startZone6Id, to = bufferZone5Id, guard = getGuard(3, rewardGenerator('guard', 'guardStartBuffer'), {Subrace.NeutralBarbarian, Subrace.NeutralWolf}) },
            { from = startZone6Id, to = bufferZone7Id, guard = getGuard(3, rewardGenerator('guard', 'guardStartBuffer'), {Subrace.Elf, Subrace.NeutralElf, Subrace.NeutralMarsh}) },
            { from = startZone6Id, to = bufferZone7Id, guard = getGuard(3, rewardGenerator('guard', 'guardStartBuffer'), {Subrace.Elf, Subrace.NeutralElf, Subrace.NeutralMarsh}) },
            { from = startZone6Id, to = treasureZone8Id, guard = getGuard(6, rewardGenerator('guard', 'guardStartTreasure'), GOsubrace) },
            { from = startZone6Id, to = treasureZone8Id, guard = getGuard(6, rewardGenerator('guard', 'guardStartTreasure'), GOsubrace) },
    
            { from = bufferZone1Id, to = bigZone0Id, guard = getGuard(4, rewardGenerator('guard', 'guardBufferBig'), t3Subrace) },
            { from = bufferZone1Id, to = bigZone0Id, guard = getGuard(4, rewardGenerator('guard', 'guardBufferBig'), t3Subrace) },
            { from = bufferZone7Id, to = bigZone0Id, guard = getGuard(4, rewardGenerator('guard', 'guardBufferBig'), t3Subrace) },
            { from = bufferZone7Id, to = bigZone0Id, guard = getGuard(4, rewardGenerator('guard', 'guardBufferBig'), t3Subrace) },
    
            { from = bufferZone3Id, to = bigZone4Id, guard = getGuard(4, rewardGenerator('guard', 'guardBufferBig'), t3Subrace) },
            { from = bufferZone3Id, to = bigZone4Id, guard = getGuard(4, rewardGenerator('guard', 'guardBufferBig'), t3Subrace) },
            { from = bufferZone5Id, to = bigZone4Id, guard = getGuard(4, rewardGenerator('guard', 'guardBufferBig'), t3Subrace) },
            { from = bufferZone5Id, to = bigZone4Id, guard = getGuard(4, rewardGenerator('guard', 'guardBufferBig'), t3Subrace) },
    
            { from = bigZone0Id, to = treasureZone8Id, guard = getGuard(5, rewardGenerator('guard', 'guardBigTreasure'), GOsubrace) },
            { from = bigZone0Id, to = treasureZone8Id, guard = getGuard(5, rewardGenerator('guard', 'guardBigTreasure'), GOsubrace) },
            { from = bigZone4Id, to = treasureZone8Id, guard = getGuard(5, rewardGenerator('guard', 'guardBigTreasure'), GOsubrace) },
            { from = bigZone4Id, to = treasureZone8Id, guard = getGuard(5, rewardGenerator('guard', 'guardBigTreasure'), GOsubrace) },
    
            { from = bufferZone1Id, to = treasureZone8Id, guard = getGuard(6, rewardGenerator('guard', 'guardBufferTreasure'), GOsubrace) },
            { from = bufferZone3Id, to = treasureZone8Id, guard = getGuard(6, rewardGenerator('guard', 'guardBufferTreasure'), GOsubrace) },
            { from = bufferZone5Id, to = treasureZone8Id, guard = getGuard(6, rewardGenerator('guard', 'guardBufferTreasure'), GOsubrace) },
            { from = bufferZone7Id, to = treasureZone8Id, guard = getGuard(6, rewardGenerator('guard', 'guardBufferTreasure'), GOsubrace) },
            
        }
    end

	return connections
end

function getTemplateContents(races, scenarioSize)
	return {
		zones = getZones(races, scenarioSize),
		connections = getConnections(scenarioSize)
	}
end

template = {
    name = 'freedom 0.9.8',
    description = 'freedom 0.9.8S by obscure, SMNS2, 72x72 or 96x96, 2 players, 2 big zones, 4 junction zones, 1 treasure zone',
    minSize = 72,
    maxSize = 96,
    maxPlayers = 2,
    roads = 50,
    forest = 45,
    startingGold = 1000,
    startingNativeMana = 200,
    getContents = getTemplateContents
}