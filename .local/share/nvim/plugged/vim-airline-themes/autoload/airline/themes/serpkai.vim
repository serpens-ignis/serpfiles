" colors

" gui
let s:bg = "#26292C"
let s:black = "#272822"
let s:red = "#F92672"
let s:green = "#A6E22E"
let s:yellow = "#E6DB74"
let s:blue = "#66D9EF"
let s:magenta = "#AE81FF"
let s:cyan = "#A1EFE4"
let s:white = "#F8F8F0"


" terminal
let s:term_black = 0
let s:term_red = 1
let s:term_green = 2
let s:term_yellow = 3
let s:term_blue = 4
let s:term_magenta = 5
let s:term_cyan = 6
let s:term_white = 7

" color groups

" format: [guifg, guibg, ctermfg, ctermbg]
let s:N1 = [s:bg, s:white, 0, 7]
let s:N2 = [s:bg, s:white, 0, 7]
let s:N3 = [s:white, s:bg, 7, 0]

let s:I1 = [s:bg, s:blue, 0, 4]
let s:I2 = [s:bg, s:blue, 0, 4]
let s:I3 = [s:blue, s:bg, 4, 0]

let s:R1 = [s:bg, s:red, 0, 1]
let s:R2 = [s:bg, s:red, 0, 1]
let s:R3 = [s:red, s:bg, 1, 0]

let s:V1 = [s:bg, s:green, 0, 2]
let s:V2 = [s:bg, s:green, 0, 2]
let s:V3 = [s:green, s:bg, 2, 0]

let s:M = [s:red, s:bg, 1, 0]
let s:W = [s:bg, s:yellow, s:term_black, s:term_yellow]
let s:E = [s:bg, s:red, s:term_black, s:term_red]

" palette

let g:airline#themes#serpkai#palette = {}

" base
let g:airline#themes#serpkai#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#serpkai#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#serpkai#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
let g:airline#themes#serpkai#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)

" modified
let g:airline#themes#serpkai#palette.normal_modified = {
    \ "airline_c": [s:M[0], s:M[1], s:M[2], s:M[3], ""]
    \ }
let g:airline#themes#serpkai#palette.insert_modified = 
    \ g:airline#themes#serpkai#palette.normal_modified
let g:airline#themes#serpkai#palette.replace_modified =
    \ g:airline#themes#serpkai#palette.normal_modified
let g:airline#themes#serpkai#palette.visual_modified =
    \ g:airline#themes#serpkai#palette.normal_modified

" warning
let g:airline#themes#serpkai#palette.normal.airline_warning = [
    \ s:W[0], s:W[1], s:W[2], s:W[3]
    \ ]

let g:airline#themes#serpkai#palette.insert.airline_warning =
    \ g:airline#themes#serpkai#palette.normal.airline_warning

let g:airline#themes#serpkai#palette.replace.airline_warning =
    \ g:airline#themes#serpkai#palette.normal.airline_warning

let g:airline#themes#serpkai#palette.visual.airline_warning =
    \ g:airline#themes#serpkai#palette.normal.airline_warning

let g:airline#themes#serpkai#palette.normal_modified.airline_warning =
    \ g:airline#themes#serpkai#palette.normal.airline_warning

let g:airline#themes#serpkai#palette.insert_modified.airline_warning =
    \ g:airline#themes#serpkai#palette.normal.airline_warning

let g:airline#themes#serpkai#palette.replace_modified.airline_warning =
    \ g:airline#themes#serpkai#palette.normal.airline_warning

let g:airline#themes#serpkai#palette.visual_modified.airline_warning =
    \ g:airline#themes#serpkai#palette.normal.airline_warning

" error
let g:airline#themes#serpkai#palette.normal.airline_error = [
    \ s:E[0], s:E[1], s:E[2], s:E[3]
    \ ]

let g:airline#themes#serpkai#palette.insert.airline_error =
    \ g:airline#themes#serpkai#palette.normal.airline_error

let g:airline#themes#serpkai#palette.replace.airline_error =
    \ g:airline#themes#serpkai#palette.normal.airline_error

let g:airline#themes#serpkai#palette.visual.airline_error =
    \ g:airline#themes#serpkai#palette.normal.airline_error

let g:airline#themes#serpkai#palette.normal_modified.airline_error =
    \ g:airline#themes#serpkai#palette.normal.airline_error

let g:airline#themes#serpkai#palette.insert_modified.airline_error =
    \ g:airline#themes#serpkai#palette.normal.airline_error

let g:airline#themes#serpkai#palette.replace_modified.airline_error =
    \ g:airline#themes#serpkai#palette.normal.airline_error

let g:airline#themes#serpkai#palette.visual_modified.airline_error =
    \ g:airline#themes#serpkai#palette.normal.airline_error
