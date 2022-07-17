local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  use({ "wbthomason/packer.nvim" }) -- Have packer manage itself

  use({ "JoosepAlviste/nvim-ts-context-commentstring" })
  use({ "Xuyuanp/scrollbar.nvim" })
  use({ "ahmedkhalf/project.nvim" })
  use({ "akinsho/bufferline.nvim" })
  use({ "akinsho/toggleterm.nvim" })
  use({ "andweeb/presence.nvim" })
  use({ "folke/which-key.nvim" })
  use({ "goolord/alpha-nvim" })
  use({ "kyazdani42/nvim-tree.lua" })
  use({ "kyazdani42/nvim-web-devicons" })
  use({ "lambdalisue/suda.vim" })
  use({ "lewis6991/impatient.nvim" })
  use({ "lukas-reineke/indent-blankline.nvim" })
  use({ "michaeljsmith/vim-indent-object" })
  use({ "moll/vim-bbye" })
  use({ "norcalli/nvim-colorizer.lua" })
  use({ "numToStr/Comment.nvim" })
  use({ "nvim-lua/plenary.nvim" }) -- Useful lua functions used by lots of plugins
  use({ "nvim-lualine/lualine.nvim" })
  use({ "phaazon/hop.nvim", branch = "v2" })
  use({ "simrat39/symbols-outline.nvim" })
  use({ "tpope/vim-surround" })
  use({ "vim-scripts/argtextobj.vim" })
  use({ "windwp/nvim-autopairs" }) -- Autopairs, integrates with both cmp and treesitter
  use({ "windwp/nvim-ts-autotag" })

  -- Colorschemes
  use({ "catppuccin/nvim", as = "catppuccin" })
  use({ "folke/tokyonight.nvim" })
  use({ "lunarvim/darkplus.nvim" })

  -- cmp plugins
  use({ "hrsh7th/cmp-buffer" }) -- buffer completions
  use({ "hrsh7th/cmp-nvim-lsp" })
  use({ "hrsh7th/cmp-nvim-lsp-signature-help" })
  use({ "hrsh7th/cmp-nvim-lua" })
  use({ "hrsh7th/cmp-path" }) -- path completions
  use({ "hrsh7th/nvim-cmp" }) -- The completion plugin
  use({ "saadparwaiz1/cmp_luasnip" }) -- snippet completions

  -- Copilot plugins
  -- use({ "github/copilot.vim" }) -- Uncomment to setup copilot
  use({ "zbirenbaum/copilot.lua" })
  use({ "zbirenbaum/copilot-cmp", module = "copilot_cmp" })

  -- snippets
  use({ "L3MON4D3/LuaSnip" }) --snippet engine
  use({ "rafamadriz/friendly-snippets" }) -- a bunch of snippets to use

  -- LSP
  use({ "RRethy/vim-illuminate" })
  use({ "jose-elias-alvarez/null-ls.nvim" }) -- for formatters and linters
  use({ "mhartington/formatter.nvim" })
  use({ "neovim/nvim-lspconfig" }) -- enable LSP
  use({ "simrat39/rust-tools.nvim" })
  use({ "williamboman/nvim-lsp-installer" }) -- simple to use language server installer
  use({ "folke/lua-dev.nvim" })

  -- Telescope
  use({ "nvim-telescope/telescope.nvim" })

  -- Treesitter
  use({ "nvim-treesitter/nvim-treesitter" })

  -- Git
  use({ "lewis6991/gitsigns.nvim" })

  -- DAP
  use({ "mfussenegger/nvim-dap" })
  use({ "mfussenegger/nvim-dap-python" })
  use({ "ravenxrz/DAPInstall.nvim" })
  use({ "rcarriga/nvim-dap-ui" })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
