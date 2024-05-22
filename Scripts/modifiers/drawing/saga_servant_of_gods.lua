

function getModifierDisplay(unit, prev)
	return prev
end

function getModifierDescTxt(unit, prev)
	return prev
end

function getNameTxt(unit, prev)
	local id = unit.baseImpl.id
	if id == Id.new("g000uu5012") or id == Id.new("g000uu5112") then
		-- orc-bagatur
		return Id.new("x012tg1265")
	end
	return prev
end

function getDescTxt(unit, prev)
	local id = unit.baseImpl.id
	if id == Id.new("g000uu5012") or id == Id.new("g000uu5112") then
		-- orc-bagatur
		return Id.new("x012tg1266")
	end
	return prev
end
