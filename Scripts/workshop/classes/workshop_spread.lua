
require('mRnd')

function Workshop_Spread_Gen(variantsNumber, luckDegree)
	if luckDegree <= 0 then
		return 1
	elseif luckDegree >= 200 then
		return variantsNumber
	end
	local int_x1 = {}
	local int_x2 = {}
	local dx = 100 / variantsNumber
	int_x1[1] = 0
	int_x2[1] = dx
	for i=2, variantsNumber do
		int_x1[i] = int_x2[i - 1]
		int_x2[i] = int_x1[i] + dx
	end
	local w = Workshop_Spread_Weight(luckDegree, variantsNumber, int_x1, int_x2, dx)
	return Workshop_Spread_Select(variantsNumber, w)
end

function Workshop_Spread_Weight(luckDegree, arrayLen, int_x1, int_x2, dx)
	-- local x1 = 0
        local y1 = Workshop_Spread_Y1(luckDegree)
        
	local x2 = 0.5 * luckDegree
        local y2 = 100 - math.abs(100 - luckDegree)
        
        -- local x3 = 100
        local y3 = Workshop_Spread_Y3(luckDegree)
	
	local slope1 = (y2 - y1)/(x2)
	local slope2 = (y3 - y2)/(100 - x2)
	
	local dx_h = 0.5 * dx
	
	-- log('x1 y1 x2 y2 x3 y3')
	-- log('0 '..y1..' '..x2..' '..y2..' 100 '..y3)
	
	local v1 = {}
	local v2 = {}
	v1[1] = y1
	for i=2, arrayLen do
		if int_x1[i] <= x2 then
			-- local v = y1 + x * slope1
			v1[i] = y1 + int_x1[i] * slope1
		else
			-- local v = y2 + ( x - x2 ) * slope2
			v1[i] = y2 + ( int_x1[i] - x2 ) * slope2
		end
		v2[i - 1] = v1[i]
	end
	v2[arrayLen] = y3
	
	local w = {}
	for i=1, arrayLen do
		if int_x2[i] <= x2 or int_x1[i] >= x2 then
			-- w[i] = 0.5 * dx * ( v1 + v2 )
			w[i] = dx_h * ( v1[i] + v2[i] )
		else
			-- w[i] = 0.5 * dx1 * ( v11 + v12 ) + 0.5 * dx2 * ( v21 + v22 )
			w[i] = 0.5 * ( ( x2 - int_x1[i] ) * ( v1[i] + y2 ) 
			             + ( int_x2[i] - x2 ) * ( y2 + v2[i] ) )
		end
		-- log('w[i] '..w[i])
	end
	return w
end

function Workshop_Spread_Select(arrayLen, w)
	local wSum = 0
	for i=1, arrayLen do
		wSum = wSum + w[i]
	end
	if wSum == 0 then
		for i=1, arrayLen do
			w[i] = 1
		end
		wSum = arrayLen
	end
	wSum = 1 / wSum
	for i=1, arrayLen do
		w[i] = ( w[i] * wSum ) * 10000000000
	end
	wSum = 0
	for i=1, arrayLen do
		wSum = wSum + w[i]
	end
	wSum = math.ceil(wSum)
	
	local r = _mRnd_RndNum(wSum) - 1
	local t = 0
	for i=1, arrayLen do
		t = t + w[i]
		if t >= r then
			return i
		end
	end
	return arrayLen
end

local delta_x = 25.000
local delta_y = 15.000

function Workshop_Spread_Y1(p)
	if p < 100 then
	    return 100 + 2 * (100 - p) * ((100 - p) / (p + 0.5)) ^ 0.9
	elseif p > 100 + delta_x then
	    return (200 - p) * delta_y / (100 - delta_x)
	elseif p > 100 then
	    return 100 - (p - 100) * (100 - delta_y) / delta_x
	else
	    return 100
	end
end

function Workshop_Spread_Y3(p)
	if p < 100 - delta_x then
	    return delta_y - (delta_y - p * delta_y / (100 - delta_x))
	elseif p < 100 then
	    return delta_y + ((p - (100 - delta_x)) * (100 - delta_y) / delta_x)
	elseif p > 100 then
	    return 100 + 2 * (p - 100) * ((p - 100) / (200 - p + 0.5)) ^ 0.9
	else
	    return 100
	end
end


-- for k=1,39 do
--	log(5.0 * k..' '..Workshop_Spread_Y1(5.0 * k)..' '..Workshop_Spread_Y3(5.0 * k))
-- end

-- Workshop_Spread_Gen(3, 80)

