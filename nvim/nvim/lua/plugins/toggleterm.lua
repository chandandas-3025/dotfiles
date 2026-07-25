return {
    "akinsho/toggleterm.nvim",
    version = "*",
    cmd = { "ToggleTerm", "TermExec" },

    keys = {
        {
            "<C-\\>",
            "<cmd>ToggleTerm<CR>",
            desc = "Toggle Terminal",
        },
    },

    opts = {
        size = 15,
        open_mapping = [[<C-\>]],
        hide_numbers = true,
        shade_terminals = true,
        start_in_insert = true,
        insert_mappings = true,
        terminal_mappings = true,
        persist_size = true,
        close_on_exit = true,
        direction = "horizontal",
    },
}
