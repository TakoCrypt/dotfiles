local function config()
  require("nvim-treesitter.configs").setup({
    ensure_installed = "all", -- one of "all" or a list of languages
    ignore_install = { "" }, -- List of parsers to ignore installing
    highlight = {
      enable = true, -- false will disable the whole extension
      disable = { "css", "markdown" }, -- list of language that will be disabled
    },
    autopairs = {
      enable = true,
    },
    autotag = {
      enable = true,
    },
    rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = nil,
    },
    indent = { enable = true, disable = { "python", "css" } },
  })
end

return {
  "nvim-treesitter/nvim-treesitter",
  config = config,
  requires = { "windwp/nvim-ts-autotag", "p00f/nvim-ts-rainbow" },
}
