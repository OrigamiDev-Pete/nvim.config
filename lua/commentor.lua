string.startsWith = function(self, str)
	return self:find('^' .. str) ~= nil
end

local function comment()
	local filetype = vim.bo.filetype
	local line = vim.api.nvim_get_current_line()
	local comment = '// '
	if (filetype == 'lua') then
		comment = '-- '
	elseif (filetype == 'vim') then
		comment = '" '
	end
		if (line:startsWith(comment) == false) then
			vim.cmd('s/^/' .. comment)
		end
	vim.cmd('nohl')
end

return {
	comment = comment
}
