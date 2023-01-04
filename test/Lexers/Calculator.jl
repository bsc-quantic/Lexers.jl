using Lexers: Token, Lexer, tokenize, ParenthesisLeft, ParenthesisRight, Plus, Minus, Asterisk, Slash, Number, Dot

@testset "Calculator" begin
    Calculator = Lexer{Tuple{ParenthesisLeft,ParenthesisRight,Plus,Minus,Asterisk,Slash,Number,Dot}}

    @test tokenize(Calculator, "4+3") == Token[
        Number(4),
        Plus(),
        Number(3),
    ]

    @test tokenize(Calculator, "1/2*(5+3)") == Token[
        Number(1),
        Slash(),
        Number(2),
        Asterisk(),
        ParenthesisLeft(),
        Number(5),
        Plus(),
        Number(3),
        ParenthesisRight(),
    ]
end