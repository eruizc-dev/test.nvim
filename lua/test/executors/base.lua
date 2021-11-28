Executor = {}

function Executor:new()
    local o = {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function Executor:run(command)
  error('run is not implemented')
end

return Executor
