local ok, scrollbar = pcall(require, "scrollbar")
if not ok then
  return
end

local colors = require("tokyonight.colors").setup()

scrollbar.setup({
  marks = {
    Search = { highlight = { fg = colors.orange } },
    Error = { highlight = { fg = colors.error } },
    Warn = { highlight = { fg = colors.warning } },
    Info = { highlight = { fg = colors.info } },
    Hint = { highlight = { fg = colors.hint } },
    Misc = { highlight = { fg = colors.purple } },
    GitAdd = { highlight = { fg = colors.green } },
    GitChange = { highlight = { fg = colors.blue } },
    GitDelete = { highlight = { fg = colors.red1 } },
  },
  providers = { gitsigns = true },
  scrollbar = {
    thumb = {
      highlight = { bg = colors.bg_highlight },
    },
  },
})
