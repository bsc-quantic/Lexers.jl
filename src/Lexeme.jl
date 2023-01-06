struct Lexeme{T<:Token,S<:AbstractString}
    lexeme::S
end

Lexeme{T}(lexeme::S) where {T<:Token,S<:AbstractString} = Lexeme{T,S}(lexeme)
Lexeme(T::Type{<:Token}, lexeme::S) where {S<:AbstractString} = Lexeme{T,S}(lexeme)

Base.convert(::Type{S}, x::Lexeme) where {S<:AbstractString} = convert(S, x.lexeme)
token(::Lexeme{T}) where {T<:Token} = T

function Base.show(io::IO, ::MIME"text/plain", lexemes::Vector{<:Lexeme})
    println(io, "$(summary(lexemes)):")
    for lexeme in lexemes
        name = replace(tokenname(token(lexeme)), r"([a-z])([A-Z])" => s"\1 \2") |> lowercase |> uppercasefirst
        println(io, " \"$(convert(String, lexeme))\" => $name")
    end
end
