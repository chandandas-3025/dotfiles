return {
  "nvimtools/none-ls.nvim",
  opts = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.diagnostics.cppcheck.with({
          extra_args = { "--enable=all", "--inconclusive" },
        }),
      },
    })
  end,
}
