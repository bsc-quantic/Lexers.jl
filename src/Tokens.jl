abstract type Token end

"""
	pattern(T)

Return the regex pattern for the `Token` type `T`.
"""
function pattern end

"""
	Newline

Represents a newline.
"""
struct Newline <: Token end
pattern(::Type{Newline}) = '\n'

"""
	Whitespace

Represents a whitespace.
"""
struct Whitespace <: Token end
pattern(::Type{Whitespace}) = ' '

"""
	Punctuation{S}

Represents a punctuation mark.
"""
struct Punctuation{S} <: Token end
pattern(::Type{Punctuation{S}}) where {S} = S

const Dot = Punctuation{'.'}
const Comma = Punctuation{','}
const Colon = Punctuation{':'}
const Semicolon = Punctuation{';'}
const ParenthesisLeft = Punctuation{'('}
const ParenthesisRight = Punctuation{')'}
const BracketsLeft = Punctuation{'['}
const BracketsRight = Punctuation{']'}
const BracesLeft = Punctuation{'{'}
const BracesRight = Punctuation{'}'}

"""
	Keyword{S}

Represents the keyword `S`.
"""
struct Keyword{S} <: Token end
Keyword(x::AbstractString) = Keyword{tuple(x...)}

pattern(::Type{Keyword{S}}) where {S} = S

"""
	Number

Represents a natural number.
"""
struct Number <: Token
    data::Int
end

pattern(::Type{Number}) = r"(\d+)"

"""
	Quote

Represents a string literal.
"""
struct Quote <: Token
    data::String
end

pattern(::Type{Quote}) = r"\"([\w\s\d]*)\""