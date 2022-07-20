local M = {}

local defaults = {
	default_runner_files = { 'nrun.json', 'nrun.lua', 'nrunner.json', 'nrunner.lua' },
	use_vscode_files = true,
	root_dir = vim.fn.getcwd()
}

M.options = {}

M.setup = function (opts)
	M.options = vim.tbl_deep_extend("force", {}, defaults, opts or {})
	return M
end

M.setup()

return M
