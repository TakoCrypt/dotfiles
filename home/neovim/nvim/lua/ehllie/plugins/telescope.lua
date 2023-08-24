return {
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      local actions = require("telescope.actions")
      local builtin = require("telescope.builtin")
      require("telescope").setup({
        defaults = {

          prompt_prefix = " ",
          selection_caret = " ",
          path_display = { "smart" },
          file_ignore_patterns = { ".git/", "node_modules" },

          mappings = {
            i = {
              ["<C-c>"] = actions.close,
              ["<Down>"] = actions.cycle_history_next,
              ["<Up>"] = actions.cycle_history_prev,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
            },
            n = {
              q = actions.close,
            },
          },
        },
      })
      local register = require("which-key").register
      register({
        f = {
          name = "Telescope",
          f = { builtin.find_files, "Find files" },
          t = { builtin.live_grep, "Live grep" },
          b = { builtin.buffers, "Find buffers" },
          h = { builtin.help_tags, "Neovim documentation" },
          l = { builtin.diagnostics, "LSP diagnostics" },
          a = { builtin.builtin, "Select a builtin picker" },
        },
      }, { prefix = "<leader>" })
    end,
    dependencies = "folke/which-key.nvim",
  },
  {
    "ahmedkhalf/project.nvim",
    config = function(_, opts)
      require("project_nvim").setup(opts)
      require("telescope").load_extension("projects")

      require("which-key").register({ ["<leader>fp"] = { ":Telescope projects<CR>", "Find projects" } })
    end,
    opts = {
      -- detection_methods = { "lsp", "pattern" }, -- NOTE: lsp detection will get annoying with multiple langs in one project
      detection_methods = { "pattern" },
      -- patterns used to detect root dir, when **"pattern"** is in detection_methods
      patterns = { ".git", "Makefile", "package.json", "flake.nix" },
    },
    dependencies = { "telescope.nvim", "folke/which-key.nvim" },
  },
}
