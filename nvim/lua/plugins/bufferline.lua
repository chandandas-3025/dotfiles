return {
    "akinsho/bufferline.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    config = function()
        require("bufferline").setup({
            options = {
                separator_style = "thin",
                persist_buffer_sort = true,
                show_tab_indicators = false,
                indicator = {
                    style = "none",
                },
            },
        })
    end,
}
