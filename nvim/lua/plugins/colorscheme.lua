vim = vim

--- Set colorscheme from a list of options
local function set_colorscheme()
  local light_colorschemes = {
    "PaperColor",
    "solarized8",
    "seoul256-light",
    "dayfox",
    "dawnfox",
    "zephyr",
    "one-light",
    "github-theme",
    "mellow",
    "frost",
    "selenized-light",
    "NeoSolarized",
    "ayu-light",
    "snow",
  }

  local dark_colorschemes = {
    "nightfox",
    "nordfox",
    "duskfox",
    "terafox",
    "carbonfox",
    "rose-pine",
    "catppuccin-frappe",
    "catppuccin-macchiato",
    "catppuccin-mocha",
    "catppuccin-latte",
    "everforest",
    "dracula",
    "kanagawa",
    "nord",
    "cobalt2",
    "tokyonight",
    "gruvbox",
    "onedark",
    "material",
    "ayu",
    "moonlight",
    "darkplus",
    "challenger_deep",
    "oceanic_next",
    "sonokai",
    "edge",
    "doom-one",
    "spaceduck",
    "rigel",
    "monokai-pro",
    "horizon",
    "tender",
    "iceberg",
    "nightfly",
    "palenight",
    "codedark",
    "srcery",
    "moonbow",
    "nvcode",
    "sierra",
    "substrata",
    "vimspectr",
    "miramare",
    "plastic",
    "abstract",
    "shades-of-purple",
    "cosmic-void",
  }

  local all_colorschemes = vim.tbl_extend("force", light_colorschemes, dark_colorschemes)

  vim.ui.select(all_colorschemes, {
    prompt = "Select a colorscheme:",
    format_item = function(item)
      return item
    end,
    kind = "color",
  }, function(choice)
    if choice then
      vim.cmd.colorscheme(choice)
    end
  end)
end

-- Define a keymap to set colorscheme
vim.keymap.set("n", "<leader>tc", set_colorscheme, {
  desc = "Set colorscheme",
})

return {
  {
    "NLKNguyen/papercolor-theme",
    lazy = true,
  },
  {
    "lifepillar/vim-solarized8",
    lazy = true,
  },
  {
    "junegunn/seoul256.vim",
    lazy = true,
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = true,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
  },
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
  },
  {
    "sainnhe/everforest",
    lazy = true,
  },
  {
    "Mofiqul/dracula.nvim",
    lazy = true,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
  },
  {
    "shaunsingh/nord.nvim",
    lazy = true,
  },
  {
    "lalitmee/cobalt2.nvim",
    lazy = true,
    dependencies = { "tjdevries/colorbuddy.nvim" },
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
  },
  {
    "navarasu/onedark.nvim",
    lazy = true,
  },
  {
    "marko-cerovac/material.nvim",
    lazy = true,
  },
  {
    "Shatur/neovim-ayu",
    lazy = true,
  },
  {
    "shaunsingh/moonlight.nvim",
    lazy = true,
  },
  {
    "lunarvim/darkplus.nvim",
    lazy = true,
  },
  {
    "challenger-deep-theme/vim",
    lazy = true,
  },
  {
    "mhartington/oceanic-next",
    lazy = true,
  },
  {
    "sainnhe/sonokai",
    lazy = true,
  },
  {
    "sainnhe/edge",
    lazy = true,
  },
  {
    "NTBBloodbath/doom-one.nvim",
    lazy = true,
  },
  {
    "pineapplegiant/spaceduck",
    lazy = true,
  },
  {
    "Rigellute/rigel",
    lazy = true,
  },
  {
    "loctvl842/monokai-pro.nvim",
    lazy = true,
  },
  {
    "ntk148v/vim-horizon",
    lazy = true,
  },
  {
    "jacoborus/tender.vim",
    lazy = true,
  },
  {
    "cocopon/iceberg.vim",
    lazy = true,
  },
  {
    "bluz71/vim-nightfly-colors",
    lazy = true,
  },
  {
    "drewtempelmeyer/palenight.vim",
    lazy = true,
  },
  {
    "tomasiser/vim-code-dark",
    lazy = true,
  },
  {
    "srcery-colors/srcery-vim",
    lazy = true,
  },
  {
    "arturgoms/moonbow.nvim",
    lazy = true,
  },
  {
    "ChristianChiarulli/nvcode-color-schemes.vim",
    lazy = true,
  },
  {
    "rakr/vim-one",
    lazy = true,
  },
  {
    "projekt0n/github-nvim-theme",
    lazy = true,
  },
  {
    "adigitoleo/vim-mellow",
    lazy = true,
  },
  {
    "NTBBloodbath/doom-one.nvim",
    lazy = true,
  },
  {
    "AlessandroYorba/Sierra",
    lazy = true,
  },
  {
    "arzg/vim-substrata",
    lazy = true,
  },
  {
    "nightsense/vimspectr",
    lazy = true,
  },
  {
    "franbach/miramare",
    lazy = true,
  },
  {
    "flrnd/plastic.vim",
    lazy = true,
  },
  {
    "jdsimcoe/abstract.vim",
    lazy = true,
  },
  {
    "Rigellute/shades-of-purple.vim",
    lazy = true,
  },
  {
    "CosmicNvim/cosmic-ui",
    lazy = true,
  },
  {
    "ray-x/aurora",
    lazy = true,
    config = function()
      vim.g.aurora_italic = true
    end,
  },
  {
    "hardselius/warlock",
    lazy = true,
  },
  {
    "nightsense/snow",
    lazy = true,
  },
  {
    "jan-warchol/selenized",
    lazy = true,
  },
  {
    "svrana/neosolarized.nvim",
    lazy = true,
  },
}
