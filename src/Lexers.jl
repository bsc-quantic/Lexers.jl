module Lexers

include("Tokens.jl")
export Token, pattern, Newline, Whitespace, Tab, Keyword, Quote, Natural, Identifier
export Glyph, Dot, Comma, Colon, Semicolon, ParenthesisLeft, ParenthesisRight, BracketLeft, BracketRight, BraceLeft, BraceRight, Plus, Minus, Asterisk, Slash, GreaterThan, LessThan, Equal, At, Exclamation, Question

include("Lexeme.jl")
export Lexeme, lexeme, token

include("Lexer.jl")
export Lexer, tokenize

end
