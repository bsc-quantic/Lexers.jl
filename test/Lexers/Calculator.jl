using Lexers: Token, Lexer, tokenize, ParenthesisLeft, ParenthesisRight, Plus, Minus, Asterisk, Slash, Natural, Dot

@testset "Calculator" begin
    Calculator = Lexer{Tuple{ParenthesisLeft,ParenthesisRight,Plus,Minus,Asterisk,Slash,Natural,Dot}}

    @test tokenize(Calculator, "4+3") == [
        (Natural(), "4"),
        (Plus(), "+"),
        (Natural(), "3"),
    ]

    @test tokenize(Calculator, "1/2*(5+3)") == [
        (Natural(), "1"),
        (Slash(), "/"),
        (Natural(), "2"),
        (Asterisk(), "*"),
        (ParenthesisLeft(), "("),
        (Natural(), "5"),
        (Plus(), "+"),
        (Natural(), "3"),
        (ParenthesisRight(), ")"),
    ]
end