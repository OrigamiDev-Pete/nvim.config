local config = require'nrunner.config'

local M = {}

M.locate_runner = function ()
	local root_dir = config.options.root_dir
	for _, v in ipairs(config.options.default_runner_files) do
		if vim.fn.filereadable(root_dir..'\\'..v) ~= 0 then
			return root_dir..'\\'..v
		end
	end
	if config.options.use_vscode_files then
		if vim.fn.filereadable(root_dir..'\\.vscode\\launch.json') then
			return root_dir..'\\.vscode\\launch.json'
		end
	end
end

M.get_run_options = function (path)
	if vim.endswith(path, '.lua') then
		-- config.run_options = require(path)
		local f = loadfile(path)
		config.run_options = f()
	else
		local file = vim.fn.readfile(path)
		config.run_options = vim.fn.json_decode(file)
	end
end

M.get_run_options_vs = function (path)
	local file = vim.fn.readfile(path)
	local uncommented_file = {} -- remove // comments from json
	for index, value in ipairs(file) do
		if vim.fn.match(value, '//') == -1 then
			table.insert(uncommented_file, value)
		end
	end
	vs_data = vim.fn.json_decode(uncommented_file)
	P(vs_data)
	print(vs_data.configurations[1].program)
end

M.generate_runner = function ()
	
end

return M
