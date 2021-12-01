local Executor = require('test.executors.plenary_job')
local M = {}

function M.test_suite()
  local project_root = vim.loop.cwd()
  local executor = Executor:new()
  local runner_type = require('test.runners.factory').get_runner_for_path(project_root)
  local runner = runner_type:new(executor)
  local result = runner:test_suite()
  print(vim.inspect(runner)) -- TODO: remove this
end

return M
