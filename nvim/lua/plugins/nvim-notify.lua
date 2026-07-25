return {
    "rcarriga/nvim-notify",
    event = "VeryLazy",

    init = function()
        vim.opt.termguicolors = true
    end,

    opts = {
        stages = "fade",
        timeout = 3000,
        render = "default",
        background_colour = "#000000",
        max_width = function()
            return math.floor(vim.o.columns * 0.4)
        end,
        max_height = function()
            return math.floor(vim.o.lines * 0.3)
        end,
    },

    config = function(_, opts)
        local notify = require("notify")

        notify.setup(opts)

        vim.notify = notify
    end,
}
