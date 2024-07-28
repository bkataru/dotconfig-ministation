return {

  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },


  -- python 
  
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function (_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      
      require("dap-python").setup(path)
    end
  },


  {

    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
      "mfussenegger/nvim-dap-python", --optional 

    },
    lazy = false,
    branch = "regexp",
    config = function ()
      require("venv-selector").setup {
        settings = {
          search = {
            my_venvs = {
              command = "fd /bin/python$ ~ --full-path -IHL -E /proc",
            },
          },
        },
      }
    end,
    keys = {
      {",v", "<cmd>VenvSelect<cr>"},
    },
  },

  -- js/ts/jsx/tsx
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "html",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
    config = function ()
      require("nvim-ts-autotag").setup()
    end
  },

  -- rust

  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },

  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function ()
      return require "configs.rust-tools"
    end,
    config = function (_, opts)
      require('rust-tools').setup(opts)
    end
  },

  {
    "saecki/crates.nvim",
    ft = {"rust", "toml"},
    config = function(_, opts)
      local crates = require('crates')
      crates.setup(opts)
      crates.show()
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require("nvchad.configs.cmp")
      table.insert(M.sources, {name="crates"})
      return M
    end,
  },

  -- go 
  
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = function (_, opts)
      require("gopher").setup(opts)
    end,
    build = function ()
      vim.cmd [[silent! GoInstallDeps]]
    end,
  },

  -- general
  

  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      }
    }
  },

  --[[
  -- replaced by none-ls.nvim 
   {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    ft = {"python", "javascript", "typescript", "javascriptreact", "typescriptreact", "json"},
    opts = function()
      return require "configs.null-ls"
    end,
  },
  --]]

  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    ft = {"html", "css", "json", "go", "python", "javascript", "typescript", "javascriptreact", "typescriptreact"},
    opts = function ()
      return require "configs.null-ls"
    end,
  },

  --[[
  -- doesn't work :(, sticking to null-ls for now
  {
    "mhartington/formatter.nvim",
    event = "VeryLazy",
    opts = function()
      return require("configs.formatter")
    end,
  },
  
  
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function ()
        return require("configs.lint")
    end,
  },
  ]]
  
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"},
    config = function ()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function ()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function ()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function ()
        dapui.close()
      end
    end
  },
  
  {
    "mfussenegger/nvim-dap", 
  },

  {
    "nvim-neotest/nvim-nio"
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "haskell-language-server",
        "gopls",
        "gofumpt",
        "goimports-reviser",
        "golines",
        "black",
        "debugpy",
        "mypy",
        "pylint",
        "pyright",
        "tailwindcss-language-server",
        "typescript-language-server",
        "eslint-lsp",
        "prettierd",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      {"nvim-treesitter/nvim-treesitter-textobjects"},
      {
        "nvim-treesitter/nvim-treesitter-context",
        opts = {enable = true, mode="topline", line_numbers = true}
      }
    },
    opts = function ()
      return require "configs.treesitter"
    end,
    config = function (_, opts)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {"markdown"},
        callback = function(ev)
          require("treesitter-context").disable()
        end
      })

      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  {
    "kylechui/nvim-surround",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-treesitter/nvim-treesitter-textobjects"
    },
    event = "VeryLazy",
    version = "*",
    config = function ()
      require("nvim-surround").setup()
    end
  },

  {
    "neovim/nvim-lspconfig",
    version = "*",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  -- {
  --   "neovim/nvim-lspconfig",
  --   config = function()
  --     require("nvchad.configs.lspconfig").defaults()
  --     require "configs.lspconfig"
  --   end,
  -- },
  --
  -- {
  -- 	"williamboman/mason.nvim",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"lua-language-server", "stylua",
  -- 			"html-lsp", "css-lsp" , "prettier"
  -- 		},
  -- 	},
  -- },
  --
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
