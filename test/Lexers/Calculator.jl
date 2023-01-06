using Lexers: Token, Lexer, tokenize, token, ParenthesisLeft, ParenthesisRight, Plus, Minus, Asterisk, Slash, Natural, Dot

@testset "Calculator" begin
    Calculator = Lexer{Tuple{ParenthesisLeft,ParenthesisRight,Plus,Minus,Asterisk,Slash,Natural,Dot}}

    @test tokenize(Calculator, "4+3") .|> token == [
        Natural,
        Plus,
        Natural,
    ]

    @test tokenize(Calculator, "1/2*(5+3)") .|> token == [
        Natural,
        Slash,
        Natural,
        Asterisk,
        ParenthesisLeft,
        Natural,
        Plus,
        Natural,
        ParenthesisRight,
    ]
end