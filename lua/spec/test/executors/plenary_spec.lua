local mock = require("luassert.mock")

describe("Plenary", function()
  local Plenary = require('test.executors.plenary')
  local Job = nil
  local executor = nil

  before_each(function()
    Job = mock(require('plenary.job'))
    executor = Plenary:new()
  end)

  it("can be instanciated", function()
    assert.is_not_nil(executor)
  end)

  describe("run", function()
    it("calls job and job start", function()
      executor:run("ls", { "-la" })
      assert.stub(Job.new).was_called()
      assert.stub(Job.start).was_called()
    end)
  end)
end)
