-- template: freedom
-- author: obscure

-- 0 1 2
-- 7 8 3
-- 6 5 4

local TemplateName = 'Freedom'
local Verison = '1.4.1'
local Timer = 'First turn: 900, second turn: 450, sixth and further turns: 600.'

function getName(name, version)
    return name .. ' ' .. version
end

function getDescription(name, version, timer)
    return name .. ' ' .. version .. 'S by obscure, SMNS2, 72x72, 2 players.\nPink zone center, Blue opposite Yellow, Red Opposite Black.\nTimer is: ' .. timer
end

----------
-- function describes subrace types
function subraceRandomizer(flag)
    local subraces = { }

    if flag == GO then
        local randomFlag = math.random(0, 4)
        if randomFlag == 0 then
            subraces = { Subrace.NeutralDragon, Subrace.Dwarf }
        end

        if randomFlag == 1 then
            subraces = { Subrace.NeutralDragon, Subrace.Human }
        end

        if randomFlag == 2 then
            subraces = { Subrace.NeutralDragon, Subrace.Elf }
        end

        if randomFlag == 3 then
            subraces = { Subrace.NeutralDragon, Subrace.Heretic }
        end

        if randomFlag == 4 then
            subraces = { Subrace.NeutralDragon, Subrace.Undead }
        end
       
    elseif flag == 1 then
        local randomFlag = math.random(0, 5)

        if randomFlag == 0 then
            subraces = { Subrace.NeutralGreenSkin, Subrace.NeutralWolf }
        end

        if randomFlag == 1 then
            subraces = { Subrace.NeutralElf, Subrace.Elf }
        end

        if randomFlag == 2 then
            subraces = { Subrace.NeutralHuman, Subrace.Human }
        end

        if randomFlag == 3 then
            subraces = { Subrace.NeutralMarsh, Subrace.NeutralWater }
        end

        if randomFlag == 4 then
            subraces = { Subrace.Neutral, Subrace.Dwarf, Subrace.Undead, Subrace.Heretic }
        end

        if randomFlag == 5 then
            subraces = { Subrace.NeutralBarbarian, Subrace.NeutralWolf }
        end

    elseif flag == 2 then
        local randomFlag = math.random(0, 7)

        if randomFlag == 0 then
            subraces = { Subrace.NeutralGreenSkin, Subrace.NeutralBarbarian, Subrace.NeutralWolf, Subrace.Neutral }
        end

        if randomFlag == 1 then
            subraces = { Subrace.NeutralElf, Subrace.Elf, Subrace.Neutral, Subrace.NeutralWolf }
        end

        if randomFlag == 2 then
            subraces = { Subrace.NeutralHuman, Subrace.Human, Subrace.Neutral,Subrace.NeutralWolf }
        end

        if randomFlag == 3 then
            subraces = { Subrace.NeutralMarsh, Subrace.NeutralWater, Subrace.Neutral }
        end

        if randomFlag == 4 then
            subraces = { Subrace.Neutral, Subrace.Dwarf, Subrace.NeutralWolf }
        end

        if randomFlag == 5 then
            subraces = { Subrace.Neutral, Subrace.Undead, Subrace.NeutralWolf }
        end

        if randomFlag == 6 then
            subraces = { Subrace.Neutral, Subrace.Heretic, Subrace.NeutralWolf }
        end

        if randomFlag == 7 then
            subraces = { Subrace.Neutral, Subrace.NeutralDragon }
        end
    end

    return subraces
end
-- end
----------

----------
-- functions generates reward for town or ruins
function rewardGenerator(objectType, objectDefinition)

	local rewardTable = { }
	local rewardRandomFlag = nil

    local startRuinPermanent = {'g001ig0034', 'g001ig0026', 'g001ig0315', 'g001ig0332', 'g001ig0533', 'g001ig0309', 'g001ig0328', 'g001ig0330', 'g001ig0346', 'g001ig0344', 'g001ig0130', 'g001ig0313', 'g001ig0311', 'g001ig0531'}

    local t1Movement = {'g000ig5022', 'g000ig5100'}
    local t1Vision = {'g000ig5006',  'g000ig5068', 'g001ig0072'}
    local t2Movement = {'g001ig0389', 'g000ig5006', 'g001ig0390'}
    local t2Vision = {'g000ig6007', 'g000ig6006', 'g000ig5030'}

	local t1Artifacts = {'g001ig0582', 'g001ig0611', 'g001ig0418', 'g000ig2001', 'g001ig0100', 'g001ig0182', 'g000ig3001', 'g001ig0048', 'g002ig0001', 'g001ig0609'}
	local t1Banners = {'g000ig1001', 'g001ig0051', 'g001ig0369', 'g000ig1003', 'g001ig0587', 'g000ig1005', 'g000ig1007'}
	local t1Jewels = {'g000ig3008', 'g001ig0421', 'g001ig0101', 'g001ig0493', 'g001ig0497', 'g000ig4005', 'g001ig0495', 'g000ig4002', 'g000ig4004', 'g001ig0494', 'g000ig4008', 'g001ig0428', 'g000ig4006', 'g000ig4001', 'g000ig4003', 'g001ig0426'}
	local t1Orbs = {'g001ig0133', 'g001ig0446', 'g000ig9017', 'g001ig0458', 'g001ig0189', 'g001ig0178', 'g001ig0472', 'g000ig9031', 'g001ig0471', 'g001ig0470', 'g001ig0464', 'g001ig0473', 'g000ig9022', 'g001ig0450', 'g000ig9033', 'g001ig0302'}
	local t1Talismans = {'g001ig0184', 'g001ig0267', 'g001ig0265', 'g001ig0266', 'g001ig0264', 'g000ig9101', 'g000ig9105', 'g000ig9131'}
	local t1Travel = {'g001ig0108', 'g001ig0110', 'g001ig0105', 'g001ig0107', 'g001ig0109', 'g001ig0106', 'g001ig0113'}
	
	local t2Artifacts = {'g001ig0559', 'g001ig0047', 'g000ig3003', 'g000ig3002', 'g001ig0042', 'g001ig0071', 'g000ig2002', 'g001ig0557', 'g001ig0417', 'g001ig0040', 'g000ig9137', 'g000ig2003', 'g001ig0558', 'g000ig3019', 'g000ig3017', 'g001ig0197', 'g001ig0173', 'g001ig0196', 'g001ig0124', 'g001ig0594', 'g001ig0591', 'g001ig0612', 'g001ig0041', 'g001ig0488', 'g001ig0592', 'g001ig0487', 'g001ig0416', 'g001ig0589', 'g001ig0045', 'g001ig0657', 'g001ig0603'}
	local t2Banners = {'g001ig0588', 'g000ig1002', 'g000ig1008', 'g001ig0289', 'g001ig0142', 'g001ig0293', 'g001ig0145', 'g001ig0361', 'g001ig0140', 'g001ig0364', 'g000ig1006', 'g001ig0370', 'g001ig0292', 'g001ig0357', 'g000ig1004', 'g001ig0141', 'g001ig0143', 'g001ig0139', 'g001ig0374', 'g001ig0365', 'g001ig0358'}
	local t2Jewels = {'g001ig0610', 'g000ig4007', 'g000ig3020', 'g001ig0420', 'g001ig0104', 'g001ig0427', 'g001ig0422', 'g001ig0423', 'g001ig0605', 'g001ig0099', 'g000ig3022', 'g002ig0002'}
	local t2Orbs = {'g001ig0304', 'g001ig0443', 'g001ig0467', 'g001ig0191', 'g001ig0176', 'g000ig9024', 'g001ig0295', 'g001ig0461', 'g001ig0300', 'g001ig0496', 'g000ig9042', 'g001ig0475', 'g001ig0468', 'g001ig0478', 'g001ig0187', 'g001ig0469', 'g001ig0454', 'g001ig0456', 'g000ig9018', 'g001ig0192', 'g001ig0479', 'g001ig0453', 'g001ig0474', 'g001ig0134', 'g000ig9020'}
	local t2Talismans = {'g000ig9130', 'g000ig9128', 'g000ig9123', 'g000ig9109', 'g001ig0259', 'g001ig0063', 'g000ig9116', 'g000ig9120', 'g000ig9140'}
	local t2Travel = {'g001ig0111', 'g000ig8003', 'g001ig0114', 'g000ig1010'}
	
	local t3Artifacts = {'g001ig0046', 'g000ig3006', 'g001ig0174', 'g001ig0158', 'g000ig3004', 'g000ig9035', 'g001ig0415', 'g001ig0604', 'g001ig0411', 'g000ig2004', 'g001ig0585', 'g001ig0410', 'g001ig0060', 'g001ig0590', 'g001ig0413'}
	local t3Banners = {'g000ig1016', 'g001ig0052', 'g001ig0367', 'g001ig0375', 'g000ig1017', 'g001ig0359', 'g001ig0500', 'g001ig0363', 'g001ig0373', 'g000ig1015', 'g001ig0362', 'g001ig0290', 'g001ig0291', 'g002ig0003'}
	local t3Jewels = {'g001ig0419', 'g001ig0597', 'g000ig2006', 'g001ig0116', 'g001ig0430', 'g001ig0037', 'g001ig0156', 'g001ig0424', 'g001ig0425', 'g001ig0539', 'g001ig0429', 'g001ig0602'}
	local t3Orbs = {'g000ig9025', 'g001ig0136', 'g000ig9021', 'g000ig9016', 'g001ig0480', 'g000ig9028', 'g001ig0303', 'g001ig0459', 'g000ig9023', 'g001ig0457', 'g000ig9014', 'g001ig0203', 'g001ig0466', 'g001ig0462', 'g001ig0183', 'g001ig0455', 'g001ig0477', 'g001ig0489', 'g000ig9027', 'g001ig0131', 'g000ig9032'}
	local t3Talismans = {'g000ig9136', 'g001ig0185', 'g001ig0202', 'g000ig9103'}
	local t3Travel = {'g001ig0115', 'g001ig0112', 'g000ig8004', 'g001ig0606'}
	
	local t4Artifacts = {'g000ig2005', 'g001ig0179', 'g001ig0039', 'g001ig0102', 'g001ig0412', 'g002ig0013', 'g002ig0010', 'g002ig0017', 'g002ig0014'}
	local t4Banners = {'g001ig0144', 'g001ig0366', 'g001ig0153', 'g001ig0360', 'g002ig0016'}
	local t4Jewels = {'g000ig3005', 'g000ig7010', 'g001ig0038', 'g002ig0015', 'g002ig0012'}
	
	local t5Artifacts = {'g001ig0414', 'g001ig0043', 'g000ig3018', 'g000ig3021', 'g000ig3015', 'g000ig3016', 'g002ig0011'}
	
	local wands = { 'g000ig6020', 'g000ig6014', 'g000ig6021', 'g000ig6002', 'g000ig6011', 'g000ig6003', 'g000ig6012', 'g000ig6006', 'g001ig0398', 'g001ig0394', 'g001ig0399', 'g001ig0396', 'g001ig0401', 'g001ig0383', 'g001ig0402', 'g001ig0391', 'g001ig0405', 'g001ig0404', 'g001ig0382', 'g001ig0403', 'g001ig0395', 'g001ig0397' }
	
	local smallValuable = {'g000ig7001', 'g001ig0431', 'g000ig7002', 'g001ig0432'}
	local smallMana = {'g001ig0481', 'g001ig0482', 'g001ig0483', 'g001ig0484', 'g001ig0485', 'g001ig0486'}
	local mediumValuable = {'g000ig7003', 'g001ig0433', 'g000ig7004', 'g000ig7005'}
	local mediumMana = {'g001ig0146', 'g001ig0147', 'g001ig0148', 'g001ig0149', 'g001ig0150', 'g001ig0151'}
	local bigValuable = {'g000ig7007', 'g000ig7006', 'g000ig7008', 'g000ig7009'}
	local bigMana = {'g001ig0282', 'g001ig0277', 'g001ig0278', 'g001ig0279', 'g001ig0280', 'g001ig0281'}
	
	local potionLow = { 'g000ig0011', 'g000ig0008', 'g000ig0014', 'g000ig0002', 'g000ig0022', 'g000ig0021', 'g000ig0023', 'g000ig0024', 'g001ig0125', 'g001ig0127', 'g001ig0547', 'g001ig0490' }
	local potionProtect = { 'g001ig0341', 'g001ig0329', 'g001ig0351', 'g001ig0343', 'g001ig0560', 'g002ig0006', 'g002ig0007', 'g002ig0005' }
	local potionHigh = { 'g000ig0003', 'g000ig0015', 'g000ig0012', 'g000ig0009', 'g001ig0562', 'g001ig0491', 'g001ig0128', 'g001ig0355', 'g001ig0126', 'g002ig0008' }
	
	local scrolls = { 'g001ig0164', 'g000ig5089', 'g001ig0577', 'g000ig5013', 'g000ig5012', 'g001ig0578', 'g000ig5073', 'g001ig0576', 'g000ig5111', 'g001ig0572', 'g001ig0580', 'g000ig5110', 'g001ig0165', 'g000ig5026', 'g001ig0570', 'g000ig5067', 'g001ig0251', 'g001ig0255', 'g000ig5069', 'g001ig0253', 'g000ig5020', 'g000ig5103', 'g000ig5066', 'g000ig5008', 'g001ig0569', 'g000ig5088', 'g000ig5104', 'g001ig0256', 'g000ig5028', 'g000ig5070', 'g000ig5016', 'g000ig5010', 'g000ig5001', 'g000ig5005', 'g001ig0568', 'g000ig5034', 'g001ig0571', 'g001ig0254', 'g000ig5046', 'g000ig5048', 'g000ig5049', 'g000ig5050', 'g001ig0249', 'g001ig0248', 'g000ig5102', 'g000ig5101', 'g001ig0250', 'g001ig0252', 'g000ig5106', 'g000ig5064', 'g000ig5003', 'g000ig5023', 'g000ig5065', 'g001ig0492', 'g000ig5098', 'g000ig5061', 'g000ig5025', 'g000ig5099', 'g001ig0247', 'g000ig5062', 'g000ig5004', 'g000ig5021', 'g000ig5097', 'g000ig5007', 'g000ig5119', 'g000ig5002', 'g000ig5024', 'g000ig5045', 'g000ig5044', 'g000ig5041', 'g000ig5043' }
	
	local permanent = {'g001ig0027', 'g001ig0028', 'g001ig0022', 'g001ig0029', 'g001ig0030', 'g001ig0018', 'g001ig0523', 'g001ig0320', 'g001ig0317', 'g001ig0083', 'g001ig0323', 'g001ig0322', 'g001ig0548', 'g001ig0321', 'g000ig0010', 'g001ig0352', 'g000ig0016', 'g001ig0348', 'g001ig0338', 'g001ig0340', 'g000ig0013', 'g001ig0376', 'g001ig0336', 'g001ig0561', 'g000ig0004'}
    local perma_big = {'g001ig0563', 'g001ig0025', 'g001ig0024', 'g001ig0013', 'g001ig0015', 'g001ig0014', 'g001ig0009', 'g001ig0011', 'g001ig0012', 'g001ig0030', 'g001ig0021', 'g001ig0031', 'g001ig0035', 'g001ig0324', 'g001ig0308', 'g001ig0325', 'g001ig0326', 'g001ig0318', 'g001ig0019', 'g001ig0316', 'g001ig0314', 'g001ig0310', 'g001ig0312'}

    local protection = {'g001ig0454', 'g001ig0056', 'g001ig0054', 'g001ig0055', 'g001ig0053', 'g001ig0058', 'g001ig0057'}
    
    if objectType == 'town' and objectDefinition == 'startT1' then
		table.insert(rewardTable, { id = 'g000ig0005', min = 2, max = 2 })
		table.insert(rewardTable, { id = 'g000ig0001', min = 1, max = 1 })

        for i = 1,2 do
            x = math.random(1, #t1Artifacts)
            table.insert(rewardTable, { id = t1Artifacts[x], min = 1, max = 1})
            table.remove(t1Artifacts, x)
        end

        for i = 1,2 do
            x = math.random(1, #potionLow)
            table.insert(rewardTable, { id = potionLow[x], min = 1, max = 1})
            table.remove(potionLow, x)
        end

        table.insert(rewardTable, { id = 'g001ig0486', min = 1, max = 1})
	elseif objectType == 'town' and objectDefinition == 'startT2' then
		table.insert(rewardTable, { id = 'g000ig0006', min = 1, max = 2 })
		table.insert(rewardTable, { id = 'g000ig0001', min = 1, max = 1 })
		table.insert(rewardTable, { id = t2Jewels[math.random(#t2Jewels)], min = 1, max = 1})
		table.insert(rewardTable, { id = t1Banners[math.random(#t1Banners)], min = 1, max = 1})
        table.insert(rewardTable, { id = 'g000ig5009', min = 1, max = 1 })

        for i = 1,2 do
            x = math.random(1, #potionLow)
            table.insert(rewardTable, { id = potionLow[x], min = 1, max = 1})
            table.remove(potionLow, x)
        end
        
        table.insert(rewardTable, { id = potionProtect[math.random(#potionProtect)], min = 1, max = 1})
        table.insert(rewardTable, { id = 'g001ig0151', min = 1, max = 1})
        table.insert(rewardTable, { id = 'g001ig0194', min = 1, max = 1})
        table.insert(rewardTable, { id = 'g001ig0530', min = 1, max = 1})
	elseif objectType == 'town' and objectDefinition == 'bufferT3' then
		table.insert(rewardTable, { id = 'g000ig0006', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g000ig0005', min = 2, max = 2 })
		table.insert(rewardTable, { id = 'g000ig0001', min = 1, max = 1 })

        for i = 1,2 do
            x = math.random(1, #potionLow)
            table.insert(rewardTable, { id = potionLow[x], min = 1, max = 2})
            table.remove(potionLow, x)
        end

		table.insert(rewardTable, { id = potionHigh[math.random(#potionHigh)], min = 1, max = 1})
        table.insert(rewardTable, { id = 'g001ig0151', min = 1, max = 1})
        table.insert(rewardTable, { id = 'g000ig5085', min = 1, max = 1})
        table.insert(rewardTable, { id = 'g000ig5030', min = 1, max = 1})
        table.insert(rewardTable, { id = 'g000ig0020', min = 1, max = 1})
		
		rewardRandomFlag = math.random(0,1)
		if rewardRandomFlag == 0 then
			table.insert(rewardTable, { id = t1Banners[math.random(#t1Banners)], min = 1, max = 1})
			table.insert(rewardTable, { id = t2Travel[math.random(#t2Travel)], min = 1, max = 1})
			table.insert(rewardTable, { id = t2Jewels[math.random(#t2Jewels)], min = 1, max = 1})
		elseif rewardRandomFlag == 1 then
			table.insert(rewardTable, { id = t2Banners[math.random(#t2Banners)], min = 1, max = 1})
			table.insert(rewardTable, { id = t2Travel[math.random(#t2Travel)], min = 1, max = 1})
			table.insert(rewardTable, { id = t1Jewels[math.random(#t1Jewels)], min = 1, max = 1})
		end
		rewardRandomFlag = nil
	elseif objectType == 'town' and objectDefinition == 'bigT2' then
		table.insert(rewardTable, { id = 'g000ig0005', min = 1, max = 1 })
		table.insert(rewardTable, { id = 'g000ig0006', min = 1, max = 1 })
		table.insert(rewardTable, { id = 'g000ig7002', min = 1, max = 1 })
		table.insert(rewardTable, { id = 'g001ig0486', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g000ig5030', min = 1, max = 1 })

        for i = 1,2 do
            x = math.random(1, #t1Orbs)
            table.insert(rewardTable, { id = t1Orbs[x], min = 1, max = 2})
            table.remove(t1Orbs, x)
        end

		table.insert(rewardTable, { id = potionLow[math.random(#potionLow)], min = 1, max = 1})
	elseif objectType == 'town' and objectDefinition == 'bigT4' then
		table.insert(rewardTable, { id = 'g000ig0006', min = 1, max = 1 })
		table.insert(rewardTable, { id = 'g000ig0001', min = 1, max = 1 })
		table.insert(rewardTable, { id = 'g001ig0152', min = 1, max = 1 })
		table.insert(rewardTable, { id = t3Orbs[math.random(#t3Orbs)], min = 1, max = 1})
        table.insert(rewardTable, { id = 'g000ig5068', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g000ig9043', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g000ig0017', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g000ig0019', min = 1, max = 1 })

        for i = 1,2 do
            x = math.random(1, #potionLow)
            table.insert(rewardTable, { id = potionLow[x], min = 1, max = 2})
            table.remove(potionLow, x)
        end

        for i = 1,2 do
            x = math.random(1, #potionHigh)
            table.insert(rewardTable, { id = potionHigh[x], min = 1, max = 2})
            table.remove(potionHigh, x)
        end
		
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

        table.insert(rewardTable, { id = t3Travel[math.random(#t3Travel)], min = 1, max = 1})

    elseif objectType == 'town' and objectDefinition == 'centerT3' then
        table.insert(rewardTable, { id = 'g000ig0006', min = 1, max = 1 })
		table.insert(rewardTable, { id = 'g000ig0001', min = 1, max = 1 })
        table.insert(rewardTable, { id = t3Orbs[math.random(#t3Orbs)], min = 1, max = 1})
        for i = 1,2 do
            x = math.random(1, #potionHigh)
            table.insert(rewardTable, { id = potionHigh[x], min = 1, max = 1})
            table.remove(potionHigh, x)
        end

        for i = 1,2 do
            x = math.random(1, #scrolls)
            table.insert(rewardTable, { id = scrolls[x], min = 1, max = 1})
            table.remove(scrolls, x)
        end
    
	elseif objectType == 'town' and objectDefinition == 'centerT5' then
		table.insert(rewardTable, { id = 'g000ig0006', min = 2, max = 2 })
		table.insert(rewardTable, { id = 'g001ig0152', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g000ig0020', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g000ig0017', min = 1, max = 1 })
        
		for i = 1,3 do
            x = math.random(1, #potionLow)
            table.insert(rewardTable, { id = potionLow[x], min = 1, max = 2})
            table.remove(potionLow, x)
        end

        for i = 1,2 do
            x = math.random(1, #potionHigh)
            table.insert(rewardTable, { id = potionHigh[x], min = 1, max = 2})
            table.remove(potionHigh, x)
        end

		for i = 1,2 do
            x = math.random(1, #potionProtect)
            table.insert(rewardTable, { id = potionProtect[x], min = 1, max = 1})
            table.remove(potionProtect, x)
        end

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

	elseif objectType == 'ruins' and objectDefinition == 'startArtifact' then
		table.insert(rewardTable, { id = t2Artifacts[math.random(#t2Artifacts)], min = 1, max = 1})
	elseif objectType == 'ruins' and objectDefinition == 'startJewel' then
		table.insert(rewardTable, { id = t1Jewels[math.random(#t1Jewels)], min = 1, max = 1})
    elseif objectType == 'ruins' and objectDefinition == 'startTravel' then
		table.insert(rewardTable, { id = t1Travel[math.random(#t1Travel)], min = 1, max = 1})
    elseif objectType == 'ruins' and objectDefinition == 'startPermanent' then
		table.insert(rewardTable, { id = startRuinPermanent[math.random(#startRuinPermanent)], min = 1, max = 1})
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
	elseif objectType == 'ruins' and objectDefinition == 'bigMana' then
		table.insert(rewardTable, { id = 'g001ig0288', min = 1, max = 1})
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
	elseif objectType == 'ruins' and objectDefinition == 'centerThief' then
		table.insert(rewardTable, { id = 'g001ig0521', min = 1, max = 1})
	elseif objectType == 'ruins' and objectDefinition == 'centerControl' then
		table.insert(rewardTable, { id = t5Artifacts[math.random(#t5Artifacts)], min = 1, max = 1})
	elseif objectType == 'ruins' and objectDefinition == 'centerBannerT4' then
		table.insert(rewardTable, { id = t4Banners[math.random(#t4Banners)], min = 1, max = 1})
	elseif objectType == 'guard' and objectDefinition == 'merchGuardT2' then
		table.insert(rewardTable, { id = 'g000ig0006', min = 1, max = 1 })
		table.insert(rewardTable, { id = 'g000ig0005', min = 1, max = 1 })

		for i = 1,3 do
            x = math.random(1, #potionLow)
            table.insert(rewardTable, { id = potionLow[x], min = 1, max = 1})
            table.remove(potionLow, x)
        end

		table.insert(rewardTable, { id = potionProtect[math.random(#potionProtect)], min = 1, max = 1})
		table.insert(rewardTable, { id = smallMana[math.random(#smallMana)], min = 1, max = 1})
		table.insert(rewardTable, { id = smallValuable[math.random(#smallValuable)], min = 1, max = 1})
        table.insert(rewardTable, { id = protection[math.random(#protection)], min = 1, max = 1})
        table.insert(rewardTable, { id = scrolls[math.random(#scrolls)], min = 1, max = 1})
	elseif objectType == 'guard' and objectDefinition == 'merchGuardT3' then
		table.insert(rewardTable, { id = 'g000ig0001', min = 1, max = 1 })
		table.insert(rewardTable, { id = 'g000ig0006', min = 1, max = 1 })
		table.insert(rewardTable, { id = potionLow[math.random(#potionLow)], min = 1, max = 2})
		table.insert(rewardTable, { id = potionHigh[math.random(#potionHigh)], min = 1, max = 2})
		table.insert(rewardTable, { id = potionProtect[math.random(#potionProtect)], min = 1, max = 1})
        table.insert(rewardTable, { id = smallValuable[math.random(#smallValuable)], min = 1, max = 1})
		table.insert(rewardTable, { id = mediumMana[math.random(#mediumMana)], min = 1, max = 1})		
        table.insert(rewardTable, { id = protection[math.random(#protection)], min = 1, max = 1})
        table.insert(rewardTable, { id = scrolls[math.random(#scrolls)], min = 1, max = 1})
	elseif objectType == 'guard' and objectDefinition == 'merchGuardT4' then
		table.insert(rewardTable, { id = 'g000ig0001', min = 1, max = 1 })
		table.insert(rewardTable, { id = 'g000ig0018', min = 1, max = 1 })
		table.insert(rewardTable, { id = potionHigh[math.random(#potionHigh)], min = 1, max = 1})
		table.insert(rewardTable, { id = potionLow[math.random(#potionLow)], min = 1, max = 1})

		for i = 1,2 do
            x = math.random(1, #potionProtect)
            table.insert(rewardTable, { id = potionProtect[x], min = 1, max = 1})
            table.remove(potionProtect, x)
        end

        table.insert(rewardTable, { id = smallValuable[math.random(#smallValuable)], min = 1, max = 1})
		table.insert(rewardTable, { id = bigMana[math.random(#bigMana)], min = 1, max = 1})
        table.insert(rewardTable, { id = protection[math.random(#protection)], min = 1, max = 1})
        table.insert(rewardTable, { id = scrolls[math.random(#scrolls)], min = 1, max = 1})
	elseif objectType == 'guard' and objectDefinition == 'otherGuard' then
		table.insert(rewardTable, { id = 'g000ig0006', min = 1, max = 1 })
		table.insert(rewardTable, { id = potionLow[math.random(#potionLow)], min = 1, max = 1})
		table.insert(rewardTable, { id = potionHigh[math.random(#potionHigh)], min = 1, max = 1})
		table.insert(rewardTable, { id = mediumValuable[math.random(#mediumValuable)], min = 1, max = 1})
		table.insert(rewardTable, { id = t3Talismans[math.random(#t3Talismans)], min = 1, max = 1})
        table.insert(rewardTable, { id = permanent[math.random(#permanent)], min = 1, max = 1})
        table.insert(rewardTable, { id = protection[math.random(#protection)], min = 1, max = 1})
        table.insert(rewardTable, { id = scrolls[math.random(#scrolls)], min = 1, max = 1})
	elseif objectType == 'guard' and objectDefinition == 'townT1' then
		table.insert(rewardTable, { id = 'g000ig0006', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g000ig0005', min = 1, max = 1 })
		table.insert(rewardTable, { id = potionLow[math.random(#potionLow)], min = 1, max = 1})
		table.insert(rewardTable, { id = smallValuable[math.random(#smallValuable)], min = 1, max = 1})
        table.insert(rewardTable, { id = smallMana[math.random(#smallMana)], min = 1, max = 1})
        table.insert(rewardTable, { id = scrolls[math.random(#scrolls)], min = 1, max = 1})
	elseif objectType == 'guard' and objectDefinition == 'townT2' then
		table.insert(rewardTable, { id = 'g000ig0001', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g000ig0006', min = 1, max = 1 })
		table.insert(rewardTable, { id = potionLow[math.random(#potionLow)], min = 1, max = 1})
		table.insert(rewardTable, { id = smallValuable[math.random(#smallValuable)], min = 1, max = 1})		
		table.insert(rewardTable, { id = smallMana[math.random(#smallMana)], min = 1, max = 1})
        table.insert(rewardTable, { id = t1Movement[math.random(#t1Movement)], min = 1, max = 1})
        table.insert(rewardTable, { id = scrolls[math.random(#scrolls)], min = 1, max = 1})
	elseif objectType == 'guard' and objectDefinition == 'townT3' then
		table.insert(rewardTable, { id = 'g000ig0001', min = 1, max = 1 })
		table.insert(rewardTable, { id = 'g000ig0006', min = 1, max = 2 })
		table.insert(rewardTable, { id = potionLow[math.random(#potionLow)], min = 1, max = 1})
		table.insert(rewardTable, { id = potionHigh[math.random(#potionHigh)], min = 1, max = 1})
        table.insert(rewardTable, { id = mediumValuable[math.random(#mediumValuable)], min = 1, max = 1})
		table.insert(rewardTable, { id = t2Orbs[math.random(#t2Orbs)], min = 1, max = 1})
		table.insert(rewardTable, { id = scrolls[math.random(#scrolls)], min = 1, max = 1})
        table.insert(rewardTable, { id = t1Vision[math.random(#t1Vision)], min = 1, max = 1})
	elseif objectType == 'guard' and objectDefinition == 'townT3Center' then
        table.insert(rewardTable, { id = scrolls[math.random(#scrolls)], min = 1, max = 1})
		table.insert(rewardTable, { id = 'g000ig0001', min = 1, max = 1 })
		table.insert(rewardTable, { id = 'g000ig0006', min = 1, max = 1 })
		table.insert(rewardTable, { id = bigMana[math.random(#bigMana)], min = 1, max = 1})
		table.insert(rewardTable, { id = t2Orbs[math.random(#t2Orbs)], min = 1, max = 1})
        table.insert(rewardTable, { id = perma_big[math.random(#perma_big)], min = 1, max = 1})
    elseif objectType == 'guard' and objectDefinition == 'townT4' then

		for i = 1,2 do
            x = math.random(1, #scrolls)
            table.insert(rewardTable, { id = scrolls[x], min = 1, max = 1})
            table.remove(scrolls, x)
        end

		table.insert(rewardTable, { id = 'g000ig0001', min = 1, max = 1 })
		table.insert(rewardTable, { id = 'g000ig0006', min = 2, max = 2 })
		table.insert(rewardTable, { id = bigMana[math.random(#bigMana)], min = 1, max = 1})
		table.insert(rewardTable, { id = t2Orbs[math.random(#t2Orbs)], min = 1, max = 1})
		table.insert(rewardTable, { id = potionHigh[math.random(#potionHigh)], min = 1, max = 1})
        table.insert(rewardTable, { id = perma_big[math.random(#perma_big)], min = 1, max = 1})
	elseif objectType == 'guard' and objectDefinition == 'townT5' then

		for i = 1,2 do
            x = math.random(1, #scrolls)
            table.insert(rewardTable, { id = scrolls[x], min = 1, max = 1})
            table.remove(scrolls, x)
        end

		table.insert(rewardTable, { id = 'g000ig0001', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g000ig0018', min = 1, max = 1 })
		table.insert(rewardTable, { id = t3Orbs[math.random(#t3Orbs)], min = 1, max = 1})
		table.insert(rewardTable, { id = bigMana[math.random(#bigMana)], min = 1, max = 1})		
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

		table.insert(rewardTable, { id = 'g000ig0001', min = 1, max = 1 })
		table.insert(rewardTable, { id = 'g000ig0018', min = 1, max = 2 })
		table.insert(rewardTable, { id = t3Orbs[math.random(#t3Orbs)], min = 1, max = 1})
		table.insert(rewardTable, { id = bigValuable[math.random(#bigValuable)], min = 1, max = 1})
		table.insert(rewardTable, { id = t3Artifacts[math.random(#t3Artifacts)], min = 1, max = 1})
        table.insert(rewardTable, { id = t2Movement[math.random(#t2Movement)], min = 1, max = 1})
	elseif objectType == 'guard' and objectDefinition == 'guardBufferBig' then
		table.insert(rewardTable, { id = scrolls[math.random(#scrolls)], min = 1, max = 1})
		table.insert(rewardTable, { id = t2Orbs[math.random(#t2Orbs)], min = 1, max = 1})
		table.insert(rewardTable, { id = 'g000ig0001', min = 1, max = 1 })
		table.insert(rewardTable, { id = 'g000ig0006', min = 2, max = 2 })
		table.insert(rewardTable, { id = mediumValuable[math.random(#mediumValuable)], min = 1, max = 1})
		table.insert(rewardTable, { id = mediumMana[math.random(#mediumMana)], min = 1, max = 1})
        table.insert(rewardTable, { id = t2Movement[math.random(#t2Movement)], min = 1, max = 1})
	elseif objectType == 'guard' and objectDefinition == 'guardBigTreasure' then
		table.insert(rewardTable, { id = scrolls[math.random(#scrolls)], min = 1, max = 1})
		table.insert(rewardTable, { id = t2Orbs[math.random(#t2Orbs)], min = 1, max = 1})
		table.insert(rewardTable, { id = 'g000ig0001', min = 1, max = 1 })
		table.insert(rewardTable, { id = 'g000ig0006', min = 2, max = 2 })
		table.insert(rewardTable, { id = mediumValuable[math.random(#mediumValuable)], min = 1, max = 1})
		table.insert(rewardTable, { id = mediumMana[math.random(#mediumMana)], min = 1, max = 1})
		table.insert(rewardTable, { id = t3Travel[math.random(#t3Travel)], min = 1, max = 1})
        table.insert(rewardTable, { id = permanent[math.random(#permanent)], min = 1, max = 1})
	elseif objectType == 'guard' and objectDefinition == 'guardBufferTreasure' then

		for i = 1,2 do
            x = math.random(1, #scrolls)
            table.insert(rewardTable, { id = scrolls[x], min = 1, max = 1})
            table.remove(scrolls, x)
        end

		table.insert(rewardTable, { id = 'g000ig0001', min = 1, max = 1 })
		table.insert(rewardTable, { id = 'g000ig0018', min = 1, max = 2 })
		table.insert(rewardTable, { id = t3Orbs[math.random(#t3Orbs)], min = 1, max = 1})
		table.insert(rewardTable, { id = mediumValuable[math.random(#mediumValuable)], min = 1, max = 1})
		table.insert(rewardTable, { id = t3Jewels[math.random(#t3Jewels)], min = 1, max = 1})

    elseif objectType == 'merchant' and objectDefinition == 'T1' then
        table.insert(rewardTable, { id = 'g000ig0006', min = 5, max = 5 })
        table.insert(rewardTable, { id = 'g000ig0001', min = 3, max = 3 })
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
        table.insert(rewardTable, { id = 'g000ig0001', min = 3, max = 3 })
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

        for i = 1,2 do
            x = math.random(1, #potionProtect)
            table.insert(rewardTable, { id = potionProtect[x], min = 1, max = 1})
            table.remove(potionProtect, x)
        end

    elseif objectType == 'merchant' and objectDefinition == 'T3-1' then
        table.insert(rewardTable, { id = 'g000ig0006', min = 5, max = 5 })
        table.insert(rewardTable, { id = 'g000ig0001', min = 3, max = 3 })
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

        for i = 1,2 do
            x = math.random(1, #potionProtect)
            table.insert(rewardTable, { id = potionProtect[x], min = 1, max = 1})
            table.remove(potionProtect, x)
        end

    elseif objectType == 'merchant' and objectDefinition == 'T3-2' then
        table.insert(rewardTable, { id = 'g000ig0006', min = 5, max = 5 })
        table.insert(rewardTable, { id = 'g000ig0018', min = 5, max = 5 })
        table.insert(rewardTable, { id = 'g000ig9040', min = 1, max = 1 })
        
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

        for i = 1,8 do
            x = math.random(1, #scrolls)
            table.insert(rewardTable, { id = scrolls[x], min = 1, max = 1})
            table.remove(scrolls, x)
        end

        for i = 1,2 do
            x = math.random(1, #wands)
            table.insert(rewardTable, { id = wands[x], min = 1, max = 1})
            table.remove(wands, x)
        end
        
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

        for i = 1,2 do
            x = math.random(1, #potionProtect)
            table.insert(rewardTable, { id = potionProtect[x], min = 1, max = 1})
            table.remove(potionProtect, x)
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

        for i = 1,4 do
            x = math.random(1, #permanent)
            table.insert(rewardTable, { id = permanent[x], min = 1, max = 1})
            table.remove(permanent, x)
        end
        
        table.insert(rewardTable, { id = t2Jewels[math.random(#t2Jewels)], min = 1, max = 1})
        table.insert(rewardTable, { id = 'g001ig0525', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g001ig0561', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g001ig0523', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g001ig0526', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g001ig0527', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g001ig0531', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g001ig0529', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g001ig0528', min = 1, max = 1 })
        table.insert(rewardTable, { id = 'g001ig0534', min = 1, max = 1 })

        for i = 1,2 do
            x = math.random(1, #potionProtect)
            table.insert(rewardTable, { id = potionProtect[x], min = 1, max = 1})
            table.remove(potionProtect, x)
        end
    
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

    if tier < 3 then
        stackSubraces = subraceRandomizer(1)
    elseif tier >= 3 then
        stackSubraces = subraceRandomizer(2)
    end
        

    local t1Items = { { id = 'g001ig0180', min = 1, max = 2 }, { id = 'g000ig0005', min = 1, max = 1 }, { id = 'g001ig0378', min = 1, max = 1 }, { id = 'g000ig0001', min = 1, max = 1 } }
    local t2Items = { { id = 'g001ig0180', min = 1, max = 2 }, { id = 'g000ig0005', min = 1, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 } } 
    local t3Items = { { id = 'g000ig0005', min = 1, max = 1 }, { id = 'g000ig0001', min = 0, max = 1 }, { id = 'g000ig0006', min = 0, max = 1 }, { id = 'g001ig0378', min = 1, max = 1 } }
    local t4Items = { { id = 'g001ig0378', min = 0, max = 1 }, { id = 'g000ig0001', min = 0, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }, { id = 'g000ig0018', min = 0, max = 1 } }
    local t5Items = { { id = 'g000ig0001', min = 0, max = 1 }, { id = 'g000ig0006', min = 1, max = 1 }, { id = 'g000ig0018', min = 0, max = 1 } }
    
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

    stackItemsValue.min = (300 * stackCount * tier * (1 - tier * 0.1))
    stackItemsValue.max = (360 * stackCount * tier * (1 - tier * 0.1))
    
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
        experienceValue.min = 230 * stackCount * tier * 1.14
        experienceValue.max = 260 * stackCount * tier * 1.14
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

    local experienceValue = { }
    
    if (tier == 1) then
        experienceValue.min = 200 * 1.1
        experienceValue.max = 240 * 1.1
    elseif (tier == 2) then
        experienceValue.min = 210 * tier * 0.92
        experienceValue.max = 240 * tier * 0.92
    elseif (tier == 3) then
        experienceValue.min = 230 * tier
        experienceValue.max = 260 * tier
    elseif (tier == 4) then
        experienceValue.min = 230 * tier * 1.1
        experienceValue.max = 260 * tier * 1.1
    elseif (tier == 5) then
        experienceValue.min = 230 * tier * 1.16
        experienceValue.max = 260 * tier * 1.16
    elseif (tier == 6) then
        experienceValue.min = 230 * tier * 1.14
        experienceValue.max = 260 * tier * 1.14
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
        experienceValue.min = 210 * townTier * 1.05
        experienceValue.max = 240 * townTier * 1.05
    elseif (townTier == 4) then
        experienceValue.min = 210 * townTier * 1.25
        experienceValue.max = 240 * townTier * 1.25
    elseif (townTier == 5) then
        experienceValue.min = 210 * townTier * 1.5
        experienceValue.max = 240 * townTier * 1.5
    end

    local townSubraces = { }

    if townTier < 3 then
        townSubraces = subraceRandomizer(1)
    elseif townTier >= 3 then
        townSubraces = subraceRandomizer(2)
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
    local t1SpellSet = { 'g000ss0043', 'g000ss0041', 'g000ss0044', 'g000ss0045', 'g000ss0024', 'g000ss0002', 'g000ss0009', 'g000ss0007', 'g000ss0097', 'g000ss0021', 'g000ss0004', 'g000ss0062', 'g000ss0178', 'g000ss0099', 'g000ss0134', 'g000ss0025', 'g000ss0061', 'g000ss0098', 'g000ss0065', 'g000ss0003', 'g000ss0023', 'g000ss0064', 'g000ss0106', 'g000ss0126', 'g000ss0181', 'g000ss0101', 'g000ss0102', 'g000ss0179', 'g000ss0022', 'g000ss0189', 'g000ss0048', 'g000ss0107', 'g000ss0028', 'g000ss0104', 'g000ss0067' }
    local t2SpellSet = { 'g000ss0050', 'g000ss0049', 'g000ss0046', 'g000ss0185', 'g000ss0030', 'g000ss0034', 'g000ss0197', 'g000ss0187', 'g000ss0198', 'g000ss0008', 'g000ss0066', 'g000ss0103', 'g000ss0184', 'g000ss0069', 'g000ss0029', 'g000ss0183', 'g000ss0186', 'g000ss0068', 'g000ss0054', 'g000ss0109', 'g000ss0033', 'g000ss0014', 'g000ss0072' }
    local t3SpellSet = { 'g000ss0052', 'g000ss0127', 'g000ss0089', 'g000ss0051', 'g000ss0199', 'g000ss0026', 'g000ss0166', 'g000ss0125', 'g000ss0209', 'g000ss0201', 'g000ss0111', 'g000ss0205', 'g000ss0073', 'g000ss0012', 'g000ss0013', 'g000ss0074', 'g000ss0006', 'g000ss0208', 'g000ss0100', 'g000ss0206', 'g000ss0207' }

    local spellsSet = { }

    if tier == 1 then
        for i = 1,7 do
            x = math.random(1, #t1SpellSet)
            spellsSet[i] = t1SpellSet[x]
            table.remove(t1SpellSet, x)
        end

        for i = 8,10 do
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

        for i = 9,12 do
            x = math.random(1, #t3SpellSet)
            spellsSet[i] = t3SpellSet[x]
            table.remove(t3SpellSet, x)
        end

    elseif tier == 3 then
        for i = 1,6 do
            x = math.random(1, #t2SpellSet)
            spellsSet[i] = t2SpellSet[x]
            table.remove(t2SpellSet, x)
        end

        for i = 7,11 do
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

function getZones(races)

	local bigZoneSize = 16000
	local startingZoneSize = 12000
	local bufferZoneSize = 7000
    local treasureZoneSize = 16000

	local zones = {}


	zones[1] = getBigZone(bigZone0Id, bigZoneSize)

	zones[2] = getBufferZone(bufferZone1Id, races[1], bufferZoneSize)

	zones[3] = getStartingZone(startZone2Id, races[1], startingZoneSize)

	zones[4] = getBufferZone(bufferZone3Id, races[2], bufferZoneSize)	

	zones[5] = getBigZone(bigZone4Id, bigZoneSize)

	zones[6] = getBufferZone(bufferZone5Id, races[2], bufferZoneSize)

	zones[7] = getStartingZone(startZone6Id, races[2], startingZoneSize)

	zones[8] = getBufferZone(bufferZone7Id, races[1], bufferZoneSize)

    zones[9] = getTreasureZone(treasureZone8Id, treasureZoneSize)

	return zones
end

function getStartingMines(race)
    local zoneMines = { }
    local randomFlag
    
    zoneMines.gold = 2

    if race == Race.Human then
        zoneMines.lifeMana = 2
        randomFlag = math.random(0,3)
        if randomFlag == 0 then
	        zoneMines.runicMana = 1
        elseif randomFlag == 1 then
	        zoneMines.deathMana = 1
        elseif randomFlag == 2 then
	        zoneMines.groveMana = 1
        elseif randomFlag == 3 then
	        zoneMines.infernalMana = 1
        end
    elseif race == Race.Dwarf then
        zoneMines.runicMana = 2
        randomFlag = math.random(0,3)
        if randomFlag == 0 then
	        zoneMines.lifeMana = 1
        elseif randomFlag == 1 then
	        zoneMines.deathMana = 1
        elseif randomFlag == 2 then
	        zoneMines.groveMana = 1
        elseif randomFlag == 3 then
	        zoneMines.infernalMana = 1
        end
    elseif race == Race.Undead then
        zoneMines.deathMana = 2
        randomFlag = math.random(0,3)
        if randomFlag == 0 then
	        zoneMines.runicMana = 1
        elseif randomFlag == 1 then
	        zoneMines.lifeMana = 1
        elseif randomFlag == 2 then
	        zoneMines.groveMana = 1
        elseif randomFlag == 3 then
	        zoneMines.infernalMana = 1
        end
    elseif race == Race.Heretic then
        zoneMines.infernalMana = 2
        randomFlag = math.random(0,3)
        if randomFlag == 0 then
	        zoneMines.runicMana = 1
        elseif randomFlag == 1 then
	        zoneMines.deathMana = 1
        elseif randomFlag == 2 then
	        zoneMines.groveMana = 1
        elseif randomFlag == 3 then
	        zoneMines.lifeMana = 1
        end
    elseif race == Race.Elf then
        zoneMines.groveMana = 2
        randomFlag = math.random(0,3)
        if randomFlag == 0 then
	        zoneMines.runicMana = 1
        elseif randomFlag == 1 then
	        zoneMines.deathMana = 1
        elseif randomFlag == 2 then
	        zoneMines.lifeMana = 1
        elseif randomFlag == 3 then
	        zoneMines.infernalMana = 1
        end
    end
    
    return zoneMines
end

----------
-- mines in the buffer zone
function getBufferZoneMinesLeft(race)
    local sizeCoef = 1
    local zoneMines = { }
    
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

function getBufferZoneMinesRight(race)
    local sizeCoef = 1
    local zoneMines = { }

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

function getPlayerSubRace(race)
	if race == Race.Human then return Subrace.Human
	elseif race == Race.Dwarf then return Subrace.Dwarf
	elseif race == Race.Undead then return Subrace.Undead
	elseif race == Race.Heretic then return Subrace.Heretic
	elseif race == Race.Elf then return Subrace.Elf
	end
end

function getStartingZone(zoneId, playerRace, zoneSize)
    local empire = {'g000ss0002', 'g000ss0004', 'g000ss0003'}
    local undead = {'g000ss0064', 'g000ss0065', 'g000ss0062'}
    local legions = {'g000ss0044', 'g000ss0043', 'g000ss0045'}
    local dwarves = {'g000ss0024', 'g000ss0023', 'g000ss0021'}
    local elves = {'g000ss0102', 'g000ss0101', 'g000ss0106'}

    local startingSpells = {'g000ss0177'} --откровение

    if playerRace == Race.Human then
        table.insert(startingSpells, empire[math.random(1, #empire)])
    elseif playerRace == Race.Dwarf then
        table.insert(startingSpells, dwarves[math.random(1, #dwarves)])
    elseif playerRace == Race.Heretic then
        table.insert(startingSpells, legions[math.random(1, #legions)])
    elseif playerRace == Race.Undead then
        table.insert(startingSpells, undead[math.random(1, #undead)])
    elseif playerRace == Race.Elf then
        table.insert(startingSpells, elves[math.random(1, #elves)])
    end

    local startingItems = {
        {id = 'g001ig0180', min = 3, max = 3},
        {id = 'g000ig0005', min = 3, max = 3},
        {id = 'g000ig0006', min = 4, max = 4},
        {id = 'g000ig0001', min = 3, max = 3},
        {id = 'g001ig0072', min = 1, max = 1},
        {id = 'g001ig0454', min = 1, max = 1},
        {id = 'g000ig5084', min = 2, max = 2},
        {id = 'g001ig0532', min = 2, max = 2},
        {id = 'g000ig0002', min = 1, max = 1},
        {id = 'g000ig0008', min = 2, max = 2},
        {id = 'g000ig0021', min = 1, max = 1},
        {id = 'g000ig0022', min = 1, max = 1},
        {id = 'g000ig0023', min = 1, max = 1},
        {id = 'g000ig0024', min = 1, max = 1},
        {id = 'g001ig0036', min = 1, max = 1},
        {id = 'g001ig0407', min = 1, max = 1},
        {id = 'g001ig0486', min = 2, max = 2},
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
    
    local zoneStacks = {
            getStack(0, 3, { }, { }),
            getStack(1, 2, { Item.Valuable }, { min = 150, max = 750 }),
            getStack(1, 2, { Item.Scroll }, { min = 200, max = 400 }),
            getStack(1, 2, { Item.PotionBoost, Item.PotionHeal }, { min = 150, max = 200 }),
            getStack(1, 2, { Item.PotionBoost }, { min = 150, max = 200 }),
            getStack(2, 2, { Item.Valuable, Item.PotionBoost }, { min = 200, max = 500 }),
            getStack(2, 2, { Item.Orb, Item.Valuable }, { min = 150, max = 450 }),
            {count=1, value={min=530,max=610}, subraceTypes=subraceRandomizer(2), loot={itemTypes={Item.TravelItem},value={min=500,max=500},itemValue={min=300,max=500},items={{id='g000ig7004',min=1,max=1},{id='g000ig0001',min=1,max=1}}}},
            {count=1, value={min=530,max=610}, subraceTypes=subraceRandomizer(2), loot={itemTypes={Item.Orb},value={min=600,max=800},itemValue={min=300,max=600},items={{id='g000ig7004',min=1,max=1},{id='g000ig0001',min=1,max=1},{id='g000ig0006',min=1,max=1}}}},
        }

    local zoneBags = {
            count = 9,
            loot = {
                itemTypes = { Item.Valuable, Item.PotionHeal, Item.Scroll, Item.Orb },
                value = { min = 1000, max = 1300 },
                items = {
                    { id = 'g000ig0001', min = 2, max = 2 },
                    { id = 'g001ig0378', min = 1, max = 2 },
                    { id = 'g000ig5007', min = 1, max = 1 },
                    { id = 'g000ig0008', min = 2, max = 2 },
                    { id = 'g001ig0482', min = 0, max = 1 },
                    { id = 'g001ig0481', min = 0, max = 1 },
                    { id = 'g001ig0485', min = 0, max = 1 },
                    { id = 'g001ig0148', min = 0, max = 1 },
                    { id = 'g001ig0484', min = 0, max = 1 },
                    { id = 'g000ig0014', min = 1, max = 2 },
                    { id = 'g000ig0009', min = 1, max = 2 },
                    { id = 'g000ig0011', min = 1, max = 2 },
                    { id = 'g000ig0002', min = 1, max = 2 },

                },
                itemValue = { min = 50, max = 200}
            }
        }

    local zoneRuins = {
            getRuins(1, { min = 340, max = 400 }, getGuard(1, { }, subraceRandomizer(1)), rewardGenerator('ruins', 'startJewel')),
            getRuins(1, { min = 340, max = 400 }, getGuard(1, { }, subraceRandomizer(1)), rewardGenerator('ruins', 'startPermanent')),
            getRuins(2, { min = 430, max = 510 }, getGuard(2, { }, subraceRandomizer(1)), rewardGenerator('ruins', 'startArtifact'))
        }

    return {
		id = zoneId,
		type = Zone.PlayerStart,
		race = playerRace,
		size = zoneSize,

        capital = {            
            garrison = {
                subraceTypes = { getPlayerSubRace(playerRace) },
                value = { min = 50, max = 50 },
                loot = {
                    items = startingItems
                }
            },
            spells = startingSpells,
        },

        mines = getStartingMines(playerRace),

        stacks = zoneStacks,

        ruins = zoneRuins,

        bags = zoneBags,
        
        merchants = {
            {
                goods = {
                    items = rewardGenerator('merchant', 'T1'),
                },
                guard = getGuard(2, rewardGenerator('guard', 'merchGuardT2'), subraceRandomizer(1))   
            },
        },
        
        towns = {
            getNeutralTown(1, rewardGenerator('town', 'startT1'), getGuard(1, rewardGenerator('guard', 'townT1'), subraceRandomizer(1))),
            getNeutralTown(2, rewardGenerator('town', 'startT2'), getGuard(2, rewardGenerator('guard', 'townT2'), subraceRandomizer(1)))
        },

        mages = {
            getMageTower(1, getGuard(2, rewardGenerator('guard', 'merchGuardT2'), subraceRandomizer(1)))
        },
    }
end

function getBufferZone(zoneId, playerRace, zoneSize)
    local zoneMines = { }

    if zoneId == 1 or zoneId == 3 then
        zoneMines = getBufferZoneMinesLeft(playerRace)
    elseif zoneId == 5 or zoneId == 7 then
        zoneMines = getBufferZoneMinesRight(playerRace)
    end

    -- local zoneMerchants = {}
    -- if zoneId == 1 or zoneId == 5 then
    --     zoneMerchants = {
    --         {
    --             goods = {
    --                 items = rewardGenerator('merchant', 'buffer'),
    --             },
    --             guard = getGuard(2, rewardGenerator('guard', 'merchGuardT2'), subraceRandomizer(1))
    --         },
    --     }
    -- end

    -- local zoneMarkets = {}
    -- if zoneId == 3 or zoneId == 7 then
    --     zoneMarkets = {
    --     {
    --         stock = {
    --             {resource = Resource.Gold, value = { min = 3000, max = 3000 }},
    --             {resource = Resource.LifeMana, value = { min = 1000, max = 1000 }},
    --             {resource = Resource.DeathMana, value = { min = 1000, max = 1000 }},
    --             {resource = Resource.InfernalMana, value = { min = 1000, max = 1000 }},
    --             {resource = Resource.RunicMana, value = { min = 1000, max = 1000 }},
    --             {resource = Resource.GroveMana, value = { min = 1000, max = 1000 }}
    --         },
    --         guard = getGuard(2, rewardGenerator('guard', 'merchGuardT2'), subraceRandomizer(1))
    --     }
    -- }
    -- end


    local zoneStacks = {
        getStack(2, 2, { Item.PotionBoost }, { min = 150, max = 200 }),
        getStack(4, 1, { Item.PotionPermanent }, { min = 250, max = 600 }),
        getStack(3, 2, { Item.PotionHeal, Item.PotionBoost }, { min = 50, max = 350 }),
        getStack(3, 2, { Item.Valuable, Item.Orb }, { min = 250, max = 750 }),
        getStack(2, 2, { Item.Scroll }, { min = 150, max = 400 }),
        {count=1, value={min=600,max=640}, subraceTypes=subraceRandomizer(3), loot={items={{id='g001ig0516',min=1,max=1},{id='g000ig0001',min=1,max=1}}}},
    }

    local zoneRuins = {
            getRuins(3, { min = 500, max = 570 }, getGuard(3, { }, subraceRandomizer(1)), rewardGenerator('ruins', 'bufferArtifactJewel')),
            getRuins(2, { min = 410, max = 490 }, getGuard(3, { }, subraceRandomizer(1)), rewardGenerator('ruins', 'bufferBanner')),
        }

    local zoneBags = {           
            count = 6,
            loot = {
                itemTypes = { Item.Valuable, Item.PotionHeal, Item.PotionBoost, Item.Scroll },
                value = { min = 900, max = 1200 },
                items = {
                    { id = 'g000ig0001', min = 1, max = 2 },
                    { id = 'g001ig0482', min = 1, max = 1 },
                    { id = 'g001ig0481', min = 1, max = 1 },
                    { id = 'g001ig0485', min = 1, max = 1 },
                    { id = 'g001ig0148', min = 1, max = 1 },
                    { id = 'g001ig0484', min = 1, max = 1 },
                },
                itemValue = { min = 150, max = 350}
            }
        }

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
                guard = getGuard(2, rewardGenerator('guard', 'merchGuardT2'), subraceRandomizer(1))
            },
        },

        towns = {
            getNeutralTown(3, rewardGenerator('town', 'bufferT3'), getGuard(3, rewardGenerator('guard', 'townT3'), subraceRandomizer(2)))
        }
	}
end

function getTreasureZone(zoneId, zoneSize)
    local zoneStacks = {
            getStack(2, 2, { Item.PotionBoost, Item.Scroll }, { min = 150, max = 550 }),
            getStack(3, 2, { Item.Valuable }, { min = 250, max = 1000 }),
            getStack(3, 2, { Item.Scroll }, { min = 150, max = 550 }),
            getStack(4, 2, { Item.PotionBoost }, { min = 200, max = 700 }),
            getStack(4, 2, { Item.Valuable }, { min = 500, max = 1000 }),
            getStack(4, 2, { Item.Scroll }, { min = 400, max = 700 }),
            getStack(4, 2, { Item.Wand, Item.Talisman }, { min = 400, max = 700}),
            getStack(5, 1, { Item.PotionBoost, Item.Scroll }, { min = 450, max = 700 }),
            getStack(5, 1, { Item.PotionPermanent }, { min = 600, max = 1000 }),
        }

    local zoneRuins = {
            getRuins(4, { min = 350, max = 380 }, getGuard(4, { }, subraceRandomizer(2)), rewardGenerator('ruins', 'centerArtifactT4')),
            getRuins(3, { min = 400, max = 500 }, getGuard(4, { }, subraceRandomizer(2)), rewardGenerator('ruins', 'centerThief')),
            getRuins(4, { min = 350, max = 380 }, getGuard(5, { }, subraceRandomizer(2)), rewardGenerator('ruins', 'centerJewelT4')),
            getRuins(5, { min = 350, max = 450 }, getGuard(6, { }, subraceRandomizer(GO)), rewardGenerator('ruins', 'centerControl')),
            getRuins(5, { min = 350, max = 450 }, getGuard(5, { }, subraceRandomizer(2)), rewardGenerator('ruins', 'centerBannerT4')),
        }

    local zoneBags = {
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

    local zoneTowns = {
            getNeutralTown(5, rewardGenerator('town', 'centerT5'), getGuard(5, rewardGenerator('guard', 'townT5'), subraceRandomizer(GO))),
            getNeutralTown(3, rewardGenerator('town', 'centerT3'), getGuard(3, rewardGenerator('guard', 'townT3Center'), subraceRandomizer(2))),
            --getNeutralTown(3, rewardGenerator('town', 'centerT3'), getGuard(3, rewardGenerator('guard', 'townT3Center'), subraceRandomizer(2))),
        }

    local zoneMerchants = {
            {
                goods = {
                    items = rewardGenerator('merchant', 'T3-1'),
                },
                guard = getGuard(4, rewardGenerator('guard', 'merchGuardT4'), subraceRandomizer(2))           
            },
            {
                goods = {
                    items = rewardGenerator('merchant', 'T3-2'),
                },
                guard = getGuard(4, rewardGenerator('guard', 'merchGuardT4'), subraceRandomizer(2))           
            },
        }

    return {
		id = zoneId,
		type = Zone.Treasure,
		size = zoneSize,

        towns = zoneTowns,

        mines = {
            gold = 2,
            lifeMana = 1,
            runicMana = 1,
            deathMana = 1,
            infernalMana = 1,
            groveMana = 1
        },

        mages = {
            getMageTower(2, getGuard(3, rewardGenerator('guard', 'merchGuardT3'), subraceRandomizer(2))),
            getMageTower(3, getGuard(4, rewardGenerator('guard', 'merchGuardT4'), subraceRandomizer(2)))
        },

        merchants = zoneMerchants,

        ruins = zoneRuins,

        stacks = zoneStacks,

        bags = zoneBags,
    }
end

function getBigZone(zoneId, zoneSize)
    local zoneStacks = {
            getStack(2, 2, { Item.Valuable, Item.Scroll }, { min = 150, max = 500 }),
            getStack(3, 2, { Item.PotionBoost }, { min = 150, max = 525 }),
            getStack(3, 2, { Item.Orb }, { min = 400, max = 700}),
            getStack(3, 2, { Item.Scroll, Item.PotionBoost }, { min = 200, max = 525 }),
            getStack(4, 2, { Item.Valuable }, { min = 450, max = 1000 }),
            getStack(4, 2, { Item.PotionHeal }, { min = 350, max = 500 }),
            getStack(4, 2, { Item.Wand, Item.Scroll }, { min = 550, max = 700 }),
            getStack(5, 2, { Item.PotionBoost, Item.Scroll }, { min = 550, max = 700 }),
            getStack(5, 1, { Item.PotionPermanent }, { min = 600, max = 1000 }),
        }

    local zoneRuins = {
            getRuins(4, { min = 350, max = 380 }, getGuard(4, { }, subraceRandomizer(2)), rewardGenerator('ruins', 'bigMana')),
            getRuins(4, { min = 350, max = 380 }, getGuard(4, { }, subraceRandomizer(2)), rewardGenerator('ruins', 'bigArtifact')),
            getRuins(4, { min = 350, max = 450 }, getGuard(4, { }, subraceRandomizer(2)), rewardGenerator('ruins', 'bigJewel')),
            getRuins(5, { min = 350, max = 450 }, getGuard(6, { }, subraceRandomizer(GO)), rewardGenerator('ruins', 'bigControl')),
        }

    local zoneBags = {
            count = 8,
            loot = {
                itemTypes = { Item.Valuable, Item.PotionHeal, Item.PotionBoost, Item.Scroll },
                value = { min = 1600, max = 1900 },
                items = {
                    { id = 'g000ig0001', min = 1, max = 2 },
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

    local zoneTowns = {
            getNeutralTown(4, rewardGenerator('town', 'bigT4'), getGuard(4, rewardGenerator('guard', 'townT4'), subraceRandomizer(GO))),
            getNeutralTown(2, rewardGenerator('town', 'bigT2'), getGuard(2, rewardGenerator('guard', 'townT2'), subraceRandomizer(2))),
        }

    local zoneMerchants = {
            {
                goods = {
                    items = rewardGenerator('merchant', 'T2'),
                },
                guard = getGuard(3, rewardGenerator('guard', 'merchGuardT3'), subraceRandomizer(2)) 
            }
        }

    local zoneOthers = { }

    if zoneId == bigZone0Id then
        zoneOthers[1] = { getMercenary(getGuard(3, rewardGenerator('guard', 'otherGuard')), subraceRandomizer(2)) }
        zoneOthers[2] = { }
    elseif zoneId == bigZone4Id then
        zoneOthers[1] = { }
        zoneOthers[2] = { { guard = getGuard(3, rewardGenerator('guard', 'otherGuard'), subraceRandomizer(2)) } }
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

        resourceMarkets = {
            {
                stock = {
                    {resource = Resource.Gold, value = { min = 3000, max = 3000 }},
                    {resource = Resource.LifeMana, value = { min = 1000, max = 1000 }},
                    {resource = Resource.DeathMana, value = { min = 1000, max = 1000 }},
                    {resource = Resource.InfernalMana, value = { min = 1000, max = 1000 }},
                    {resource = Resource.RunicMana, value = { min = 1000, max = 1000 }},
                    {resource = Resource.GroveMana, value = { min = 1000, max = 1000 }}
                },
                guard = getGuard(2, rewardGenerator('guard', 'merchGuardT2'), subraceRandomizer(1))
            }
        },

        mages = {
            getMageTower(2, getGuard(3, rewardGenerator('guard', 'merchGuardT3'), subraceRandomizer(2)))
        },
    }
end

function getConnections()

    local connections = {
            { from = startZone2Id, to = bufferZone1Id, guard = getGuard(3, rewardGenerator('guard', 'guardStartBuffer'), {Subrace.Elf, Subrace.NeutralElf, Subrace.NeutralMarsh}) },
            { from = startZone2Id, to = bufferZone3Id, guard = getGuard(3, rewardGenerator('guard', 'guardStartBuffer'), {Subrace.NeutralBarbarian, Subrace.Dwarf}) },
            { from = startZone2Id, to = treasureZone8Id, guard = getGuard(6, rewardGenerator('guard', 'guardStartTreasure'), subraceRandomizer(GO)) },
            
            { from = startZone6Id, to = bufferZone5Id, guard = getGuard(3, rewardGenerator('guard', 'guardStartBuffer'), {Subrace.NeutralBarbarian, Subrace.Dwarf}) },
            { from = startZone6Id, to = bufferZone7Id, guard = getGuard(3, rewardGenerator('guard', 'guardStartBuffer'), {Subrace.Elf, Subrace.NeutralElf, Subrace.NeutralMarsh}) },
            { from = startZone6Id, to = treasureZone8Id, guard = getGuard(6, rewardGenerator('guard', 'guardStartTreasure'), subraceRandomizer(GO)) },
    
            { from = bufferZone1Id, to = bigZone0Id, guard = getGuard(4, rewardGenerator('guard', 'guardBufferBig'), subraceRandomizer(2)) },
            { from = bufferZone7Id, to = bigZone0Id, guard = getGuard(4, rewardGenerator('guard', 'guardBufferBig'), subraceRandomizer(2)) },
    
            { from = bufferZone3Id, to = bigZone4Id, guard = getGuard(4, rewardGenerator('guard', 'guardBufferBig'), subraceRandomizer(2)) },
            { from = bufferZone5Id, to = bigZone4Id, guard = getGuard(4, rewardGenerator('guard', 'guardBufferBig'), subraceRandomizer(2)) },
    
            { from = bigZone0Id, to = treasureZone8Id, guard = getGuard(5, rewardGenerator('guard', 'guardBigTreasure'), subraceRandomizer(GO)) },
            { from = bigZone4Id, to = treasureZone8Id, guard = getGuard(5, rewardGenerator('guard', 'guardBigTreasure'), subraceRandomizer(GO)) },
    
            { from = bufferZone1Id, to = treasureZone8Id, guard = getGuard(6, rewardGenerator('guard', 'guardBufferTreasure'), subraceRandomizer(GO)) },
            { from = bufferZone3Id, to = treasureZone8Id, guard = getGuard(6, rewardGenerator('guard', 'guardBufferTreasure'), subraceRandomizer(GO)) },
            { from = bufferZone5Id, to = treasureZone8Id, guard = getGuard(6, rewardGenerator('guard', 'guardBufferTreasure'), subraceRandomizer(GO)) },
            { from = bufferZone7Id, to = treasureZone8Id, guard = getGuard(6, rewardGenerator('guard', 'guardBufferTreasure'), subraceRandomizer(GO)) },
            
        }

	return connections
end

function getTemplateContents(races)
	return {
		zones = getZones(races),
		connections = getConnections()
	}
end

template = {
    name = getName(TemplateName, Verison),
    description = getDescription(TemplateName, Verison, Timer),
    minSize = 72,
    maxSize = 72,
    maxPlayers = 2,
    roads = 50,
    forest = 25,
    startingGold = 1100,
    startingNativeMana = 200,
    getContents = getTemplateContents,
    forbiddenSpells = {
        'g000ss0027', --мореплавание
        'g000ss0095', --сумерки
        'g000ss0083', --свет дня
        'g000ss0092', --terra illudere
        'g000ss0087', --ветер путешествий
    },
    forbiddenItems = {
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
        --
        'g001ig0534', --change source
        -- 'g001ig0596', --Линарет
        'g001ig0349', --защита от вампиризма
        'g001ig0339', --защита от превращения
        'g001ig0333', --иммунитет к имитации
        'g001ig0347', --защита от понижения
        'g001ig0353', --защита от разрушения
        'g001ig0345', --защита от ослабления
        'g001ig0560', --зелье провокатора
        'g001ig0294', --сфера бальзамирования
        'g001ig0296', --сфера жестокости
        'g000ig9043', --сфера ярости
        'g000ig9039', --сфера ужаса
        'g001ig0062', --сфера теней
        'g001ig0441', --сфера проклятого дара
        'g000ig5031', --valk
        'g000ig5071', --koshmar
        'g000ig5108', --ent big
        'g001ig0076',
        'g001ig0075',
        'g001ig0074', 
        'g001ig0077',
        'g001ig0078',
        'g000ig5100', 
        'g000ig5006',
        'g000ig5063',
        'g001ig0073',
        'g001ig0194',
        'g000ig5085',
        'g001ig0574',
        'g001ig0573',
        'g001ig0117',
        'g000ig5009',
        'g000ig5078',
        'g000ig5117',
        'g000ig5038',
        'g000ig5058',
        'g000ig5030',
        'g001ig0095', --rod
        'g001ig0103', --rod
        --scrolls damage t3 and higher
        'g000ig5060',
        'g000ig5054',
        'g000ig5090',
        'g000ig5019',
        'g000ig5109',
        'g000ig5033',
        'g000ig5037',
        'g000ig5014',
        'g000ig5072',
        'g000ig5086',
        'g000ig5080',
        'g000ig5112',
        'g000ig5077',
        'g000ig5093',
        'g000ig5105',
        'g000ig5081',


    },
    forbiddenUnits = {
        --фракционные призыватели
        'g001uu8238',
        'g000uu8238',
        'g000uu8185',
        'g000uu8191',
        'g001uu7598',
        'g000uu7598',
        'g000uu0164',
        --повелительница стихий
        'g000uu8205',
        'g000uu8206',
        --summons that can spawn in capital
        'g001uu0101',
        'g001uu0049',
        'g000uu8036',
        --support leaders
        'g000uu8133',
        'g000uu7528',
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
        'g070uu9002', -- демиург
        'g000uu8238', -- демиург
        'g000uu8185', -- магистр стихий
        'g070uu9001', -- магистр стихий
        'g000uu8191', -- магистр стихий

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
    },
}