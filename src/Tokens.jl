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
	Punctuation{S}

Represents a punctuation mark.
"""
struct Punctuation{S} <: Token end
pattern(::Type{Punctuation{S}}) where {S} = Regex(String(['\\', S]))

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
const Plus = Punctuation{'+'}
const Minus = Punctuation{'-'}
const Asterisk = Punctuation{'*'}
const Slash = Punctuation{'/'}
const GreaterThan = Punctuation{'>'}
const LessThan = Punctuation{'<'}
const Equal = Punctuation{'='}
const At = Punctuation{'@'}
const Exclamation = Punctuation{'!'}
const Question = Punctuation{'?'}

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