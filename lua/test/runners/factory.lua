local M = {}

local runners = {
  gradle = require('test.runners.gradle'),
  plenary_busted = require('test.runners.plenary_busted'),
}

local function file_exists(filename)
  local stat = vim.loop.fs_stat(filename)
  return stat and stat.type
end

function M.get_runner_for_path(dir)
  for _, runner in pairs(runners) do
    for _, pattern in ipairs(runner.root_patterns) do
      if file_exists(dir .. '/' .. pattern) then
        return runner
      end
    end
  end
  error('Runner not found')
end

return M
