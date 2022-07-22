local config = require'nrunner.config'
local util = require'nrunner.util'

local M = {}

M.setup = function () 
	C = vim.api.nvim_create_user_command
	C('NRun', M.run, {nargs='?'})
	C('NRunBuild', M.build, {nargs='?'})
	C('NRunSetRunner', M.set_runner, {nargs=1, complete='file'})

	if config.options.use_keymaps then
		K = vim.keymap.set
		K('n', '<F5>', M.run, {remap = true})
		K('n', '<F6>', M.build, {remap = true})
	end
end

M.run = function (args)
	if config.run_options.command == nil then
		print('No command found.\nCreate an Nrunner file with a command field.')
		return
	end

	local run_command = '!'..config.run_options.command
	if args then
		if args.args then
			run_command = run_command..' '..args.args
		end
	end

	if config.run_options.terminal == 'float' then
		vim.api.nvim_command(run_command)
	else
		local buf = vim.api.nvim_create_buf(false, false)
		local window = vim.api.nvim_open_win(buf, true, { relative = 'win', width = 100, height = 100, row=3, col=3 })
		vim.api.nvim_open_term(buf, {})
		vim.api.chan_send(window, run_command)
	end
end

M.build = function ()

end

M.set_runner = function (args)
	config.nrunner_file = args.args
	util.get_run_options(args.args)
	P(config)
end

return M
