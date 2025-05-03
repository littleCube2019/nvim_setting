require("nvim-treesitter.configs").setup({
	-- Supported Language: https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
	ensure_installed = { "lua", "javascript", "typescript", "html", "css", "json", "cpp" },
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
})

-- folding
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
-- default no folding
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.wo.foldlevel = 99
