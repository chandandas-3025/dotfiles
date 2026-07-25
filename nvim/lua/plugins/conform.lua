return {
    "stevearc/conform.nvim",

    event = { "BufWritePre" },

    cmd = { "ConformInfo" },

    keys = {
        {
            "<leader>cf",
            function()
                require("conform").format({
                    async = true,
                    lsp_format = "fallback",
                })
            end,
            desc = "Format Buffer",
        },
    },

    opts = {
        formatters_by_ft = {
            lua = { "stylua" },

            c = { "clang_format" },
            cpp = { "clang_format" },

            python = { "black" },

            javascript = { "prettier" },
            typescript = { "prettier" },
            javascriptreact = { "prettier" },
            typescriptreact = { "prettier" },

            html = { "prettier" },
            css = { "prettier" },
            json = { "prettier" },
            yaml = { "prettier" },
            markdown = { "prettier" },

            sh = { "shfmt" },
        },

        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
        },
    },
}
