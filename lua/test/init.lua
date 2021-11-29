local M = {}

function M.test_suite()
  local runner = require('test.runners.plenary_busted')
  local result = runner:test_suite()
  print(vim.inspect(result)) -- TODO: remove this
end

return M
