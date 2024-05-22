function getMercenary()
    local heal_buff = {
        { id = 'g000uu0160', level = 4, unique = true },
        { id = 'g000uu0035', level = 3, unique = true },
        { id = 'g000uu2022', level = 1, unique = true },
        { id = 'g000uu7544', level = 1, unique = true },
        { id = 'g000uu0161', level = 3, unique = true },
        { id = 'g000uu8220', level = 1, unique = true },
        { id = 'g000uu7557', level = 4, unique = true },
        { id = 'g000uu0017', level = 3, unique = true },
        { id = 'g000uu5006', level = 1, unique = true },
        { id = 'g000uu8213', level = 1, unique = true },
        { id = 'g000uu8265', level = 1, unique = true },
        { id = 'g003uu8039', level = 3, unique = true },
        { id = 'g000uu8214', level = 4, unique = true },
        { id = 'g000uu8266', level = 1, unique = true },
        { id = 'g000uu7570', level = 4, unique = true },
        { id = 'g000uu0012', level = 2, unique = true },
        { id = 'g001uu8262', level = 1, unique = true },
        { id = 'g000uu8264', level = 1, unique = true },
        { id = 'g000uu7569', level = 3, unique = true },
        { id = 'g001uu7614', level = 1, unique = true },
        { id = 'g000uu8033', level = 3, unique = true },
        { id = 'g000uu0016', level = 2, unique = true },
        { id = 'g000uu2006', level = 1, unique = true },
        { id = 'g000uu8032', level = 2, unique = true },
        { id = 'g000uu0150', level = 4, unique = true },
        { id = 'g000uu0151', level = 4, unique = true },
        { id = 'g000uu0013', level = 3, unique = true },
        { id = 'g003uu8037', level = 2, unique = true },
        { id = 'g000uu8235', level = 5, unique = true },
        { id = 'g000uu7619', level = 1, unique = true },
        { id = 'g000uu8034', level = 4, unique = true },
        { id = 'g000uu2002', level = 4, unique = true },
        { id = 'g000uu8263', level = 1, unique = true },
        { id = 'g000uu2008', level = 4, unique = true },
        { id = 'g000uu7558', level = 3, unique = true },
        { id = 'g000uu2007', level = 3, unique = true },
        { id = 'g000uu0034', level = 2, unique = true },
        { id = 'g000uu7605', level = 1, unique = true },
        { id = 'g001uu7592', level = 1, unique = true },
        { id = 'g000uu7559', level = 4, unique = true },
    }
    
    local big = {
        { id = 'g001uu8272', level = 3, unique = true },
        { id = 'g000uu7572', level = 2, unique = true },
        { id = 'g000uu8194', level = 5, unique = true },
        { id = 'g000uu5037', level = 1, unique = true },
        { id = 'g000uu8192', level = 4, unique = true },
        { id = 'g000uu5038', level = 1, unique = true },
        { id = 'g000uu0180', level = 4, unique = true },
        { id = 'g000uu0169', level = 5, unique = true },
        { id = 'g000uu5036', level = 1, unique = true },
        { id = 'g001uu8281', level = 1, unique = true },
        { id = 'g000uu2001', level = 5, unique = true },
        { id = 'g000uu8029', level = 1, unique = true },
        { id = 'g000uu0058', level = 2, unique = true },
        { id = 'g000uu0170', level = 5, unique = true },
        { id = 'g000uu0181', level = 4, unique = true },
        { id = 'g000uu0094', level = 2, unique = true },
        { id = 'g000uu0095', level = 3, unique = true },
        { id = 'g000uu8155', level = 5, unique = true },
        { id = 'g000uu7583', level = 2, unique = true },
        { id = 'g000uu0043', level = 1, unique = true },
        { id = 'g000uu8224', level = 3, unique = true },
        { id = 'g000uu5027', level = 1, unique = true },
        { id = 'g001uu7621', level = 1, unique = true },
        { id = 'g001uu7551', level = 1, unique = true },
        { id = 'g001uu7586', level = 1, unique = true },
        { id = 'g000uu0032', level = 3, unique = true },
        { id = 'g000uu5015', level = 1, unique = true },
        { id = 'g000uu0069', level = 1, unique = true },
        { id = 'g000uu0056', level = 2, unique = true },
        { id = 'g000uu0158', level = 4, unique = true },
        { id = 'g000uu5010', level = 1, unique = true },
        { id = 'g001uu8271', level = 1, unique = true },
        { id = 'g000uu0167', level = 3, unique = true },
        { id = 'g001uu7622', level = 1, unique = true },
        { id = 'g001uu8280', level = 1, unique = true },
        { id = 'g000uu0031', level = 3, unique = true },
        { id = 'g000uu0061', level = 4, unique = true },
        { id = 'g000uu8212', level = 3, unique = true },
        { id = 'g000uu7595', level = 2, unique = true },
        { id = 'g000uu7577', level = 2, unique = true },
        { id = 'g000uu8225', level = 4, unique = true },
        { id = 'g000uu0159', level = 4, unique = true },
        { id = 'g000uu0060', level = 4, unique = true },
        { id = 'g000uu0168', level = 5, unique = true },
        { id = 'g000uu0018', level = 1, unique = true },
        { id = 'g001uu8309', level = 1, unique = true },
        { id = 'g000uu5016', level = 1, unique = true },
        { id = 'g000uu8047', level = 1, unique = true },
        { id = 'g001uu7574', level = 3, unique = true },
        { id = 'g001uu7573', level = 3, unique = true },
        { id = 'g000uu5035', level = 1, unique = true },
        { id = 'g001uu7548', level = 1, unique = true },
        { id = 'g000uu8229', level = 1, unique = true },
    }
    
    local melee = {
        { id = 'g003uu5030', level = 1, unique = true },
        { id = 'g001uu7550', level = 1, unique = true },
        { id = 'g003uu5002', level = 2, unique = true },
        { id = 'g000uu0014', level = 4, unique = true },
        { id = 'g000uu6108', level = 1, unique = true },
        { id = 'g001uu7571', level = 2, unique = true },
        { id = 'g000uu0053', level = 2, unique = true },
        { id = 'g000uu2016', level = 4, unique = true },
        { id = 'g000uu7629', level = 1, unique = true },
        { id = 'g001uu7547', level = 1, unique = true },
        { id = 'g000uu5040', level = 1, unique = true },
        { id = 'g004uu6120', level = 1, unique = true },
        { id = 'g000uu0157', level = 4, unique = true },
        { id = 'g000uu0038', level = 3, unique = true },
        { id = 'g000uu5032', level = 1, unique = true },
        { id = 'g000uu0166', level = 4, unique = true },
        { id = 'g000uu0037', level = 2, unique = true },
        { id = 'g000uu0179', level = 5, unique = true },
        { id = 'g000uu5039', level = 1, unique = true },
        { id = 'g001uu7563', level = 2, unique = true },
        { id = 'g000uu5031', level = 1, unique = true },
        { id = 'g003uu5031', level = 1, unique = true },
        { id = 'g000uu8199', level = 1, unique = true },
        { id = 'g000uu0190', level = 1, unique = true },
        { id = 'g000uu6121', level = 1, unique = true },
        { id = 'g000uu8153', level = 1, unique = true },
        { id = 'g000uu0015', level = 4, unique = true },
        { id = 'g003uu6108', level = 4, unique = true },
        { id = 'g000uu0087', level = 2, unique = true },
        { id = 'g000uu7628', level = 1, unique = true },
        { id = 'g000uu0003', level = 3, unique = true },
        { id = 'g000uu0005', level = 3, unique = true },
        { id = 'g000uu8254', level = 4, unique = true },
        { id = 'g000uu7540', level = 4, unique = true },
        { id = 'g000uu7608', level = 1, unique = true },
        { id = 'g000uu2010', level = 4, unique = true },
        { id = 'g001uu7560', level = 1, unique = true },
        { id = 'g001uu8313', level = 5, unique = true },
        { id = 'g000uu7609', level = 1, unique = true },
        { id = 'g001uu7579', level = 3, unique = true },
        { id = 'g000uu8017', level = 3, unique = true },
        { id = 'g000uu8015', level = 2, unique = true },
        { id = 'g000uu8016', level = 2, unique = true },
        { id = 'g000uu5011', level = 1, unique = true },
        { id = 'g000uu7578', level = 4, unique = true },
        { id = 'g001uu8314', level = 4, unique = true },
        { id = 'g000uu2009', level = 3, unique = true },
        { id = 'g000uu8233', level = 5, unique = true },
        { id = 'g000uu0165', level = 5, unique = true },
        { id = 'g000uu5003', level = 1, unique = true },
        { id = 'g000uu7610', level = 1, unique = true },
        { id = 'g000uu5005', level = 1, unique = true },
        { id = 'g000uu0091', level = 3, unique = true },
        { id = 'g000uu0155', level = 5, unique = true },
        { id = 'g000uu2013', level = 4, unique = true },
        { id = 'g000uu7604', level = 1, unique = true },
        { id = 'g000uu7603', level = 1, unique = true },
        { id = 'g000uu0092', level = 1, unique = true },
        { id = 'g001uu7613', level = 1, unique = true },
        { id = 'g000uu5013', level = 1, unique = true },
        { id = 'g000uu5012', level = 1, unique = true },
        { id = 'g001uu7546', level = 1, unique = true },
        { id = 'g003uu5012', level = 3, unique = true },
        { id = 'g000uu2014', level = 2, unique = true },
        { id = 'g000uu7589', level = 1, unique = true },
        { id = 'g000uu7588', level = 1, unique = true },
        { id = 'g000uu0004', level = 2, unique = true },
        { id = 'g000uu0156', level = 5, unique = true },
        { id = 'g000uu2029', level = 2, unique = true },
        { id = 'g000uu2030', level = 3, unique = true },
        { id = 'g000uu2031', level = 4, unique = true },
        { id = 'g000uu8276', level = 1, unique = true },
        { id = 'g003uu0023', level = 1, unique = true },
        { id = 'g000uu6106', level = 1, unique = true },
        { id = 'g001uu8284', level = 1, unique = true },
        { id = 'g000uu8247', level = 1, unique = true },
        { id = 'g003uu5003', level = 3, unique = true },
        { id = 'g000uu0002', level = 2, unique = true },
        { id = 'g001uu7545', level = 1, unique = true },
        { id = 'g001uu7543', level = 4, unique = true },
        { id = 'g000uu0088', level = 3, unique = true },
        { id = 'g000uu0089', level = 4, unique = true },
        { id = 'g004uu5039', level = 1, unique = true },
        { id = 'g001uu7602', level = 1, unique = true },
        { id = 'g000uu0040', level = 4, unique = true },
        { id = 'g000uu7611', level = 1, unique = true },
        { id = 'g000uu2015', level = 3, unique = true },
        { id = 'g000uu0090', level = 2, unique = true },
        { id = 'g000uu8041', level = 1, unique = true },
        { id = 'g000uu5028', level = 1, unique = true },
        { id = 'g000uu5033', level = 1, unique = true },
        { id = 'g000uu8277', level = 1, unique = true },
        { id = 'g000uu2017', level = 5, unique = true },
        { id = 'g000uu8151', level = 1, unique = true },
        { id = 'g003uu5014', level = 4, unique = true },
        { id = 'g000uu5014', level = 1, unique = true },
        { id = 'g001uu7564', level = 2, unique = true },
        { id = 'g003uu8050', level = 5, unique = true },
        { id = 'g000uu2011', level = 4, unique = true },
        { id = 'g003uu5013', level = 2, unique = true },
        { id = 'g000uu0054', level = 3, unique = true },
        { id = 'g000uu8207', level = 5, unique = true },
        { id = 'g000uu7607', level = 1, unique = true },
        { id = 'g001uu8279', level = 1, unique = true },
        { id = 'g001uu7565', level = 2, unique = true },
        { id = 'g000uu8306', level = 1, unique = true },
        { id = 'g000uu0039', level = 5, unique = true },
        { id = 'g000uu5024', level = 1, unique = true },
    }

    local archer = {
        { id = 'g000uu0027', level = 2, unique = true },
        { id = 'g000uu8311', level = 3, unique = true },
        { id = 'g000uu0154', level = 3, unique = true },
        { id = 'g000uu8021', level = 3, unique = true },
        { id = 'g000uu7562', level = 3, unique = true },
        { id = 'g000uu8174', level = 1, unique = true },
        { id = 'g000uu8175', level = 1, unique = true },
        { id = 'g004uu8005', level = 2, unique = true },
        { id = 'g000uu7561', level = 2, unique = true },
        { id = 'g000uu0162', level = 3, unique = true },
        { id = 'g001uu8239', level = 5, unique = true },
        { id = 'g000uu0085', level = 3, unique = true },
        { id = 'g001uu8312', level = 4, unique = true },
        { id = 'g001uu7594', level = 1, unique = true },
        { id = 'g000uu0065', level = 4, unique = true },
        { id = 'g000uu2004', level = 4, unique = true },
        { id = 'g000uu5007', level = 1, unique = true },
        { id = 'g000uu2012', level = 3, unique = true },
        { id = 'g001uu7612', level = 1, unique = true },
        { id = 'g000uu8052', level = 5, unique = true },
        { id = 'g000uu2019', level = 5, unique = true },
        { id = 'g000uu8274', level = 1, unique = true },
        { id = 'g000uu2003', level = 3, unique = true },
        { id = 'g001uu7624', level = 1, unique = true },
        { id = 'g000uu8137', level = 1, unique = true },
        { id = 'g000uu8019', level = 2, unique = true },
        { id = 'g000uu7566', level = 1, unique = true },
        { id = 'g000uu7567', level = 1, unique = true },
        { id = 'g000uu8237', level = 1, unique = true },
        { id = 'g000uu0079', level = 2, unique = true },
        { id = 'g000uu8051', level = 4, unique = true },
        { id = 'g000uu0007', level = 2, unique = true },
        { id = 'g000uu8310', level = 2, unique = true },
        { id = 'g000uu0177', level = 4, unique = true },
        { id = 'g000uu7568', level = 3, unique = true },
        { id = 'g000uu8020', level = 3, unique = true },
        { id = 'g000uu8022', level = 2, unique = true },
        { id = 'g000uu8023', level = 3, unique = true },
        { id = 'g000uu0178', level = 4, unique = true },
        { id = 'g000uu8042', level = 1, unique = true },
        { id = 'g001uu8282', level = 1, unique = true },
        { id = 'g000uu0174', level = 3, unique = true },
        { id = 'g001uu7617', level = 1, unique = true },
        { id = 'g000uu8045', level = 1, unique = true },
        { id = 'g000uu8024', level = 3, unique = true },
        { id = 'g000uu7542', level = 2, unique = true },
        { id = 'g001uu8240', level = 4, unique = true },
        { id = 'g001uu8267', level = 3, unique = true },
        { id = 'g001uu8255', level = 1, unique = true },
        { id = 'g000uu9000', level = 4, unique = true },
        { id = 'g000uu8156', level = 5, unique = true },
        { id = 'g000uu7590', level = 1, unique = true },
    }

    local mage = {
        { id = 'g000uu0176', level = 5, unique = true },
        { id = 'g000uu8027', level = 3, unique = true },
        { id = 'g001uu8236', level = 5, unique = true },
        { id = 'g000uu0152', level = 4, unique = true },
        { id = 'g000uu0083', level = 4, unique = true },
        { id = 'g000uu0067', level = 2, unique = true },
        { id = 'g000uu0175', level = 5, unique = true },
        { id = 'g000uu8218', level = 1, unique = true },
        { id = 'g000uu0009', level = 2, unique = true },
        { id = 'g000uu8157', level = 1, unique = true },
        { id = 'g000uu5025', level = 1, unique = true },
        { id = 'g000uu0041', level = 3, unique = true },
        { id = 'g001uu8238', level = 5, unique = true },
        { id = 'g000uu0064', level = 3, unique = true },
        { id = 'g000uu8227', level = 3, unique = true },
        { id = 'g000uu8005', level = 1, unique = true },
        { id = 'g004uu6101', level = 2, unique = true },
        { id = 'g001uu8243', level = 5, unique = true },
        { id = 'g006uu1026', level = 1, unique = true },
        { id = 'g000uu8043', level = 1, unique = true },
        { id = 'g001uu7581', level = 3, unique = true },
        { id = 'g001uu8260', level = 1, unique = true },
        { id = 'g000uu0081', level = 2, unique = true },
        { id = 'g000uu0068', level = 3, unique = true },
        { id = 'g000uu8258', level = 4, unique = true },
        { id = 'g001uu8261', level = 1, unique = true },
        { id = 'g001uu7582', level = 4, unique = true },
        { id = 'g000uu0084', level = 4, unique = true },
        { id = 'g000uu0010', level = 3, unique = true },
        { id = 'g000uu8185', level = 4, unique = true },
        { id = 'g006uu1128', level = 3, unique = true },
        { id = 'g000uu8275', level = 1, unique = true },
        { id = 'g000uu2020', level = 4, unique = true },
        { id = 'g000uu0172', level = 5, unique = true },
        { id = 'g000uu0082', level = 3, unique = true },
        { id = 'g000uu0163', level = 4, unique = true },
        { id = 'g000uu0066', level = 4, unique = true },
        { id = 'g000uu0164', level = 4, unique = true },
        { id = 'g000uu5008', level = 1, unique = true },
        { id = 'g000uu0171', level = 1, unique = true },
        { id = 'g000uu0028', level = 1, unique = true },
        { id = 'g000uu5026', level = 1, unique = true },
        { id = 'g000uu7627', level = 1, unique = true },
        { id = 'g000uu8048', level = 1, unique = true },
        { id = 'g000uu0173', level = 4, unique = true },
        { id = 'g000uu0063', level = 2, unique = true },
        { id = 'g001uu7598', level = 3, unique = true },
        { id = 'g000uu8028', level = 3, unique = true },
        { id = 'g000uu0153', level = 3, unique = true },
        { id = 'g001uu8242', level = 4, unique = true },
        { id = 'g000uu8026', level = 2, unique = true },
        { id = 'g000uu8246', level = 1, unique = true },
    }

    local mercenaryUnits = { }

    for i = 1,2 do
        x = math.random(1, #heal_buff)
        table.insert(mercenaryUnits, heal_buff[x])
        table.remove(heal_buff, x)
    end

    for i = 1,2 do
        x = math.random(1, #big)
        table.insert(mercenaryUnits, big[x])
        table.remove(big, x)
    end

    for i = 1,2 do
        x = math.random(1, #melee)
        table.insert(mercenaryUnits, melee[x])
        table.remove(melee, x)
    end

    for i = 1,2 do
        x = math.random(1, #archer)
        table.insert(mercenaryUnits, archer[x])
        table.remove(archer, x)
    end

    for i = 1,2 do
        x = math.random(1, #mage)
        table.insert(mercenaryUnits, mage[x])
        table.remove(mage, x)
    end

    return {
        units = mercenaryUnits,
    }

end

function getClothesMerchant()
    local artifacts = { 'g001ig0603', 'g002ig0001', 'g001ig0657', 'g000ig2005', 'g001ig0582', 'g001ig0604', 'g001ig0124', 'g001ig0042', 'g001ig0612', 'g001ig0585', 'g001ig0046', 'g001ig0045', 'g001ig0592', 'g001ig0043', 'g000ig2003', 'g001ig0040', 'g001ig0558', 'g000ig2004', 'g001ig0557', 'g001ig0559', 'g001ig0047', 'g001ig0416', 'g000ig2001', 'g000ig2002', 'g001ig0060', 'g001ig0611', 'g001ig0041', 'g001ig0590', 'g001ig0589', 'g001ig0591', 'g001ig0594', 'g001ig0071', 'g001ig0179', 'g001ig0174', 'g000ig3001', 'g001ig0411', 'g001ig0410', 'g000ig3002', 'g000ig3017', 'g000ig3018', 'g000ig3019', 'g000ig3007', 'g001ig0102', 'g000ig3006', 'g000ig3021', 'g001ig0488', 'g000ig3003', 'g001ig0487', 'g001ig0413', 'g000ig3015', 'g001ig0412', 'g001ig0414', 'g001ig0173', 'g001ig0197', 'g000ig3016', 'g001ig0417', 'g001ig0415', 'g000ig3004', 'g001ig0196', 'g000ig9137', 'g000ig9035', 'g001ig0182', 'g001ig0100' }
    local banners = { 'g002ig0003', 'g001ig0293', 'g000ig1004', 'g001ig0362', 'g000ig1005', 'g001ig0153', 'g001ig0364', 'g000ig1016', 'g001ig0051', 'g001ig0361', 'g001ig0289', 'g000ig1001', 'g001ig0370', 'g001ig0375', 'g001ig0359', 'g001ig0357', 'g000ig1002', 'g001ig0363', 'g001ig0500', 'g001ig0358', 'g000ig1007', 'g000ig1006', 'g001ig0369', 'g000ig1003', 'g001ig0374', 'g001ig0052', 'g000ig1015', 'g000ig1008', 'g001ig0366', 'g001ig0292', 'g001ig0290', 'g001ig0360', 'g001ig0291' }
    local relics = { 'g001ig0426', 'g002ig0002', 'g001ig0602', 'g001ig0421', 'g001ig0420', 'g001ig0424', 'g001ig0104', 'g001ig0597', 'g000ig4002', 'g000ig4001', 'g000ig4003', 'g000ig4004', 'g001ig0605', 'g000ig4006', 'g001ig0428', 'g000ig7010', 'g000ig3005', 'g001ig0422', 'g001ig0423', 'g000ig4007', 'g001ig0427', 'g001ig0429', 'g001ig0610', 'g001ig0099', 'g001ig0116', 'g001ig0430', 'g001ig0539', 'g001ig0038', 'g000ig3020', 'g001ig0101', 'g001ig0156', 'g001ig0419', 'g001ig0037' }
    local travels = { 'g001ig0108', 'g001ig0115', 'g001ig0112', 'g001ig0110', 'g001ig0105', 'g001ig0111', 'g001ig0107', 'g001ig0109', 'g001ig0106', 'g001ig0114', 'g001ig0113' }
    local result = { }

    for i = 1, 5 do
        x = math.random(1, #artifacts)
        result[i] = { id = artifacts[x], min = 1, max = 1 }
        table.remove(artifacts, x)
    end

    for i = 6, 8 do
        x = math.random(1, #banners)
        result[i] = { id = banners[x], min = 1, max = 1 }
        table.remove(banners, x)
    end

    for i = 9, 11 do
        x = math.random(1, #relics)
        result[i] = { id = relics[x], min = 1, max = 1 }
        table.remove(relics, x)
    end

    for i = 12, 14 do
        x = math.random(1, #travels)
        result[i] = { id = travels[x], min = 1, max = 1 }
        table.remove(travels, x)
    end
        
    return result

end

function getMagicMerchant()
    local orbs = {'g001ig0157', 'g001ig0133', 'g000ig9017', 'g001ig0189', 'g001ig0178', 'g001ig0472', 'g000ig9031', 'g001ig0471', 'g001ig0470', 'g001ig0192', 'g001ig0464', 'g001ig0473', 'g000ig9022', 'g001ig0450', 'g000ig9033', 'g001ig0302', 'g001ig0458', 'g001ig0443', 'g001ig0176', 'g001ig0187', 'g001ig0304', 'g001ig0467', 'g001ig0191', 'g000ig9024', 'g001ig0461', 'g001ig0300', 'g001ig0496', 'g000ig9042', 'g001ig0475', 'g001ig0468', 'g001ig0478', 'g001ig0469', 'g001ig0454', 'g001ig0456', 'g000ig9018', 'g001ig0479', 'g001ig0453', 'g001ig0474', 'g001ig0134', 'g000ig9020', 'g000ig9028', 'g001ig0462', 'g000ig9025', 'g001ig0136', 'g000ig9021', 'g000ig9016', 'g001ig0480', 'g001ig0303', 'g001ig0459', 'g000ig9014', 'g001ig0203', 'g001ig0466', 'g001ig0183', 'g001ig0455', 'g001ig0489', 'g000ig9027', 'g001ig0131', 'g000ig9032'}
    local talismans = {'g000ig9120', 'g000ig9140', 'g001ig0184', 'g001ig0267', 'g001ig0265', 'g001ig0266', 'g001ig0264', 'g000ig9101', 'g000ig9105', 'g000ig9131', 'g000ig9130', 'g000ig9128', 'g000ig9123', 'g000ig9109', 'g001ig0259', 'g001ig0063', 'g000ig9116', 'g000ig9136', 'g001ig0185', 'g001ig0202', 'g000ig9103'}
    local result = { }

    for i = 1, 7 do
        x = math.random(1, #orbs)
        result[i] = { id = orbs[x], min = 1, max = 1 }
        table.remove(orbs, x)
    end

    for i = 8, 12 do
        x = math.random(1, #talismans)
        result[i] = { id = talismans[x], min = 1, max = 1 }
        table.remove(talismans, x)
    end

    return result
end

function getPotionMerhant()
    local potions = { 'g000ig0014', 'g000ig0009', 'g000ig0008', 'g000ig0011', 'g000ig0002', 'g001ig0355', 'g001ig0547', 'g001ig0560' }
    local result = { }

    for i = 1, 12 do
        result[i] = { id = potions[math.random(#potions)], min = 1, max = 1 }
    end

    return result
end


function getPlayerZone(zoneId, playerRace, zoneSize)

    return {
        id = zoneId,
        type = Zone.PlayerStart,
		race = playerRace,
        size = zoneSize,
        minDist = 144,
        blockDist = 144,

        capital = {
            garrison = {
                loot = {
                    items = {
                        { id = 'g000ig5032', min = 40, max = 40 },
                        { id = 'g001ig0282', min = 3, max = 3 },
                        { id = 'g001ig0090', min = 9, max = 9 },
                        { id = 'g001ig0534', min = 1, max = 1 },
                        { id = 'g001ig0531', min = 1, max = 1 },
                        { id = 'g001ig0533', min = 1, max = 1 },
                        { id = 'g001ig0513', min = 1, max = 1 },
                        { id = 'g000ig0018', min = 20, max = 20 },

                    }
                }
            },
        },

    }
end

function getFirstZone(zoneId, zoneSize)

    return {
        id = zoneId,
        type = Zone.Junction,
        size = zoneSize,

        stacks = zoneStacks,
      
        mages = {
            { 
                spellTypes = { Spell.Lower, Spell.Boost }, 
                spellLevel = { min = 1, max = 5 },
                value = { min = 8000, max = 8000 }
            },
        },

        merchants = {
            {
                goods = {
                    items = getClothesMerchant(),
                }
            },
            {
                goods = {
                    items = getMagicMerchant(),
                }
            },
            {
                goods = {
                    items = getPotionMerhant(),
                }
            },
        },

        mercenaries = {
            getMercenary(),
        },

        towns = {
            {
                tier = 5,
                garrison = {
                    value = { min = 40000, max = 50000 }
                },
                stack = {
                    value = { min = 40000, max = 50000 }
                }
            }
        },

    }
end

function getSecondZone(zoneId, zoneSize)
    local zoneRuins = { }

    for i = 1,5 do
        zoneRuins[i] = { 
            gold = { min = 700, max = 700 },
            guard = {
                subraceTypes = { Subrace.NeutralGreenSkin },
                value = { min = 8, max = 11 } 
            }
        }
    end

    return {
        id = zoneId,
        type = Zone.Treasure,
        size = zoneSize,        

        ruins = zoneRuins,

        towns = {
            {
                tier = 5,
                garrison = {
                    value = { min = 40000, max = 50000 }
                },
                stack = {
                    value = { min = 40000, max = 50000 }
                }
            }
        },

        trainers = {
            { }, { },
        },
    }
end

function getCenterZone(zoneId, zoneSize)
    return {
        id = zoneId,
        type = Zone.Treasure,
        size = zoneSize,
        border = Border.Water,

        mines = {
            gold = 3,
        }
    }
end

function getZones(races)
    local zones = { }

    zones[1] = getPlayerZone(0, races[1], 280)

    zones[2] = getSecondZone(1, 400)

    zones[3] = getFirstZone(2, 400)

    zones[4] = getPlayerZone(3, races[2], 280)   

    zones[5] = getSecondZone(4, 400)

    zones[6] = getFirstZone(5, 400)

    zones[7] = getCenterZone(6, 144)

    return zones
end

function getConnections()
    local connections = { }

    for i = 1,3 do
        connections[i] = { from = 0, to = 1 }
    end

    for i = 4,6 do
        connections[i] = { from = 1, to = 2 }
    end

    for i = 7,9 do
        connections[i] = { from = 3, to = 4 }
    end

    for i = 10,12 do
        connections[i] = { from = 4, to = 5 }
    end

    for i = 13,15 do
        connections[i] = { from = 5, to = 6 }
    end

    for i = 16,18 do
        connections[i] = { from = 2, to = 6 }
    end

    return connections
end

function getTemplateContents(races)
	return {
		zones = getZones(races),
		connections = getConnections()
	}
end

template = {
    name = 'Valhalla',
    description = 'Selling "Scrolls usage" potion, "+5 moves" potion, "+2 vision" potion, "Song of Speed" scrolls is not permitted. Building "Mage tower" and learning your own spells is not permitted. Building "Guild" and recruiting Thieves is not permitted. Learning "Merchant" skill is not permitted. You can levelup your hero or units in the first zone. You can buy anything in the second zone. You have to fight in the third zone. Timer is 600+30.',
    minSize = 48,
    maxSize = 48,
    maxPlayers = 2,
    roads = 100,
    forest = 25,
    startingGold = 900,
    startingNativeMana = 0,
    getContents = getTemplateContents,
    forbiddenSpells = {
        'g000ss0099',
        'g000ss0177',
        'g000ss0192',
        'g000ss0152',
        'g000ss0191',
        'g000ss0126',
        'g000ss0022',
        'g000ss0189',
        'g000ss0132',
        'g000ss0156',
        'g000ss0130',
        'g000ss0154',
        'g000ss0176',
        'g000ss0027',
        'g000ss0131',
        'g000ss0129',
        'g000ss0153',
        'g000ss0198',
        'g000ss0133',
        'g000ss0157',
        'g000ss0135',
        'g000ss0155',
        'g000ss0128',
        'g000ss0199',
        'g000ss0175',
        'g000ss0149',
        'g000ss0200',
        'g000ss0085',
        'g000ss0150',
        'g000ss0190',
        'g000ss0159',
        'g000ss0174',
        'g000ss0053',
        'g000ss0172',
        'g000ss0161',
        'g000ss0160',
        'g000ss0162',
        'g000ss0164',
        'g000ss0163',
        'g000ss0167',
        'g000ss0170',
        'g000ss0169',
        'g000ss0168',
        'g000ss0196',
        'g000ss0151',
        'g000ss0204',
        'g000ss0094',
        'g000ss0202',
        'g000ss0203',
        'g000ss0194',
        'g000ss0165',
        'g000ss0171',
        'g000ss0193',
        'g000ss0084',
        'g000ss0039',
        'g000ss0088',
        'g000ss0118',
        'g000ss0040',
        'g000ss0210',
        'g000ss0120',
        'g000ss0173',
        'g000ss0087',
        'g000ss0113',

        --resists
        'g000ss0180',
        'g000ss0005',
        'g000ss0001',
        'g000ss0010',
        'g000ss0016',
        'g000ss0011',
        'g000ss0018',
        'g000ss0079',
        'g000ss0182',

    },
    forbiddenItems = {
        'g000ig3022',
        'g001ig0596',
        'g000ig1011',
        'g001ig0050',
        'g000ig8004',
        'g001ig0606',
        'g000ig8003',
        'g000ig8005',
        'g000ig1010',
    }
}