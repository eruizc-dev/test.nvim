local Notifier = require('test.notifiers.quickfixlist')
local Executor = require('test.executors.plenary_job')
local M = {}

function M.test_suite()
  local notifier = Notifier:new()
  local executor = Executor:new()

  local runner_type = require('test.runners.factory').get_runner_for_path(vim.loop.cwd())

  local runner = runner_type:new(executor)
  runner:test_suite()

  local results = runner:get_results()

  notifier:notify_results(results)
end

return M
