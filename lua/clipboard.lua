-- set to system clipboard
vim.o.clipboard = "unnamedplus"

-- disable paste, use <C+S+v> to paste in windows terminal
-- test terminal support OSC 52: echo -e "\e]52;c;Y29waWVkLXRleHQ=\a"
local function paste()
	return {
		vim.fn.split(vim.fn.getreg(""), "\n"),
		vim.fn.getregtype(""),
	}
end

-- OSC 52 to copy to system clipboard, and disable paste
vim.g.clipboard = {
	name = "OSC 52",
	copy = {
		["+"] = require("vim.ui.clipboard.osc52").copy("+"),
		["*"] = require("vim.ui.clipboard.osc52").copy("*"),
	},
	paste = {
		["+"] = paste,  
		["*"] = paste, 
	},
}

if vim.env.TMUX ~= nil then
	local copy = {'tmux', 'load-buffer', '-w', '-'}
	local paste = {'bash', '-c', 'tmux refresh-client -l && sleep 0.05 && tmux save-buffer -'}
	vim.g.clipboard = {
		name = 'tmux',
		copy = {
			['+'] = copy,
			['*'] = copy,
		},
		paste = {
			['+'] = paste,
			['*'] = paste,
		},
		cache_enabled = 0,
	}
end
