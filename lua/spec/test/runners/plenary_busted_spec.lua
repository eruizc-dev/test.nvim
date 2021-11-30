local mock = require('luassert.mock')

describe('PlenaryBusted', function()
  local PlenaryBusted = require('test.runners.plenary_busted')
  local Executor = mock(require('test.executors.plenary_job'), true)
  local runner = nil

  before_each(function()
    runner = PlenaryBusted:new()
  end)

  it('can be instanciated', function()
    assert.is_not_nil(runner)
  end)

  describe('properties', function()
    it('has correct filetypes', function()
      local filetypes = { 'lua' }
      assert.are.same(filetypes, runner.filetypes)
    end)

    it('has correct root patterns', function()
      local patterns = { 'lua', '.git' }
      assert.are.same(patterns, runner.root_patterns)
    end)
  end)

  describe('test_suite', function()
    it('calls plenary executor with correct command', function()
      Executor.run.returns({
        exit_code = 0,
        stdout = {},
        stderr = {}
      })
      runner:test_suite()
      assert.stub(Executor.run).was_called_with(Executor, { 'nvim', '--headless', '-c', 'PlenaryBustedDirectory lua' })
    end)
  end)

  describe('did_run', function()
    it('returns false for new object', function()
      assert.is_false(runner:did_run())
    end)

    it('returns true after calling test_suite', function()
      runner:test_suite()
      assert.is_true(runner:did_run())
    end)
  end)
end)

