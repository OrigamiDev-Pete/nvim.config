local util = require'nrunner.util'

local M = {}

M.setup = function (opts)
	local config = require'nrunner.config'.setup(opts)
	if config.options.runner_path then
		if vim.fn.filereadable(vim.fn.expand(config.options.runner_path)) ~= 0 then
			util.get_run_options(config.options.runner_path)
		else
			print('Could not find '..config.options.runner_path)
		end
	else
		-- try locating nrunner file
		local nrunner_file = util.locate_runner()
		if nrunner_file then
			util.get_run_options(nrunner_file)
		else
			print('NRunner file could not be found.')
			-- TODO(Pete): auto generate nrunner_file
			-- util.generate_runner()
		end
	end
end


M.run = function (args)
	local config = require'nrunner.config'
	if config.options.run_options.command == nil then
		print('No command found.\nSet the [command] field in the setup() opts.')
		return
	end

	local run_command = '!'..config.options.run_options.command
	if args then
		run_command = run_command..' '..args
	end

	if config.options.run_options.terminal == 'float' then
		vim.api.nvim_command(run_command)
	else
		local buf = vim.api.nvim_create_buf(false, false)
		local window = vim.api.nvim_open_win(buf, true, { relative = 'win', width = 100, height = 100, row=3, col=3 })
		vim.api.nvim_open_term(buf, {})
		vim.api.chan_send(window, run_command)
	end
end


M.setup({ runner_path  = '.\\.vscode\\launch.json'})
M.run()

M.build = function ()

end

return M
