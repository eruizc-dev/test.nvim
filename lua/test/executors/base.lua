Executor = {}

function Executor:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Executor:run(cmd, args)
  assert(false, "test_suite is not implemented")
end

return Executor
