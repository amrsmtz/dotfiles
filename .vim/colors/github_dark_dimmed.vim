" GitHub Dark Dimmed, the palette of the VS Code theme of the same name.
" Needs truecolor ('termguicolors'), the colors are 24-bit hex values.

set background=dark
highlight clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'github_dark_dimmed'

" Usage: s:hi(group, fg, bg [, attr [, sp]]), '' leaves fg/bg unset
function! s:hi(group, fg, bg, ...) abort
  let attr = get(a:, 1, 'NONE')
  let sp = get(a:, 2, '')
  execute 'highlight' a:group
        \ 'guifg=' . (empty(a:fg) ? 'NONE' : a:fg)
        \ 'guibg=' . (empty(a:bg) ? 'NONE' : a:bg)
        \ 'gui=' . attr 'cterm=' . attr
        \ 'guisp=' . (empty(sp) ? 'NONE' : sp)
endfunction

" Palette
let s:bg        = '#22272e'
let s:bg_inset  = '#1c2128'
let s:bg_subtle = '#2d333b'
let s:border    = '#444c56'
let s:fg        = '#adbac7'
let s:fg_bright = '#cdd9e5'
let s:fg_muted  = '#768390'
let s:fg_faint  = '#636e7b'
let s:red       = '#f47067'
let s:orange    = '#f69d50'
let s:yellow    = '#c69026'
let s:green     = '#8ddb8c'
let s:blue      = '#6cb6ff'
let s:blue_lite = '#96d0ff'
let s:purple    = '#dcbdfb'
let s:error     = '#e5534b'
let s:success   = '#57ab5a'
let s:accent    = '#539bf5'
let s:selection = '#2e4460'
let s:search    = '#4b412c'

" Editor UI
call s:hi('Normal', s:fg, s:bg)
call s:hi('LineNr', s:fg_faint, '')
call s:hi('CursorLineNr', s:fg, '', 'bold')
call s:hi('CursorLine', '', s:bg_subtle)
call s:hi('CursorColumn', '', s:bg_subtle)
call s:hi('ColorColumn', '', s:bg_subtle)
call s:hi('SignColumn', s:fg_faint, s:bg)
call s:hi('FoldColumn', s:fg_faint, s:bg)
call s:hi('Folded', s:fg_muted, s:bg_subtle)
call s:hi('NonText', s:border, '')
call s:hi('EndOfBuffer', s:border, '')
call s:hi('SpecialKey', s:border, '')
call s:hi('VertSplit', s:border, s:bg)
call s:hi('Visual', '', s:selection)
call s:hi('Search', s:fg_bright, s:search)
call s:hi('IncSearch', s:bg, s:yellow)
call s:hi('CurSearch', s:bg, s:yellow)
call s:hi('MatchParen', s:fg_bright, s:border, 'bold')
call s:hi('StatusLine', s:fg, s:bg_subtle)
call s:hi('StatusLineNC', s:fg_muted, s:bg_inset)
call s:hi('StatusLineTerm', s:fg, s:bg_subtle)
call s:hi('StatusLineTermNC', s:fg_muted, s:bg_inset)
call s:hi('TabLine', s:fg_muted, s:bg_inset)
call s:hi('TabLineFill', '', s:bg_inset)
call s:hi('TabLineSel', s:fg, s:bg, 'bold')
call s:hi('Pmenu', s:fg, s:bg_subtle)
call s:hi('PmenuSel', s:fg_bright, '#316dca')
call s:hi('PmenuSbar', '', s:bg_subtle)
call s:hi('PmenuThumb', '', '#545d68')
call s:hi('WildMenu', s:fg_bright, '#316dca')
call s:hi('QuickFixLine', '', s:selection)
call s:hi('Directory', s:blue, '')
call s:hi('Title', s:blue, '', 'bold')
call s:hi('ErrorMsg', s:error, '')
call s:hi('WarningMsg', s:yellow, '')
call s:hi('MoreMsg', s:success, '')
call s:hi('Question', s:success, '')
call s:hi('ModeMsg', s:fg, '', 'bold')
call s:hi('DiffAdd', '', '#273732')
call s:hi('DiffDelete', s:error, '#3f2e32')
call s:hi('DiffChange', '', '#3b372d')
call s:hi('DiffText', '', '#5a4a2a')
call s:hi('SpellBad', '', '', 'undercurl', s:error)
call s:hi('SpellCap', '', '', 'undercurl', s:yellow)
call s:hi('SpellRare', '', '', 'undercurl', s:purple)
call s:hi('SpellLocal', '', '', 'undercurl', s:accent)

" Syntax
call s:hi('Comment', s:fg_muted, '')
call s:hi('Constant', s:blue, '')
call s:hi('String', s:blue_lite, '')
call s:hi('Character', s:blue_lite, '')
call s:hi('Identifier', s:orange, '')
call s:hi('Function', s:purple, '')
call s:hi('Statement', s:red, '')
call s:hi('Operator', s:red, '')
call s:hi('PreProc', s:red, '')
call s:hi('Type', s:orange, '')
call s:hi('StorageClass', s:red, '')
call s:hi('Structure', s:red, '')
call s:hi('Typedef', s:red, '')
call s:hi('Special', s:blue, '')
call s:hi('SpecialChar', s:green, '')
call s:hi('Tag', s:green, '')
call s:hi('Delimiter', s:fg, '')
call s:hi('Underlined', s:blue_lite, '', 'underline')
call s:hi('Error', s:error, '', 'bold')
call s:hi('Todo', s:yellow, '', 'bold')

" Language tweaks to match the VS Code theme
highlight! link htmlTag Delimiter
highlight! link htmlEndTag Delimiter
highlight! link htmlTagName Tag
highlight! link htmlArg Constant
highlight! link xmlTagName Tag
highlight! link xmlAttrib Constant
highlight! link jsonKeyword Constant
highlight! link markdownCode String
highlight! link markdownCodeBlock String
highlight! link diffAdded MoreMsg
highlight! link diffRemoved ErrorMsg
highlight! link gitcommitSummary Normal

" Colors of :terminal windows
let g:terminal_ansi_colors = [
      \ '#545d68', '#f47067', '#57ab5a', '#c69026',
      \ '#539bf5', '#b083f0', '#39c5cf', '#909dab',
      \ '#636e7b', '#ff938a', '#6bc46d', '#daaa3f',
      \ '#6cb6ff', '#dcbdfb', '#56d4dd', '#cdd9e5',
      \ ]
