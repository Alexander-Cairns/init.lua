vim.api.nvim_create_augroup("AutoFormat", {})

vim.api.nvim_create_autocmd(
    "BufWritePost",
    {
        pattern = "*.go",
        group = "AutoFormat",
        callback = function()
            vim.cmd("silent !gofmt -w %")
            vim.cmd("edit")
        end,
    }
)
