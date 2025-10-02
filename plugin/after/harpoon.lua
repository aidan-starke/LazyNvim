local ok, harpoon = pcall(require, "harpoon")
if not ok then
  return
end

---@diagnostic disable-next-line: missing-fields
harpoon.setup({
  excluded_filetypes = { "harpoon", "NeoTree", "TelescopePrompt" },
  settings = {
    save_on_toggle = true,
    sync_on_ui_close = true,
  },
})

local harpoon_extensions = require("harpoon.extensions")
harpoon:extend(harpoon_extensions.builtins.highlight_current_file())

-- Custom extension to close NeoTree when navigating to files
harpoon:extend({
  UI_CREATE = function(cx) end,
  UI_SELECT = function(cx)
    -- Close NeoTree when selecting a file from harpoon
    pcall(function()
      require("neo-tree.command").execute({ action = "close" })
    end)
  end,
  NAVIGATE = function(cx)
    -- Close NeoTree when navigating to files via next/prev
    pcall(function()
      require("neo-tree.command").execute({ action = "close" })
    end)
  end,
})

local set_keymaps, nnoremap = require("setup.helpers").set_keymaps, require("setup.keymap").nnoremap

set_keymaps(nnoremap, {
  {
    "<leader>hx",
    function()
      harpoon:list():add()
    end,
  },
  {
    "<leader>hm",
    function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end,
  },
  {
    "<leader>hn",
    function()
      harpoon:list():next({ ui_nav_wrap = true })
    end,
  },
  {
    "<leader>hp",
    function()
      harpoon:list():prev()
    end,
  },
}, { silent = true })
