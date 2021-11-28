Runner = {}

function Runner:new()
  local o = {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function Runner:test_suite()
  error('test_suite is not implemented')
end

return Runner
