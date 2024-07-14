require('lint').linters_by_ft = {
  javascript = {'biome'},
  typescript = {'biome'},
  python = {'mypy', 'ruff'},
}

vim.api.nvim_create_autocmd({ "BufWritePost "}, {
  callback = function ()
    require("lint").try_lint()
  end,
})
