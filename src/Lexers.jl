module Lexers

include("Tokens.jl")
export Token, pattern, Newline, Whitespace, Keyword, Quote, Number
export Punctuation, Dot, Comma, Colon, Semicolon, ParenthesisLeft, ParenthesisRight, BracketsLeft, BracketsRight, BracesLeft, BracesRight, Plus, Minus, GreaterThan, LessThan, Equal, At, Exclamation, Question

end
