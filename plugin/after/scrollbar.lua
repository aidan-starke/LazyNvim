local ok, scrollbar = pcall(require, "scrollbar")
if not ok then
  return
end

local colors = require("tokyonight.colors").setup()

scrollbar.setup({
  handle = {
    color = colors.bg_highlight,
  },
  marks = {
    Search = { color = colors.orange },
    Error = { color = colors.error },
    Warn = { color = colors.warning },
    Info = { color = colors.info },
    Hint = { color = colors.hint },
    Misc = { color = colors.purple },
    GitAdd = { color = colors.green },
    GitChange = { color = colors.blue },
    GitDelete = { color = colors.red1 },
  },
})

require("scrollbar.handlers.gitsigns").setup()
