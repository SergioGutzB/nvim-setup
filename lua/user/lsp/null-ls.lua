local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions.shellcheck -- shell script code actions

null_ls.setup({
	debug = false,
	sources = {
    formatting.prettier,
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
		diagnostics.shellcheck, -- shell script diagnostics
		-- diagnostics.flake8,
		code_actions.shellcheck, -- shell script code actions
	},
})

-- load required null-ls references
local h = require("null-ls.helpers")
local cmd_resolver = require("null-ls.helpers.command_resolver")
local methods = require("null-ls.methods")
local u = require("null-ls.utils")
local FORMATTING = methods.internal.FORMATTING

-- Define the new javascript formatter
local pe = h.make_builtin({
  name = "prettier_eslint",
  meta = {
    url = "https://github.com/prettier/prettier-eslint-cli",
    description = "Eslint + Prettier",
  },
  method = FORMATTING,
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "vue",
    "jsx"
  },
  factory = h.formatter_factory,
  generator_opts = {
    command = "prettier-eslint",
    args = { "--stdin", "--parser", "babel", "--resolve-plugins-relative-to", "~/.nvm/versions/node/v16.16.0/lib" },
    to_stdin = true,
  }
})
