describe('Gradle', function()
  local Gradle = require('test.runners.gradle')
  local runner = nil

  before_each(function()
    runner = Gradle:new()
  end)

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
    it('is not implemented', function()
      assert.has_error(function() runner:test_suite() end, 'test_suite is not implemented')
    end)
  end)
end)

