local Runner = require('test.runners.base')

PlenaryBusted = Runner:child()

PlenaryBusted.filetypes = { 'lua' }
PlenaryBusted.root_patterns = { 'lua', '.git' } -- TODO: I don't like this, maybe use function like lspconfig?

function PlenaryBusted:test_suite()
  self.raw_results = self.executor:run({ 'nvim', '--headless', '-c', 'PlenaryBustedDirectory lua' })
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

function PlenaryBusted:get_results()
  if not self.raw_results then return {} end
  local r = {}
  for _, line in ipairs(self.raw_results.output) do
    table.insert(r, line[1])
  end
  return r
end

return PlenaryBusted
