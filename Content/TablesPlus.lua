--[[
	An experimental module I made to remove some annoying limitations tables have.
	
	Just require this module and call it on a table you wish to "improve":
		local myTable = {}
		require(TablesPlus)(myTable)
		
	Here's a list of features:
		* Can call the table to find indexes of specific values:
			local myTable = {
				SomeKey = 'SomeValue'
			}
			require(TablesPlus)(myTable)
			print(myTable('SomeValue')) -> 'SomeKey'
		* You can now get the length of dictionaries using #
		* Useful functions:
			find(value) - Find first index of value
			remove(value) - Remove first content with value
			removeAll(value) - Remove all contents with specific value
]]

-- Meta functions
local meta = {
	__len = function(t) -- count the length of a table even if it's a dictionary
		local c = 0
		for i,v in t do
			c += 1
		end
		return c
	end,
	__call = function(t, val) -- find the first index for a certain value "val"
		local index
		for i,v in t do
			if v == val then
				index = i
				break
			end
		end
		return index
	end,
}

-- Functions
function meta:find(val) -- can also be used to find indexes by their values
	return self(val)
end

function meta:remove(val) -- remove something from the table using value
	for i,v in self do
		if v == val then
			self[i] = nil
			break
		end
	end
end

function meta:removeAll(val) -- same as remove but does not stop upon 1 removal
	for i,v in self do
		if v == val then
			self[i] = nil
		end
	end
end

-- Main
return function(t: {})
	return setmetatable(t, meta)
end
