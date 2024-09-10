require 'nvchad.mappings'

-- add yours here

local map = vim.keymap.set

map('n', ';', ':', { desc = 'CMD enter command mode' })
map('i', 'jk', '<ESC>')

-- breakpoints toggle
map('n', '<leader>db', '<cmd> DapToggleBreakpoint <CR>', { desc = 'Add breakpoint at line' })

-- start/continue debugger
map('n', '<leader>dr', '<cmd> DapContinue <CR>', { desc = 'Start or continue the debugger' })

-- python debugger
map('n', '<leader>dpr', function()
  require('dap-python').test_method()
end)

-- rust debugger
map('n', '<leader>dus', function()
  local widgets = require 'dap.ui.widgets'
  local sidebar = widgets.sidebar(widgets.scopes)
  sidebar.open()
end)

-- rust crates
map('n', '<leader>rcu', function()
  require('crates').upgrade_all_crates()
end)

-- go
map('n', '<leader>gsj', '<cmd> GoTagAdd json <CR>', { desc = "Add json struct tags for go's reflection capabilities" })

map('n', '<leader>gsy', '<cmd> GoTagAdd yaml <CR>', {
  desc = "Add yaml struct tags for go's reflection capabilities",
})

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
