describe("Executor", function()
  local Executor = require('test.executors.base')

  it("can be instanciated", function()
    local executor = Executor:new()
    assert.is_not_nil(executor)
  end)

  describe("run", function()
    it("is not implemented", function()
      local executor = Executor:new()
      assert.has_error(function() executor:run() end)
    end)
  end)
end)
