return {
  -- Colorizer (Inline preview)
  {
    "norcalli/nvim-colorizer.lua",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("colorizer").setup({
        'css', 'scss', 'html', 'javascript', 'lua'
      }, {
        RGB      = true;
        RRGGBB   = true;
        names    = true;
        RRGGBBAA = true;
        rgb_fn   = true;
        hsl_fn   = true;
        mode     = 'background'; -- or 'foreground'
      })
    end,
  },

  -- CCC (Color Picker)
  {
    "uga-rosa/ccc.nvim",
    keys = {
      { "<leader>cp", "<cmd>CccPick<cr>", desc = "Color Picker" },
      { "<leader>cc", "<cmd>CccConvert<cr>", desc = "Convert Color" },
    },
    config = function()
    require("ccc").setup({
	  default_output_format = "hex", 
})
end,
  },
}
