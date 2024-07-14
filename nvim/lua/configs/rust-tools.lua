local config = require("nvchad.configs.lspconfig")

local on_attach = config.on_attach
local on_init = config.on_init
local capabilities = config.capabilities

local options = {
  server = {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
}

return options
