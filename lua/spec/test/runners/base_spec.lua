describe('Runner', function()
  local Runner = require('test.runners.base')
  local runner = nil

  before_each(function()
    runner = Runner:new()
  end)

  it('can be instanciated', function()
    assert.is_not_nil(runner)
  end)

  describe('test_suite', function()
    it('is not implemented', function()
      assert.has_error(function() runner:test_suite() end, 'test_suite is not implemented')
    end)
  end)
end)

