if exists('*s:convert')
  let b:breadcrumbs_converter = function('s:convert')
  finish
endif

function s:convert(item) abort
  let item = matchstr(a:item, '"[^"]*"')
  if a:item =~# '[$'
    let item ..= '[]'
    endif
  return item
endfunction
let b:breadcrumbs_converter = function('s:convert')
