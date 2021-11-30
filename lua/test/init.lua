local Executor = require('test.executors.plenary_job')
local Runner = require('test.runners.plenary_busted')
local M = {}

function M.test_suite()
  local executor = Executor:new()
  local runner = Runner:new(executor)
  local result = runner:test_suite()
  print(vim.inspect(runner)) -- TODO: remove this
end

return M
