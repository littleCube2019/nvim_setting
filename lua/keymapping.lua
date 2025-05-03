-- Usage
-- mode, orikey, newKey, option
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Disable direction
map('n', '<Up>',    '<C-w><Up>', opts)
map('n', '<Down>',  '<C-w><Down>', opts)
map('n', '<Left>',  '<C-w><Left>', opts)
map('n', '<Right>', '<C-w><Right>', opts)

-- Fzf hot key
map("n", "<C-f>", ":Rg<CR>", opts)
map("n", "<C-p>", ":Files<CR>", opts)
map("n", "<C-h>", ":History<CR>", opts)

------------------------
-- <F-x> key
-- F2: toggle highlight search
-- F3: git blame
-- F4: appending space
------------------------
-- <F2> => Toggle highlight search
local function toggle_hlsearch()
	if vim.opt.hlsearch:get() == true then
		vim.opt.hlsearch = false
	else
		vim.opt.hlsearch = true
	end
end
map("n", "<F2>", toggle_hlsearch, opts)

-- <F3> => Git blame
map("n", "<F3>", ":Git blame<CR>", opts)

map("n", "aa", function()
  vim.cmd([[echo "g, grep l, log s, show"]])
end, opts) -- show 

map("n", "as", function()
  local word = vim.fn.expand("<cword>")
  vim.cmd("Git show " .. word)
end, opts)

map("n", "al", function()
  local cWORD = vim.fn.expand("<cWORD>")
  local gitFile = string.gsub(cWORD, "^[^/]*/", "")
  vim.cmd("Git log -p -- " .. gitFile)
end, opts)

map("n", "ag", function()
  local word = vim.fn.expand("<cword>")
  vim.cmd("Git log --grep=" .. word)
end, opts)

-- <F4> => Detect appending whitespace
local extra_whitespace_highlighted = false

local function toggle_extra_whitespace()
  if extra_whitespace_highlighted then
    vim.cmd("highlight ExtraWhitespace NONE")
    vim.cmd("match none")
    extra_whitespace_highlighted = false
  else
    vim.api.nvim_set_hl(0, "ExtraWhitespace", { ctermbg = "red", bg = "red" })
    vim.cmd([[match ExtraWhitespace /\s\+$/]])
    extra_whitespace_highlighted = true
  end
end

map("n", "<F4>", toggle_extra_whitespace, opts)

-- map 8 => *
map("n", "8", "*", opts)

