using Lexers: Token, Lexer, tokenize, token, GreaterThan, LessThan, Plus, Minus, Dot, Comma, BracketLeft, BracketRight

# NOTE Brainfuck code examples extracted from https://esolangs.org/wiki/Brainfuck_algorithms
@testset "Brainfuck" begin
    Brainfuck = Lexer{Tuple{GreaterThan,LessThan,Plus,Minus,Dot,Comma,BracketLeft,BracketRight}}

    # Add 2 values
    @test tokenize(Brainfuck, "[->+<]") .|> token == [
        BracketLeft,
        Minus,
        GreaterThan,
        Plus,
        LessThan,
        BracketRight,
    ]

    # Find a zeroed cell to the right
    @test tokenize(Brainfuck, "[>]") .|> token == [
        BracketLeft,
        GreaterThan,
        BracketRight,
    ]

    # Find a zeroed cell to the left
    @test tokenize(Brainfuck, "[<]") .|> token == [
        BracketLeft,
        LessThan,
        BracketRight,
    ]

    # Read all characters into memory
    @test tokenize(Brainfuck, ",[>,]") .|> token == [
        Comma,
        BracketLeft,
        GreaterThan,
        Comma,
        BracketRight,
    ]
end