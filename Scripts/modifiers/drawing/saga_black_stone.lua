

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getNameTxt(unit, prev)
	local id = unit.baseImpl.id
	if id == Id.new("g000uu8263") then
		-- mahhalat
		return Id.new("x012tg1146")
	elseif id == Id.new("g000uu8261") or id == Id.new("g001uu8261") then
		-- suna lich
		return Id.new("x012tg1147")
	elseif id == Id.new("g000uu0161") then
		-- suna alchemist
		return Id.new("x012tg1147")
	elseif id == Id.new("g000uu7050") or id == Id.new("g001uu0050") then
		-- hild
		return Id.new("x012tg1148")
	elseif id == Id.new("g000uu6106") or id == Id.new("g000uu6006") then
		-- yara
		return Id.new("x012tg1158")
	elseif id == Id.new("g000uu0154") or id == Id.new("g000uu5354") then
		-- balduin
		return Id.new("x012tg1159")
	elseif id == Id.new("g000uu7540") or id == Id.new("g000uu8316") then
		-- kuyak
		return Id.new("x012tg1160")
	elseif id == Id.new("g000uu8166") or id == Id.new("g000uu8167") then
		-- lecal golem
		return Id.new("x012tg1161")
	elseif id == Id.new("g000uu6105") or id == Id.new("g000uu6005") then
		-- munin
		return Id.new("x012tg1162")
	end
	return prev
end

function getDescTxt(unit, prev)
	local id = unit.baseImpl.id
	if id == Id.new("g000uu8263") then
		-- mahhalat
		return Id.new("x012tg1138")
	elseif id == Id.new("g000uu8261") or id == Id.new("g001uu8261") then
		-- suna lich
		return Id.new("x012tg1142")
	elseif id == Id.new("g000uu0161") then
		-- suna alchemist
		return Id.new("x012tg1141")
	elseif id == Id.new("g000uu7050") or id == Id.new("g001uu0050") then
		-- hild
		return Id.new("x012tg1144")
	elseif id == Id.new("g000uu6106") or id == Id.new("g000uu6006") then
		-- yara
		return Id.new("x012tg1137")
	elseif id == Id.new("g000uu0154") or id == Id.new("g000uu5354") then
		-- balduin
		return Id.new("x012tg1139")
	elseif id == Id.new("g000uu7540") or id == Id.new("g000uu8316") then
		-- kuyak
		return Id.new("x012tg1145")
	elseif id == Id.new("g000uu8166") or id == Id.new("g000uu8167") then
		-- lecal golem
		return Id.new("x012tg1143")
	elseif id == Id.new("g000uu6105") or id == Id.new("g000uu6005") then
		-- munin
		return Id.new("x012tg1140")
	end
	return prev
end
