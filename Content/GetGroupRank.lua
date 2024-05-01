-- Get or check a player's group rank easily

return function(Player: Player, GroupId: number, Rank: number?, Syntax: string?)
	assert(typeof(Player) == 'Instance', 'Player argument is not an instance')
	assert(typeof(GroupId) == 'number', 'GroupId argument is not a number')
	
	local GetRank = Player:GetRankInGroup(GroupId)
	if Syntax == '==' or (Rank and not Syntax) then
		return GetRank == Rank
	elseif Syntax == '>=' then
		return GetRank >= Rank
	elseif Syntax == '<=' then
		return GetRank <= Rank
	elseif Syntax == '>' then
		return GetRank > Rank
	elseif Syntax == '<' then
		return GetRank < Rank
	elseif Syntax == nil then
		return GetRank
	else
		error('Invalid syntax argument (==, >=, <=, >, <)')
	end
end
