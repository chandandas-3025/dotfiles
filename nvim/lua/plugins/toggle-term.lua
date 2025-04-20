return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = function(term)
          if term.direction == "horizontal" then
            return 8  -- smaller height for horizontal terminal
          elseif term.direction == "vertical" then
            return math.floor(vim.o.columns * 0.3) -- 30% width
          end
        end,
        open_mapping = [[<leader>t]], -- You toggle using <leader>t
        hide_numbers = true, -- hide line numbers in terminal buffers
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true, -- use terminal mode mappings
        terminal_mappings = true,
        persist_size = true,
        persist_mode = true,
        direction = "horizontal", -- default terminal type
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "curved",
          winblend = 3,
        },
      })
    end
  }
}
