local Executor = require('test.executors.base')
local Job = require('plenary.job')

Plenary = Executor:new()

function Plenary:run(cmd, args)
  local result = {
    stdout = {},
    stderr = {},
    exit_code = 0
  }

  local j = Job:new({
    command = cmd,
    args = args,
    cwd = vim.loop.cwd(),
    on_stdout = function(error, data)
      table.insert(result.stdout, data)
    end,
    on_stderr = function(error, data)
      table.insert(result.stderr, data)
    end,
    on_exit = function(job, code)
      result.exit_code = code
    end
  }):sync()

  return result
end

return Plenary
