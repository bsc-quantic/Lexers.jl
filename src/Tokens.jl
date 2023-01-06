abstract type Token end

istypealias(@nospecialize(x::Type)) = !isnothing(Base.make_typealias(x))

function tokenname(@nospecialize(T::Type{<:Token}))
    if istypealias(T)
        aliasname = Base.make_typealias(T) |> first |> x -> x.name |> String
        return aliasname
    else
        "$(T.name.name)"
    end
end

function Base.show(io::IO, ::MIME"text/plain", tokens::Vector{Tuple{Token,SubString}})
    println(io, "$(summary(tokens)):")
    for (token, substr) in tokens
        name = replace(tokenname(typeof(token)), r"([a-z])([A-Z])" => s"\1 \2") |> lowercase |> uppercasefirst
        println(io, " \"$substr\" => $name")
    end
end

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
pattern(::Type{Newline}) = Regex(String(['\n']))

"""
	Whitespace

Represents a whitespace.
"""
struct Whitespace <: Token end
pattern(::Type{Whitespace}) = r" "

"""
    Tab

Represents a tab space.
"""
struct Tab <: Token end
pattern(::Type{Tab}) = r"\t"

"""
	Glyph{S}

Represents a single-character glyph, `S`, such as typographycal symbols, punctuation marks, mathematical operators, ...
"""
struct Glyph{S} <: Token end
pattern(::Type{Glyph{S}}) where {S} = Regex(String(['\\', S]))

const Dot = Glyph{'.'}
const Comma = Glyph{','}
const Colon = Glyph{':'}
const Semicolon = Glyph{';'}
const ParenthesisLeft = Glyph{'('}
const ParenthesisRight = Glyph{')'}
const BracketsLeft = Glyph{'['}
const BracketsRight = Glyph{']'}
const BracesLeft = Glyph{'{'}
const BracesRight = Glyph{'}'}
const Plus = Glyph{'+'}
const Minus = Glyph{'-'}
const Asterisk = Glyph{'*'}
const Slash = Glyph{'/'}
const GreaterThan = Glyph{'>'}
const LessThan = Glyph{'<'}
const Equal = Glyph{'='}
const At = Glyph{'@'}
const Exclamation = Glyph{'!'}
const Question = Glyph{'?'}

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
struct Number <: Token end
pattern(::Type{Number}) = r"(\d+)"

"""
	Quote

Represents a string literal.
"""
struct Quote <: Token end
pattern(::Type{Quote}) = r"\"([\w\s\d]*)\""

"""
    Identifier

Represents an identifier such as a variable or function name.
"""
struct Identifier <: Token end
pattern(::Type{Identifier}) = r"([_\w][_\w\s]*)"
