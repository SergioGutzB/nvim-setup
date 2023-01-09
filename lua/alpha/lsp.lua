local function on_attach()
  -- keymaps for lsp
end

local lsp_installer = require("nvim-lsp-installer")

lsp_installer.on_server_ready(function(server)
  local opts = {}

  -- (optional) Customize the options passed to the server
  --
  if server.name == "emet_ls" then
    opts.filetypes = {"html", "css"}
  end

  opts.on_attach = on_attach


  server:setup(opts)
  vim.cmd [[do User LspAttachBuffers]]

end)
