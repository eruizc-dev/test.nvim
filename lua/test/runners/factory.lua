local utils = require('test.utils')
local M = {}

local runners = {
  gradle = require('test.runners.gradle'),
  plenary_busted = require('test.runners.plenary_busted'),
}

function M.get_runner_for_path(dir)
  for _, runner in pairs(runners) do
    for _, pattern in ipairs(runner.root_patterns) do
      if utils.file_exists(dir .. '/' .. pattern) then
        return runner
      end
    end
  end
  error('Runner not found')
end

return M
