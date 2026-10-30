-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.loader.enable()

vim.opt.guicursor = ""
vim.opt.termguicolors = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 15
vim.opt.smartindent = true

vim.opt.numberwidth = 3
vim.opt.statuscolumn = "%=%{v:virtnum < 1 ? (v:relnum ? v:relnum : v:lnum < 10 ? v:lnum . '  ' : v:lnum) : ''}%=%s"

vim.opt.wrap = true

vim.g.mapleader = " "

vim.opt.clipboard:append({ "unnamedplus" })

-- Over SSH there's no local clipboard tool, so yank via OSC 52 to the client terminal.
-- Paste reads the unnamed register: OSC 52 reads hang or prompt in most terminals.
if vim.env.SSH_TTY then
  local osc52 = require("vim.ui.clipboard.osc52")
  local function paste()
    return { vim.fn.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
  end
  vim.g.clipboard = {
    name = "OSC 52",
    copy = { ["+"] = osc52.copy("+"), ["*"] = osc52.copy("*") },
    paste = { ["+"] = paste, ["*"] = paste },
  }
end

vim.opt.updatetime = 50

vim.opt.wildmenu = true
vim.opt.wildmode = { "longest", "full", "full" }

vim.o.swapfile = false

vim.g.lazyvim_prettier_needs_config = false
