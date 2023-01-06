using Lexers: Token, Lexer, tokenize, GreaterThan, LessThan, Plus, Minus, Dot, Comma, BracketLeft, BracketRight

# NOTE Brainfuck code examples extracted from https://esolangs.org/wiki/Brainfuck_algorithms
@testset "Brainfuck" begin
    Brainfuck = Lexer{Tuple{GreaterThan,LessThan,Plus,Minus,Dot,Comma,BracketLeft,BracketRight}}

    # Add 2 values
    @test tokenize(Brainfuck, "[->+<]") .|> first == Token[
        BracketLeft(),
        Minus(),
        GreaterThan(),
        Plus(),
        LessThan(),
        BracketRight(),
    ]

    # Find a zeroed cell to the right
    @test tokenize(Brainfuck, "[>]") .|> first == Token[
        BracketLeft(),
        GreaterThan(),
        BracketRight(),
    ]

    # Find a zeroed cell to the left
    @test tokenize(Brainfuck, "[<]") .|> first == Token[
        BracketLeft(),
        LessThan(),
        BracketRight(),
    ]

    # Read all characters into memory
    @test tokenize(Brainfuck, ",[>,]") .|> first == Token[
        Comma(),
        BracketLeft(),
        GreaterThan(),
        Comma(),
        BracketRight(),
    ]
end