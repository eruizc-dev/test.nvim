describe('Publisher', function()
  local Publisher = require('test.publishers.base')
  local publisher = nil

  before_each(function()
    publisher = Publisher:new()
  end)

  it('can be instanciated', function()
    assert.is_not_nil(publisher)
  end)

  describe('publish', function()
    it('is not implemented', function()
      assert.has_error(function() publisher:publish() end, 'publish is not implemented')
    end)
  end)
end)
