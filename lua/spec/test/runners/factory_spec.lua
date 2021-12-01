local mock = require('luassert.mock')

describe('RunnerFactory', function()
  local file_exists = mock(require('test.utils').file_exists, true)

  describe('get_runner_for_path', function()
    it('returns gradle for path with build.gradle', function()
      -- TODO: no idea how to test this yet. Created an issue in Plenary
      -- https://github.com/nvim-lua/plenary.nvim/issues/275
    end)
  end)
end)
