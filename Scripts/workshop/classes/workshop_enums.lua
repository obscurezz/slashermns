-- ¬ ›“ŒÃ ‘¿…À≈ Õ»◊≈√Œ “–Œ√¿“‹ Õ≈ Õ”∆ÕŒ
-- ÒÏÓÚË ‚ workshop_commonlib.lua

require('GroupInfo')

GroupLeaderType          = {}
GroupLeaderType.Any      = 0
GroupLeaderType.Nobody   = 1
GroupLeaderType.Fighter  = 2
GroupLeaderType.Explorer = 3
GroupLeaderType.Mage     = 4
GroupLeaderType.Rod      = 5
GroupLeaderType.Noble    = 6
GroupLeaderType.Summon   = 7
GroupLeaderType.Illusion = 8
GroupLeaderType.Guardian = 9

GroupLeaderTypeArray = {GroupLeaderType.Any,
			GroupLeaderType.Nobody,
			GroupLeaderType.Fighter,
			GroupLeaderType.Explorer,
			GroupLeaderType.Mage,
			GroupLeaderType.Rod,
			GroupLeaderType.Noble,
			GroupLeaderType.Summon,
			GroupLeaderType.Illusion,
			GroupLeaderType.Guardian}

function WorkshopEnum_getGroupLeaderType(group, owner, ownerType)
	if ownerType == 1 or group == nil then
		local leader = _GroupInfo_getGroupLeader(group)
		if leader == nil then
			if owner == nil then
				return nil
			end
			leader = owner.leader
			if leader == nil then
				return nil
			end
		end
		local leaderImpl = leader.baseImpl
		local utype = leaderImpl.type
		local ltype = leaderImpl.leaderType
		if utype == Unit.Summon then
			return GroupLeaderType.Summon
		elseif utype ==	Unit.Illusion then
			return GroupLeaderType.Illusion
		elseif ltype == Leader.Fighter then
			return GroupLeaderType.Fighter
		elseif ltype == Leader.Explorer then
			return GroupLeaderType.Explorer
		elseif ltype == Leader.Mage then
			return GroupLeaderType.Mage
		elseif ltype == Leader.Rod then
			return GroupLeaderType.Rod
		elseif ltype == Leader.Noble then
			return GroupLeaderType.Noble
		else
			return nil
		end
	elseif ownerType == 2 then
		local units = group.units
		for i = 1, #units do
			if units[i].baseImpl.type == Unit.Guardian then
				return GroupLeaderType.Guardian
			end
		end
		return GroupLeaderType.Nobody
	elseif ownerType == 3 then
		return GroupLeaderType.Nobody
	else
		return nil
	end
end

---------------------------------

SpreadMode = {}
SpreadMode.NoSpread  = 0
SpreadMode.Smooth    = 1
SpreadMode.MinMax    = 2
SpreadMode.MinMidMax = 3

---------------------------------

RangeRestriction = {}
RangeRestriction.NoRestriction           = 0
RangeRestriction.NearestLine             = 1
RangeRestriction.NearestLineIfSecondLine = 2



