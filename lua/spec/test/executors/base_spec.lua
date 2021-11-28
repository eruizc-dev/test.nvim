describe("Executor", function()
  local Executor = require('test.executors.base')
  local executor = nil

  before_each(function()
    executor = Executor:new()
  end)

  it("can be instanciated", function()
    assert.is_not_nil(executor)
  end)

  describe("run", function()
    it("is not implemented", function()
      assert.has_error(function() executor:run() end, "run is not implemented")
    end)
  end)
end)
