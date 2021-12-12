local mock = require('luassert.mock')

describe('PlenaryBusted', function()
  local PlenaryBusted = require('test.runners.plenary_busted')
  local Executor = mock(require('test.executors.plenary_job'), true)
  local executor = nil
  local runner = nil

  before_each(function()
    executor = Executor:new()
    runner = PlenaryBusted:new(executor)
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
      assert.stub(Executor.run).was_called_with(executor, { 'nvim', '--headless', '-c', 'PlenaryBustedDirectory lua' })
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

  describe('get_results', function()
    it('returns empty table for new object', function()
      assert.are.same({}, runner:get_results())
    end)

    it('returns list with messages', function()
      executor.run.returns({
        exit_code = 0,
        output = {
          { 'message 1', 1 },
          { 'message 2', 1 },
          { 'message 3', 1 },
        }
      })
      runner:test_suite()
      local results = runner:get_results()
      assert.are.same(3, #results)
      assert.are.same('message 1', results[1])
      assert.are.same('message 2', results[2])
      assert.are.same('message 3', results[3])
    end)
  end)

  describe('get_test_count', function()
    it('has correct shape', function()
      local test_count = runner:get_test_count()
      assert.is_number(test_count.total)
      assert.is_number(test_count.passed)
      assert.is_number(test_count.failed)
    end)
  end)
end)
