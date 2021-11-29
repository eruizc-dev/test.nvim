local Runner = require('test.runners.base')
local plenary_job = require('test.executors.plenary') -- TODO: inject

PlenaryBusted = Runner:new({
  filetypes = { 'lua' },
  root_patterns = { 'lua', '.git' } -- TODO: I don't like this, maybe use function like lspconfig?
})

function PlenaryBusted:test_suite()
  local executor = plenary_job:new() -- TODO: set cwd and executor as dependency
  local result = executor:run({ 'nvim', '--headless', '-c', 'PlenaryBustedDirectory lua' })
  return result
end

return PlenaryBusted
