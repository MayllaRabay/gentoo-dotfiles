vim.opt.packpath:append(vim.fn.stdpath("data") .. "/site")

local ok, paq = pcall(require, "paq")

if not ok then
	print("Paq não encontrado. Tente rodar :packadd paq-nvim")
else
	paq {
		"savq/paq-nvim";
		"nvim-treesitter/nvim-treesitter";
		"norcalli/nvim-colorizer.lua";
		"neanias/everforest-nvim";
		"nvim-lualine/lualine.nvim";
		"kyazdani42/nvim-web-devicons";
	}
end

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

local color_ok, colorizer = pcall(require, "colorizer")
if color_ok then colorizer.setup() end

if pcall(vim.cmd, 'colorscheme everforest') then
	print("Tema carregado com sucesso")
else
	vim.cmd('colorscheme desert')
end
