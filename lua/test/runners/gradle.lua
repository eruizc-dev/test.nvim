local plenary_job = require('test.executors.plenary')
local runner = require('test.runners.base')

Gradle = Runner:new({
  filetypes = { 'java' },
  root_patterns = { 'gradlew', 'build.gradle', 'settings.gradle' }
})

function Gradle:test_suite()
  local executor = plenary_job:new() -- TODO: set cwd and executor as dependency
  local result = executor:run("./gradlew test")
  return result
end

return Gradle
