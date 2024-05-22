
local _setValue_ImmunityClassIsDecreased = {}
for sourceClass = 0, 8 do
	_setValue_ImmunityClassIsDecreased[sourceClass] = {}
end

local _setValue_ImmunityDecreasedClass = {}
_setValue_ImmunityDecreasedClass[Immune.NotImmune] = Immune.NotImmune
_setValue_ImmunityDecreasedClass[Immune.Once] = Immune.NotImmune
_setValue_ImmunityDecreasedClass[Immune.Always] = Immune.Once

local _setValue_attackSourceVulnerability = {}
function svSetAttackSourceVulnerability(unit, source, value)
	_setValue_ImmunityClassIsDecreased[source][unit.id.value] = value
	return 0
end

function svSourceImmunityClass(unit, source, prevImmunityClass, newImmunityClass)
	if _setValue_ImmunityClassIsDecreased[source][unit.id.value] then
		return math.max(prevImmunityClass, _setValue_ImmunityDecreasedClass[newImmunityClass])
	else
		return math.max(prevImmunityClass, newImmunityClass)
	end
end

function svAttackImmunityClass(unit, attack, prevImmunityClass, newImmunityClass)
	return math.max(prevImmunityClass, newImmunityClass)
end
