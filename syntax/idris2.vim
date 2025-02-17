" syntax highlighting for Idris 2 (idris-lang.org)
"
" Heavily modified version of the haskell syntax
" highlighter to support Idris 2.
"
" author: raichoo (raichoo@googlemail.com)

if exists("b:current_syntax")
  finish
endif

syn match idrisTypeDecl "[a-zA-Z][a-zA-z0-9_']*\s\+:\s\+"
  \ contains=idrisIdentifier,idrisOperators
syn region idrisParens matchgroup=idrisDelimiter start="(" end=")" contains=TOP,idrisTypeDecl
syn region idrisBrackets matchgroup=idrisDelimiter start="\[" end="]" contains=TOP,idrisTypeDecl
syn region idrisBlock matchgroup=idrisDelimiter start="{" end="}" contains=TOP,idrisTypeDecl
syn region idrisSnocBrackets matchgroup=idrisDelimiter start="\[<" end="]" contains=TOP
syn region idrisListBrackets matchgroup=idrisDelimiter start="\[>" end="]" contains=TOP
syn keyword idrisModule module namespace
syn keyword idrisImport import
syn keyword idrisStructure data record interface implementation
syn keyword idrisWhere where
syn keyword idrisVisibility public abstract private export
syn keyword idrisBlock parameters mutual using
syn keyword idrisTotality total partial covering
syn keyword idrisAnnotation auto impossible default constructor
syn keyword idrisStatement do case of rewrite with proof
syn keyword idrisLet let in
syn keyword idrisForall forall
syn keyword idrisDataOpt noHints uniqueSearch search external noNewtype containedin=idrisBrackets
syn keyword idrisConditional if then else
syn match idrisNumber '\v<[0-9]+%(_[0-9]+)*>|<0[xX][0-9a-fA-F]+%(_[0-9a-fA-F]+)*>|<0[oO][0-7]+%(_[0-7]+)*>|<0[bB][01]+%(_[01]+)*>'
syn match idrisFloat '\v<[0-9]+\.[0-9]+([eE][-+]=[0-9]+)=>'
syn match idrisDelimiter "[,;]"
syn keyword idrisInfix prefix infix infixl infixr
syn match idrisOperators "\([-!#$%&\*\+./<=>\?@\\^|~:]\|\<_\>\)"
syn match idrisType "\<[A-Z][a-zA-Z0-9_']*\>"
syn keyword idrisTodo TODO FIXME XXX HACK contained
syn match idrisLineComment "---*\([^-!#$%&\*\+./<=>\?@\\^|~].*\)\?$" contains=idrisTodo,@Spell
syn match idrisDocComment "|||\([^-!#$%&\*\+./<=>\?@\\^|~].*\)\?$" contains=idrisTodo,@Spell
syn match idrisMetaVar "?[a-zA-Z][A-Za-z0-9_']*"
syn match idrisPragma "%\(hide\|logging\|auto_lazy\|unbound_implicits\|prefix_record_projections\|ambiguity_depth\|nf_metavar_threshold\|search_timeout\|pair\|rewrite\|integerLit\|stringLit\|charLit\|doubleLit\|name\|start\|allow_overloads\|language\|default\|transform\|hint\|globalhint\|defaulthint\|inline\|noinline\|extern\|macro\|spec\|foreign\|nomangle\|builtin\|MkWorld\|World\|search\|runElab\|tcinline\|auto_implicit_depth\)"
syn match idrisChar "\v'%([^'\\]|\\%(.|[0-9]+|x[0-9a-fA-F]+|o[0-7]+|NUL|SOH|STX|ETX|EOT|ENQ|ACK|BEL|BS|HT|LF|VT|FF|CR|SO|SI|DLE|DC1|DC2|DC3|DC4|NAK|SYN|ETB|CAN|EM|SUB|ESC|FS|GS|RS|US|SP|DEL))'"
syn match idrisBacktick "`[A-Za-z][A-Za-z0-9_']*`"
syn region idrisString start=+"+ skip=+\\\\\|\\"+ end=+"+ contains=@Spell
syn region idrisBlockComment start="{-" end="-}" contains=idrisBlockComment,idrisTodo,@Spell
syn match idrisIdentifier "[a-zA-Z][a-zA-z0-9_']*" contained

highlight def link idrisDeprecated Error
highlight def link idrisIdentifier Identifier
highlight def link idrisImport Structure
highlight def link idrisModule Structure
highlight def link idrisStructure Structure
highlight def link idrisStatement Statement
highlight def link idrisForall Structure
highlight def link idrisDataOpt Statement
highlight def link idrisDSL Statement
highlight def link idrisBlock Statement
highlight def link idrisAnnotation Statement
highlight def link idrisWhere Structure
highlight def link idrisLet Structure
highlight def link idrisTotality Statement
highlight def link idrisVisibility Statement
highlight def link idrisConditional Conditional
highlight def link idrisPragma Statement
highlight def link idrisNumber Number
highlight def link idrisFloat Float
highlight def link idrisDelimiter Delimiter
highlight def link idrisInfix PreProc
highlight def link idrisOperators Operator
highlight def link idrisType Include
highlight def link idrisDocComment Comment
highlight def link idrisLineComment Comment
highlight def link idrisBlockComment Comment
highlight def link idrisTodo Todo
highlight def link idrisMetaVar Macro
highlight def link idrisString String
highlight def link idrisChar String
highlight def link idrisBacktick Operator

let b:current_syntax = "idris2"
