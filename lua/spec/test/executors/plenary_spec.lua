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

    it("returns exit code", function()
      local result = executor:run("ls", { "-la" })
      assert.are.equal(0, result.exit_code)
    end)

    it("returns stdout", function()
      local result = executor:run("echo", { "hello everyone" })
      assert.are.equal(
        vim.inspect({ "hello everyone" }),
        vim.inspect(result.stdout)
      )
    end)

    it("returns list of errors in stderr", function()
      local result = executor:run("ls", { "-3" })
      assert.are.equal(
        vim.inspect({ "ls: invalid option -- '3'", "Try 'ls --help' for more information." }),
        vim.inspect(result.stderr)
      )
    end)
  end)
end)
