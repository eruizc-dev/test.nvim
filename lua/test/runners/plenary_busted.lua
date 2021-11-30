local Runner = require('test.runners.base')

PlenaryBusted = Runner:child()

PlenaryBusted.filetypes = { 'lua' }
PlenaryBusted.root_patterns = { 'lua', '.git' } -- TODO: I don't like this, maybe use function like lspconfig?

function PlenaryBusted:test_suite()
  self.raw_results = self.executor:run({ 'nvim', '--headless', '-c', 'PlenaryBustedDirectory lua' })
  return self.raw_results
end

function PlenaryBusted:did_run()
  return self.raw_results ~= nil
end

return PlenaryBusted
