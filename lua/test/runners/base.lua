Runner = {}

function Runner:child()
  self.__index = self
  return setmetatable({ base = self }, self)
end

function Runner:new(executor)
  self.__index = self
  return setmetatable({ executor = executor }, self)
end

function Runner:test_suite()
  error('test_suite is not implemented')
end

function Runner:did_run()
  error('did_run is not implemented')
end

return Runner
