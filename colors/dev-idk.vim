set background=dark
let g:colors_name="dev-idk"
lua package.loaded['dev-idk'] = nil
lua require('lush')(require('dev-idk'))
