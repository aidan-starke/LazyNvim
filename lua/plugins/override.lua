return {
  {
    "Exafunction/codeium.nvim",
    opts = {
      enable_cmp_source = false,
      virtual_text = {
        enabled = true,
        manual = false,
        idle_delay = 75,
        key_bindings = {
          accept = "<Tab>",
          next = "<M-]>",
          prev = "<M-[>",
        },
      },
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      close_if_last_window = false,
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    },
  },
}
