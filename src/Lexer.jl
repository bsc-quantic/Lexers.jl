abstract type Lexer{L<:Tuple} end

parameters(::Type{Lexer{L}}) where {L} = L.parameters

function tokenize(T::Type{Lexer{_}}, stream::AbstractString) where {_}
    tokens = Token[]
    streamview = @view stream[1:end]

    while !isempty(streamview)
        # TODO capture exception and throw?
        tokentype = Iterators.filter(p -> startswith(streamview, pattern(p)), parameters(T)) |> first

        m = match(pattern(tokentype), streamview)

        token = tokentype(m.captures...)

        push!(tokens, token)
        streamview = @view streamview[length(m.match)+1:end]
    end

    return tokens
end

