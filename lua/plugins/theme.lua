return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      on_highlights = function(hl, c)
        hl.Keyword = { fg = c.blue5 }
        hl.Comment = { fg = "#636da6" }

        hl.LineNr = { fg = c.blue, bg = "none" }
        hl.LineNrAbove = { fg = c.blue0, bg = "none" }
        hl.LineNrBelow = { fg = c.blue0, bg = "none" }
        hl.CursorLineNr = { fg = c.orange, bold = true, bg = "none" }
        hl.SignColumn = { bg = "none" }
      end,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
}
