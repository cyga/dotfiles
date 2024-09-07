vim.api.nvim_create_autocmd("BufWritePost", {pattern = "*.go", command = "silent !~/go-code/tools/ide/formatter -w % | edit"})
