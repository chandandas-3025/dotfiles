-- Setup lazy.nvim
require("config.lazy")

require('lint').linters.cppcheck.args = {
  '--enable=all',
  '--inline-suppr',
  '--suppress=missingIncludeSystem'
}
