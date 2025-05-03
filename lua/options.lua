-- Tab
vim.opt.tabstop = 4	-- 1 TAB = 4 visual space
vim.opt.shiftwidth= 4	-- insert 4 spaces on a TAB

-- UI config
vim.opt.number = true -- show line number
vim.api.nvim_set_hl(0, "LineNr", { ctermfg = "yellow" }) -- yellow line number
vim.api.nvim_set_hl(0, 'Identifier', { ctermfg = 3 })  -- Identifier => gold
vim.api.nvim_set_hl(0, "TabLineSel", { ctermfg = 0, ctermbg = 15, bold = true }) -- Tab => black bg, white fg


-- Cursor style
vim.opt.guicursor = table.concat({
	"n-v-c:block",	-- Normal
	"i-ci-ve:ver25", -- Insert
	"r-crl:hor20",	-- Replace
}, ",") -- cursor style for different mode

vim.api.nvim_create_autocmd("InsertEnter", {
	pattern = "*",
	callback = function()
		vim.opt.cursorline = true
	end,
}) -- insert mode: turn on highlight line

vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	callback = function()
		vim.opt.cursorline = false
	end,
}) -- normal mode: turn off highlight line

vim.api.nvim_set_hl(0, "CursorLine", {
	ctermbg = "darkgrey",
	bg = "darkgrey",
}) -- highlight line style

-----------------------
-- Plugin option ------
-----------------------
-- Update refresh time
vim.opt.updatetime = 100

-- Icon color
vim.api.nvim_set_hl(0, 'GitGutterAdd', { ctermfg = 2, fg = '#00FF00' })
vim.api.nvim_set_hl(0, 'GitGutterDelete', { ctermfg = 1, fg = '#FF0000' })
vim.api.nvim_set_hl(0, 'GitGutterChange', { ctermfg = 3, fg = '#FFFF00' })

