local palette = {
  black        = "#000000",
  red          = "#d44d53",
  green        = "#b9c949",
  yellow       = "#e6c446",
  blue         = "#79a6da",
  magenta      = "#c396d7",
  cyan         = "#70c0b1",
  white        = "#fffefe",

  bright_black = "#000000",
  bright_red   = "#d44d53",
  bright_green = "#b9c949",
  bright_yellow= "#e6c446",
  bright_blue  = "#79a6da",
  bright_magenta="#c396d7",
  bright_cyan  = "#70c0b1",
  bright_white = "#fffefe",

  background   = "#000000",
  foreground   = "#e9e9e9",
  cursor       = "#e9e9e9",
  selection_bg = "#424242",
  selection_fg = "#000000",
}

-- Utility function to create shaded colors
-- factor: 0.0 (black) to 1.0 (original color)
function palette.shade(hex_color, factor)
  -- Remove '#' if present
  local hex = hex_color:gsub("#", "")

  -- Parse RGB components
  local r = tonumber(hex:sub(1, 2), 16)
  local g = tonumber(hex:sub(3, 4), 16)
  local b = tonumber(hex:sub(5, 6), 16)

  -- Apply shading factor
  r = math.floor(r * factor)
  g = math.floor(g * factor)
  b = math.floor(b * factor)

  -- Return formatted hex color
  return string.format("#%02x%02x%02x", r, g, b)
end

return palette
