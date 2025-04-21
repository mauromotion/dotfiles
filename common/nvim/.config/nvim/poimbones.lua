local colors_name = "poimbones"
vim.g.colors_name = colors_name -- Required when defining a colorscheme

local lush = require "lush"
local hsluv = lush.hsluv -- Human-friendly hsl
local util = require "zenbones.util"

local bg = vim.o.background

-- Define a palette. Use `palette_extend` to fill unspecified colors
-- Based on https://github.com/drcmda/poimandres-theme
local palette
if bg == "light" then
	palette = util.palette_extend({
		bg = hsluv "#E4F0FB",
		fg = hsluv "#1B1E28",
		rose = hsluv "#D0679D",
		leaf = hsluv "#5FB3A1",
		wood = hsluv "#F99964",
		water = hsluv "#ADD7FF",
		blossom = hsluv "#FCC5E9",
		sky = hsluv "#7390AA",
	}, bg)
else
	palette = util.palette_extend({
		bg = hsluv "#1B1E28",
		fg = hsluv "#E4F0FB",
		rose = hsluv "#D0679D",
		leaf = hsluv "#5DE4C7",
		wood = hsluv "#FFFAC2",
		water = hsluv "#ADD7FF",
		blossom = hsluv "#FCC5E9",
		sky = hsluv "#89DDFF",
	}, bg)
end

-- Generate the lush specs using the generator util
local generator = require "zenbones.specs"
local base_specs = generator.generate(palette, bg, generator.get_global_config(colors_name, bg))

-- Optionally extend specs using Lush
local specs = lush.extends({ base_specs }).with(function()
	return {
		Statement { base_specs.Statement, fg = palette.leaf },
		Special { fg = palette.fg },
		Type { fg = palette.sky, gui = "italic" },
	}
end)

-- Pass the specs to lush to apply
lush(specs)

-- Optionally set term colors
require("zenbones.term").apply_colors(palette)
