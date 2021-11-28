Executor = {}

function Executor:new()
    local o = {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Executor:run(cmd, args)
  assert(false, "run is not implemented")
end

return Executor
