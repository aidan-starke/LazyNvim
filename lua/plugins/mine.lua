return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  { "smoka7/hop.nvim", event = "VeryLazy" }, -- Hop to a character

  { "MeanderingProgrammer/render-markdown.nvim", ft = "markdown" }, -- Render markdown

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  }, -- Edit surrounding brackets/quotes/tags

  {
    "gcmt/wildfire.vim",
    event = "VeryLazy",
  }, -- Smart selection

  { "tpope/vim-sleuth" }, -- Auto-detect indentation

  {
    "chentoast/marks.nvim",
    event = "VeryLazy",
    opts = {},
  },

  {
    "akinsho/git-conflict.nvim",
    event = "VeryLazy",
    version = "*",
    config = true,
  }, -- Git conflicts

  {
    "petertriho/nvim-scrollbar",
    branch = "refactor/v2", -- TODO: drop after 2026-11-16, when v2 lands on main
    event = "VeryLazy",
    dependencies = { "tokyonight.nvim", "lewis6991/gitsigns.nvim" },
  },
}
