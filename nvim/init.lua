local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		"https://github.com/folke/lazy.nvim.git",
		lazypath
	})
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.g.netrw_banner = 0

vim.g.c_syntax_for_h = true

vim.opt.swapfile = false

vim.opt.mouse = ""

vim.opt.nu = true
vim.opt.rnu = true

vim.opt.colorcolumn = "80"

vim.cmd.colorscheme("habamax")

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })

require("lazy").setup({
    spec = {
        {
            "nvim-telescope/telescope.nvim",
            tag = "0.1.8",
            dependencies = { "nvim-lua/plenary.nvim" },
        },
    },
    install = { colorscheme = { "habamax" } },
    checker = { enabled = true },
})

vim.keymap.set("n", "<c-f>", "<c-f>zz")
vim.keymap.set("n", "<c-b>", "<c-b>zz")
vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")

vim.keymap.set("n", "<leader>f", require("telescope.builtin").find_files)
vim.keymap.set("n", "<leader>rw", vim.cmd.Ex)

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then
			vim.api.nvim_echo({
				{ "LspAttach: could not get client\n", "ErrorMsg" },
			}, true, {})
			vim.fn.getchar()
			return
		end

		if client.supports_method("textDocument/declaration") then
			vim.keymap.set("n", "<leader>d", vim.lsp.buf.declaration)
		end

		if client.supports_method("textDocument/definition") then
			vim.keymap.set("n", "<leader>D", vim.lsp.buf.definition)
		end

		if client.supports_method("textDocument/hover") then
			vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover)
		end

		if client.supports_method("textDocument/implementation") then
			vim.keymap.set("n", "<leader>i", vim.lsp.buf.implementation)
		end

		if client.supports_method("textDocument/rename") then
			vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
		end

		if client.supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end

	end
})

vim.lsp.enable("phpactor")
