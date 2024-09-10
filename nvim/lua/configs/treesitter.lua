local M = {
  ensure_installed = {
    'vim',
    'vimdoc',

    'lua',

    'dockerfile',
    'gitignore',

    'json',
    'yaml',

    'html',
    'css',
    'markdown',
    'markdown_inline',

    'cpp',
    'rust',

    'go',
    'gomod',
    'gosum',
    'gowork',

    'haskell',

    'python',

    'javascript',
    'typescript',
    'tsx',
  },
  indent = { enable = true },
  auto_install = true,
  sync_install = false,
  highlight = {
    enable = true,
  },
  textobjects = { select = { enable = true, lookahead = true } },
}

return M
