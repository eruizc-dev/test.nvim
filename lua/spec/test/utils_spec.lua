describe('utils', function()
  local utils = require('test.utils')

  describe('split_command', function()
    it('returns command in list', function()
      local command = { 'neofetch' }
      local cmd, args = utils.split_command(command)
      assert.are.equal(cmd, 'neofetch')
      assert.are.same(args, {})
    end)

    it('returns commands and arguments in list', function()
      local command = { 'neofetch', '--help' }
      local cmd, args = utils.split_command(command)
      assert.are.equal(cmd, 'neofetch')
      assert.are.same(args, { '--help' })
    end)

    it('returns command in string', function()
      local command = 'neofetch'
      local cmd, args = utils.split_command(command)
      assert.are.equal(cmd, 'neofetch')
      assert.are.same(args, {})
    end)

    it('returns command and arguments in string', function()
      local command = 'neofetch --help'
      local cmd, args = utils.split_command(command)
      assert.are.equal(cmd, 'neofetch')
      assert.are.same(args, { '--help' })
    end)

    it('throws if argument is nil', function()
      assert.has_error(function() utils.split_command(nil) end, 'expected table or string, got: nil')
    end)

    it('throws if argument is empty table', function()
      assert.has_error(function() utils.split_command({}) end, 'command table is empty')
    end)

    it('throws if argument is empty string', function()
      assert.has_error(function() utils.split_command('') end, 'command string is empty')
    end)
  end)

  describe('file_exists', function()
    it('returns true if file exists', function()
      assert.is_true(utils.file_exists('/'))
    end)

    it('returns false if file does not exist', function()
      assert.is_false(utils.file_exists('/home/non-existent-file'))
    end)
  end)
end)
