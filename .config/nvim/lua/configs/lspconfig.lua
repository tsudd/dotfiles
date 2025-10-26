require("nvchad.configs.lspconfig").defaults()

local nvlsp = require "nvchad.configs.lspconfig"

local servers = {
  html = {},
  rubocop = {},
  ruby_lsp = {
    capabilities = nvlsp.capabilities,
  },

  -- omnisharp languageserver
  -- -- prerequisites:
  -- -- install LSP itself: ownisharp-roslyn https://aaronbos.dev/posts/csharp-dotnet-neovim
  -- -- install Formatter: `dotnet tool install --global csharpier`
  -- -- install debugger: `https://github.com/Samsung/netcoredbg/releases`
  -- -- create corresponding folders in `/usr/local/bin/` and unzip omnisharp-roslyn and netcoredbg respectively.
  -- -- don't forget to make both tools executable
  omnisharp = {
    cmd = {
      "/usr/local/bin/omnisharp-roslyn/OmniSharp",
      "-z",
      "--hostPID",
      "12345",
      "DotNet:enablePackageRestore=false",
      "--encoding",
      "utf-8",
      "--languageserver",
    },
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  },
}

for name, opts in pairs(servers) do
  vim.lsp.config(name, opts)
  vim.lsp.enable(name)
end

-- read :h vim.lsp.config for changing options of lsp servers

vim.lsp.config("*", {
  root_markers = { ".git" },
})
