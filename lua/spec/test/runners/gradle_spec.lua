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
    it('supports filetypes', function()
      local filetypes = { 'java' }
      assert.are.same(filetypes, runner.filetypes)
    end)
  end)

  describe('test_suite', function()
    it('is not implemented', function()
      assert.has_error(function() runner:test_suite() end, 'test_suite is not implemented')
    end)
  end)
end)

