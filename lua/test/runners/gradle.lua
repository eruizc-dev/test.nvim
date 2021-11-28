local runner = require('test.runners.base')

Gradle = Runner:new({
  filetypes = { 'java' },
})

return Gradle
