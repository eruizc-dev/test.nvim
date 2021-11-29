local mock = require('luassert.mock')

describe('Gradle', function()
  local Gradle = require('test.runners.gradle')
  local Executor = mock(require('test.executors.plenary_job'), true)
  local runner = Gradle:new()

  it('can be instanciated', function()
    assert.is_not_nil(runner)
  end)

  describe('properties', function()
    it('has correct filetypes', function()
      local filetypes = { 'java' }
      assert.are.same(filetypes, runner.filetypes)
    end)

    it('has correct root patterns', function()
      local patterns = { 'gradlew', 'build.gradle', 'settings.gradle' }
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
      assert.stub(Executor.run).was_called_with(Executor, "./gradlew test")
    end)
  end)
end)
