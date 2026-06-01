-- Glamrick: a dark, medium-contrast colorscheme inspired by provided image
-- Save as: ~/.config/nvim/lua/colors/glamrick.lua OR ~/.config/nvim/colors/glamrick.lua
local M = {}
M.name = "glamrick"

local fmt = string.format

-- Core palette (extracted/derived from the image)
local palette = {
	bg = "#0b1020", -- deep midnight (editor background)
	bg_alt = "#0f1626", -- slightly lighter for cursorline/status
	fg = "#c8d6e8", -- soft off-white for primary text
	comment = "#5b6b7f", -- muted cool grey for comments
	cursor = "#dfefff", -- light cursor color
	gutter_fg = "#394756", -- line number / gutter
	selection = "#112033", -- selection/cursorline tint

	red = "#ff6b6b", -- errors, warnings accent (muted red)
	orange = "#ffb86b", -- strings/important literals (warm orange)
	yellow = "#ffd66b", -- numbers/constants (soft yellow)
	green = "#8be98b", -- success/booleans (muted green)
	cyan = "#69d1ff", -- preserved bright cyan (keywords/types accent)
	blue = "#79a7ff", -- functions, identifiers
	violet = "#9aa3ff", -- keywords/keywords2
	gray = "#9fb0c6", -- secondary text
}

-- Highlight helper
local hi = function(group, guifg, guibg, gui, guisp)
	local s = { guifg = guifg, guibg = guibg, gui = gui, guisp = guisp }
	for k, v in pairs(s) do
		if v == nil then
			s[k] = nil
		end
	end
	vim.api.nvim_set_hl(0, group, s)
end

function M.setup()
	vim.o.termguicolors = true
	vim.cmd("highlight clear")
	if vim.fn.exists("syntax_on") == 1 then
		vim.cmd("syntax reset")
	end
	vim.g.colors_name = M.name

	-- Basic editor colors
	hi("Normal", palette.fg, palette.bg, nil)
	hi("Cursor", palette.bg, palette.cursor, "reverse")
	hi("CursorLine", nil, palette.bg_alt, nil)
	hi("CursorLineNr", palette.orange, palette.bg_alt, "bold")
	hi("LineNr", palette.gutter_fg, palette.bg, nil)
	hi("ColorColumn", nil, "#0c1a2b", nil)
	hi("Visual", nil, palette.selection, nil)
	hi("Search", palette.bg, palette.yellow, "bold")
	hi("IncSearch", palette.bg, palette.orange, "bold")
	hi("Pmenu", palette.fg, palette.bg_alt, nil)
	hi("PmenuSel", palette.bg, palette.cyan, "bold")
	hi("PmenuSbar", nil, palette.bg_alt, nil)
	hi("PmenuThumb", nil, palette.cyan, nil)
	hi("StatusLine", palette.gray, palette.bg_alt, nil)
	hi("StatusLineNC", palette.gutter_fg, palette.bg, nil)
	hi("VertSplit", palette.bg_alt, nil, nil)
	hi("Comment", palette.comment, nil, "italic")
	hi("Whitespace", palette.gutter_fg, nil, nil)
	hi("NormalFloat", palette.fg, palette.bg_alt, nil)
	hi("FloatBorder", palette.gutter_fg, nil, nil)
	hi("Title", palette.orange, nil, "bold")

	-- Syntax highlights
	hi("Constant", palette.yellow, nil, nil) -- numbers, booleans
	hi("String", palette.orange, nil, nil)
	hi("Character", palette.orange, nil, nil)
	hi("Boolean", palette.green, nil, "bold")
	hi("Identifier", palette.blue, nil, nil)
	hi("Function", palette.blue, nil, nil)
	hi("Statement", palette.violet, nil, "bold") -- keywords
	hi("Conditional", palette.violet, nil, "bold")
	hi("Repeat", palette.violet, nil, "bold")
	hi("Label", palette.violet, nil, nil)
	hi("Operator", palette.cyan, nil, nil)
	hi("Keyword", palette.cyan, nil, "bold")
	hi("Exception", palette.red, nil, "bold")

	-- Type / storage
	hi("Type", palette.cyan, nil, "bold")
	hi("StorageClass", palette.cyan, nil, nil)
	hi("Structure", palette.cyan, nil, nil)
	hi("Typedef", palette.cyan, nil, nil)

	-- Underlined / special
	hi("Underlined", palette.cyan, nil, "underline")
	hi("Error", palette.red, nil, "bold")
	hi("Todo", palette.yellow, nil, "bold,italic")

	-- LSP
	hi("LspDiagnosticsDefaultError", palette.red, nil, nil)
	hi("LspDiagnosticsDefaultWarning", palette.orange, nil, nil)
	hi("LspDiagnosticsDefaultInformation", palette.cyan, nil, nil)
	hi("LspDiagnosticsDefaultHint", palette.green, nil, nil)

	-- Treesitter (common groups)
	hi("@comment", palette.comment, nil, "italic")
	hi("@constant", palette.yellow, nil, nil)
	hi("@string", palette.orange, nil, nil)
	hi("@variable", palette.fg, nil, nil)
	hi("@function", palette.blue, nil, nil)
	hi("@function.builtin", palette.violet, nil, nil)
	hi("@keyword", palette.violet, nil, "bold")
	hi("@keyword.return", palette.violet, nil, "bold")
	hi("@type", palette.cyan, nil, "bold")
	hi("@parameter", palette.gray, nil, nil)
	hi("@property", palette.blue, nil, nil)
	hi("@field", palette.blue, nil, nil)
	hi("@operator", palette.cyan, nil, nil)
	hi("@punctuation.bracket", palette.gutter_fg, nil, nil)
	hi("@attribute", palette.yellow, nil, "bold")
	hi("@attribute.builtin", palette.yellow, nil, "bold")
	hi("@constant", palette.yellow, nil, "bold")
	hi("Identifier", nil, nil, "bold")

	-- Git signs / diff
	hi("DiffAdd", palette.green, nil, nil)
	hi("DiffChange", palette.yellow, nil, nil)
	hi("DiffDelete", palette.red, nil, nil)
	hi("GitGutterAdd", palette.green, nil, nil)
	hi("GitGutterChange", palette.yellow, nil, nil)
	hi("GitGutterDelete", palette.red, nil, nil)

	-- Telescope (common)
	hi("TelescopeBorder", palette.gutter_fg, nil, nil)
	hi("TelescopeNormal", palette.fg, palette.bg, nil)
	hi("TelescopePromptPrefix", palette.orange, nil, "bold")

	-- additional UI tweaks
	hi("MatchParen", nil, "#112233", "bold")
	hi("SearchResult", palette.bg, palette.yellow, nil)
end

return M
