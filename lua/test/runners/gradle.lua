local runner = require('test.runners.base')

Gradle = Runner:new({
  filetypes = { 'java' },
  root_patterns = { 'gradlew', 'build.gradle', 'settings.gradle' }
})

return Gradle
