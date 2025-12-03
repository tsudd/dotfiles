return {
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      on_attach = function(bufnr)
        local api = require "nvim-tree.api"
        api.config.mappings.default_on_attach(bufnr)

        -- use easy-dotnet to create new file from template
        vim.keymap.set(
          "n",
          "A",
          function()
            local node = api.tree.get_node_under_cursor()
            local path = node.type == "directory" and node.absolute_path or vim.fs.dirname(node.absolute_path)
            require("easy-dotnet").create_new_item(path)
          end,
          { desc = "Create file from dotnet template", buffer = bufnr, noremap = true, silent = true, nowait = true }
        )
      end,
    },
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
    cmd = { "ConformInfo" },
  },
  {
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    optional = true,
    opts = {
      file_types = { "markdown", "copilot-chat" },
    },
    ft = { "markdown", "copilot-chat" },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    lazy = false,
    opts = require "configs.copilot-chat",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "github/copilot.vim",
    },
  },
  {
    lazy = false,
    "github/copilot.vim",
  },
  -- {
  --   -- Setup for omnisharp-extended-lsp.nvim
  --   "Hoffs/omnisharp-extended-lsp.nvim",
  -- },
  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "csharp-language-server",
        "ruby_lsp",
        "omnisharp",
        "xmlformatter",
        "stylua",
        "bicep-lsp",
        "html-lsp",
        "css-lsp",
        "csharpier",
        "prettier",
        "json-lsp",
      },
    },
  },
  {
    -- Debug Framework
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "suketa/nvim-dap-ruby",
    },
    config = function()
      require "configs.nvim-dap"
    end,
    event = "VeryLazy",
  },
  { "nvim-neotest/nvim-nio" },
  {
    -- UI for debugging
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      require "configs.nvim-dap-ui"
    end,
  },
  {
    "nvim-neotest/neotest",
    requires = {
      {
        "Issafalcon/neotest-dotnet",
      },
    },
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },
  -- {
  --   "Issafalcon/neotest-dotnet",
  --   lazy = false,
  --   dependencies = {
  --     "nvim-neotest/neotest",
  --   },
  -- },
  "NMAC427/guess-indent.nvim", -- Detect tabstop and shiftwidth automatically
  -- Highlight todo, notes, etc in comments
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
  },
}
