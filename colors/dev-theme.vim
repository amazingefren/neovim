set background=dark
let g:colors_name="dev-theme"
lua package.loaded['dev-theme'] = nil
lua require('lush')(require('dev-theme'))
