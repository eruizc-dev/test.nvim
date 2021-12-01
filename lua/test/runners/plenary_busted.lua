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

function PlenaryBusted:parse_results()
  self.test_count = {
    total = 0,
    passed = 0,
    failed = 0
  }
end

function PlenaryBusted:get_test_count()
  if self.test_count == nil then
    self:parse_results()
  end
  return self.test_count
end

return PlenaryBusted
