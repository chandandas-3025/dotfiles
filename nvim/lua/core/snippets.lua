-- Prevent LSP from overwriting Tree-sitter highlights
vim.highlight.priorities.semantic_tokens = 95

-- Customize diagnostics (works with any terminal)
vim.diagnostic.config {
  virtual_text = {
    prefix = '●',
    format = function(diagnostic)
      local code = diagnostic.code and string.format('[%s]', diagnostic.code) or ''
      return string.format('%s %s', code, diagnostic.message)
    end,
  },
  underline = false,
  update_in_insert = true,
  float = {
    source = 'always',
  },
  on_ready = function()
    vim.cmd 'highlight DiagnosticVirtualText guibg=NONE'
  end,
}

-- Highlight text after yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
