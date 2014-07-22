" default configuration {{{1
if !exists('g:ex_cscope_winsize')
    let g:ex_cscope_winsize = 20
endif

if !exists('g:ex_cscope_winsize_zoom')
    let g:ex_cscope_winsize_zoom = 40
endif

" bottom or top
if !exists('g:ex_cscope_winpos')
    let g:ex_cscope_winpos = 'bottom'
endif

if !exists('g:ex_cscope_ignore_case')
    let g:ex_cscope_ignore_case = 1
endif

if !exists('g:ex_cscope_enable_help')
    let g:ex_cscope_enable_help = 1
endif

" ------------------------------------------------------------------ 
" Desc: window height for horizon window mode
" ------------------------------------------------------------------ 

if !exists('g:exCS_window_height')
    let g:exCS_window_height = 20
endif

" ------------------------------------------------------------------ 
" Desc: window width for vertical window mode
" ------------------------------------------------------------------ 

if !exists('g:exCS_window_width')
    let g:exCS_window_width = 48
endif

" ------------------------------------------------------------------ 
" Desc: window height increment value
" ------------------------------------------------------------------ 

if !exists('g:exCS_window_height_increment')
    let g:exCS_window_height_increment = 30
endif

" ------------------------------------------------------------------ 
" Desc: window width increment value
" ------------------------------------------------------------------ 

if !exists('g:exCS_window_width_increment')
    let g:exCS_window_width_increment = 50
endif

" ------------------------------------------------------------------ 
" Desc: placement of the window
" 'topleft','botright','belowright'
" ------------------------------------------------------------------ 

if !exists('g:exCS_window_direction')
    let g:exCS_window_direction = 'belowright'
endif

" ------------------------------------------------------------------ 
" Desc: use vertical or not
" ------------------------------------------------------------------ 

if !exists('g:exCS_use_vertical_window')
    let g:exCS_use_vertical_window = 0
endif

" ------------------------------------------------------------------ 
" Desc: go back to edit buffer
" ------------------------------------------------------------------ 

if !exists('g:exCS_backto_editbuf')
    let g:exCS_backto_editbuf = 0
endif

" ------------------------------------------------------------------ 
" Desc: go and close exTagSelect window
" ------------------------------------------------------------------ 

if !exists('g:exCS_close_when_selected')
    let g:exCS_close_when_selected = 0
endif

" ------------------------------------------------------------------ 
" Desc: set edit mode
" 'none', 'append', 'replace'
" ------------------------------------------------------------------ 

if !exists('g:exCS_edit_mode')
    let g:exCS_edit_mode = 'replace'
endif

" ------------------------------------------------------------------ 
" Desc: use syntax highlight for search result
" ------------------------------------------------------------------ 

if !exists('g:exCS_highlight_result')
    let g:exCS_highlight_result = 0
endif




"}}}

" commands {{{1
command! -n=1 -complete=customlist,ex#compl_by_symbol TSelect call excscope#select('<args>')
command! EXCscopeCWord call excscope#select(expand('<cword>'))

command! EXCsToggle call excscope#toggle_window()
command! EXCsOpen call excscope#open_window()
command! EXCsClose call excscope#close_window()
" command EXCsSelectToggle call excscope#toggle_window('Select')
" command EXCsQuickViewToggle call excscope#ToggleWindow('QuickView')
command EXCsParseFunction call excscope#ParseFunction()

"/////////////////////////////////////////////////////////////////////////////
" Commands
"/////////////////////////////////////////////////////////////////////////////

command -nargs=1 -complete=customlist,exUtility#CompleteBySymbolFile CSD call excscope#GetSearchResult('<args>', 'da')
command -nargs=1 -complete=customlist,exUtility#CompleteBySymbolFile CSC call excscope#GetSearchResult('<args>', 'c')
command -nargs=1 -complete=customlist,exUtility#CompleteByProjectFile CSI call excscope#GetSearchResult('<args>', 'i')
command -nargs=1 -complete=customlist,exUtility#CompleteBySymbolFile CSS call excscope#GetSearchResult('<args>', 's')
command -nargs=1 -complete=customlist,exUtility#CompleteBySymbolFile CSG call excscope#GetSearchResult('<args>', 'g')
command -nargs=1 -complete=customlist,exUtility#CompleteBySymbolFile CSE call excscope#GetSearchResult('<args>', 'e')


command CSDD call excscope#GoDirect('da')
command CSCD call excscope#GoDirect('c')
command CSID call excscope#GoDirect('i')
command CSIC call excscope#GetSearchResult(fnamemodify( bufname("%"), ":p:t" ), 'i')
command CSSD call excscope#GoDirect('s')
command CSGD call excscope#GoDirect('g')
command CSED call excscope#GoDirect('e')


"}}}

" default key mappings {{{1
call excscope#register_hotkey( 1  , 1, '<F1>'            , ":call excscope#toggle_help()<CR>"           , 'Toggle help.' )
if has('gui_running')
    call excscope#register_hotkey( 2  , 1, '<ESC>'           , ":EXCsClose<CR>"                         , 'Close window.' )
else
    call excscope#register_hotkey( 2  , 1, '<leader><ESC>'   , ":EXCsClose<CR>"                         , 'Close window.' )
endif
call excscope#register_hotkey( 3  , 1, '<Space>'         , ":call excscope#toggle_zoom()<CR>"           , 'Zoom in/out project window.' )
call excscope#register_hotkey( 4  , 1, '<CR>'            , ":call excscope#confirm_select('')<CR>"      , 'Go to the select result.' )
call excscope#register_hotkey( 5  , 1, '<2-LeftMouse>'   , ":call excscope#confirm_select('')<CR>"      , 'Go to the select result.' )
call excscope#register_hotkey( 6  , 1, '<S-CR>'          , ":call excscope#confirm_select('shift')<CR>" , 'Go to the select result in split window.' )
call excscope#register_hotkey( 7  , 1, '<S-2-LeftMouse>' , ":call excscope#confirm_select('shift')<CR>" , 'Go to the select result in split window.' )
"}}}

call ex#register_plugin( 'excscope', { 'actions': ['autoclose'] } )

" vim:ts=4:sw=4:sts=4 et fdm=marker:
