local M = {}

-- Split string by spaces
local function split(s)
    local result = {};
    for match in (s .. ' '):gmatch("(.-)" .. ' ') do
        table.insert(result, match);
    end
    return result;
end

local function split_table_command(command)
  if #command == 0 then
    error('command table is empty')
  end
  local args = {}
  for i = 2, #command do
    args[#args + 1] = command[i]
  end
  return command[1], args
end

local function split_str_command(command)
  if #command == 0 then
    error('command string is empty')
  end
  return split_table_command(split(command))
end

function M.split_command(command)
  local type = type(command)
  if type == "string" then
    return split_str_command(command)
  elseif type == "table" then
    return split_table_command(command)
  else
    error('expected table or string, got: ' .. type)
  end
end

function M.file_exists(filename)
  local stat = vim.loop.fs_stat(filename)
  local exists = stat and stat.type
  return exists and true or false
end

return M
