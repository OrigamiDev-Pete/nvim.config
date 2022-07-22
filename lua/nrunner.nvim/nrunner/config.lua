local M = {}

local default_run_commands = {
	cSharp     = 'dotnet run',
	java       = 'java %',
	javaScript = 'node %',
	html       = '%',
	lua        = 'lua %',
	odin       = 'odin run .',
	python     = 'python %',
	typeScript = 'node %',
	zig        = 'zig build run',
}

local set_default_command_from_filetype = function ()
	local filetype = vim.bo.filetype
	if filetype then
		return default_run_commands[filetype]
	end
end


local defaults = {
	default_runner_files = { 'nrun.json', 'nrun.lua', 'nrunner.json', 'nrunner.lua' },
	runner_path = nil,
	use_vscode_files = true,
	use_keymaps = true,
	root_dir = vim.fn.getcwd(),
	generate_default_run_command = true,
}

M.options = {}
M.run_options = {
	command = nil,
	terminal = 'float',
}

M.setup = function (opts)
	M.options = vim.tbl_deep_extend("force", {}, defaults, opts or {})
	if M.options.generate_default_run_command then
		M.run_options.command = set_default_command_from_filetype()
	end
	return M
end

M.setup()

return M
