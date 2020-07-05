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

highlight DiffText guifg=#e3b26d guibg=NONE

highlight ErrorMsg guifg=#e3b26d guibg=NONE
highlight WarningMsg guifg=#e3b26d guibg=NONE
highlight Exception guifg=#e3b26d guibg=NONE
highlight Error guifg=#e3b26d guibg=NONE
highlight DiffDelete guifg=#e3b26d guibg=NONE
highlight GitGutterDelete guifg=#5db005 guibg=NONE
highlight GitGutterChangeDelete guifg=#05b011 guibg=NONE
highlight cssIdentifier guifg=#e3b26d guibg=NONE
highlight cssImportant guifg=#e3b26d guibg=NONE
highlight Type guifg=#e3b26d guibg=NONE
highlight PreProc guifg=#e3b26d guibg=NONE
highlight Identifier guifg=#e3b26d guibg=NONE
highlight Constant guifg=#36a1e3 guibg=NONE
highlight Repeat guifg=#36a1e3 guibg=NONE
highlight DiffAdd guifg=#36a1e3 guibg=NONE
highlight GitGutterAdd guifg=#36a1e3 guibg=NONE
highlight cssIncludeKeyword guifg=#36a1e3 guibg=NONE
highlight Keyword guifg=#36a1e3 guibg=NONE
highlight IncSearch guifg=#06789e guibg=#ffffff 
highlight Title guifg=#6cf09a guibg=NONE
highlight PreCondit guifg=#6cf09a guibg=NONE
highlight Debug guifg=#6cf09a guibg=NONE
highlight SpecialChar guifg=#6cf09a guibg=NONE
highlight Conditional guifg=#6cf09a guibg=NONE
highlight Todo guifg=#06789e guibg=NONE
highlight Special guifg=#6cf09a guibg=NONE
highlight Label guifg=#6cf09a guibg=NONE
highlight Delimiter guifg=#6cf09a guibg=NONE
highlight Number guifg=#6cf09a guibg=NONE
highlight RelativeNumber guifg=#4cb2c2 guibg=NONE
highlight CursorLineNR guifg=#6ceef0 guibg=NONE
highlight Define guifg=#6ceef0 guibg=NONE
highlight MoreMsg guifg=#6ceef0 guibg=NONE
highlight Tag guifg=#6ceef0 guibg=NONE
highlight String guifg=#6ceef0 guibg=NONE
highlight MatchParen guifg=#eb5721 guibg=NONE gui=bold
highlight Macro guifg=#6ceef0 guibg=NONE gui=italic
highlight DiffChange guifg=#6ceef0 guibg=NONE
highlight GitGutterChange guifg=#6ceef0 guibg=NONE
highlight cssColor guifg=#6ceef0 guibg=NONE
highlight Function guifg=#72a0ed guibg=NONE gui=italic
highlight Directory guifg=#067d9e guibg=NONE
highlight markdownLinkText guifg=#067d9e guibg=NONE
highlight javaScriptBoolean guifg=#067d9e guibg=NONE
highlight Include guifg=#067d9e guibg=NONE
highlight Storage guifg=#067d9e guibg=NONE
highlight cssClassName guifg=#067d9e guibg=NONE
highlight cssClassNameDot guifg=#067d9e guibg=NONE
highlight Statement guifg=#4ebfd9 guibg=NONE
highlight Operator guifg=#4ebfd9 guibg=NONE
highlight cssAttr guifg=#4ebfd9 guibg=NONE

highlight Pmenu guifg=#59ace8 guibg=#394f59
highlight PMenuSel guifg=#36a1e3 guibg=NONE

highlight SignColumn guibg=#2b3040
highlight Title guifg=#59ace8
highlight LineNr guifg=#0e4267 guibg=#2b3040
highlight NonText guifg=#62a0a9 guibg=#2b3040

highlight Comment guifg=#62a0a9 gui=italic
highlight SpecialComment guifg=#62a0a9 gui=italic guibg=#2b3040

highlight CursorLine guibg=#394f59

highlight TabLineFill gui=NONE guibg=#394f59
highlight TabLine guifg=#0e4267 guibg=#394f59 gui=NONE
highlight StatusLine gui=bold guibg=#394f59 guifg=#59ace8
highlight StatusLineNC gui=NONE guibg=#2b3040 guifg=#59ace8
highlight Search guifg=#ffffff guibg=#68c24f  

highlight VertSplit gui=NONE guifg=#394f59 guibg=NONE
highlight Visual gui=NONE guibg=#394f59
highlight ColorColumn guibg=#394f59

set background=dark
