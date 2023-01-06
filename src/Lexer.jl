abstract type Lexer{L<:Tuple} end

parameters(::Type{Lexer{L}}) where {L} = L.parameters

function tokenize(T::Type{Lexer{TokenList}}, stream::S) where {TokenList,S<:AbstractString}
    lexemes = Vector{Lexeme{T,SubString{S}} where T<:Token}()
    streamview = @view stream[1:end]

    while !isempty(streamview)
        # TODO capture exception and throw?
        token = Iterators.filter(p -> startswith(streamview, pattern(p)), parameters(T)) |> first

        matched = match(pattern(token), streamview)
        substr = @view streamview[1:length(matched.match)]

        push!(lexemes, Lexeme{token}(substr))
        streamview = @view streamview[length(matched.match)+1:end]
    end

    return lexemes
end

