Runner = {}

function Runner:new(obj)
  obj = obj or {}
  setmetatable(obj, self)
  self.__index = self
  return obj
end

function Runner:test_suite()
  error('test_suite is not implemented')
end

function Runner:did_run()
  error('did_run is not implemented')
end

return Runner
