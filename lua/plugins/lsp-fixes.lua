return {
  -- Don't let language servers attach to non-file buffers (diffview://, fugitive://, ...).
  -- gopls rejects those URIs with: -32700 JSON RPC parse error: DocumentURI scheme is not 'file'
  --
  -- Neovim's own guard (vim/lsp.lua lsp_enable_callback) only checks `buftype`, and diffview
  -- leaves buftype = "" on staged-file buffers (vcs/file.lua:269) while naming them
  -- diffview://..., so they look like real files and the server attaches.
  {
    "neovim/nvim-lspconfig",
    opts = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp_no_virtual_buffers", { clear = true }),
        callback = function(args)
          local name = vim.api.nvim_buf_get_name(args.buf)
          local scheme = name:match("^([%w+.-]+)://")
          if scheme and scheme ~= "file" then
            vim.schedule(function()
              if vim.api.nvim_buf_is_valid(args.buf) then
                vim.lsp.buf_detach_client(args.buf, args.data.client_id)
              end
            end)
          end
        end,
      })
    end,
  },
}
