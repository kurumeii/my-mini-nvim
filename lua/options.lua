local opts = vim.o
local g = vim.g
g.mapleader = ' '
g.maplocalleader = ' '
opts.shell = "pwsh.exe"
opts.shellcmdflag =
"-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
-- opts.number = false
opts.relativenumber = true
opts.smartcase = true
opts.ignorecase = true
opts.breakindent = true
opts.splitright = true
opts.splitbelow = true
opts.cmdheight = 1
opts.wrap = true
opts.tabstop = 2
opts.shiftwidth = 2
opts.cursorline = true
opts.termguicolors = true
opts.confirm = true
opts.foldcolumn = '0'
opts.foldlevelstart = 99
opts.foldenable = true
g.clipboard = {
	copy = {
		["+"] = "win32yank.exe -i --crlf",
		["*"] = "win32yank.exe -i --crlf",
    },
	paste = {
		["+"] = "win32yank.exe -o --crlf",
		["*"] = "win32yank.exe -o --crlf",
	},
}

vim.schedule(function ()
	opts.clipboard = "unnamedplus"
end)
