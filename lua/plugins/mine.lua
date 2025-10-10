return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  { "phaazon/hop.nvim", event = "VeryLazy" }, -- Hop to a character

  { "MeanderingProgrammer/render-markdown.nvim", ft = "markdown" }, -- Render markdown

  {
    "gcmt/wildfire.vim",
    event = "VeryLazy",
  }, -- Smart selection

  {
    "Aasim-A/scrollEOF.nvim",
    event = "VeryLazy",
    config = function()
      require("scrollEOF").setup()
    end,
  }, -- Scroll past end of file

  { "tpope/vim-sleuth" }, -- Auto-detect indentation
}
