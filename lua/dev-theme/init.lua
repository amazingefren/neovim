local lush = require("lush")
local hsl = lush.hsl

local base = {
    shade = hsl(180, 0, 5),
    b0 = hsl(180, 0, 8),
    b1 = hsl(180, 0, 15),
    b2 = hsl(180, 0, 20),
    b3 = hsl(180, 0, 25),
    b4 = hsl(180, 0, 30),
    b5 = hsl(180, 0, 35),
    b6 = hsl(180, 0, 45),
    dark = hsl(200, 0, 50),
    black = hsl(180, 0, 13),
    fg = hsl(35, 30, 75),
    bright = hsl(35, 40, 85),
    red = hsl(5, 70, 65),
    orange = hsl(30, 70, 65),
    yellow = hsl(50, 70, 65),
    green = hsl(100, 70, 70),
    cyan = hsl(150, 70, 65),
    teal = hsl(180, 70, 65),
    blue = hsl(213, 70, 65),
    purple = hsl(265, 70, 65),
    pink = hsl(330, 70, 65),
    red_bg = hsl(5, 30, 10),
    yellow_bg = hsl(50, 30, 10),
    green_bg = hsl(100, 30, 10),
    blue_bg = hsl(200, 30, 10)
}

local colors = {
    shade = "#0D0D0D",
    b0 = "#141414",
    b1 = "#262626",
    b2 = "#333333",
    b3 = "#404040",
    b4 = "#4D4D4D",
    b5 = "#595959",
    b6 = "#737373",
    dark = "#808080",
    fg = "#D2C2AC",
    bright = "#E8DBC9",
    black = "#212121",
    red = "#E47267",
    orange = "#E4A667",
    yellow = "#E4CF67",
    green = "#A1E87D",
    cyan = "#67E4A6",
    teal = "#67E4E4",
    blue = "#67A0E4",
    purple = "#9B67E4",
    pink = "#E467A6",
    red_bg = "#211312",
    yellow_bg = "#211F12",
    green_bg = "#172112",
    blue_bg = "#121921"
}

local styles = {
    bold = "bold",
    curly = "undercurl",
    underline = "underline",
    strike = "strikethrough",
    reverse = "reverse",
    inverse = "inverse",
    italic = "italic",
    standout = "standout",
    nocombine = "nocombine",
    none = ""
}

local theme =
    lush(
    function()
        return {
            Comment {fg = base.b4}, -- any comment
            ColorColumn {bg = base.b1}, -- used for the columns set with 'colorcolumn'
            Conceal {fg = base.cyan}, -- placeholder characters substituted for concealed text (see 'conceallevel')
            Cursor {gui = styles.inverse}, -- character under the cursor
            lCursor {Cursor}, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
            CursorIM {Cursor}, -- like Cursor, but used when in IME mode |CursorIM|
            CursorColumn {bg = base.b1}, -- Screen-column at the cursor, when 'cursorcolumn' is set.
            CursorLine {bg = base.black}, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
            Directory {fg = base.blue}, -- directory names (and other special names in listings)
            DiffAdd {fg = base.green}, -- diff mode: Added line |diff.txt|
            DiffChange {fg = base.yellow}, -- diff mode: Changed line |diff.txt|
            DiffDelete {fg = base.red}, -- diff mode: Deleted line |diff.txt|
            DiffText {fg = base.fg}, -- diff mode: Changed text within a changed line |diff.txt|
            EndOfBuffer {fg = base.b2}, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
            ErrorMsg {bg = base.red_bg, fg = base.red}, -- error messages on the command line
            VertSplit {fg = base.b2, bg = base.b0}, -- the column separating vertically split windows
            Folded {fg = base.b4, bg = base.b1}, -- line used for closed folds
            FoldColumn {fg = base.b4, bg = base.b1}, -- 'foldcolumn'
            SignColumn {}, -- column where |signs| are displayed
            IncSearch {bg = base.blue, fg = base.b0}, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
            Substitute {IncSearch}, -- |:substitute| replacement text highlighting
            LineNr {fg = base.b2}, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
            CursorLineNr {fg = base.dark}, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
            MatchParen {fg = base.bright}, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
            ModeMsg {fg = base.fg, bg = base.b0}, -- 'showmode' message (e.g., "-- INSERT -- ")
            MsgArea {ModeMsg}, -- Area for messages and cmdline
            MoreMsg {ModeMsg}, -- |more-prompt|
            NonText {fg = base.b1}, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
            Normal {fg = base.fg, bg = base.b0}, -- normal text
            NormalFloat {fg = base.fg, bg = base.b1}, -- Normal text in floating windows.
            NormalNC {Normal}, -- normal text in non-current windows
            Pmenu {fg = base.fg, bg = base.b1}, -- Popup menu: normal item.
            PmenuSel {fg = base.bright, bg = base.b2}, -- Popup menu: selected item.
            PmenuSbar {bg = base.b3}, -- Popup menu: scrollbar.
            PmenuThumb {bg = base.b2}, -- Popup menu: Thumb of the scrollbar.
            Question {fg = base.pink}, -- |hit-enter| prompt and yes/no questions
            QuickFixLine {fg = base.b0, bg = base.yellow}, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
            Search {fg = base.bright, bg = base.b4}, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
            SpecialKey {fg = base.b3}, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
            SpellBad {fg = base.pink}, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
            SpellRare {fg = base.pink}, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
            StatusLine {fg = base.fg, bg = base.b1}, -- status line of current window
            StatusLineNC {fg = base.b4, bg = base.b1}, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
            TabLine {StatusLineNC}, -- tab pages line, not active tab page label
            TabLineFill {StatusLineNC}, -- tab pages line, where there are no labels
            TabLineSel {StatusLine}, -- tab pages line, active tab page label
            Title {fg = base.bright}, -- titles for output from ":set all", ":autocmd" etc.
            Visual {bg = base.b2}, -- Visual mode selection --- TODO: check for colors.base0 fg visibility
            VisualNOS {fg = base.red}, -- Visual mode selection when vim is "Not Owning the Selection".
            WarningMsg {fg = base.red}, -- warning messages
            -- Whitespace   { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
            WildMenu {fg = base.bright, bg = base.b4}, -- current match in 'wildmenu' completion
            Constant {fg = base.fg}, -- (preferred) any constant
            String {fg = base.green}, --   a string constant: "this is a string"
            Character {fg = base.blue}, --  a character constant: 'c', '\n'
            Number {fg = base.bright}, --   a number constant: 234, 0xff
            Boolean {fg = base.pink}, --  a boolean constant: TRUE, false
            Float {Number}, --    a floating point constant: 2.3e10
            Identifier {fg = base.blue}, -- (preferred) any variable name
            Function {fg = base.cyan}, -- function name (also: methods for classes)
            Statement {fg = base.yellow}, -- (preferred) any statement
            Conditional {fg = base.red}, --  if, then, else, endif, switch, etc.
            Repeat {fg = base.red}, --   for, do, while, etc.
            Label {fg = base.red}, --    case, default, etc.
            Operator {fg = base.orange}, -- "sizeof", "+", "*", etc.
            Keyword {fg = base.blue}, --  any other keyword
            Exception {fg = base.red}, --  try, catch, throw
            PreProc {fg = base.fg}, -- (preferred) generic Preprocessor
            Include {fg = base.dark}, --  preprocessor #include
            Define {fg = base.bright}, --   preprocessor #define
            Macro {Define}, --    same as Define
            Type {fg = base.yellow}, -- (preferred) int, long, char, etc.
            StorageClass {fg = base.yellow}, -- static, register, volatile, etc.
            Structure {fg = base.yellow}, --  struct, union, enum, etc.
            Typedef {fg = base.yellow}, --  A typedef
            Special {fg = base.red}, -- (preferred) any special symbol
            Tag {fg = base.green}, --    you can use CTRL-] on this
            Delimiter {fg = base.orange}, --  character that needs attention
            SpecialComment {fg = base.bright}, -- special things inside a comment
            Debug {fg = base.red}, --    debugging statements
            Underlined {gui = "undercurl"}, -- (preferred) text that stands out, HTML links
            Bold {gui = "bold"},
            Italic {gui = "italic"},
            Ignore {}, -- (preferred) left blank, hidden  |hl-Ignore|
            Error {gui = styles.curly}, -- (preferred) any erroneous construct
            Todo {fg = base.yellow}, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
            LspError {fg = base.red},
            LspWarning {fg = base.yellow},
            LspInfo {fg = base.blue},
            LspHint {fg = base.green},
            LspReferenceText {fg = base.b4}, -- used for highlighting "text" references
            LspReferenceRead {fg = base.b4}, -- used for highlighting "read" references
            LspReferenceWrite {fg = base.b4}, -- used for highlighting "write" references
            LspDiagnosticsDefaultError {LspError, bg = base.red_bg}, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
            LspDiagnosticsDefaultWarning {fg = base.yellow, bg = base.yellow_bg}, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
            LspDiagnosticsDefaultInformation {LspInfo, bg = base.blue_bg}, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
            LspDiagnosticsDefaultHint {LspHint, bg = base.green_bg}, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
            LspDiagnosticsVirtualTextError {LspDiagnosticsDefaultError, bg = base.red_bg}, -- Used for "Error" diagnostic virtual text
            LspDiagnosticsVirtualTextWarning {LspDiagnosticsDefaultWarning, bg = base.yellow_bg}, -- Used for "Warning" diagnostic virtual text
            LspDiagnosticsVirtualTextInformation {LspDiagnosticsDefaultInformation, bg = base.blue_bg}, -- Used for "Information" diagnostic virtual text
            LspDiagnosticsVirtualTextHint {LspDiagnosticsDefaultHint, bg = base.green_bg}, -- Used for "Hint" diagnostic virtual text
            LspDiagnosticsUnderlineError {sp = base.red, gui = styles.curly}, -- Used to underline "Error" diagnostics
            LspDiagnosticsUnderlineWarning {sp = base.yellow, gui = styles.curly}, -- Used to underline "Warning" diagnostics
            LspDiagnosticsUnderlineInformation {sp = base.blue, gui = styles.curly}, -- Used to underline "Information" diagnostics
            LspDiagnosticsUnderlineHint {sp = base.cyan, gui = styles.curly}, -- Used to underline "Hint" diagnostics
            LspDiagnosticsFloatingError {LspError, bg = base.b1}, -- Used to color "Error" diagnostic messages in diagnostics float
            LspDiagnosticsFloatingWarning {LspWarning, bg = base.b1}, -- Used to color "Warning" diagnostic messages in diagnostics float
            LspDiagnosticsFloatingInformation {LspInfo, bg = base.b1}, -- Used to color "Information" diagnostic messages in diagnostics float
            LspDiagnosticsFloatingHint {LspHint, bg = base.b1}, -- Used to color "Hint" diagnostic messages in diagnostics float
            LspDiagnosticsSignError {LspError}, -- Used for "Error" signs in sign column
            LspDiagnosticsSignWarning {LspWarning}, -- Used for "Warning" signs in sign column
            LspDiagnosticsSignInformation {LspInfo}, -- Used for "Information" signs in sign column
            LspDiagnosticsSignHint {LspHint}, -- Used for "Hint" signs in sign column
            -- TSAnnotation {}, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
            TSBoolean {Boolean}, -- For booleans.
            TSCharacter {Character}, -- For characters.
            TSComment {Comment}, -- For comment blocks.
            TSConstructor {fg = base.yellow}, -- For constructor calls and definitions: ` { }` in Lua, and Java constructors.
            TSConditional {Conditional}, -- For keywords related to conditionnals.
            TSConstant {Constant}, -- For constants
            TSConstBuiltin {Special}, -- For constant that are built in the language: `nil` in Lua.
            TSConstMacro {Exception}, -- For constants that are defined by macros: `NULL` in C.
            TSError {Error}, -- For syntax/parser errors.
            TSException {Exception}, -- For exception related keywords.
            TSField {Function}, -- For fields.
            TSFloat {Float}, -- For floats.
            TSFunction {Function}, -- For function (calls and definitions).
            TSFuncBuiltin {Identifier}, -- For builtin functions: `table.insert` in Lua.
            TSFuncMacro {Macro}, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
            TSInclude {Include}, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
            TSKeyword {Keyword}, -- For keywords that don't fall in previous categories.
            TSKeywordFunction {Keyword}, -- For keywords used to define a fuction.
            TSLabel {Label}, -- For labels: `label:` in C and `:label:` in Lua.
            TSMethod {Function}, -- For method calls and definitions.
            TSNamespace {Identifier}, -- For identifiers referring to modules and namespaces.
            TSNone {}, -- TODO: docs
            TSNumber {Number}, -- For all numbers
            TSOperator {Operator}, -- For any operator: `+`, but also `->` and `*` in C.
            TSParameter {fg = base.fg}, -- For parameters of a function.
            -- TSParameterReference {}, -- For references to parameters of a function.
            TSProperty {TSField}, -- Same as `TSField`.
            TSPunctDelimiter {Delimiter}, -- For delimiters ie: `.`
            TSPunctBracket {Delimiter}, -- For brackets and parens.
            TSPunctSpecial {Delimiter}, -- For special punctutation that does not fall in the catagories before.
            TSRepeat {Repeat}, -- For keywords related to loops.
            TSString {String}, -- For strings.
            TSStringRegex {Special}, -- For regexes.
            TSStringEscape {Identifier}, -- For escape characters within a string.
            -- TSSymbol {Special}, -- For identifiers referring to symbols or atoms.
            TSType {Type}, -- For types.
            TSTypeBuiltin {Type}, -- For builtin types.
            TSVariable {TSParameter}, -- Any variable name that does not have another highlight.
            TSVariableBuiltin {Special}, -- Variable names that are defined by the languages, like `this` or `self`.
            TSTag {Tag}, -- Tags like html tag names.
            TSTagDelimiter {fg = base.dark}, -- Tag delimiter like `<` `>` `/`
            TSText {fg = base.cyan}, -- For strings considered text in a markup language.
            TSEmphasis {gui = "italic"}, -- For text to be represented with emphasis.
            TSUnderline {gui = styles.curly}, -- For text to be represented with an underline.
            TSStrike {gui = "strikethrough"}, -- For strikethrough text.
            TSTitle {Title}, -- Text that is part of a title.
            TSLiteral {String}, -- Literal text.
            TSURI {Underlined}, -- Any URI like a link or email.
            -- Telescope
            TelescopePreviewBorder {fg = base.b4},
            TelescopePromptBorder {TelescopePreviewBorder},
            TelescopeResultsBorder {TelescopePreviewBorder},
            TelescopeSelectionCaret {TelescopePreviewBorder},
            TelescopeSelection {bg = base.b3, fg = base.dark},
            TelescopeMatching {fg = base.cyan},
            TelescopePromptPrefix {fg = base.cyan},
            TelescopeMultiSelection {fg = base.cyan},
            TelescopeNormal {fg = base.dark},
            -- GitSigns
            GitSignsAdd {DiffAdd},
            GitSignsChange {DiffChange},
            GitSignsDelete {DiffDelete},
            -- NvimTree
            NvimTreeGitIgnored {fg = base.b4},
            NvimTreeSymlink {fg = base.purple},
            NvimTreeFolderIcon {fg = base.teal},
            NvimTreeFolderName {fg = base.dark, gui = styles.bold},
            NvimTreeRootFolder {fg = base.yellow, gui = styles.bold},
            NvimTreeEmptyFolderName {NvimTreeFolderName},
            NvimTreeOpenedFolderName {fg = base.teal, gui = styles.bold},
            NvimTreeIndentMarker {fg = base.b3},
            NvimTreeNormal {Normal, bg = base.shade},
            NvimTreeGitDirty {fg = base.orange}
        }
    end
)

return theme, {colors}

-- vi:nowrap
