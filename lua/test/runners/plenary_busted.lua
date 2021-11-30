local Runner = require('test.runners.base')
local plenary_job = require('test.executors.plenary_job') -- TODO: inject

PlenaryBusted = Runner:new({
  filetypes = { 'lua' },
  root_patterns = { 'lua', '.git' } -- TODO: I don't like this, maybe use function like lspconfig?
})

function PlenaryBusted:test_suite()
  local executor = plenary_job:new() -- TODO: set cwd and executor as dependency
  self.raw_results = executor:run({ 'nvim', '--headless', '-c', 'PlenaryBustedDirectory lua' })
end

function PlenaryBusted:did_run()
  return self.raw_results ~= nil
end

return PlenaryBusted
