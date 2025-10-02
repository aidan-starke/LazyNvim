-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Close NeoTree when opening a file
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    local filetype = vim.bo.filetype
    -- Only close NeoTree if we're entering a normal file buffer
    if filetype ~= "neo-tree" and filetype ~= "" and vim.bo.buftype == "" then
      pcall(function()
        require("neo-tree.command").execute({ action = "close" })
      end)
    end
  end,
})

-- Disable semantic tokens for C#
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == "omnisharp" then
      client.server_capabilities.semanticTokensProvider = nil
    end
  end,
})
