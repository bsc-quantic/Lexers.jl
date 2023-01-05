using Lexers: Token, Lexer, tokenize, GreaterThan, LessThan, Plus, Minus, Dot, Comma, BracketsLeft, BracketsRight

# NOTE Brainfuck code examples extracted from https://esolangs.org/wiki/Brainfuck_algorithms
@testset "Brainfuck" begin
    Brainfuck = Lexer{Tuple{GreaterThan,LessThan,Plus,Minus,Dot,Comma,BracketsLeft,BracketsRight}}

    # Add 2 values
    @test tokenize(Brainfuck, "[->+<]") .|> first == Token[
        BracketsLeft(),
        Minus(),
        GreaterThan(),
        Plus(),
        LessThan(),
        BracketsRight(),
    ]

    # Find a zeroed cell to the right
    @test tokenize(Brainfuck, "[>]") .|> first == Token[
        BracketsLeft(),
        GreaterThan(),
        BracketsRight(),
    ]

    # Find a zeroed cell to the left
    @test tokenize(Brainfuck, "[<]") .|> first == Token[
        BracketsLeft(),
        LessThan(),
        BracketsRight(),
    ]

    # Read all characters into memory
    @test tokenize(Brainfuck, ",[>,]") .|> first == Token[
        Comma(),
        BracketsLeft(),
        GreaterThan(),
        Comma(),
        BracketsRight(),
    ]
end