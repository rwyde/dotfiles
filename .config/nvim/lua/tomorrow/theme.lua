local palette = require("tomorrow.palette")

local theme = {
  Normal       = { fg = palette.foreground, bg = palette.background },
  Cursor       = { fg = palette.background, bg = palette.cursor },
  CursorLine   = { bg = "#111111" },
  CursorLineNr = { fg = palette.yellow, bold = true },
  LineNr       = { fg = "#444444" },
  Visual       = { fg = palette.selection_fg, bg = palette.selection_bg },
  StatusLine   = { fg = palette.foreground, bg = "#222222" },
  StatusLineNC = { fg = "#666666", bg = "#111111" },
  VertSplit    = { fg = "#333333" },
  Pmenu        = { fg = palette.foreground, bg = "#222222" },
  PmenuSel     = { fg = palette.background, bg = palette.blue },
  ColorColumn  = { bg = "#111111" },

  -- Syntax
  Comment      = { fg = "#666666", italic = true },
  Constant     = { fg = palette.cyan },
  String       = { fg = palette.green },
  Character    = { fg = palette.green },
  Number       = { fg = palette.yellow },
  Boolean      = { fg = palette.yellow },
  Identifier   = { fg = palette.blue },
  Function     = { fg = palette.magenta },
  Statement    = { fg = palette.red },
  Keyword      = { fg = palette.red, bold = true },
  Operator     = { fg = palette.cyan },
  PreProc      = { fg = palette.yellow },
  Type         = { fg = palette.blue },
  Special      = { fg = palette.magenta },
  Underlined   = { fg = palette.blue, underline = true },
  Error        = { fg = palette.red, bg = "#220000" },
  Todo         = { fg = palette.yellow, bold = true },
}

-- Treesitter Highlights
theme["@comment"]           = { link = "Comment" }
theme["@constant"]          = { link = "Constant" }
theme["@constant.builtin"]  = { fg = palette.yellow }
theme["@string"]            = { link = "String" }
theme["@character"]         = { link = "Character" }
theme["@number"]            = { link = "Number" }
theme["@boolean"]           = { link = "Boolean" }
theme["@identifier"]        = { link = "Identifier" }
theme["@function"]          = { link = "Function" }
theme["@function.call"]     = { link = "Function" }
theme["@function.builtin"]  = { fg = palette.magenta }
theme["@parameter"]         = { fg = palette.cyan }
theme["@keyword"]           = { link = "Keyword" }
theme["@keyword.function"]  = { fg = palette.red, bold = true }
theme["@type"]              = { link = "Type" }
theme["@type.builtin"]      = { fg = palette.blue }
theme["@field"]             = { fg = palette.cyan }
theme["@property"]          = { fg = palette.cyan }
theme["@variable"]          = { fg = palette.foreground }
theme["@variable.builtin"]  = { fg = palette.yellow }
theme["@namespace"]         = { fg = palette.blue }

-- LSP Semantic Highlights
theme.LspReferenceText      = { bg = "#1a1a1a" }
theme.LspReferenceRead      = { bg = "#1a1a1a" }
theme.LspReferenceWrite     = { bg = "#1a1a1a" }

theme.DiagnosticError       = { fg = palette.red }
theme.DiagnosticWarn        = { fg = palette.yellow }
theme.DiagnosticInfo        = { fg = palette.blue }
theme.DiagnosticHint        = { fg = palette.cyan }

theme.DiagnosticUnderlineError = { undercurl = true, sp = palette.red }
theme.DiagnosticUnderlineWarn  = { undercurl = true, sp = palette.yellow }
theme.DiagnosticUnderlineInfo  = { undercurl = true, sp = palette.blue }
theme.DiagnosticUnderlineHint  = { undercurl = true, sp = palette.cyan }

-- Render Markdown Headers (subtle backgrounds - darkened theme colors)
-- Adjust the factor (0.0-1.0) to control darkness. Lower = darker, Higher = brighter
local shade_factor = 0.3

theme.RenderMarkdownH1Bg = { bg = palette.shade(palette.magenta, shade_factor) }
theme.RenderMarkdownH2Bg = { bg = palette.shade(palette.cyan, shade_factor) }
theme.RenderMarkdownH3Bg = { bg = palette.shade(palette.blue, shade_factor) }
theme.RenderMarkdownH4Bg = { bg = palette.shade(palette.magenta, shade_factor) }
theme.RenderMarkdownH5Bg = { bg = palette.shade(palette.red, shade_factor) }
theme.RenderMarkdownH6Bg = { bg = palette.shade(palette.yellow, shade_factor) }


return theme

