Publisher = {}

function Publisher:new()
  local o = {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function Publisher:publish(message)
  error('publish is not implemented')
end

return Publisher
