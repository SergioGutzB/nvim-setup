local status, packer = pcall(require, "packer")
if (not status) then
	print("Packer is not installed")
	return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  -- Your plugins go here
	use {
	    "williamboman/nvim-lsp-installer",
	    "neovim/nvim-lspconfig",
	}

  -- Completition
	use "hrsh7th/cmp-nvim-lsp-signature-help"
	use "onsails/lspkind-nvim"
  use "nvim-lua/completion-nvim"

  use {
    'kkoomen/vim-doge',
    run = ':call doge#install()'
  }

  use 'wbthomason/packer.nvim' -- Package manager
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP

end)


