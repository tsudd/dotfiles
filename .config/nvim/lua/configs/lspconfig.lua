require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = { "html", "cssls" }
local nvlsp = require "nvchad.configs.lspconfig"
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers

vim.lsp.config("*", {
  root_markers = { ".git" },
})

-- omnisharp languageserver
-- prerequisites:
-- install LSP itself: ownisharp-roslyn https://aaronbos.dev/posts/csharp-dotnet-neovim
-- install Formatter: `dotnet tool install --global csharpier`
-- install debugger: `https://github.com/Samsung/netcoredbg/releases`
-- create corresponding folders in `/usr/local/bin/` and unzip omnisharp-roslyn and netcoredbg respectively.
-- don't forget to make both tools executable
lspconfig.omnisharp.setup {
  cmd = {
    "/usr/local/bin/omnisharp-roslyn/OmniSharp",
  },
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}
