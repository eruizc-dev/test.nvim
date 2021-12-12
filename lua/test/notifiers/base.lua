Notifier = {}

function Notifier:child()
  self.__index = self
  return setmetatable({ base = self }, self)
end

function Notifier:new()
  self.__index = self
  return setmetatable({}, self)
end

function Notifier:notify_results(results)
  error('notify_results is not implemented')
end

return Notifier
