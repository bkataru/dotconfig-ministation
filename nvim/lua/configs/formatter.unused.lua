local M = {
  filetype = {
    python = {
      require("formatter.filetypes.python").black
    },
    javascript = {
      require("formatter.filetypes.javascript").biome
    },
    typescript = {
      require("formatter.filetypes.typescript").biome
    },
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace
    }
  }
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  command = "FormatWriteLock"
})

return M
