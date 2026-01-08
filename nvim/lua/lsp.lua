local M = {}

function M.enable()
	vim.lsp.enable("clangd")
	vim.lsp.enable("lua_ls")
	vim.lsp.enable("phpactor")
	vim.lsp.enable("pyright")
	vim.lsp.enable("ruff")
	vim.lsp.enable("rust_analyzer")
	vim.lsp.enable("sourcekit")
	vim.lsp.enable("zls")
end

return M
