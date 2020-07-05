" Vim Color File
" Name:       sarawak.vim
" Maintainer: https://github.com/sandkoan/sarawak.vim
" License:    The MIT License (MIT)

highlight clear

if exists("syntax_on")
  syntax reset
endif

set t_Co=256

let g:colors_name="sarawak"

highlight Normal guifg=#59ace8 ctermbg=NONE guibg=#2b3040 gui=NONE

highlight Title guifg=#6cf09a guibg=NONE
" highlight Title guifg=#18d0f0 " eb5721 0e4267 
highlight Comment guifg=#62a0a9 gui=italic 

highlight Constant guifg=#36a1e3 guibg=NONE
highlight String guifg=#6ceef0 guibg=NONE
highlight Character guifg=#76de95 guibg=NONE
highlight Number guifg=#6cf09a guibg=NONE
highlight Float guifg=#6cf09a guibg=NONE
highlight Boolean guifg=#FFA500 guibg=NONE

highlight Identifier guifg=#e3b26d guibg=NONE
highlight Function guifg=#72a0ed guibg=NONE gui=italic

highlight Statement guifg=#f2d177 guibg=NONE
highlight Conditional guifg=#6ce09f guibg=NONE
highlight Repeat guifg=#36a1e3 guibg=NONE
highlight Label guifg=#6cf09a guibg=NONE
highlight Operator guifg=#4ebfd0 guibg=NONE
highlight Keyword guifg=#36a1e3 guibg=NONE
highlight Exception guifg=#e3b26d guibg=NONE

highlight PreProc guifg=#e3b26d guibg=NONE
highlight Include guifg=#067d9f guibg=NONE
highlight Define guifg=#6ceef0 guibg=NONE
highlight Macro guifg=#6ae3f0 guibg=NONE gui=italic
highlight PreCondit guifg=#6cf09a guibg=NONE

highlight Type guifg=#00bdde guibg=NONE
highlight StorageClass guifg=#f59453 guibg=NONE
" TODO FIXME add colors below
" highlight Structure
" highlight Typedef 

highlight Special guifg=#6cf06a guibg=NONE
highlight SpecialChar guifg=#6ce08a guibg=NONE
highlight Tag guifg=#6ceef0 guibg=NONE
highlight Delimiter guifg=#6cf09a guibg=NONE
highlight SpecialComment guifg=#62a0a9 gui=italic guibg=#2b3040
highlight Debug guifg=#6cf09a guibg=NONE

highlight Error guifg=#e3b26d guibg=NONE
highlight ErrorMsg guifg=#d14636 guibg=NONE
highlight WarningMsg guifg=#d14636 guibg=NONE
highlight MoreMsg guifg=#6ceef0 guibg=NONE

highlight DiffText guifg=#ffffff guibg=#1fe05d
highlight DiffDelete guifg=##c14636 guibg=NONE
highlight DiffAdd guifg=#36a1e3 guibg=NONE
highlight DiffChange guifg=#6ceef0 guibg=NONE

highlight GitGutterAdd guifg=#36a1e3 guibg=NONE
highlight GitGutterChange guifg=#6ceef0 guibg=NONE
highlight GitGutterDelete guifg=#5db005 guibg=NONE
highlight GitGutterChangeDelete guifg=#05b011 guibg=NONE

" TODO FIXME change colors 
highlight cssAttr guifg=#f2d177 guibg=NONE
highlight cssColor guifg=#6ceef0 guibg=NONE
highlight cssClassName guifg=#067d9e guibg=NONE
highlight cssClassNameDot guifg=#067d9e guibg=NONE
highlight cssIdentifier guifg=#e3b26d guibg=NONE
highlight cssImportant guifg=#e3b26d guibg=NONE
highlight cssIncludeKeyword guifg=#36a1e3 guibg=NONE

highlight Search guifg=#ffffff guibg=#39992e  
highlight IncSearch guifg=#06789e guibg=#ffffff 

highlight Todo guifg=#ffffff guibg=NONE gui=underline
highlight WildMenu guifg=#72a0ed guibg=#394f59 gui=underline
highlight SignColumn guibg=#2b3040

highlight LineNr guifg=#067d9e guibg=#2b3040
highlight CursorLine guibg=#394f59
highlight CursorLineNR guifg=#16baa4 guibg=NONE

highlight MatchParen guifg=#eb5721 guibg=NONE gui=bold
highlight NonText guifg=#62a0a9 guibg=#2b3040

highlight Pmenu guifg=#59ace8 guibg=#394f59
highlight PMenuSel guifg=#36a1e3 guibg=NONE

highlight Storage guifg=#067d9e guibg=NONE
highlight Directory guifg=#2ebabf guibg=NONE gui=bold
highlight markdownLinkText guifg=#067d9e guibg=NONE
highlight javaScriptBoolean guifg=#067d9e guibg=NONE

highlight TabLine guifg=#ffffff guibg=#394f59 gui=NONE
highlight TabLineFill gui=NONE guibg=#394f59
highlight TabLineSel guifg=#16baa4 guibg=#394f59
set tabline=%!MyTabLine()


highlight VertSplit gui=NONE guifg=#394f59 guibg=NONE
highlight Visual gui=NONE guibg=#394f59

highlight ColorColumn guibg=#394f59

highlight StatusLine gui=bold guibg=#394f59 guifg=#59ace8
highlight StatusLineNC gui=NONE guibg=#2b3040 guifg=#59ace8

set background=dark
