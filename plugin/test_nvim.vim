if exists('g:test_nvim_loaded') || &compatible
    finish
endif
let g:test_nvim_loaded = v:true

command! TestSuite lua require'test'.test_suite()
