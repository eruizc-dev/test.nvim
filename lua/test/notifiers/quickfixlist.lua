local Notifier = require('test.notifiers.base')

Quickfixlist = Notifier:new()

function Quickfixlist:notify_results(results)
  local r = {}
  for _, result in ipairs(results) do
    table.insert(r, {
      text	= result,
    })
  end

  vim.fn.setqflist(r, 'r')
  vim.fn.execute('copen')
end

return Quickfixlist
