local mock = require('luassert.mock')

describe('Plenary', function()
  local Plenary = require('test.executors.plenary')
  local Job = nil
  local executor = nil

  before_each(function()
    Job = mock(require('plenary.job'))
    executor = Plenary:new()
  end)

  it('can be instanciated', function()
    assert.is_not_nil(executor)
  end)

  describe('run', function()
    it('calls job and job start', function()
      executor:run('ls', { '-la' })
      assert.stub(Job.new).was_called()
      assert.stub(Job.start).was_called()
    end)

    it('returns exit code', function()
      local result = executor:run({ 'ls', '-la' })
      assert.are.equal(0, result.exit_code)
    end)

    it('returns stdout', function()
      local result = executor:run({ 'echo', 'hello everyone' })
      assert.are.same(
        { 'hello everyone' },
        result.stdout
      )
    end)

    it('returns list of errors in stderr', function()
      local result = executor:run('ls -3')
      assert.are.same(
        { "ls: invalid option -- '3'", "Try 'ls --help' for more information." },
        result.stderr
      )
    end)

    it('accepts string or array', function()
      local command1 = 'ls -la'
      local command2 = { 'ls', '-la' }
      assert.are.same(
        executor:run(command1),
        executor:run(command2),
        'expected results to be the same'
      )
    end)
  end)
end)
