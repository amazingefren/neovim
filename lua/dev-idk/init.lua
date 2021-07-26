local lush = require("lush")
local hsl = lush.hsl

--[[ local base = {
    b0 = hsl(212, 23, 8),  -- Default BG
    b1 = hsl(212, 23, 16), -- Lighter b0 (statusbar)
    b2 = hsl(212, 23, 22), -- Selection BG
    b3 = hsl(212, 23, 35), -- Comments/Invis/LineHL
    b4 = hsl(212, 23, 70), -- Dark FG
    b5 = hsl(212, 23, 80), -- Norm FG
    b6 = hsl(212, 23, 85), -- Light BG
    b7 = hsl(212, 23, 90), -- Light BG

    b8 = hsl(0, 50, 65),
    b9 = hsl(25, 50,65),
    ba = hsl(50,  50, 65),
    bb = hsl(110, 50, 65),
    bc = hsl(140, 50, 65),
    bd = hsl(190, 50, 65),
    be = hsl(300, 50, 65),
    bf = hsl(384, 50, 65)
} ]]
local base = {
    -- #131415
    -- b0 = hsl(230, 5, 8), -- Default BG
    b0 = hsl(230, 5, 5), -- Default BG
    -- #27272B
    -- b1 = hsl(230, 5, 16), -- Lighter b0 (statusbar)
    b1 = hsl(230, 5, 12), -- Lighter b0 (statusbar)
    -- #35363B
    -- b2 = hsl(230, 5, 22), -- Selection BG
    b2 = hsl(230, 5, 20), -- Selection BG
    -- #5E5C55
    b3 = hsl(50, 5, 35), -- Comments/Invis/LineHL
    b4 = hsl(50, 15, 65), -- Dark FG
    -- #C2BDA3
    b5 = hsl(50, 20, 70), -- Norm FG
    b6 = hsl(50, 25, 75), -- Light BG
    -- #DBD6BD
    b7 = hsl(50, 30, 80), -- Light BG
    -- #D27979
    b8 = hsl(0, 50, 65),
    -- #D29E79
    b9 = hsl(25, 50, 65),
    -- #D2C479
    ba = hsl(50, 50, 65),
    -- #88D279
    bb = hsl(110, 50, 65),
    -- #79D2A6
    bc = hsl(150, 50, 65),
    -- #79C4D2
    bd = hsl(190, 50, 65),
    -- #D279D2
    be = hsl(300, 50, 65),
    bf = hsl(384, 50, 65)
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
            Comment {fg = base.b3}, -- any comment
            ColorColumn {bg = base.b1}, -- used for the columns set with 'colorcolumn'
            Conceal {fg = base.bc}, -- placeholder characters substituted for concealed text (see 'conceallevel')
            Cursor {fg = base.bd, gui = styles.inverse}, -- character under the cursor
            lCursor {Cursor}, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
            CursorIM {Cursor}, -- like Cursor, but used when in IME mode |CursorIM|
            CursorColumn {bg = base.b1}, -- Screen-column at the cursor, when 'cursorcolumn' is set.
            CursorLine {bg = base.b1}, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
            Directory {fg = base.bc}, -- directory names (and other special names in listings)
            DiffAdd {fg = base.bb}, -- diff mode: Added line |diff.txt|
            DiffChange {fg = base.ba}, -- diff mode: Changed line |diff.txt|
            DiffDelete {fg = base.b8}, -- diff mode: Deleted line |diff.txt|
            DiffText {fg = base.b4}, -- diff mode: Changed text within a changed line |diff.txt|
            EndOfBuffer {fg = base.b2}, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
            ErrorMsg {bg = base.b8, fg = base.b0}, -- error messages on the command line
            VertSplit {fg = base.b1, bg = base.b0}, -- the column separating vertically split windows
            Folded {fg = base.b4, bg = base.b1}, -- line used for closed folds
            FoldColumn {fg = base.b4, bg = base.b1}, -- 'foldcolumn'
            SignColumn {}, -- column where |signs| are displayed
            IncSearch {bg = base.ba, fg = base.b1}, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
            Substitute {IncSearch}, -- |:substitute| replacement text highlighting
            LineNr {fg = base.b1}, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
            CursorLineNr {fg = base.b3}, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
            MatchParen {fg = base.ba}, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
            ModeMsg {fg = base.b4}, -- 'showmode' message (e.g., "-- INSERT -- ")
            MsgArea {ModeMsg}, -- Area for messages and cmdline
            MoreMsg {ModeMsg}, -- |more-prompt|
            NonText {fg = base.b2}, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
            Normal {fg = base.b5, bg = base.b0}, -- normal text
            NormalFloat {fg = base.b5, bg = base.b1}, -- Normal text in floating windows.
            NormalNC {Normal}, -- normal text in non-current windows
            Pmenu {fg = base.b4, bg = base.b1}, -- Popup menu: normal item.
            PmenuSel {fg = base.b5, bg = base.b2}, -- Popup menu: selected item.
            PmenuSbar {bg = base.b3}, -- Popup menu: scrollbar.
            PmenuThumb {bg = base.b2}, -- Popup menu: Thumb of the scrollbar.
            Question {fg = base.be}, -- |hit-enter| prompt and yes/no questions
            QuickFixLine {fg = base.b0, bg = base.ba}, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
            Search {fg = base.b0, bg = base.bd}, -- Last search pattern highlighting (see 'hlsearch').  Also used for similar items that need to stand out.
            SpecialKey {fg = base.b3}, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
            SpellBad {fg = base.be}, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
            -- SpellCap     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
            -- SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
            SpellRare {fg = base.be}, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
            StatusLine {fg = base.b4, bg = base.b1}, -- status line of current window
            StatusLineNC {fg = base.b4, bg = base.b0}, -- status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
            TabLine {StatusLineNC}, -- tab pages line, not active tab page label
            TabLineFill {StatusLineNC}, -- tab pages line, where there are no labels
            TabLineSel {StatusLine}, -- tab pages line, active tab page label
            Title {fg = base.b5}, -- titles for output from ":set all", ":autocmd" etc.
            Visual {bg = base.b2}, -- Visual mode selection --- TODO: check for colors.base0 fg visibility
            VisualNOS {fg = base.b8}, -- Visual mode selection when vim is "Not Owning the Selection".
            WarningMsg {fg = base.b8}, -- warning messages
            -- Whitespace   { }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
            WildMenu {fg = base.b2, bg = base.ba}, -- current match in 'wildmenu' completion
            Constant {fg = base.b5}, -- (preferred) any constant
            String {fg = base.bb}, --   a string constant: "this is a string"
            Character {fg = base.ba}, --  a character constant: 'c', '\n'
            Number {fg = base.b5}, --   a number constant: 234, 0xff
            Boolean {fg = base.be}, --  a boolean constant: TRUE, false
            Float {Number}, --    a floating point constant: 2.3e10
            Identifier {fg = base.bc}, -- (preferred) any variable name
            Function {fg = base.bd}, -- function name (also: methods for classes)
            Statement {fg = base.b8}, -- (preferred) any statement
            Conditional {fg = base.be}, --  if, then, else, endif, switch, etc.
            Repeat {fg = base.ba}, --   for, do, while, etc.
            Label {fg = base.ba}, --    case, default, etc.
            Operator {fg = base.b9}, -- "sizeof", "+", "*", etc.
            Keyword {fg = base.b8}, --  any other keyword
            Exception {fg = base.b8}, --  try, catch, throw
            PreProc {fg = base.ba}, -- (preferred) generic Preprocessor
            Include {fg = base.bd}, --  preprocessor #include
            Define {fg = base.be}, --   preprocessor #define
            Macro {fg = base.b8}, --    same as Define
            PreCondit {fg = base.be}, --  preprocessor #if, #else, #endif, etc.
            Type {fg = base.bc}, -- (preferred) int, long, char, etc.
            StorageClass {fg = base.ba}, -- static, register, volatile, etc.
            Structure {fg = base.be}, --  struct, union, enum, etc.
            Typedef {fg = base.ba}, --  A typedef
            Special {fg = base.b5}, -- (preferred) any special symbol
            SpecialChar {fg = base.b5}, --  special character in a constant
            Tag {fg = base.ba}, --    you can use CTRL-] on this
            Delimiter {fg = base.b8}, --  character that needs attention
            SpecialComment {fg = base.b8}, -- special things inside a comment
            Debug {fg = base.b8}, --    debugging statements
            Underlined {gui = "undercurl"}, -- (preferred) text that stands out, HTML links
            Bold {gui = "bold"},
            Italic {gui = "italic"},
            Ignore {}, -- (preferred) left blank, hidden  |hl-Ignore|
            Error {gui = styles.curly}, -- (preferred) any erroneous construct
            Todo {fg = base.b4}, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX
            LspError {fg = base.b8},
            LspWarning {fg = base.ba},
            LspInfo {fg = base.bd},
            LspHint {fg = base.bc},
            LspReferenceText {fg = base.b4}, -- used for highlighting "text" references
            LspReferenceRead {fg = base.b4}, -- used for highlighting "read" references
            LspReferenceWrite {fg = base.b4}, -- used for highlighting "write" references
            LspDiagnosticsDefaultError {LspError}, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
            LspDiagnosticsDefaultWarning {LspWarning}, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
            LspDiagnosticsDefaultInformation {LspInfo}, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
            LspDiagnosticsDefaultHint {LspHint}, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
            LspDiagnosticsVirtualTextError {LspDiagnosticsDefaultError, bg=base.b1}, -- Used for "Error" diagnostic virtual text
            LspDiagnosticsVirtualTextWarning {LspDiagnosticsDefaultWarning, bg=base.b1}, -- Used for "Warning" diagnostic virtual text
            LspDiagnosticsVirtualTextInformation {LspDiagnosticsDefaultInformation, bg=base.b1}, -- Used for "Information" diagnostic virtual text
            LspDiagnosticsVirtualTextHint {LspDiagnosticsDefaultHint, bg=base.b1}, -- Used for "Hint" diagnostic virtual text
            LspDiagnosticsUnderlineError {sp = base.b8, gui = styles.curly}, -- Used to underline "Error" diagnostics
            LspDiagnosticsUnderlineWarning {sp = base.ba, gui = styles.curly}, -- Used to underline "Warning" diagnostics
            LspDiagnosticsUnderlineInformation {sp = base.bd, gui = styles.curly}, -- Used to underline "Information" diagnostics
            LspDiagnosticsUnderlineHint {sp = base.bc, gui = styles.curly}, -- Used to underline "Hint" diagnostics
            LspDiagnosticsFloatingError {LspError, bg = base.b1}, -- Used to color "Error" diagnostic messages in diagnostics float
            LspDiagnosticsFloatingWarning {LspWarning, bg = base.b1}, -- Used to color "Warning" diagnostic messages in diagnostics float
            LspDiagnosticsFloatingInformation {LspInfo, bg = base.b1}, -- Used to color "Information" diagnostic messages in diagnostics float
            LspDiagnosticsFloatingHint {LspHint, bg = base.b1}, -- Used to color "Hint" diagnostic messages in diagnostics float
            LspDiagnosticsSignError {LspError}, -- Used for "Error" signs in sign column
            LspDiagnosticsSignWarning {LspWarning}, -- Used for "Warning" signs in sign column
            LspDiagnosticsSignInformation {LspInfo}, -- Used for "Information" signs in sign column
            LspDiagnosticsSignHint {LspHint}, -- Used for "Hint" signs in sign column
            TSAnnotation {PreProc}, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
            TSBoolean {Boolean}, -- For booleans.
            TSCharacter {Character}, -- For characters.
            TSComment {Comment}, -- For comment blocks.
            TSConstructor {Special}, -- For constructor calls and definitions: ` { }` in Lua, and Java constructors.
            TSConditional {Conditional}, -- For keywords related to conditionnals.
            TSConstant {Constant}, -- For constants
            TSConstBuiltin {Special}, -- For constant that are built in the language: `nil` in Lua.
            TSConstMacro {Define}, -- For constants that are defined by macros: `NULL` in C.
            TSError {Error}, -- For syntax/parser errors.
            TSException {Exception}, -- For exception related keywords.
            TSField {Identifier}, -- For fields.
            TSFloat {Float}, -- For floats.
            TSFunction {Function}, -- For function (calls and definitions).
            TSFuncBuiltin {Special}, -- For builtin functions: `table.insert` in Lua.
            TSFuncMacro {Macro}, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
            TSInclude {Include}, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
            TSKeyword {Keyword}, -- For keywords that don't fall in previous categories.
            TSKeywordFunction {Keyword}, -- For keywords used to define a fuction.
            TSLabel {Label}, -- For labels: `label:` in C and `:label:` in Lua.
            TSMethod {Function}, -- For method calls and definitions.
            TSNamespace {Include}, -- For identifiers referring to modules and namespaces.
            TSNone {}, -- TODO: docs
            TSNumber {Number}, -- For all numbers
            TSOperator {Operator}, -- For any operator: `+`, but also `->` and `*` in C.
            TSParameter {Identifier}, -- For parameters of a function.
            TSParameterReference {Identifier}, -- For references to parameters of a function.
            TSProperty {Identifier}, -- Same as `TSField`.
            TSPunctDelimiter {Delimiter}, -- For delimiters ie: `.`
            TSPunctBracket {Delimiter}, -- For brackets and parens.
            TSPunctSpecial {Delimiter}, -- For special punctutation that does not fall in the catagories before.
            TSRepeat {Repeat}, -- For keywords related to loops.
            TSString {String}, -- For strings.
            TSStringRegex {String}, -- For regexes.
            TSStringEscape {SpecialChar}, -- For escape characters within a string.
            TSSymbol {SpecialChar}, -- For identifiers referring to symbols or atoms.
            TSType {Type}, -- For types.
            TSTypeBuiltin {Type}, -- For builtin types.
            TSVariable {Special}, -- Any variable name that does not have another highlight.
            TSVariableBuiltin {Special}, -- Variable names that are defined by the languages, like `this` or `self`.
            TSTag {Tag}, -- Tags like html tag names.
            TSTagDelimiter {Tag}, -- Tag delimiter like `<` `>` `/`
            TSText {TSNone}, -- For strings considered text in a markup language.
            TSEmphasis {gui = "italic"}, -- For text to be represented with emphasis.
            TSUnderline {gui = styles.curly}, -- For text to be represented with an underline.
            TSStrike {gui = "strikethrough"}, -- For strikethrough text.
            TSTitle {Title}, -- Text that is part of a title.
            TSLiteral {String}, -- Literal text.
            TSURI {Underlined}, -- Any URI like a link or email.
            -- Telescope
            TelescopePreviewBorder {fg = base.b2},
            TelescopePromptBorder {TelescopePreviewBorder},
            TelescopeResultsBorder {TelescopePreviewBorder},
            TelescopeSelectionCaret {TelescopePreviewBorder},
            TelescopeSelection {bg = base.b2, fg = base.b5},
            TelescopeMatching {IncSearch},
            TelescopePromptPrefix {fg = base.b2},
            TelescopeMultiSelection {fg = base.bd},
            TelescopeNormal {fg = base.b4},
            -- GitSigns
            GitSignsAdd {DiffAdd},
            GitSignsChange {DiffChange},
            GitSignsDelete {DiffDelete},
            -- NvimTree
            NvimTreeGitIgnored {fg = base.b3},
            NvimTreeSymlink {fg = base.be},
            NvimTreeFolderIcon {fg = base.b8},
            NvimTreeFolderName {fg = base.bd},
            NvimTreeRootFolder {fg = base.bc},
            NvimTreeEmptyFolderName {NvimTreeFolderName},
            NvimTreeOpenedFolderName {fg = base.ba},
            NvimTreeIndentMarker {fg = base.ba},
            NvimTreeNormal {fg = base.b4, bg = base.b0},
            NvimTreeGitDirty {fg = base.be}
        }
    end
)

return theme

-- vi:nowrap
