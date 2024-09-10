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

-- (neo)codeium
map('i', '<A-f>', function()
  require('neocodeium').accept()
end)

map('i', '<A-w>', function()
  require('neocodeium').accept_word()
end)

map('i', '<A-a>', function()
  require('neocodeium').accept_line()
end)

map('i', '<A-e>', function()
  require('neocodeium').cycle_or_complete()
end)

map('i', '<A-r>', function()
  require('neocodeium').cycle_or_complete(-1)
end)

map('i', '<A-c>', function()
  require('neocodeium').clear()
end)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
