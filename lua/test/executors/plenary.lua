local Executor = require('test.executors.base')
local Job = require('plenary.job')

Plenary = Executor:new()

function Plenary:run(cmd, args)
  Job:new({
    command = cmd,
    args = args,
    cwd = vim.loop.cwd()
  }):start()
end

return Plenary
