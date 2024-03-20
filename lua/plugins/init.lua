return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre' -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
  	"williamboman/mason.nvim",
  	opts = {
  		ensure_installed = {
  			"black", "lua-language-server", "stylua",
  			"html-lsp", "css-lsp" , "prettier",
            "rust-analyzer", "pyright",
            "mypy", "ruff", "debugpy",
  		},
  	},
  },

  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
            "html", "css", "python", "rust",
  		},
  	},
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = "python",
    opts = function()
      return require "configs.null-ls"
    end,
  },

  {
    "mfussenegger/nvim-dap",
  },

  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
        "mfussenegger/nvim-dap",
        "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
        local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
        require("dap-python").setup(path)
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")
        dapui.setup()
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end
    end
  },

  {
    "nvim-neotest/nvim-nio",
  },

  {
    "gelguy/wilder.nvim",
    config = function()
        local wilder = require('wilder')
        wilder.setup({modes = {':', '/', '?'}})

        wilder.set_option('pipeline', {
            wilder.branch(
                wilder.cmdline_pipeline(),
                wilder.search_pipeline()
            ),
        })

        wilder.set_option('renderer', wilder.wildmenu_renderer({
            highlighter = wilder.basic_highlighter(),
        }))
    end,
  }
}
