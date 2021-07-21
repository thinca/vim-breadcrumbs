if expand('%') !~# '_spec\.rb$'
  finish
endif

if exists('*s:convert')
  let b:breadcrumbs_converter = function('s:convert')
  finish
endif

function s:convert(item) abort
  let item = matchstr(a:item, '\v%(RSpec\.)?%(describe|context|it)\s+\zs.{-}\ze\s+do$')
  let item = substitute(item, '\v^%(([''"])(.*)\1|([[:alnum:]:]+)).*', '\2\3', '')
  return item
endfunction
let b:breadcrumbs_converter = function('s:convert')
