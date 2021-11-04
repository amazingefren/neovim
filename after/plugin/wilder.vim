" call wilder#setup({'modes': [':', '?']})

call wilder#setup({'modes': [':', '/', '?']})
call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
      \ 'apply_incsearch_fix': 1,
      \ 'highlighter': wilder#basic_highlighter(),
      \ 'highlights': {
        \ 'default': wilder#make_hl('WilderPopupMenu', 'Normal', [{}, {}, {}]),
        \ 'accent': wilder#make_hl('WilderPopupMenuAccent', 'Normal', [{}, {}, {'foreground': '#67E4A6'}]),
        \ 'border': wilder#make_hl('WilderPopupMenuBorder', 'Normal', [{}, {}, {'foreground': '#414D58'}]),
      \ },
      \ 'border': 'rounded'
      \ })))

call wilder#set_option('pipeline', [
      \   wilder#branch(
      \     wilder#cmdline_pipeline({
      \       'fuzzy': 1,
      \       'set_pcre2_pattern': has('nvim'),
      \     }),
      \     wilder#python_search_pipeline({
      \       'pattern': 'fuzzy',
      \     }),
      \   ),
      \ ])

" call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
"       \ 'highlights': {
"       \   'border': 'Normal',
"       \ },
"       \ 'border': 'rounded',
"       \ })))
